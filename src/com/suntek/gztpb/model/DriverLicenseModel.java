package com.suntek.gztpb.model;

import java.util.Date;

import com.suntek.gztpb.core.Saveable;

public class DriverLicenseModel implements Saveable {
	private String applyNum;
	private String bizType;
	private String docNum;
	private String bizReason;
	private String receiptNum;
	private String announce;
	
	private String ownerName;
	private String country;
	private Integer idType;
	private String idNO;
	private Integer sex;
	private String birthday;
	
	private String homeAddress;
	private String postAddress;
	private String postArea;
	private String phone;
	private String mobile;
	private String email;
	
	private Integer receiveType;
	private String receiver;
	private String area;
	private String receiveAddress;
	private String receivePhone;

	private String creator;
	private Date  createdTime;
	private Integer source;
	private Date submitTime;

    public String getApplyNum() {
		return applyNum;
	}
  
	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

    public String getBizType() {
		return bizType;
	}
  
	public void setBizType(String bizType) {
		this.bizType = bizType;
	}

    public String getDocNum() {
		return docNum;
	}
  
	public void setDocNum(String docNum) {
		this.docNum = docNum;
	}

    public String getBizReason() {
		return bizReason;
	}
  
	public void setBizReason(String bizReason) {
		this.bizReason = bizReason;
	}
	
	public String getReceiptNum(){
		return receiptNum;
	}
	public void setReceiptNum(String receiptNum){
		this.receiptNum=receiptNum;
	}
	
	public String getAnnounce(){
		return announce;
	}
	
	public void setAnnounce(String announce){
		this.announce=announce;
	}

    public String getOwnerName() {
		return ownerName;
	}
  
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	
    public String getCountry() {
		return country;
	}
  
	public void setCountry(String country) {
		this.country = country;
	}

    public String getHomeAddress() {
		return homeAddress;
	}
  
	public void setHomeAddress(String homeAddress) {
		this.homeAddress = homeAddress;
	}
	
    public String getPostAddress() {
		return postAddress;
	}
  
	public void setPostAddress(String postAddress) {
		this.postAddress = postAddress;
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

    public Integer getIdType() {
		return idType;
	}
  
	public void setIdType(Integer idType) {
		this.idType = idType;
	}

    public String getIdNO() {
		return idNO;
	}
  
	public void setIdNO(String idNO) {
		this.idNO = idNO;
	}

    public Integer getSex() {
		return sex;
	}
  
	public void setSex(Integer sex) {
		this.sex = sex;
	}

    public String getBirthday() {
		return birthday;
	}
  
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

    public Integer getReceiveType() {
		return receiveType;
	}
  
	public void setReceiveType(Integer receiveType) {
		this.receiveType = receiveType;
	}

    public String getReceiver() {
		return receiver;
	}
  
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

    public String getReceiveAddress() {
		return receiveAddress;
	}
  
	public void setReceiveAddress(String receiveAddress) {
		this.receiveAddress = receiveAddress;
	}
	
	public String getArea(){
		return area;
	}
	
	public void setArea(String area){
		this.area=area;
	}
	
	public String getPostArea(){
		return postArea;
	}
	
	public void setPostArea(String postArea){
		this.postArea=postArea;
	}

    public String getReceivePhone() {
		return receivePhone;
	}
  
	public void setReceivePhone(String receivePhone) {
		this.receivePhone = receivePhone;
	}

    public String getCreator() {
		return creator;
	}
  
	public void setCreator(String creator) {
		this.creator = creator;
	}

    public Date getCreatedTime() {
		return createdTime;
	}
  
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime; 
	}

    public Integer getSource() {
		return source;
	}
  
	public void setSource(Integer source) {
		this.source = source;
	}

    public Date getSubmitTime() {
		return submitTime;
	}
  
	public void setSubmitTime(Date submitTime) {
		this.submitTime = submitTime;
	}	
	
	
	private static String[] keyColumns = {"APPLYNUM"};
	private static String TABLENAME = "ITMS_DRIVER_LICENSE_APPLY_TMP";
	public String[] getKeyColumns() {
		return keyColumns;
	}
	public String getTableName() {
		return TABLENAME;
	}
}
