package com.suntek.gztpb.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.jdbc.core.support.AbstractLobCreatingPreparedStatementCallback;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.lob.LobCreator;
import org.springframework.jdbc.support.lob.LobHandler;
import org.springframework.stereotype.Repository;

import com.suntek.gztpb.model.DriverLicenseModel;

@Repository("DriverLicenseDao")
@SuppressWarnings("unchecked")
public class DriverLicenseDao extends JdbcDaoSupport {
	 private LobHandler lobHandler; // 定义 LobHandler 属性
	  public LobHandler getLobHandler() {
	    return lobHandler;
	  }
	  public void setLobHandler(LobHandler lobHandler) {
	    this.lobHandler = lobHandler;
	  }
	  
	  public void saveApply(final DriverLicenseModel apply){
		  String sql="INSERT INTO "+apply.getTableName()
				  +" (APPLYNUM,BIZTYPE, DOCNUM,BIZREASON,receiptNum,"
				  +"OWNERNAME,country,IDTYPE,IDNO,SEX,BIRTHDAY,"
				  +"HOMEADDRESS,postAddress,PHONE,MOBILE,EMAIL," 
				  +"RECEIVETYPE, RECEIVER, RECEIVEADDRESS, RECEIVEPHONE,"
				  +"CREATOR, CREATEDTIME, SOURCE) VALUES("
				  +"?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		  getJdbcTemplate().execute(sql,
			      new AbstractLobCreatingPreparedStatementCallback(this.lobHandler) { 
			          protected void setValues(PreparedStatement ps,LobCreator lobCreator)
			                      throws SQLException { 
			            ps.setString(1, apply.getApplyNum());
			            ps.setString(2, apply.getBizType());
			            ps.setString(3, apply.getDocNum());
			            ps.setString(4, apply.getBizReason());
			            ps.setString(5, apply.getReceiptNum());
			            
			            ps.setString(6, apply.getOwnerName());
			            ps.setString(7, apply.getCountry());
			            ps.setInt(8,apply.getIdType());
			            ps.setString(9, apply.getIdNO());
			            ps.setInt(10, apply.getSex());
			            ps.setString(11, apply.getBirthday());
			            
			            ps.setString(12, apply.getHomeAddress());
			            ps.setString(13, apply.getPostAddress());
			            ps.setString(14, apply.getPhone());
			            ps.setString(15, apply.getMobile());
			            ps.setString(16, apply.getEmail());
			            
			            ps.setInt(17, apply.getReceiveType());
			            ps.setString(18, apply.getReceiver());
			            ps.setString(19, apply.getReceiveAddress());
			            ps.setString(20, apply.getReceivePhone());
			              
			            ps.setString(21, apply.getCreator());
			            ps.setInt(22,apply.getSource());
			          }
			        });
	  }
}
