package com.suntek.gztpb.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;

import com.suntek.gztpb.model.VehicleLicenseModel;

@Repository("VehicleLicenseDao")
@SuppressWarnings("unchecked")
public class VehicleLicenseDao extends JdbcDaoSupport {

	 private LobHandler lobHandler; // 定义 LobHandler 属性
	  public LobHandler getLobHandler() {
	    return lobHandler;
	  }
	  public void setLobHandler(LobHandler lobHandler) {
	    this.lobHandler = lobHandler;
	  }
	  
	  public void saveApply(final VehicleLicenseModel apply,final byte[] fileStream){
		  String sql="INSERT INTO itms_vehicle_license_apply_tmp (APPLYNUM,"
				  +"BIZTYPE, SERVICEITEMNUM, BIZREASON, OWNERNAME, HOMEADDRESS, ZIP, EMAIL, PHONE," 
				  +" MOBILE, IDTYPE, IDNO, SEX, BIRTHDAY, NATIVEPLACE, IGAMA, PLATENUMTYPE, PLATENUM,"
				  +"VEHICLEIDNUM, ENGINENUM, VEHICLEIMAGE, PROXYFLAG, PROXYNAME,"
				  +"PROXYADDRESS, PROXYZIP, PROXYPHONE, PROXYEMAIL, RECEIVETYPE, RECEIVER, RECEIVEADDRESS, RECEIVEPHONE,"
				  +"CREATOR, CREATEDTIME, SOURCE) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		  getJdbcTemplate().execute(sql,
			      new AbstractLobCreatingPreparedStatementCallback(this.lobHandler) { 
			          protected void setValues(PreparedStatement ps,LobCreator lobCreator)
			                      throws SQLException { 
			            ps.setString(1, apply.getApplyNum());
			            ps.setString(2, apply.getBizType());
			            ps.setString(3, apply.getSERVICEITEMNUM());
			            ps.setString(4, apply.getBizReason());
			            ps.setString(5, apply.getOwnerName());
			            ps.setString(6, apply.getHomeAddress());
			            ps.setString(7, apply.getZip());
			            ps.setString(8, apply.getEmail());
			            ps.setString(9, apply.getPhone());
			            
			            ps.setString(10, apply.getMobile());
			            ps.setInt(11,apply.getIdType());
			            ps.setString(12, apply.getIdNO());
			            ps.setInt(13, apply.getSex());
			            ps.setString(14, apply.getBirthday());
			            ps.setString(15, apply.getNATIVEPLACE());
			            ps.setString(16, apply.getIGAMA());
			            ps.setString(17, apply.getPlateNumType());
			            ps.setString(18, apply.getPlateNum());
			          
			            ps.setString(19, apply.getVehicleIdNum());
			            ps.setString(20, apply.getengineNum());
			           // ps.setString(21, apply.getVehicleImage());
			            lobCreator.setBlobAsBytes(ps, 21, fileStream);
			            ps.setInt(22, apply.getProxyFlag());
			           // ps.setString(23, apply.getLetterOfAuth());
			            ps.setString(23, apply.getPROXYNAME());

			            ps.setString(24, apply.getPROXYADDRESS());
			            ps.setString(25, apply.getPROXYzip());
			            ps.setString(26, apply.getPROXYphone());
			            ps.setString(27, apply.getPROXYemail());
			            ps.setInt(28, apply.getReceiveType());
			            ps.setString(29, apply.getReceiver());
			            ps.setString(30, apply.getReceiveAddress());
			            ps.setString(31, apply.getReceivePhone());
			            ps.setString(32, apply.getCreator());
			          //  ps.setDate(35, java.sql.Date.valueOf("2012-08-17"));// apply.getCreatedTime().toString()
			            ps.setInt(33,apply.getSource());// 
			           // ps.setString(37,"2012-09-09");//apply.getSUBMITTIME()
			          }
			        });
	  }
	  
	  public List getAttachs(final String id){
		  String sql = "select ID,Blob from itms_test where id =?  ";
		  return getJdbcTemplate().query(
		        sql,new Object[] {id},
		        new RowMapper() {
		          public byte[] mapRow(ResultSet rs, int rowNum) throws SQLException {
		            //① 以二进制数组方式获取 BLOB 数据。
		            byte[] attach = lobHandler.getBlobAsBytes(rs, 2); 
		            return attach;
		          }
		        });
		}
}
