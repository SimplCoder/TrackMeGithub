package com.trackme.spring.dao;

import java.util.List;

public interface MapLatlngDAO {
	public List getAllVehicleLocation(); 
	public List getLatlngDetailsByVehicleNo(String vehicleNo);
}
