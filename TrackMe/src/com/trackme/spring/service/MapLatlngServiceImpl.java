package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.spring.dao.MapLatlngDAO;

@Service("mapLatlngService")
public class MapLatlngServiceImpl implements MapLatlngService {

	@Autowired
	private MapLatlngDAO mapLatlngDAO;
	
	@Override
	@Transactional
	public List getAllVehicleLocation() {
		return mapLatlngDAO.getAllVehicleLocation();
	}
	
	@Override
	@Transactional
	public List getLatlngDetailsByVehicleNo(String vehicleNo, String fromDate, String toDate){
		return mapLatlngDAO.getLatlngDetailsByVehicleNo(vehicleNo, fromDate, toDate);
	}

}
