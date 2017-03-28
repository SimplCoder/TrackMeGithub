package com.trackme.spring.service;

import java.util.List;

public interface MapLatlngService {
	public List getAllVehicleLocation();
	public List getLatlngDetailsByVehicleNo(String vehicleNo,String fromDate, String toDate);
	public  String getLastIngnitionOf(String vehicleNo);
	public double getDistance(double lat1, double lng1, double lat2, double lng2, String unit);
}
