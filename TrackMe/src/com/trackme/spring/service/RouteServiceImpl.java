package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.spring.dao.RouteDetailsDAO;
import com.trackme.spring.model.Route;

@Service("routeService")
public class RouteServiceImpl implements RouteService{

	@Autowired
	private RouteDetailsDAO routeDetailsDAO;
	
	@Override
	@Transactional
	public void addRouteDetails(Route routeDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public void updateRouteDetails(Route routeDetails) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public List<Route> listRouteDetails() {
		// TODO Auto-generated method stub
		return routeDetailsDAO.listRouteDetails();
	}

	@Override
	@Transactional
	public Route getRouteDetailsById(String routeDetailsId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void removeRouteDetails(String routeDetailsId) {
		// TODO Auto-generated method stub
		
	}

}
