<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>剧毒化学品公路运输通行证申请表</title>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/datetimepicker/WdatePicker.js"></script>
<script type="text/javascript"
			src="/gztpbwebsite/js/jquery-1.4.2.min.js">
</script>
<script type="text/javascript">

function addNewRow(){
	var t = document.getElementById("product");
	var row = t.insertRow(-1);
	var cell1 = row.insertCell(-1);
	var cell2 = row.insertCell(-1);
	var cell3 = row.insertCell(-1);
	cell1.innerHTML = "<select name=\"productName\" style=\"width: 90%;margin-left: 5px;\">"+
							"<option value=''>--请选择品名--</option>"+
						    "<option value='1'>氰化钠</option>"+
						    "<option value='2'>双氧水</option>"+
					  "</select>";
	cell2.innerHTML = "<input type=\"text\" id=\"\" name=\"amount\" width=\"40;\" size=\"40;\" style=\"margin-left: 5px;\">";
	cell3.innerHTML = "<input type=\"button\" id=\"\" name=\"\" style=\"font-size: 13px;color: #4A4A4A;\" value=\"删除\" onclick=\"deleteCurrentRow(this)\" />";
}

function deleteCurrentRow(obj){    
	var tr=obj.parentNode.parentNode;    
	 
	var tbody=tr.parentNode;    
	  
	tbody.removeChild(tr);  
}

function deleteRow(rowIndex){
	//if(confirm("是否删除当前品种，删除后不可恢复")){
		document.getElementById("product").deleteRow(rowIndex);
		//findObj("product",document).deleteRow(rowIndex);
		
	//}
}

/*日期选择*/
function datePicker(obj) {
new WdatePicker({
dateFmt: convert_format('yyyymm'),
isShowToday: true,
readOnly: true,
onpicked: function(dp) {
monthChange(obj);
}
});
}

//验证表格输入是否正确
function doValidate(){	
	var buyDept = obj("buyDept");
	if(buyDept.value.trim() == ""){
		alert("购买单位名称为必填项！");
		return ;
	}
	var seller = obj("seller");
	if(seller.value.trim() == ""){
		alert("销售单位名称为必填项！");
		return ;
	}
	var transportDept = obj("transportDept");
	if(transportDept.value.trim() == ""){
		alert("承运单位名称为必填项！");
		return ;
	}
	var truckNumber = obj("truckNumber");
	if(truckNumber.value.trim() == ""){
		alert("牌照号码为必选项！");
		return ;
	}
	var transportNumber1 = obj("transportNumber1");
	var transportNumber2 = obj("transportNumber2");
	if(transportNumber1.value.trim() == "" || transportNumber2.value.trim() == "" ){
		alert("挂车号牌为必选项！");
		return ;
	}
	var driver = obj("driver");var driver2 = obj("driver2");
	if(driver.value.trim() == "" || driver2.value.trim() == ""){
		alert("驾驶人员姓名为必填项！");
		return ;
	}
	var driverID = obj("driverID");var driver2ID = obj("driver2ID");
	if(driverID.value.trim() == "" || driver2ID.value.trim() == ""){
		alert("驾驶人员身份证件号码为必填项！");
		return ;
	}
	var escortor = obj("escortor");var escortor2 = obj("escortor2");
	if(escortor.value.trim() == "" || escortor2.value.trim() == ""){
		alert("押运人员姓名为必填项！");
		return ;
	}
	var escortorID = obj("escortorID");var escortor2ID = obj("escortor2ID");
	if(escortorID.value.trim() == "" || escortor2ID.value.trim() == ""){
		alert("押运人员身份证件号码为必填项！");
		return ;
	}
	var applier = obj("applier");
	if(applier.value.trim() == ""){
		alert("申请人员姓名为必填项！");
		return ;
	}
	var applierID = obj("applierID");
	if(applierID.value.trim() == ""){
		alert("申请人员身份证件号码为必填项！");
		return ;
	}
	var applierPhone = obj("applierPhone");
	if(applierPhone.value.trim() == ""){
		alert("申请人员手机号码为必填项！");
		return ;
	}
	var credentials = obj("credentials");
	if(credentials.value.trim() == ""){
		alert("购买许可或进出口登记证件号码 为必填项！");
		return ;
	}
	
	/*
	* 品种验证
	*/
	var aoumt = 0 ;
	var productName1 = obj("productName1");
	var productAoumt1 = obj("productAoumt1");
	var productName2 = obj("productName2");
	var productAoumt2 = obj("productAoumt2");
	if(productName1.value.trim() != "" && productAoumt1.value.trim() == "" ){
		alert("运输品种数量为必填项");
		return ;
	}else{
		if(productName1.value.trim() == "" && productAoumt1.value.trim() != "" ){
			alert("运输品种品名为必填项");
			return ;
		}
	}
	if(productName2.value.trim() != "" && productAoumt2.value.trim() == "" ){
		alert("运输品种数量为必填项");
		return ;
	}else{
		if(productName2.value.trim() == "" && productAoumt2.value.trim() != "" ){
			alert("运输品种品名为必填项");
			return ;
		}
	}
	if(productName1.value.trim() == "" && productAoumt1.value.trim() == ""
			&& productName2.value.trim() == "" && productAoumt2.value.trim() == ""){
		alert("运输品种必填项");
		return ;
	}
	
	var way = obj("way");
	if(way.value.trim() == ""){
		alert("运输路线为必选项！");
		return ;
	}
	var startTime = obj("startTime");
	if(startTime.value.trim() == ""){
		alert("开始时间为必选项！");
		return ;
	}
	var endTime = obj("endTime");
	if(endTime.value.trim() == ""){
		alert("结束时间为必选项！");
		return ;
	}
	
	/*
	var names = document.getElementsByName("name");
	for( var i = 0 ; i < names.length ; i++){
		if(names[i].value.trim() == ""){
			alert("名称或姓名不能为空！");
			return ;
		}
	}
	*/
	/*
	var representor = document.getElementById("representor");
    if(representor.value.trim() == ""){
    	alert("法定代表人不能为空！");
		return ;
    }
    */
    /*
    var telephones = document.getElementsByName("telephone");
	for( var i = 0 ; i < telephones.length ; i++){
		if(!isTelephoneCorrect(telephones[i].value.trim())){
			alert("联系电话格式不正确！");
			return ;
		}
	}
	*/
	
	/*
	var IDs = document.getElementsByName("ID");
	for( var i = 0 ; i < IDs.length ; i++){
		if(!isIDCorrect(IDs[i].value)){
			alert("身份证号码不正确！");
			return ;
		}
	}
	var qualitys = document.getElementsByName("quality");
	for( var i = 0 ; i < qualitys.length ; i++){
		if(!isQualityCorrect(qualitys[i].value.trim())){
			alert("质量格式不正确！");
			return ;
		}
	}
	var amounts = document.getElementsByName("amount");
	for( var i = 0 ; i < amounts.length ; i++){
		if(!isAmountCorrect(amounts[i].value.trim())){
			alert("数量格式不正确！");
			return ;
		}
	}
	var way = document.getElementById("way");
	if(way.value.trim() == ""){
		alert("请选择运输路线！");
		return ;
	}
	
	var startTime = document.getElementById("startTime");
	var endTime = document.getElementById("endTime");
	if(startTime.value.trim() == ""){
		alert("开始时间不能为空！");
		return ;
	}
	if(endTime.value.trim() == ""){
		alert("结束时间不能为空！");
		return ;
	}
	*/
	var date = new Date();
	
	alert("申请成功，本次申请流水号为"+date.getFullYear()+(date.getMonth()+1)+date.getDate()+date.getHours()+date.getMinutes()+date.getSeconds()+".");
	location.href="/gztpbwebsite/jsp/hxjd/fillForm2.jsp";
	return true;
}

//去掉字符串两边空格
String.prototype.trim = function (){
    return this.replace(/(^\s*)|(\s*$)/g , '');
}

//判断身份证号码格式是否正确
function isIDCorrect(value){
	//身份证正则表达式(15位) 
	var isIDCard15=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 
	//身份证正则表达式(18位) 
	var isIDCard18=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/; 
    if(isIDCard15.test(value) || isIDCard18.test(value) ){
    	return true;
    }else{
    	return false;
    }
}

//电话号码格式是否正确
function isTelephoneCorrect(value){
	if(/((d{3,4})|d{3,4}-)?d{7,8}(-d{3})*/.test(value))
		return true;
	else
		return false;
}

//手机号码格式是否正确
function isPhoneCorrect(value){
	
}

//判断非负整数
function isAmountCorrect(value){
	if(/^\d+$/.test(value) )
		return true;
	else
		return false;
}

//判断非负整数或非负小数
function isQualityCorrect(value){
	if( /^\d+$/.test(value) || /^\d+(\.\d+)?$/.test(value))
		return true;
	else
		return false;
}

//购买单位是否合法
function isBuyDeptLegal(obj){
	var buyDeptLegal = "购买单位";
	if(obj.value.trim() == buyDeptLegal){
		document.getElementById("buyDeptSpan").innerHTML = "";
	}else{
		document.getElementById("buyDeptSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">购买单位审核不通过!</font>";
	    /*
		obj.blur();
		obj.focus();
		*/
		
	}
}

//承运单位是否合法
function isTransportDeptLegal(obj){
	var transportLegal = "承运单位";
	if(obj.value.trim() == transportLegal){
		document.getElementById("transportDeptSpan").innerHTML = "";
	}else{
		document.getElementById("transportDeptSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">承运单位审核不通过!</font>";
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//承运车辆号码是否合法
function isTruckNumberLegal(obj){
	var truckNumberLegal = "粤A000000";
	if(obj.value.trim() == truckNumberLegal){
		document.getElementById("truckNumberSpan").innerHTML = "";
	}else{
		document.getElementById("truckNumberSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">牌照号码审核不通过!</font>";
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//挂车号牌是否合法
function isTransportNumberLegal(obj){
	var truckNumberLegal = "粤A000000";
	if(obj.value.trim() == truckNumberLegal){
		if(obj.id == "transportNumber1")
			document.getElementById("transportNumber1Span").innerHTML = "";
		else
			document.getElementById("transportNumber2Span").innerHTML = "";
	}else{
		if(obj.id == "transportNumber1")
			document.getElementById("transportNumber1Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">挂车号牌1审核不通过!</font>";
		else
			document.getElementById("transportNumber2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">挂车号牌2审核不通过!</font>";
		
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//驾驶人员是否合法
function isDriverLegal(obj){
	var driverLegal = "驾驶人员";
	if(obj.value.trim() == driverLegal){
		if(obj.id == "driver")
			document.getElementById("driverSpan").innerHTML = "";
		else
			document.getElementById("driver2Span").innerHTML = "";
	}else{
		if(obj.id == "driver")
			document.getElementById("driverSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">主驾驶人审核不通过!</font>";
		else
			document.getElementById("driver2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">副驾驶人审核不通过!</font>";
		
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//押运人员是否合法
function isEscortorLegal(obj){
	var escortorLegal = "押运人员";
	if(obj.value.trim() == escortorLegal){
		if(obj.id == "escortor")
			document.getElementById("escortorSpan").innerHTML = "";
		else
			document.getElementById("escortor2Span").innerHTML = "";
	}else{
		if(obj.id == "escortor")
			document.getElementById("escortorSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">主押运人审核不通过!</font>";
		else
			document.getElementById("escortor2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">副押运人审核不通过!</font>";
		
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

function obj(id){
	return document.getElementById(id);
}

</script>
<style>
body {
	border-left: 1px solid #D9E0EA;
	border-right: 1px solid #D9E0EA;
	margin: 0px;
	padding:20px 7px 0px 7px;
}

td {
	padding: 2px 0px;vertical-align: middle;
}

.text {
	background-color: #EFF3FA;
	border-right: 1px solid #B1B9DC;
	text-align: right;
	font-size: 13px;
	color: #4A4A4A;
	width: 90px;
}
.text2 {
	background-color: #EFF3FA;
	border-right: 1px solid #B1B9DC;
	text-align: right;
	font-size: 13px;
	color: #4A4A4A;
	width: 70px;
}
 .requested{
 color:red;
 }
#jdc_table {
	font-size: 12px;
	color:#4A4A4A;
	margin-top:5px;
}

.text font {
	color: red;
	font-size: 12px;
}
.secondValue{
    margin-left: 5px;
}


</style>
	</head>

	<body>
	<div style="text-align:center;margin-bottom:5px;">
		<font size="4" color="#085DB2">剧毒化学品公路运输通行证申请表</font>
	</div>
	  <form id="form1" action="?" method="post"  style="margin:0px;">
	  <fieldset>
	  <!-- <legend><font></font></legend> -->
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="0" cellpadding="0" style="">
			<tr >
     <td >购买单位</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >名    称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="buyDept" name="buyDept" width="30;" size="30;" onblur="isBuyDeptLegal(this);" class="secondValue"/><br/>
                         <span id="buyDeptSpan"></span>                         
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >法定代表人&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                      <input type="text" id="representor" name="representor"  width="30;" size="30;"  class="secondValue"/>
				</td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">地    址&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">联系电话&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
  </tr>
  <tr >
     <td >销售单位</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >名    称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="seller" name="seller" width="30;" size="30;" class="secondValue"/><br/>
                                                 
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >法定代表人&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                      <input type="text" id="representor2" name="representor2"  width="30;" size="30;"  class="secondValue"/>
				</td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">地    址&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">联系电话&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone2" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
  </tr>
			<tr >
				<td >承运单位</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">名    称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="transportDept" name="transportDept"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportDeptLegal(this);"/><br/>
                 	  <span id="transportDeptSpan"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">经营许可证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;" />
				 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">地    址&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">联系电话&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
			</tr>
			<tr >
     <td>承运车辆</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">牌照号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                     <select id="truckNumber" name="truckNumber" style="width:90%;margin-left: 5px;"  onblur="isTruckNumberLegal(this);">
			            <option value=''>--请选择牌照号码--</option>
			            <option value='粤A000000'>粤A000000</option>
			            <option value='粤A000001'>粤A000001</option>
			        </select>
			        <!-- 
                 	 <input type="text" id="truckNumber" name="truckNumber"  width="30;" size="30;"/><br/>
			          -->
                 	 <span id="truckNumberSpan"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">道路运输证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">核载质量&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="quality"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">实际载质量&nbsp;&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="quality" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>挂车信息</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">挂车号牌1<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="transportNumber1" name="transportNumber1"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportNumberLegal(this);"/><br/>
                 	  <span id="transportNumber1Span"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">挂车号牌2<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="transportNumber2" name="transportNumber2"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportNumberLegal(this);"/><br/>
                 	  <span id="transportNumber2Span"></span>
				 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>主驾驶人</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">姓    名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver" name="driver" width="30;" size="30;" style="margin-left: 5px;" onblur="isDriverLegal(this);"  /><br/>
                 	 <span id="driverSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">上岗资格证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">身份证件号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driverID" name="driverID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>副驾驶人</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">姓    名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver2" name="driver2" width="30;" size="30;" style="margin-left: 5px;" onblur="isDriverLegal(this);"  /><br/>
                 	 <span id="driver2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">上岗资格证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">身份证件号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver2ID" name="driver2ID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
   <tr >
     <td>主押运人</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">姓      名<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor" name="escortor"  width="30;" size="30;" style="margin-left: 5px;" onblur="isEscortorLegal(this);" /><br/>
                 	 <span id="escortorSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">上岗资格证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">身份证件号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortorID" name="escortorID" width="30;" size="30;"  style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>副押运人</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">姓      名<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor2" name="escortor2"  width="30;" size="30;" style="margin-left: 5px;" onblur="isEscortorLegal(this);" /><br/>
                 	 <span id="escortor2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">上岗资格证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">身份证件号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor2ID" name="escortor2ID" width="30;" size="30;"  style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>申请人员</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">姓    名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="applier" name="applier" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">身份证件号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="applierID" name="applierID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="applierPhone" name="applierPhone" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">&nbsp;</td>
                 <td>&nbsp;</td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
    <td colspan="5">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin:0px;">
            <tr>
	            <td align="right" style="background-color: #EFF3FA;border-right: 1px solid #B1B9DC;color: #4A4A4A;font-size: 13px;" width="30%;">购买许可或进出口登记证件号码 <span class="requested">*</span></td>
	    		<td><input type="text" id="credentials" name="credentials"  width="65" size="65" style="margin-left: 5px;"/></td>
    		</tr>
        </table>
    </td>
    
  </tr>
  <tr >
    <td>
                   运输品种<span class="requested">*</span><br/>
       <input type="button" id="addProductBtn" name="addProductBtn" style="margin:0px;font-size: 13px;color: #4A4A4A;" value="添加品种" onclick="addNewRow();"/>            
    </td>
    <td>
        <table id="product" width="100%" border="0" cellspacing="2" cellpadding="0" style="margin:0px;font-size: 13px;color: #4A4A4A;">
            <tr >
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">品名<span class="requested">*</span></td>
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">数量（千克）<span class="requested">*</span>
            	</td>
            	<td align="center" style="background-color: #EFF3FA;">操作</td>
           	</tr>
           	<tr>
            	<td >
            		 <select id="productName1" name="productName1" style="width: 90%;margin-left: 5px;">
			            <option value='' >--请选择品名--</option>
			            <option value='1'>氰化钠</option>
			            <option value='2'>双氧水</option>
			        </select>
            	</td>
            	<td>
            		<input type="text" id="productAoumt1" name="productAoumt1" width="40;" size="40;" style="margin-left: 5px;"/>        		 
            	</td>
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="删除" onclick="deleteCurrentRow(this)" />
            	</td>
           	</tr>
           	<tr>
            	<td >
            		 <select id="productName2" name="productName2" style="width: 90%;margin-left: 5px;">
			            <option value=''>--请选择品名--</option>
			            <option value='1'>氰化钠</option>
			            <option value='2'>双氧水</option>
			        </select>
            	</td>
            	<td>
            		 <input type="text" id="productAoumt2" name="productAoumt2" width="40;" size="40;" style="margin-left: 5px;"/>
            	</td>
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="删除" onclick="deleteCurrentRow(this)" />
            	</td>
           	</tr>           	
        </table>
    </td>
  </tr>
  <tr >
    <td>运输路线<span class="requested">*</span></td>
    <td>
    <table width="100%"  border="0" cellspacing="0" bordercolor="#d2e2f0" cellpadding="3" frame="void"
            style="border-collapse: collapse;">
            <tr>
    <td width="180px;" align="left">
        <select id="way" style="width: 90%;margin-left: 5px;">
            <option value=''>--请选择--</option>
            <option value='1'>广州->深圳</option>
            <option value='2'>广州->佛山</option>
        </select>
    </td> 
    <td class="text2">开始时间<span class="requested">*</span></td>
    <td>
        <input type="text" class="Wdate" name="startTime" id="startTime" size="22"
onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});"
readOnly="readonly"/>
    </td> 
    <td class="text2">结束时间<span class="requested">*</span></td>
    <td>
        <input type="text" class="Wdate" name="endTime" id="endTime" size="22"
onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true})"
readOnly="readonly"/>
    </td>  
    </tr>
    </table>
    </td>
  </tr>
		</table>
     
	  </fieldset>
	  </form>
	  <div align="center" style="margin-top: 20px;font-size:13px;color:#666666">
所有带有星号（<span class="requested">*</span>）标记的的字段是必填项的。<br/><br/>
<span>
查看业务须知和填表说明，
</span>
<input type="button" id="doPrevious" value="上一步" onclick="javascript:location.href='fillFormNote.jsp'" />
&nbsp;&nbsp;
<input type="submit" id="doSubmit" value="提交" onclick="doValidate();" />
&nbsp;&nbsp;
<input type="button" id="doReset" value="重置" onclick="form1.reset();" />
</div>
</div>
	</body>

</html>
