package com.suntek.gztpb.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.suntek.gztpb.core.BaseService;
import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.dao.DriverChangeDao;
import com.suntek.gztpb.model.DriverChangeModel;

@Service("driverChangeService")
public class DriverChangeService {

		@Autowired
		private DriverChangeDao driverChangeDao;
		public void signUp(DriverChangeModel driverInfo) throws ServiceException{
			try {
				driverChangeDao.addUser(driverInfo);
			} catch (Exception e) {
				throw new ServiceException("driverChangeDao出错:", e);
			}
		}
		
		
	}

	
