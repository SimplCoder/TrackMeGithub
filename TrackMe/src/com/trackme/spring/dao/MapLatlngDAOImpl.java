package com.trackme.spring.dao;

import java.sql.Timestamp;
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
		strBuf.append(" to_char(gsm.datetimedate , 'YYYY-MM-DD') ||' '|| to_char(gsm.datetime, 'HH:MI PM') ");
		strBuf.append(" as datetime1 , case when sd.description='Ignition Off' then ");
		strBuf.append(" Cast (EXTRACT(EPOCH FROM current_timestamp-(gsm.datetimedate + gsm.datetime))/3600 As Integer) ");
		strBuf.append(" when sd.description='Idling Start' then ");
		strBuf.append(" Cast (EXTRACT(EPOCH FROM current_timestamp-(gsm.datetimedate + gsm.datetime))/3600 As Integer) ");
		strBuf.append(" else 0 end as idleTime from vehiclemaster vm join gsmmaster gsm on vm.unitno= gsm.unitNo ");
		strBuf.append(" inner join (select gsm1.unitno , max(gsm1.datetimedate+gsm1.datetime) as lattime ");
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
			if (fromDate != null && !"".equals(fromDate) ){
				strBuf.append(" and gsm.datetimedate+gsm.datetime >= '");
				strBuf.append(fromDate);
				strBuf.append("'");
			}
			if (toDate != null && !"".equals(toDate) ){
				strBuf.append(" and gsm.datetimedate+gsm.datetime <=  '");
				strBuf.append(toDate);
				strBuf.append("'");
			}
			strBuf.append(" order by gsm.datetimedate+gsm.datetime asc ");
			String query = strBuf.toString();
			logger.info("getLatlngDetailsByVehicleNo Query== " + query);
			Query sqlQuery = session.createSQLQuery(query);
			sqlQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
			vehicleLatlngList = sqlQuery.list();
			logger.info("Empty VehicleNo returning NULL");
		}
		return vehicleLatlngList;
	}

	@Override
	public String getLastIngnitionOf(String vehicleNo) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		StringBuffer strBuf= new StringBuffer();
		strBuf.append("select gsm1.datetimedate+ gsm1.datetime as lastIgnition "
				+ "from gsmmaster  gsm1 " );
		if(vehicleNo !=null && vehicleNo !="" ){
			strBuf.append(" join vehiclemaster vm on ( gsm1.unitno= vm.unitno and vm.vehicleno = '"+vehicleNo +"') ");
		}
		
		strBuf.append( "  where gsm1.status=1  order by gsm1.datetimedate+ gsm1.datetime desc  fetch first 1 rows only ");
		
        		
		String query = strBuf.toString();
		logger.info("getInginationOf Query== " + query);
		Query sqlQuery = session.createSQLQuery(query);
		sqlQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
		List<Map<String, Object>>	vehicleLatlngList = sqlQuery.list();
		if(vehicleLatlngList!=null && !vehicleLatlngList.isEmpty() ){
			return ((Timestamp)vehicleLatlngList.get(0).get("lastignition")).toString();
			
		}
		
		return "";
	}

}
