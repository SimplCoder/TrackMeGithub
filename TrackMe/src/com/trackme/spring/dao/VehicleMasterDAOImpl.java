package com.trackme.spring.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trackme.spring.model.FuelDetail;
import com.trackme.spring.model.VehicleMaster;


@Repository("vehicleMasterDAO")
public class VehicleMasterDAOImpl implements VehicleMasterDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(VehicleMasterDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addVehicleMaster(VehicleMaster p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("VehicleMaster saved successfully, VehicleMaster Details="+p);
	}

	@Override
	public void updateVehicleMaster(VehicleMaster p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("VehicleMaster updated successfully, VehicleMaster Details="+p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VehicleMaster> listVehicleMasters() {
		Session session = this.sessionFactory.getCurrentSession();
		List<VehicleMaster> VehicleMastersList = session.createQuery("from VehicleMaster").list();
		
		return VehicleMastersList;
	}

	@Override
	public VehicleMaster getVehicleMasterById(String vehicleNo) {
		try{
		Session session = this.sessionFactory.getCurrentSession();		
		VehicleMaster p = (VehicleMaster) session.load(VehicleMaster.class, vehicleNo);
		logger.info("VehicleMaster loaded successfully, VehicleMaster details="+p);
		return p;
		}catch(Exception e){
			logger.equals(e.getMessage());
		}
		return null;
	}

	@Override
	public void removeVehicleMaster(String vehicleNo) {
		Session session = this.sessionFactory.getCurrentSession();
		VehicleMaster p = (VehicleMaster) session.load(VehicleMaster.class, vehicleNo);
		if(null != p){
			session.delete(p);
		}
		logger.info("VehicleMaster deleted successfully, VehicleMaster details="+p);
	}

	@Override
	public int totaNoOffVehicle() {
		Session session = this.sessionFactory.getCurrentSession();
		Long count=null;
		try{
		Query query=session.createQuery("select count(*)from VehicleMaster ");
		 count = (Long)query.uniqueResult();	
		}catch(Exception e){
			return 0;
		}
		return (int)count.longValue();
	}

}
