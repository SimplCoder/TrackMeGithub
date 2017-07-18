package com.trackme.spring.service;

import java.util.List;

import com.trackme.spring.model.GeoFenceDetail;



public interface GeoFencingService {

	public void addGeoFence(GeoFenceDetail geoFenceDetail);
	public void updateGeoFence(GeoFenceDetail geoFenceDetail);
	public List<GeoFenceDetail> getGeoFenceList();
	public GeoFenceDetail getGeoFenceById(int geoFenceId);
	public void removeGeoFence(int geoFenceId);
	public void createPushNotification();
	
}
