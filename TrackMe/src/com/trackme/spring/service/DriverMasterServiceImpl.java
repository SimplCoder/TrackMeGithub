package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.spring.dao.DriverMasterDAO;
import com.trackme.spring.dao.GenericDAO;
import com.trackme.spring.model.DriverMaster;


@Service("driverMasterService")
public class DriverMasterServiceImpl implements DriverMasterService {

	@Autowired
	private DriverMasterDAO driverMastersDAO;
	
	@Autowired
	private GenericDAO<DriverMaster> genericDAO;


	@Override
	@Transactional
	public void addDriverMaster(DriverMaster driverMaster) {
		this.driverMastersDAO.saveDriverMaster(driverMaster);
	}

	@Override
	@Transactional
	public void updateDriverMaster(DriverMaster driverMaster) {
		this.driverMastersDAO.updateDriverMaster(driverMaster);
		
	}

	@Override
	@Transactional
	public List<DriverMaster> getDriverMasterList() {
		return this.driverMastersDAO.getDriverMasterList();
	}


	@Override
	@Transactional
	public DriverMaster getDriverMasterById(String driverId) {
		return this.driverMastersDAO.getDriverMaster(driverId);
	}
	@Override
	@Transactional
	public void removeDriverMaster(String driverId) {
		this.driverMastersDAO.removeDriverMaster(driverId);
	}
}
