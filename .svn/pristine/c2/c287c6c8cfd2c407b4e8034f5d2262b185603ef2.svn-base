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
//location="#top";

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
	<%--
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
	// location.href="/gztpbwebsite/jsp/hxjd/fillForm2.jsp"; 
	--%>
	obj("form1").submit();
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
		<!-- <a name="#top"></a> -->
	</div>
	  <form id="form1" action="/gztpbwebsite/chemicalController/save.htm" method="post"  style="margin:0px;">
	  <fieldset>
	  <!-- <legend><font></font></legend> -->
		<table id="jdc_table" width="700" height="auto" align="center"
			border="0" cellspacing="0" cellpadding="0" style="">
			<tr >
     <!-- <td >购买单位</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >购买单位名称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="PURCHASER" name="PURCHASER" width="30;" size="30;"  class="secondValue" value="广州化学购买单位"/><br/>
                         <span id="buyDeptSpan"></span>                         
                 </td>
                
				<td class="text"  style="padding: 2px 0px;vertical-align: middle;" >销售单位名称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="SELLER" name="SELLER" width="30;" size="30;" class="secondValue" value="广州化学销售单位"/>
                                                 
                 </td>
             </tr>
            
         </table>
     </td>
  </tr>
  <tr >
     <!-- <td >销售单位</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >申请人员姓名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="APPLICANT" name="APPLICANT" width="30;" size="30;" class="secondValue" value="张三"/><br/>
                                                 
                 </td>
                 
				<td class="text"  style="padding: 2px 0px;vertical-align: middle;">承运单位名称<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="CARRIER" name="CARRIER"  width="30;" size="30;" style="margin-left: 5px;" value="广州化学承运单位" /><br/>
                 	  <span id="transportDeptSpan"></span>  
                 </td>
             </tr>
             
         </table>
     </td>
  </tr>
  <tr >
     <!-- <td>申请人员</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                <!--  <td class="text"  style="padding: 2px 0px;vertical-align: middle;">申请人姓名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="APPLICANT" name="APPLICANT" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td> -->
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">申请人身份证<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="APPLICANTIDNO" name="APPLICANTIDNO"  width="30;" size="30;" style="margin-left: 5px;" value="44010119999999"/>
                 </td>
             <!-- </tr>
             <tr> -->
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">申请人员手机<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="APPLICANTTELNO" name="APPLICANTTELNO" width="30;" size="30;" style="margin-left: 5px;" value="1374457454"/>
                 </td>
                
             </tr>
         </table>
     </td>
     
  </tr>
			
			<tr >
     <!-- <td>承运车辆</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">承运车辆种类<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <select id="VEHICLETYPE" name="VEHICLETYPE" style="width:177px;margin-left: 5px;"  >
			            <option value='0'>小型汽车</option>
			            <option value='1'>大型汽车</option>
			        </select>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">承运车辆牌号<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                     <select id="CARRIERVEHICLE" name="CARRIERVEHICLE" style="width:177px;margin-left: 5px;"  >
			            <option value='粤A000000'>粤A000000</option>
			            <option value='粤A000001'>粤A000001</option>
			        </select>
			        <!-- 
                 	 <input type="text" id="truckNumber" name="truckNumber"  width="30;" size="30;"/><br/>
			          -->
                 	 <span id="truckNumberSpan"></span>  
                 </td>
                 <!-- 
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">道路运输证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td> 
                 -->
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">核载质量&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="ALLOWQTY" name="ALLOWQTY"  width="30;" size="30;" style="margin-left: 5px;" value="1000"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">实载质量&nbsp;&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="ACTUALYQTY" name="ACTUALYQTY" width="30;" size="30;" style="margin-left: 5px;" value="800"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
    <!--  <td>挂车信息</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">挂车号牌1<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="PLATELICENSE1" name="PLATELICENSE1"  width="30;" size="30;" style="margin-left: 5px;" value="粤A91919"/><br/>
                 	  <span id="transportNumber1Span"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">挂车号牌2<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="PLATELICENSE2" name="PLATELICENSE2"  width="30;" size="30;" style="margin-left: 5px;" value="粤A1414"/><br/>
                 	  <span id="transportNumber2Span"></span>
				 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
    <!--  <td>主驾驶人</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">主驾驶人姓名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="MAINDIRVERNAME" name="MAINDIRVERNAME" width="30;" size="30;" style="margin-left: 5px;" value="小李" /><br/>
                 	 <span id="driverSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">主驾驶身份证<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="MAINDRIVERIDNO" name="MAINDRIVERIDNO"  width="30;" size="30;" style="margin-left: 5px;" value="440801199999"/>
                 </td>
                 
             </tr>
             
             
         </table>
     </td>
     
  </tr>
  <tr >
     <!-- <td>副驾驶人</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">副驾驶人姓名<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="SECONDDIRVERNAME" name="SECONDDIRVERNAME" width="30;" size="30;" style="margin-left: 5px;" value="小张" /><br/>
                 	 <span id="driver2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">副驾驶身份证<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="SECONDDIRVERIDNO" name="SECONDDIRVERIDNO"  width="30;" size="30;" style="margin-left: 5px;" value="440801199999"/>
                 </td>
                 
             </tr>
             
         </table>
     </td>
     
  </tr>
   <tr >
     <!-- <td>主押运人</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">主押运人姓名<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="MAINESCORTNAME" name="MAINESCORTNAME"  width="30;" size="30;" style="margin-left: 5px;" value="张三"  /><br/>
                 	 <span id="escortorSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">主押运身份证<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="MAINESCORTIDNO" name="MAINESCORTIDNO" width="30;" size="30;"  style="margin-left: 5px;"  value="440801199999"/>
                 </td>
                
             </tr>
             <!-- <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">手机号码&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
                  <td class="text"  style="padding: 2px 0px;vertical-align: middle;">上岗资格证号&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr> -->
         </table>
     </td>
     
  </tr>
  <tr >
     <!-- <td>副押运人</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">副押运人姓名<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="SECONDESCORTNAME" name="SECONDESCORTNAME"  width="30;" size="30;" style="margin-left: 5px;" value="王一" /><br/>
                 	 <span id="escortor2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">副押运身份证<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="SECONDESCORTIDNO" name="SECONDESCORTIDNO" width="30;" size="30;"  style="margin-left: 5px;"  value="440801199999"/>
                 </td>
                 
             </tr>
             
         </table>
     </td>
     
  </tr>
  
  <tr >
    <!--  <td>购买凭证</td> -->
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">购买凭证类型<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                     <select id="PROOFTYPE" name="PROOFTYPE" style="width:177px;margin-left: 5px;" >
			            <option value='1'>购买凭证</option>
			            <option value='2'>准购证</option>
			        </select>
			     </td>
                 
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">购买凭证编号<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="PROOFNO" name="PROOFNO"  width="30;" size="30;" style="margin-left: 5px;" value="A998800BC"/><br/>
                 	 
				 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  
  <tr >
   <!--  <td>
                   运输品种<span class="requested">*</span><br/>
    </td> -->
    <td>
        <table id="product" width="100%" border="0" cellspacing="2" cellpadding="0" style="margin:0px;font-size: 13px;color: #4A4A4A;">
            <tr height="28px;">
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">运输品种<span class="requested">*</span></td>
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">数量（千克）<span class="requested">*</span>
            	</td>
            	<!-- 
            	<td align="center" style="background-color: #EFF3FA;">操作</td>
            	 -->
           	</tr>
           	<tr>
            	<td >
            		 <select id="GOODSTYPE1" name="GOODSTYPE1" style="width: 90%;margin-left: 5px;">
            		    	 <option value=''>--请选择--</option>
			            	 <option value='氰化钠' selected="selected">氰化钠</option>
			           		 <option value='双氧水'>双氧水</option>
			        </select>
            	</td>
            	<td align="center">
            		<input type="text" id="GOODSNUM1" name="GOODSNUM1" width="40;" size="40;" style="margin-left: 5px;" value="200"/>        		 
            	</td>
            	<!-- 
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="删除" onclick="deleteCurrentRow(this)" />
            	</td>
            	 -->
           	</tr>
           	<tr>
            	<td >
            		 <select id="GOODSTYPE2" name="GOODSTYPE2" style="width: 90%;margin-left: 5px;">
	            			 <option value=''>--请选择--</option>
				          	 <option value='氰化钠'>氰化钠</option>
			           	 	<option value='双氧水'>双氧水</option>
			        </select>
            	</td>
            	<td align="center">
            		 <input type="text" id="GOODSNUM2" name="GOODSNUM2" width="40;" size="40;" style="margin-left: 5px;"/>
            	</td>
            	<!-- 
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="删除" onclick="deleteCurrentRow(this)" />
            	</td>
            	 -->
           	</tr>
           	<tr>
            	<td >
            		 <select id="GOODSTYPE3" name="GOODSTYPE3" style="width: 90%;margin-left: 5px;">
            		 	<option value=''>--请选择--</option>
			            <option value='氰化钠'>氰化钠</option>
			            <option value='双氧水'>双氧水</option>
			        </select>
            	</td>
            	<td align="center">
            		 <input type="text" id="GOODSNUM3" name="GOODSNUM3" width="40;" size="40;" style="margin-left: 5px;"/>
            	</td>
            	<!-- 
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="删除" onclick="deleteCurrentRow(this)" />
            	</td>
            	 -->
           	</tr>             	
        </table>
    </td>
  </tr>
  <tr >
    <td>
     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
            <tr height="28px;">
    <td class="text"  style="padding: 2px 0px;vertical-align: middle;">运输路线<span class="requested">*</span></td>
    <td style="padding: 2px 0px;vertical-align: middle;" colspan="3">
        <select id="LINE" name="LINE" style="width: 140px;margin-left: 5px;">
            <option value='广州->深圳'>广州->深圳</option>
            <option value='广州->佛山'>广州->佛山</option>
        </select>
    </td>
     </tr>
     </table>
     </td>
     <tr>
     <td>
     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
     <tr height="28px;">
    <td class="text"  style="padding: 2px 0px;vertical-align: middle;">运输开始时间<span class="requested">*</span></td>
    <td>
        <input type="text" class="Wdate" name="GOBEGINTIME" id="GOBEGINTIME" size="25"
onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});"
readOnly="readonly"/>
    </td> 
    <td class="text"  style="padding: 2px 0px;vertical-align: middle;">运输结束时间<span class="requested">*</span></td>
    <td>
        <input type="text" class="Wdate" name="GOFINISHTIME" id="GOFINISHTIME" size="25"
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
	</body>

</html>
