package com.trackme.spring.dao.jdbc;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("GsmMasterJDBC")
public class GsmMasterJDBCImpl implements GsmMasterJDBC {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Autowired
	private JdbcTemplate jdbcTemplate;  
	  
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {  
	    this.jdbcTemplate = jdbcTemplate;  
	}  

	@Override
	public int getVehicleCountByStatus(String status) {
		StringBuilder queryStr=new StringBuilder();
		queryStr.append("select count(*)  from vehiclemaster vm join gsmmaster gsm on vm.unitno= gsm.unitNo ");
		queryStr.append("inner join ");
		queryStr.append("(select gsm1.unitno , max(gsm1.datetimedate+gsm1.datetime) as lattime ");
		queryStr.append("from  gsmmaster gsm1 group by gsm1.unitno");
		queryStr.append(" ) latest on ");
		queryStr.append(" gsm.unitno = latest.unitno and (gsm.datetimedate+gsm.datetime)=latest.lattime");
		queryStr.append(" where gsm.status in("+status);
		queryStr.append(")");
		
		int total = jdbcTemplate.queryForInt(queryStr.toString());
		return total;
	}


}
