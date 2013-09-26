package com.suntek.gztpb.dao;

import org.springframework.stereotype.Repository;

import com.suntek.gztpb.core.BaseDao;
import com.suntek.gztpb.model.DriverChangeModel;

@Repository("driverChangeDao")
@SuppressWarnings("unchecked")

public class DriverChangeDao extends BaseDao {
	
//	public DriverChangeModel addUser(final DriverChangeModel driverInfo){
//		driverInfo.setApplynum(String.valueOf( super.saveAndReturnKey(driverInfo)) );
//		return driverInfo; 
//	}
	
	public void addUser(final DriverChangeModel driverInfo){
      super.save(driverInfo);
	}
}
