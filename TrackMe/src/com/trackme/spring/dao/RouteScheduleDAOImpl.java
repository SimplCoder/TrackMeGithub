package com.trackme.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trackme.constants.Constant;
import com.trackme.spring.model.RouteSchedule;

@Repository("RouteScheduleDAO")
public class RouteScheduleDAOImpl implements RouteScheduleDAO{

	private static final Logger logger = LoggerFactory.getLogger(VehicleMasterDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public void addRouteScheduleDetails(RouteSchedule routeSchedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRouteScheduleDetails(RouteSchedule routeSchedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RouteSchedule> listRouteScheduleDetails() {
		Session session = this.sessionFactory.getCurrentSession();
		List<RouteSchedule> routeScheduleList =null;
		try{
			routeScheduleList = session.createQuery("from RouteSchedule where status like '"+Constant.STATUS_ACTIVE+"' ").list();
		}catch(Exception e){
			return null;
		}
		return routeScheduleList;
	}

	@Override
	public RouteSchedule getRouteScheduleDetailsById(String routeScheduleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeRouteScheduleDetails(String routeScheduleId) {
		// TODO Auto-generated method stub
		
	}

	
}
