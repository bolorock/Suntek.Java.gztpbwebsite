package com.suntek.gztpb.model;

import java.math.BigDecimal;
import java.util.Date;

import com.suntek.gztpb.core.Saveable;

public class CarChangeModel implements Saveable {

    private String applynum;
    private String biztype;
    private String serviceitemnum;
    private String platenumtype;
    private String platenum;
    private String vehicleidnum;
    private String ownername;
    private int idtype;
    private String idno;
    private Date firstregdate;
    private String reglicenseno;
    private String zip;
    private String email;
    private String phone;
    private String mobile;
    private int source;
    private String creator;
    private Date createdtime;
    private Date submittime;
    private int finish;
    private String postaddress;
    private String  enginenum;
    

	public String getApplynum() {
		return applynum;
	}
	public void setApplynum(String applynum) {
		this.applynum = applynum;
	}
	public String getBiztype() {
		return biztype;
	}
	public void setBiztype(String biztype) {
		this.biztype = biztype;
	}
	public String getServiceitemnum() {
		return serviceitemnum;
	}
	public void setServiceitemnum(String serviceitemnum) {
		this.serviceitemnum = serviceitemnum;
	}
	public String getPlatenumtype() {
		return platenumtype;
	}
	public void setPlatenumtype(String platenumtype) {
		this.platenumtype = platenumtype;
	}
	public String getPlatenum() {
		return platenum;
	}
	public void setPlatenum(String platenum) {
		this.platenum = platenum;
	}
	public String getVehicleidnum() {
		return vehicleidnum;
	}
	public void setVehicleidnum(String vehicleidnum) {
		this.vehicleidnum = vehicleidnum;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public int getIdtype() {
		return idtype;
	}
	public void setIdtype(int idtype) {
		this.idtype = idtype;
	}
	public String getIdno() {
		return idno;
	}
	public void setIdno(String idno) {
		this.idno = idno;
	}
	public Date getFirstregdate() {
		return firstregdate;
	}
	public void setFirstregdate(Date firstregdate) {
		this.firstregdate = firstregdate;
	}
	public String getReglicenseno() {
		return reglicenseno;
	}
	public void setReglicenseno(String reglicenseno) {
		this.reglicenseno = reglicenseno;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public Date getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}
	public Date getSubmittime() {
		return submittime;
	}
	public void setSubmittime(Date submittime) {
		this.submittime = submittime;
	}
	public int getFinish() {
		return finish;
	}
	public void setFinish(int finish) {
		this.finish = finish;
	}
	public String getPostaddress() {
		return postaddress;
	}
	public void setPostaddress(String postaddress) {
		this.postaddress = postaddress;
	}
	private static String[] keyColumns = {"APPLYNUM"};
	private static String TABLENAME = "ITMS_VEHICLE_CHANGE_APPLY_TMP";
	
	public String[] getKeyColumns() {
		return keyColumns;
	}
	public String getTableName() {
		return TABLENAME;
	}
	public String getEnginenum() {
		return enginenum;
	}
	public void setEnginenum(String enginenum) {
		this.enginenum = enginenum;
	}

}
