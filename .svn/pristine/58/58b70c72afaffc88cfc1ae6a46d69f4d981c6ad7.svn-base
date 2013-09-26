package com.suntek.gztpb.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.suntek.gztpb.core.BaseDao;
import com.suntek.gztpb.model.ChemicalModel;

/** 
 * <p>Title: ChemicalDao.java</p> 
 * <p>Description: </p> 
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: Suntek</p> 
 * @author lam 
 * @date 2012-8-14 
 * @version 1.0
 */
@Repository("chemicalDao")
public class ChemicalDao extends BaseDao{

	public void addChemical(ChemicalModel chemical) {
		super.save(chemical);
	}

	/**
	 * 根据承运单位编号判断承运单位是否存在
	 * @param carrierNo , 承运单位编号
	 * @return true : 存在 ; false : 不存在.
	 */
	public String isCarrierExists(String carrierNo) {
		String sql = "SELECT DWMC FROM WXP_YS_CORP WHERE DWBH = '"+carrierNo+"'";
		List<Map<String,Object>> result = getJdbcTemplate().queryForList(sql);
//		System.out.println("result:"+result);
		if(result.size() > 0 ){
			String carrier = String.valueOf(result.get(0).get("DWMC"));
			return carrier;
		}else{
			return "0";
		}
	}

	public boolean isDriverExists(String name, String idNo) {
		
		return false;
	}

}

