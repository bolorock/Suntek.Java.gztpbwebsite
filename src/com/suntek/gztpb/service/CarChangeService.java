package com.suntek.gztpb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.dao.CarChangeDao;
import com.suntek.gztpb.dao.DriverChangeDao;
import com.suntek.gztpb.model.CarChangeModel;
import com.suntek.gztpb.model.DriverChangeModel;

@Service("carChangeService")
public class CarChangeService {
	@Autowired
	private CarChangeDao carChangeDao;
	public void signUp(CarChangeModel carInfo) throws ServiceException{
		try {
			carChangeDao.addUser(carInfo);
		} catch (Exception e) {
			throw new ServiceException("driverChangeDao出错:", e);
		}
	}
}
