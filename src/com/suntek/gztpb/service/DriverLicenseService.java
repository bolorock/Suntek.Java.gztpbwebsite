package com.suntek.gztpb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suntek.gztpb.core.BaseService;
import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.dao.DriverLicenseDao;
import com.suntek.gztpb.model.DriverLicenseModel;

@Service("driverLicenseService")
public class DriverLicenseService extends BaseService  {
	@Autowired
	private DriverLicenseDao driverLicenseDao;
	
	public void saveApply(DriverLicenseModel apply) throws ServiceException{
		try {
			apply.setCreator("admin");
			apply.setSource(0);
			apply.setPostAddress("广东省广州市"+apply.getPostArea()+apply.getPostAddress());
			apply.setReceiveAddress("广东省广州市"+apply.getArea()+apply.getReceiveAddress());

			driverLicenseDao.saveApply(apply);
		} catch (Exception e) {
			throw new ServiceException(e.getMessage(), e);
		}
		
	}
}
