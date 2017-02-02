package com.trackme.spring.service;

import java.util.List;

public interface MapLatlngService {
	public List getAllVehicleLocation();
	public List getLatlngDetailsByVehicleNo(String vehicleNo,String fromDate, String toDate);
}
