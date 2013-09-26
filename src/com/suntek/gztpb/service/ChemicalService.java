package com.suntek.gztpb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.dao.ChemicalDao;
import com.suntek.gztpb.model.ChemicalModel;
import com.suntek.gztpb.model.DriverChangeModel;

/** 
 * <p>Title: ChemicalService.java</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: Suntek</p> 
 * @author lam 
 * @date 2012-8-14 
 * @version 1.0 
 */
@Service("chemicalService")
public class ChemicalService {
	
	@Autowired
	private ChemicalDao chemicalDao;
	
	public void signUp(ChemicalModel chemical) throws ServiceException{
		try {
			chemicalDao.addChemical(chemical);
		} catch (Exception e) {
			//throw new ServiceException("driverChangeDao出错:", e);
			System.out.println("driverChangeDao出错:"+e.getMessage());
		}
	}

	/**
	 * 根据承运单位编号判断承运单位是否存在
	 * @param carrierNo , 承运单位编号
	 * @return true : 存在 ; false : 不存在.
	 */
	public String isCarrierExists(String carrierNo) {
		return chemicalDao.isCarrierExists(carrierNo);
	}

	public boolean isDriverExists(String name, String idNo) {
		return chemicalDao.isDriverExists(name,idNo);
	}

}

