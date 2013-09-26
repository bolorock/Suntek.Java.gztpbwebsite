package com.suntek.gztpb.model;

import java.sql.Timestamp;

import com.suntek.gztpb.core.Saveable;

/**
 * <p>
 * Title: ChemicalModel.java
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012
 * </p>
 * <p>
 * Company: Suntek
 * </p>
 * 
 * @author lam
 * @date 2012-8-14
 * @version 1.0
 */
public class ChemicalModel implements Saveable {

	
	private String applyNum; // 业务流水号yymmddss+biztype+0001 长度是16位

	private String bizType; // 业务类型0401 剧毒化学品运输许可证申请

	private String serviceItemNum; // 服务事项编码，可以是空，与市民网同步用，需要车管所提供具体的编号

	private String purchaser; // 购买单位

	private String seller; // 销售单位

	private String carrierNo; //承运单位编号
	
	private String carrier; // 承运单位

	private String carrierVehicle; // 承运车辆号

	private String vehicleType; // 承运车辆号牌种类

	private String transLicenseNum; // 道路运输证号

	private String allowQty; // 核载质量

	private String actualyQty; // 实载质量

	private String plateLicense1; // 挂车号牌1

	private String plateLicense2; // 挂车号牌2

	private String mainDriverIdNo; // 主驾驶人身份证号码

	private String mainDirverName; // 主驾驶人姓名

	private String secondDirverIdNo; // 副驾驶人身份证号

	private String secondDirverName; // 副驾驶人姓名

	private String mainEscortIdNo; // 主押运人身份证号码

	private String mainEscortName; // 主押运人姓名

	private String secondeScortIdNo; // 副押运人身份证号码

	private String secondeScortName; // 副押运人姓名

	private String proofType; // 购买凭证类型

	private String proofNo; // 购买凭证编号

	private String line; // 通行线路

	private Timestamp goBeginTime; // 通行开始时间

	private Timestamp goFinishTime; // 通行结束时间

	private String goodsType1; // 运输物品品种名称1

	private String goodsNum1; // 运输物品数量/重量1

	private String goodsType2; // 运输物品品种名称2

	private String goodsNum2; // 运输物品数量/重量2

	private String goodsType3; // 运输物品品种名称3

	private String goodsNum3; // 运输物品数量/重量3

	private String applicant; // 申请人

	private String applicantTelNo; // 申请人联系电话

	private String applicantIdNo; // 申请人身份证号码

	private Timestamp applyTime; // 申请时间

	private String creator; // 创建人

	private Timestamp createdTime; // 创建时间

	private int source; // 来源
	
	private Timestamp submiTime;
	
	private int finish ;

	
	public ChemicalModel(){}

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

	public String getServiceItemNum() {
		return serviceItemNum;
	}

	public void setServiceItemNum(String serviceItemNum) {
		this.serviceItemNum = serviceItemNum;
	}

	public String getPurchaser() {
		return purchaser;
	}

	public void setPurchaser(String purchaser) {
		this.purchaser = purchaser;
	}

	public String getSeller() {
		return seller;
	}

	public void setSeller(String seller) {
		this.seller = seller;
	}

	public String getCarrier() {
		return carrier;
	}

	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}

	public String getCarrierVehicle() {
		return carrierVehicle;
	}

	public void setCarrierVehicle(String carrierVehicle) {
		this.carrierVehicle = carrierVehicle;
	}

	public String getVehicleType() {
		return vehicleType;
	}

	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}

	public String getTransLicenseNum() {
		return transLicenseNum;
	}

	public void setTransLicenseNum(String transLicenseNum) {
		this.transLicenseNum = transLicenseNum;
	}

	public String getAllowQty() {
		return allowQty;
	}

	public void setAllowQty(String allowQty) {
		this.allowQty = allowQty;
	}

	public String getActualyQty() {
		return actualyQty;
	}

	public void setActualyQty(String actualyQty) {
		this.actualyQty = actualyQty;
	}

	public String getPlateLicense1() {
		return plateLicense1;
	}

	public void setPlateLicense1(String plateLicense1) {
		this.plateLicense1 = plateLicense1;
	}

	public String getPlateLicense2() {
		return plateLicense2;
	}

	public void setPlateLicense2(String plateLicense2) {
		this.plateLicense2 = plateLicense2;
	}

	public String getMainDriverIdNo() {
		return mainDriverIdNo;
	}

	public void setMainDriverIdNo(String mainDriverIdNo) {
		this.mainDriverIdNo = mainDriverIdNo;
	}

	public String getMainDirverName() {
		return mainDirverName;
	}

	public void setMainDirverName(String mainDirverName) {
		this.mainDirverName = mainDirverName;
	}

	public String getSecondDirverIdNo() {
		return secondDirverIdNo;
	}

	public void setSecondDirverIdNo(String secondDirverIdNo) {
		this.secondDirverIdNo = secondDirverIdNo;
	}

	public String getSecondDirverName() {
		return secondDirverName;
	}

	public void setSecondDirverName(String secondDirverName) {
		this.secondDirverName = secondDirverName;
	}

	public String getMainEscortIdNo() {
		return mainEscortIdNo;
	}

	public void setMainEscortIdNo(String mainEscortIdNo) {
		this.mainEscortIdNo = mainEscortIdNo;
	}

	public String getMainEscortName() {
		return mainEscortName;
	}

	public void setMainEscortName(String mainEscortName) {
		this.mainEscortName = mainEscortName;
	}

	public String getSecondeScortIdNo() {
		return secondeScortIdNo;
	}

	public void setSecondeScortIdNo(String secondeScortIdNo) {
		this.secondeScortIdNo = secondeScortIdNo;
	}

	public String getSecondeScortName() {
		return secondeScortName;
	}

	public void setSecondeScortName(String secondeScortName) {
		this.secondeScortName = secondeScortName;
	}

	public String getProofType() {
		return proofType;
	}

	public void setProofType(String proofType) {
		this.proofType = proofType;
	}

	public String getProofNo() {
		return proofNo;
	}

	public void setProofNo(String proofNo) {
		this.proofNo = proofNo;
	}

	public String getLine() {
		return line;
	}

	public void setLine(String line) {
		this.line = line;
	}

	public Timestamp getGoBeginTime() {
		return goBeginTime;
	}

	public void setGoBeginTime(Timestamp goBeginTime) {
		this.goBeginTime = goBeginTime;
	}

	public Timestamp getGoFinishTime() {
		return goFinishTime;
	}

	public void setGoFinishTime(Timestamp goFinishTime) {
		this.goFinishTime = goFinishTime;
	}

	public String getGoodsType1() {
		return goodsType1;
	}

	public void setGoodsType1(String goodsType1) {
		this.goodsType1 = goodsType1;
	}

	public String getGoodsNum1() {
		return goodsNum1;
	}

	public void setGoodsNum1(String goodsNum1) {
		this.goodsNum1 = goodsNum1;
	}

	public String getGoodsType2() {
		return goodsType2;
	}

	public void setGoodsType2(String goodsType2) {
		this.goodsType2 = goodsType2;
	}

	public String getGoodsNum2() {
		return goodsNum2;
	}

	public void setGoodsNum2(String goodsNum2) {
		this.goodsNum2 = goodsNum2;
	}

	public String getGoodsType3() {
		return goodsType3;
	}

	public void setGoodsType3(String goodsType3) {
		this.goodsType3 = goodsType3;
	}

	public String getGoodsNum3() {
		return goodsNum3;
	}

	public void setGoodsNum3(String goodsNum3) {
		this.goodsNum3 = goodsNum3;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public String getApplicantTelNo() {
		return applicantTelNo;
	}

	public void setApplicantTelNo(String applicantTelNo) {
		this.applicantTelNo = applicantTelNo;
	}

	public String getApplicantIdNo() {
		return applicantIdNo;
	}

	public void setApplicantIdNo(String applicantIdNo) {
		this.applicantIdNo = applicantIdNo;
	}

	public Timestamp getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Timestamp applyTime) {
		this.applyTime = applyTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public Timestamp getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Timestamp createdTime) {
		this.createdTime = createdTime;
	}

	public int getSource() {
		return source;
	}

	public void setSource(int source) {
		this.source = source;
	}

	public Timestamp getSubmiTime() {
		return submiTime;
	}

	public void setSubmiTime(Timestamp submiTime) {
		this.submiTime = submiTime;
	}

	public int getFinish() {
		return finish;
	}

	public void setFinish(int finish) {
		this.finish = finish;
	}
	
	private static String[] keyColumns = { "APPLYNUM" };
	private static String TABLENAME = "ITMS_HTC_LICENSE_APPLY_TMP";

	public String getTableName() {
		return TABLENAME;
	}

	public String[] getKeyColumns() {
		return keyColumns;
	}

	public String getCarrierNo() {
		return carrierNo;
	}

	public void setCarrierNo(String carrierNo) {
		this.carrierNo = carrierNo;
	}



}
