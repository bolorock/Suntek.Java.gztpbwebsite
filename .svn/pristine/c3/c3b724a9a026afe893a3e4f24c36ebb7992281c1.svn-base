package com.suntek.gztpb.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suntek.gztpb.core.BaseService;
import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.dao.VehicleLicenseDao;
import com.suntek.gztpb.model.VehicleLicenseModel;
import com.suntek.gztpb.util.IdGenerator;

@Service("vehicleLicenseService")
public class VehicleLicenseService extends BaseService {

	@Autowired
	private VehicleLicenseDao vehicleLicenseDao;
	
	public void saveApply(VehicleLicenseModel apply,byte[] fileStream) throws ServiceException{
		try {
			apply.setCreator("admin");
			apply.setSex(0);
			apply.setBirthday("1984-08-08");
			apply.setSource(0);
			apply.setReceiveAddress("广东省广州市"+apply.getArea()+apply.getReceiveAddress());
			apply.setPlateNum("粤A"+apply.getPlateNum());
			
			if (apply.getBirthday().equals("0202")){
				apply.setBizReason("正常签满");
			}
			
			//vehicleLicenseDao.addApply(apply);
			vehicleLicenseDao.saveApply(apply,fileStream);
		} catch (Exception e) {
			throw new ServiceException(e.getMessage(), e);
		}
		
	}
}
