package com.trackme.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trackme.constants.Constant;
import com.trackme.spring.model.GeoFenceDetail;

@Repository
public class GeoFencingDAOImpl implements GeoFencingDAO {

	private static final Logger logger = LoggerFactory.getLogger(GeoFencingDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	
	
	
	@Override
	public void addGeoFence(GeoFenceDetail geoFenceDetail) {}

	@Override
	public void updateGeoFence(GeoFenceDetail geoFenceDetail) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(geoFenceDetail);
		session.flush();
		logger.info("geoFenceDetail updated successfully, geoFenceDetail Details="+geoFenceDetail);

	}

	@Override
	public List<GeoFenceDetail> getGeoFenceList() {
		Session session = this.sessionFactory.getCurrentSession();
		List<GeoFenceDetail> geoFenceList = session.createQuery("from GeoFenceDetail where status like '"+Constant.STATUS_ACTIVE+"' ").list();
		return geoFenceList;
	}

	@Override
	public GeoFenceDetail getGeoFenceById(int geoFenceId) {
		try{
			Session session = this.sessionFactory.getCurrentSession();		
			GeoFenceDetail geoFenceDetail = (GeoFenceDetail) session.load(GeoFenceDetail.class, geoFenceId);
			if(null!=geoFenceDetail.getStatus()){
				if(geoFenceDetail.getStatus().equals(Constant.STATUS_INACTIVE)){
					logger.info("GeoFenceDetail status is Inactive, GeoFenceDetail details="+geoFenceDetail);
					return null;
				}
			}
			logger.info("GeoFenceDetail loaded successfully, GeoFenceDetail details="+geoFenceDetail);
			return geoFenceDetail;
			}catch(Exception e){
				logger.equals(e.getMessage());
			}
			return null;
	}

	@Override
	public void removeGeoFence(int geoFenceId) {
		Session session = this.sessionFactory.getCurrentSession();
		GeoFenceDetail geoFenceDetail = (GeoFenceDetail) session.load(GeoFenceDetail.class, geoFenceId);
		if(null != geoFenceDetail){
//			session.delete(geoFenceDetail);
			geoFenceDetail.setStatus(Constant.STATUS_INACTIVE);
			session.update(geoFenceDetail);
			session.flush();
		}
		logger.info("GeoFenceDetail deleted successfully, GeoFenceDetail details="+geoFenceDetail);
	}

	@Override
	public void saveGeoFenceUsingHibrnate(GeoFenceDetail geoFenceDetail) {
	Session session = this.sessionFactory.getCurrentSession();
	session.save(geoFenceDetail);
		
		// TODO Auto-generated method stub
		
	}

}
