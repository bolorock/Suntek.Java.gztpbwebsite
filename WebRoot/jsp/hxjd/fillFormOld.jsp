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
		<title>�綾��ѧƷ��·����ͨ��֤�����</title>

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
							"<option value=''>--��ѡ��Ʒ��--</option>"+
						    "<option value='1'>�軯��</option>"+
						    "<option value='2'>˫��ˮ</option>"+
					  "</select>";
	cell2.innerHTML = "<input type=\"text\" id=\"\" name=\"amount\" width=\"40;\" size=\"40;\" style=\"margin-left: 5px;\">";
	cell3.innerHTML = "<input type=\"button\" id=\"\" name=\"\" style=\"font-size: 13px;color: #4A4A4A;\" value=\"ɾ��\" onclick=\"deleteCurrentRow(this)\" />";
}

function deleteCurrentRow(obj){    
	var tr=obj.parentNode.parentNode;    
	 
	var tbody=tr.parentNode;    
	  
	tbody.removeChild(tr);  
}

function deleteRow(rowIndex){
	//if(confirm("�Ƿ�ɾ����ǰƷ�֣�ɾ���󲻿ɻָ�")){
		document.getElementById("product").deleteRow(rowIndex);
		//findObj("product",document).deleteRow(rowIndex);
		
	//}
}

/*����ѡ��*/
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

//��֤��������Ƿ���ȷ
function doValidate(){	
	var buyDept = obj("buyDept");
	if(buyDept.value.trim() == ""){
		alert("����λ����Ϊ�����");
		return ;
	}
	var seller = obj("seller");
	if(seller.value.trim() == ""){
		alert("���۵�λ����Ϊ�����");
		return ;
	}
	var transportDept = obj("transportDept");
	if(transportDept.value.trim() == ""){
		alert("���˵�λ����Ϊ�����");
		return ;
	}
	var truckNumber = obj("truckNumber");
	if(truckNumber.value.trim() == ""){
		alert("���պ���Ϊ��ѡ�");
		return ;
	}
	var transportNumber1 = obj("transportNumber1");
	var transportNumber2 = obj("transportNumber2");
	if(transportNumber1.value.trim() == "" || transportNumber2.value.trim() == "" ){
		alert("�ҳ�����Ϊ��ѡ�");
		return ;
	}
	var driver = obj("driver");var driver2 = obj("driver2");
	if(driver.value.trim() == "" || driver2.value.trim() == ""){
		alert("��ʻ��Ա����Ϊ�����");
		return ;
	}
	var driverID = obj("driverID");var driver2ID = obj("driver2ID");
	if(driverID.value.trim() == "" || driver2ID.value.trim() == ""){
		alert("��ʻ��Ա���֤������Ϊ�����");
		return ;
	}
	var escortor = obj("escortor");var escortor2 = obj("escortor2");
	if(escortor.value.trim() == "" || escortor2.value.trim() == ""){
		alert("Ѻ����Ա����Ϊ�����");
		return ;
	}
	var escortorID = obj("escortorID");var escortor2ID = obj("escortor2ID");
	if(escortorID.value.trim() == "" || escortor2ID.value.trim() == ""){
		alert("Ѻ����Ա���֤������Ϊ�����");
		return ;
	}
	var applier = obj("applier");
	if(applier.value.trim() == ""){
		alert("������Ա����Ϊ�����");
		return ;
	}
	var applierID = obj("applierID");
	if(applierID.value.trim() == ""){
		alert("������Ա���֤������Ϊ�����");
		return ;
	}
	var applierPhone = obj("applierPhone");
	if(applierPhone.value.trim() == ""){
		alert("������Ա�ֻ�����Ϊ�����");
		return ;
	}
	var credentials = obj("credentials");
	if(credentials.value.trim() == ""){
		alert("������ɻ�����ڵǼ�֤������ Ϊ�����");
		return ;
	}
	
	/*
	* Ʒ����֤
	*/
	var aoumt = 0 ;
	var productName1 = obj("productName1");
	var productAoumt1 = obj("productAoumt1");
	var productName2 = obj("productName2");
	var productAoumt2 = obj("productAoumt2");
	if(productName1.value.trim() != "" && productAoumt1.value.trim() == "" ){
		alert("����Ʒ������Ϊ������");
		return ;
	}else{
		if(productName1.value.trim() == "" && productAoumt1.value.trim() != "" ){
			alert("����Ʒ��Ʒ��Ϊ������");
			return ;
		}
	}
	if(productName2.value.trim() != "" && productAoumt2.value.trim() == "" ){
		alert("����Ʒ������Ϊ������");
		return ;
	}else{
		if(productName2.value.trim() == "" && productAoumt2.value.trim() != "" ){
			alert("����Ʒ��Ʒ��Ϊ������");
			return ;
		}
	}
	if(productName1.value.trim() == "" && productAoumt1.value.trim() == ""
			&& productName2.value.trim() == "" && productAoumt2.value.trim() == ""){
		alert("����Ʒ�ֱ�����");
		return ;
	}
	
	var way = obj("way");
	if(way.value.trim() == ""){
		alert("����·��Ϊ��ѡ�");
		return ;
	}
	var startTime = obj("startTime");
	if(startTime.value.trim() == ""){
		alert("��ʼʱ��Ϊ��ѡ�");
		return ;
	}
	var endTime = obj("endTime");
	if(endTime.value.trim() == ""){
		alert("����ʱ��Ϊ��ѡ�");
		return ;
	}
	
	/*
	var names = document.getElementsByName("name");
	for( var i = 0 ; i < names.length ; i++){
		if(names[i].value.trim() == ""){
			alert("���ƻ���������Ϊ�գ�");
			return ;
		}
	}
	*/
	/*
	var representor = document.getElementById("representor");
    if(representor.value.trim() == ""){
    	alert("���������˲���Ϊ�գ�");
		return ;
    }
    */
    /*
    var telephones = document.getElementsByName("telephone");
	for( var i = 0 ; i < telephones.length ; i++){
		if(!isTelephoneCorrect(telephones[i].value.trim())){
			alert("��ϵ�绰��ʽ����ȷ��");
			return ;
		}
	}
	*/
	
	/*
	var IDs = document.getElementsByName("ID");
	for( var i = 0 ; i < IDs.length ; i++){
		if(!isIDCorrect(IDs[i].value)){
			alert("���֤���벻��ȷ��");
			return ;
		}
	}
	var qualitys = document.getElementsByName("quality");
	for( var i = 0 ; i < qualitys.length ; i++){
		if(!isQualityCorrect(qualitys[i].value.trim())){
			alert("������ʽ����ȷ��");
			return ;
		}
	}
	var amounts = document.getElementsByName("amount");
	for( var i = 0 ; i < amounts.length ; i++){
		if(!isAmountCorrect(amounts[i].value.trim())){
			alert("������ʽ����ȷ��");
			return ;
		}
	}
	var way = document.getElementById("way");
	if(way.value.trim() == ""){
		alert("��ѡ������·�ߣ�");
		return ;
	}
	
	var startTime = document.getElementById("startTime");
	var endTime = document.getElementById("endTime");
	if(startTime.value.trim() == ""){
		alert("��ʼʱ�䲻��Ϊ�գ�");
		return ;
	}
	if(endTime.value.trim() == ""){
		alert("����ʱ�䲻��Ϊ�գ�");
		return ;
	}
	*/
	var date = new Date();
	
	alert("����ɹ�������������ˮ��Ϊ"+date.getFullYear()+(date.getMonth()+1)+date.getDate()+date.getHours()+date.getMinutes()+date.getSeconds()+".");
	location.href="/gztpbwebsite/jsp/hxjd/fillForm2.jsp";
	return true;
}

//ȥ���ַ������߿ո�
String.prototype.trim = function (){
    return this.replace(/(^\s*)|(\s*$)/g , '');
}

//�ж����֤�����ʽ�Ƿ���ȷ
function isIDCorrect(value){
	//���֤������ʽ(15λ) 
	var isIDCard15=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 
	//���֤������ʽ(18λ) 
	var isIDCard18=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/; 
    if(isIDCard15.test(value) || isIDCard18.test(value) ){
    	return true;
    }else{
    	return false;
    }
}

//�绰�����ʽ�Ƿ���ȷ
function isTelephoneCorrect(value){
	if(/((d{3,4})|d{3,4}-)?d{7,8}(-d{3})*/.test(value))
		return true;
	else
		return false;
}

//�ֻ������ʽ�Ƿ���ȷ
function isPhoneCorrect(value){
	
}

//�жϷǸ�����
function isAmountCorrect(value){
	if(/^\d+$/.test(value) )
		return true;
	else
		return false;
}

//�жϷǸ�������Ǹ�С��
function isQualityCorrect(value){
	if( /^\d+$/.test(value) || /^\d+(\.\d+)?$/.test(value))
		return true;
	else
		return false;
}

//����λ�Ƿ�Ϸ�
function isBuyDeptLegal(obj){
	var buyDeptLegal = "����λ";
	if(obj.value.trim() == buyDeptLegal){
		document.getElementById("buyDeptSpan").innerHTML = "";
	}else{
		document.getElementById("buyDeptSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">����λ��˲�ͨ��!</font>";
	    /*
		obj.blur();
		obj.focus();
		*/
		
	}
}

//���˵�λ�Ƿ�Ϸ�
function isTransportDeptLegal(obj){
	var transportLegal = "���˵�λ";
	if(obj.value.trim() == transportLegal){
		document.getElementById("transportDeptSpan").innerHTML = "";
	}else{
		document.getElementById("transportDeptSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">���˵�λ��˲�ͨ��!</font>";
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//���˳��������Ƿ�Ϸ�
function isTruckNumberLegal(obj){
	var truckNumberLegal = "��A000000";
	if(obj.value.trim() == truckNumberLegal){
		document.getElementById("truckNumberSpan").innerHTML = "";
	}else{
		document.getElementById("truckNumberSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">���պ�����˲�ͨ��!</font>";
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//�ҳ������Ƿ�Ϸ�
function isTransportNumberLegal(obj){
	var truckNumberLegal = "��A000000";
	if(obj.value.trim() == truckNumberLegal){
		if(obj.id == "transportNumber1")
			document.getElementById("transportNumber1Span").innerHTML = "";
		else
			document.getElementById("transportNumber2Span").innerHTML = "";
	}else{
		if(obj.id == "transportNumber1")
			document.getElementById("transportNumber1Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">�ҳ�����1��˲�ͨ��!</font>";
		else
			document.getElementById("transportNumber2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">�ҳ�����2��˲�ͨ��!</font>";
		
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//��ʻ��Ա�Ƿ�Ϸ�
function isDriverLegal(obj){
	var driverLegal = "��ʻ��Ա";
	if(obj.value.trim() == driverLegal){
		if(obj.id == "driver")
			document.getElementById("driverSpan").innerHTML = "";
		else
			document.getElementById("driver2Span").innerHTML = "";
	}else{
		if(obj.id == "driver")
			document.getElementById("driverSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">����ʻ����˲�ͨ��!</font>";
		else
			document.getElementById("driver2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">����ʻ����˲�ͨ��!</font>";
		
		/*
		obj.blur();
		obj.focus();
		*/
	}
}

//Ѻ����Ա�Ƿ�Ϸ�
function isEscortorLegal(obj){
	var escortorLegal = "Ѻ����Ա";
	if(obj.value.trim() == escortorLegal){
		if(obj.id == "escortor")
			document.getElementById("escortorSpan").innerHTML = "";
		else
			document.getElementById("escortor2Span").innerHTML = "";
	}else{
		if(obj.id == "escortor")
			document.getElementById("escortorSpan").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">��Ѻ������˲�ͨ��!</font>";
		else
			document.getElementById("escortor2Span").innerHTML = "<font color=\"#FF0000\" size=\"2px;\">��Ѻ������˲�ͨ��!</font>";
		
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
		<font size="4" color="#085DB2">�綾��ѧƷ��·����ͨ��֤�����</font>
	</div>
	  <form id="form1" action="?" method="post"  style="margin:0px;">
	  <fieldset>
	  <!-- <legend><font></font></legend> -->
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="0" cellpadding="0" style="">
			<tr >
     <td >����λ</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="buyDept" name="buyDept" width="30;" size="30;" onblur="isBuyDeptLegal(this);" class="secondValue"/><br/>
                         <span id="buyDeptSpan"></span>                         
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >����������&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                      <input type="text" id="representor" name="representor"  width="30;" size="30;"  class="secondValue"/>
				</td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ַ&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��ϵ�绰&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
  </tr>
  <tr >
     <td >���۵�λ</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                    
	                     <input type="text" id="seller" name="seller" width="30;" size="30;" class="secondValue"/><br/>
                                                 
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;" >����������&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                      <input type="text" id="representor2" name="representor2"  width="30;" size="30;"  class="secondValue"/>
				</td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ַ&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��ϵ�绰&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone2" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
  </tr>
			<tr >
				<td >���˵�λ</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="transportDept" name="transportDept"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportDeptLegal(this);"/><br/>
                 	  <span id="transportDeptSpan"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��Ӫ���֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;" />
				 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ַ&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				      <input type="text" id="" name="" width="30;" size="30;" class="secondValue"/>
				 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��ϵ�绰&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
				 	 <input type="text" id="" name="telephone" width="30;" size="30;" class="secondValue"/>	
				 </td>
             </tr>
         </table>
     </td>
			</tr>
			<tr >
     <td>���˳���</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���պ���<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                     <select id="truckNumber" name="truckNumber" style="width:90%;margin-left: 5px;"  onblur="isTruckNumberLegal(this);">
			            <option value=''>--��ѡ�����պ���--</option>
			            <option value='��A000000'>��A000000</option>
			            <option value='��A000001'>��A000001</option>
			        </select>
			        <!-- 
                 	 <input type="text" id="truckNumber" name="truckNumber"  width="30;" size="30;"/><br/>
			          -->
                 	 <span id="truckNumberSpan"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��·����֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��������&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="quality"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">ʵ��������&nbsp;&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="quality" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>�ҳ���Ϣ</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ҳ�����1<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="transportNumber1" name="transportNumber1"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportNumberLegal(this);"/><br/>
                 	  <span id="transportNumber1Span"></span>  
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ҳ�����2<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
					 <input type="text" id="transportNumber2" name="transportNumber2"  width="30;" size="30;" style="margin-left: 5px;" onblur="isTransportNumberLegal(this);"/><br/>
                 	  <span id="transportNumber2Span"></span>
				 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>����ʻ��</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver" name="driver" width="30;" size="30;" style="margin-left: 5px;" onblur="isDriverLegal(this);"  /><br/>
                 	 <span id="driverSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ϸ��ʸ�֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ֻ�����&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���֤������<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driverID" name="driverID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>����ʻ��</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver2" name="driver2" width="30;" size="30;" style="margin-left: 5px;" onblur="isDriverLegal(this);"  /><br/>
                 	 <span id="driver2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ϸ��ʸ�֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name=""  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ֻ�����&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���֤������<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="driver2ID" name="driver2ID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
   <tr >
     <td>��Ѻ����</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��      ��<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor" name="escortor"  width="30;" size="30;" style="margin-left: 5px;" onblur="isEscortorLegal(this);" /><br/>
                 	 <span id="escortorSpan"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ϸ��ʸ�֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ֻ�����&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���֤������<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortorID" name="escortorID" width="30;" size="30;"  style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>��Ѻ����</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��      ��<span class="requested">*</span> </td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor2" name="escortor2"  width="30;" size="30;" style="margin-left: 5px;" onblur="isEscortorLegal(this);" /><br/>
                 	 <span id="escortor2Span"></span>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ϸ��ʸ�֤��&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ֻ�����&nbsp;</td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="" name="phone" width="30;" size="30;" style="margin-left: 5px;" />
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���֤������<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="escortor2ID" name="escortor2ID" width="30;" size="30;"  style="margin-left: 5px;"/>
                 </td>
             </tr>
         </table>
     </td>
     
  </tr>
  <tr >
     <td>������Ա</td>
     <td >
	     <table width="100%" border="0" cellspacing="1" cellpadding="0" style="margin:0px;">
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">��    ��<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="applier" name="applier" width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">���֤������<span class="requested">*</span></td>
                 <td style="padding: 2px 0px;vertical-align: middle;">
                 	 <input type="text" id="applierID" name="applierID"  width="30;" size="30;" style="margin-left: 5px;"/>
                 </td>
             </tr>
             <tr>
                 <td class="text"  style="padding: 2px 0px;vertical-align: middle;">�ֻ�����<span class="requested">*</span></td>
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
	            <td align="right" style="background-color: #EFF3FA;border-right: 1px solid #B1B9DC;color: #4A4A4A;font-size: 13px;" width="30%;">������ɻ�����ڵǼ�֤������ <span class="requested">*</span></td>
	    		<td><input type="text" id="credentials" name="credentials"  width="65" size="65" style="margin-left: 5px;"/></td>
    		</tr>
        </table>
    </td>
    
  </tr>
  <tr >
    <td>
                   ����Ʒ��<span class="requested">*</span><br/>
       <input type="button" id="addProductBtn" name="addProductBtn" style="margin:0px;font-size: 13px;color: #4A4A4A;" value="���Ʒ��" onclick="addNewRow();"/>            
    </td>
    <td>
        <table id="product" width="100%" border="0" cellspacing="2" cellpadding="0" style="margin:0px;font-size: 13px;color: #4A4A4A;">
            <tr >
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">Ʒ��<span class="requested">*</span></td>
            	<td width="280px;" align="center" style="background-color: #EFF3FA;">������ǧ�ˣ�<span class="requested">*</span>
            	</td>
            	<td align="center" style="background-color: #EFF3FA;">����</td>
           	</tr>
           	<tr>
            	<td >
            		 <select id="productName1" name="productName1" style="width: 90%;margin-left: 5px;">
			            <option value='' >--��ѡ��Ʒ��--</option>
			            <option value='1'>�軯��</option>
			            <option value='2'>˫��ˮ</option>
			        </select>
            	</td>
            	<td>
            		<input type="text" id="productAoumt1" name="productAoumt1" width="40;" size="40;" style="margin-left: 5px;"/>        		 
            	</td>
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="ɾ��" onclick="deleteCurrentRow(this)" />
            	</td>
           	</tr>
           	<tr>
            	<td >
            		 <select id="productName2" name="productName2" style="width: 90%;margin-left: 5px;">
			            <option value=''>--��ѡ��Ʒ��--</option>
			            <option value='1'>�軯��</option>
			            <option value='2'>˫��ˮ</option>
			        </select>
            	</td>
            	<td>
            		 <input type="text" id="productAoumt2" name="productAoumt2" width="40;" size="40;" style="margin-left: 5px;"/>
            	</td>
            	<td width="14px;">
            		<input type="button" id="" name="" style="font-size: 13px;color: #4A4A4A;" value="ɾ��" onclick="deleteCurrentRow(this)" />
            	</td>
           	</tr>           	
        </table>
    </td>
  </tr>
  <tr >
    <td>����·��<span class="requested">*</span></td>
    <td>
    <table width="100%"  border="0" cellspacing="0" bordercolor="#d2e2f0" cellpadding="3" frame="void"
            style="border-collapse: collapse;">
            <tr>
    <td width="180px;" align="left">
        <select id="way" style="width: 90%;margin-left: 5px;">
            <option value=''>--��ѡ��--</option>
            <option value='1'>����->����</option>
            <option value='2'>����->��ɽ</option>
        </select>
    </td> 
    <td class="text2">��ʼʱ��<span class="requested">*</span></td>
    <td>
        <input type="text" class="Wdate" name="startTime" id="startTime" size="22"
onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});"
readOnly="readonly"/>
    </td> 
    <td class="text2">����ʱ��<span class="requested">*</span></td>
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
���д����Ǻţ�<span class="requested">*</span>����ǵĵ��ֶ��Ǳ�����ġ�<br/><br/>
<span>
�鿴ҵ����֪�����˵����
</span>
<input type="button" id="doPrevious" value="��һ��" onclick="javascript:location.href='fillFormNote.jsp'" />
&nbsp;&nbsp;
<input type="submit" id="doSubmit" value="�ύ" onclick="doValidate();" />
&nbsp;&nbsp;
<input type="button" id="doReset" value="����" onclick="form1.reset();" />
</div>
</div>
	</body>

</html>
