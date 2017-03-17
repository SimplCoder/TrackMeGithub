package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.spring.dao.GeoFencingDAO;
import com.trackme.spring.model.GeoFenceDetail;

@Service("geoFencingService")
public class GeoFencingServiceImpl implements GeoFencingService {
	
	@Autowired
	private GeoFencingDAO geoFencingDAO;
	
	public GeoFencingDAO getGeoFencingDAO() {
		return geoFencingDAO;
	}

	public void setGeoFencingDAO(GeoFencingDAO geoFencingDAO) {
		this.geoFencingDAO = geoFencingDAO;
	}

	@Override
	@Transactional
	public void addGeoFence(GeoFenceDetail geoFenceDetail) {
		//geoFencingDAO.addGeoFence(geoFenceDetail);
		geoFencingDAO.saveGeoFenceUsingHibrnate(geoFenceDetail);
	}

	@Override
	@Transactional
	public void updateGeoFence(GeoFenceDetail geoFenceDetail) {
		geoFencingDAO.updateGeoFence(geoFenceDetail);
	}

	@Override
	@Transactional
	public List<GeoFenceDetail> getGeoFenceList() {
		return geoFencingDAO.getGeoFenceList();
	}

	@Override
	@Transactional
	public GeoFenceDetail getGeoFenceById(int geoFenceId) {
		return geoFencingDAO.getGeoFenceById(geoFenceId);
	}

	@Override
	@Transactional
	public void removeGeoFence(int geoFenceId) {
		geoFencingDAO.removeGeoFence(geoFenceId);
	}

}
