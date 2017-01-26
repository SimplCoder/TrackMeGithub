package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.spring.dao.RouteScheduleDAO;
import com.trackme.spring.model.RouteSchedule;

@Service("routeScheduleService")
public class RouteScheduleServiceImpl implements RouteScheduleService{

	@Autowired
	private RouteScheduleDAO routeScheduleDAO;
	
	@Override
	@Transactional
	public void addRouteScheduleDetails(RouteSchedule routeSchedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public void updateRouteScheduleDetails(RouteSchedule routeSchedule) {
		// TODO Auto-generated method stub
		
	}

	@Override
	@Transactional
	public List<RouteSchedule> listRouteScheduleDetails() {
		
		return routeScheduleDAO.listRouteScheduleDetails();
	}

	@Override
	@Transactional
	public RouteSchedule getRouteScheduleDetailsById(String routeScheduleId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public void removeRouteScheduleDetails(String routeScheduleId) {
		// TODO Auto-generated method stub
		
	}

}
