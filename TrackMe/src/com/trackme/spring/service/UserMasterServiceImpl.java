package com.trackme.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.trackme.constants.Constant;
import com.trackme.spring.dao.UserMasterDAO;
import com.trackme.spring.model.UserMaster;

@Service("UserMasterService")
public class UserMasterServiceImpl implements UserMasterService {
	
	@Autowired
	private UserMasterDAO UserMasterDAO;

	public void setUserMasterDAO(UserMasterDAO UserMasterDAO) {
		this.UserMasterDAO = UserMasterDAO;
	}

	@Override
	@Transactional
	public void addUserMaster(UserMaster p) {
		this.UserMasterDAO.addUserMaster(p);
	}

	@Override
	@Transactional
	public void updateUserMaster(UserMaster p) {
		this.UserMasterDAO.updateUserMaster(p);
	}

	@Override
	@Transactional
	public List<UserMaster> listUserMasters() {
		return this.UserMasterDAO.listUserMasters();
	}

	@Override
	@Transactional
	public UserMaster getUserMasterById(String userName) {
		return this.UserMasterDAO.getUserMasterById(userName);
	}

	@Override
	@Transactional
	public void removeUserMaster(String userName) {
		UserMaster userMaster=UserMasterDAO.getUserMasterById(userName);
		userMaster.setStatus(Constant.STATUS_INACTIVE);
		this.UserMasterDAO.updateUserMaster(userMaster);
	}

}
