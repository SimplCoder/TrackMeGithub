package com.trackme.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trackme.spring.model.Route;

@Repository("RouteDetailsDAO")
public class RouteDetailsDAOImpl implements RouteDetailsDAO{

	private static final Logger logger = LoggerFactory.getLogger(VehicleMasterDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}	
	
	@Override
	public void addRouteDetails(Route routeDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateRouteDetails(Route routeDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Route> listRouteDetails() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Route> routeDetailList =null;
		try{
			routeDetailList = session.createQuery("from Route").list();
		}catch(Exception e){
			return null;
		}
		return routeDetailList;
	}

	@Override
	public Route getRouteDetailsById(String routeDetailsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeRouteDetails(String routeDetailsId) {
		// TODO Auto-generated method stub
		
	}

}
