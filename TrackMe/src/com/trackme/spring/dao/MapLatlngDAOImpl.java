package com.trackme.spring.dao;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mapLatlngDAO")
public class MapLatlngDAOImpl implements MapLatlngDAO {

	private static final Logger logger = LoggerFactory
			.getLogger(VehicleMasterDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public List getAllVehicleLocation() {
		Session session = this.sessionFactory.getCurrentSession();

		StringBuffer strBuf = new StringBuffer();
		strBuf.append(" select vm.vehicleno,  sd.description, gsm.speed, gsm.location, gsm.latitude, gsm.longitude, ");
		strBuf.append(" to_char(gsm.datetimedate , 'YYYY-MM-DD') ||' '|| to_char(gsm.datetime, 'HH:MI PM') as datetime1  from vehiclemaster vm join gsmmaster gsm on vm.unitno= gsm.unitNo ");
		strBuf.append(" inner join ");
		strBuf.append(" (select gsm1.unitno , max(gsm1.datetimedate+gsm1.datetime) as lattime ");
		strBuf.append(" from  gsmmaster gsm1 group by gsm1.unitno ) latest on ");
		strBuf.append(" gsm.unitno = latest.unitno and (gsm.datetimedate+gsm.datetime)=latest.lattime ");
		strBuf.append(" join statusdesc sd on  gsm.status  = sd.code ");
		String query = strBuf.toString();
		logger.info("getAllVehicleLocation Query== " + query);
		Query sqlQuery = session.createSQLQuery(query);
		sqlQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		List<Map<String, Object>> mapLatlngList = sqlQuery.list();
		return mapLatlngList;
	}

	@Override
	public List getLatlngDetailsByVehicleNo(String vehicleNo, String fromDate, String toDate) {
		List<Map<String, Object>> vehicleLatlngList = null;
		if (vehicleNo != null || !"".equals(vehicleNo)) {
			Session session = this.sessionFactory.getCurrentSession();
			StringBuffer strBuf = new StringBuffer();
			strBuf.append(" select vm.vehicleno,  sd.description, gsm.speed, gsm.location,gsm.latitude, gsm.longitude, ");
			strBuf.append(" to_char(gsm.datetimedate , 'YYYY-MM-DD') ||' '|| to_char(gsm.datetime, 'HH:MI PM')as datetime1  from vehiclemaster vm join gsmmaster gsm on vm.unitno= gsm.unitNo  ");
			strBuf.append(" join statusdesc sd on  gsm.status  = sd.code ");
			strBuf.append(" where vm.vehicleno like '");
			strBuf.append(vehicleNo.trim());
			strBuf.append("'");
			if (fromDate != null || "".equals(fromDate) ){
				strBuf.append(" and gsm.datetimedate >=  '");
				strBuf.append(fromDate);
				strBuf.append("'");
			}
			if (toDate != null || "".equals(toDate) ){
				strBuf.append(" and gsm.datetimedate <=  '");
				strBuf.append(toDate);
				strBuf.append("'");
			}
			strBuf.append(" order by datetime1 asc ");
			String query = strBuf.toString();
			logger.info("getLatlngDetailsByVehicleNo Query== " + query);
			Query sqlQuery = session.createSQLQuery(query);
			sqlQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			vehicleLatlngList = sqlQuery.list();
		} else {
			logger.info("Empty VehicleNo returning NULL");
		}
		return vehicleLatlngList;
	}

}
