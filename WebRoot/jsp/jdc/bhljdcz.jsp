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
		<title>��/���������֤</title>

		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/datetimepicker/WdatePicker.js"></script>
		<script type="text/javascript"
			src="/gztpbwebsite/js/jquery-1.4.2.min.js">
</script>
		<script type="text/javascript">
function chackAll() {

}
function checkDaiban(){
	var flag = document.getElementsByName("daiban")[0];
	if(flag.value ==""){
		flag.value = "y";
		document.getElementsByName("entrustbook")[0].disabled="";
		document.getElementsByName("IDcardcopy")[0].disabled="";
	}else{
		flag.value = "";
		document.getElementsByName("entrustbook")[0].disabled="disabled";
		document.getElementsByName("IDcardcopy")[0].disabled="disabled";
	}	
}
function checkPromise(){
	var flag = document.getElementsByName("promise")[0];
	if(flag.value ==""){
		flag.value = "y";
		document.getElementsByName("submit")[0].disabled="";
	}else{
		flag.value = "";
		document.getElementsByName("submit")[0].disabled="disabled";
	}
}
function refreshValidate(){
	var validate_img = document.getElementById("validate_img");
	validate_img.src="<%=path %>/jsp/validate/makeCertPic.jsp?timeamp="+new Date().getTime();	
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
	padding: 5px 0px;vertical-align: middle;
}

.text {
	background-color: #EFF3FA;
	border-right: 1px solid #B1B9DC;
	text-align: right;
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
</style>
	</head>

	<body>
	<div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">�������������ʻ֤�����</font></div>
	  <form action="/gzitms/vehicle/VehicleServlet" method="post" onsubmit="return chackAll()" style="margin:0px;">
	  <fieldset>
	  <!-- <legend><font></font></legend> -->
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="2" cellpadding="0" style="">
			<tr height="32px">
				<td class="text" width="18%">
					ҵ������
					<font>*</font>
				</td>
				<td width="32%">
					<select name="bussType" disabled="disabled">
					<option value="�������������ʻ֤" selected="selected">�������������ʻ֤</option>
					</select>
				</td>
				<td width="18%" class="text">
					����������������
					<font>*</font>
				</td>
				<td width="32%">
					<input type="text" name="userName" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text" width="18%">
					����������
					<font>*</font>
				</td>
				<td width="32%">
					<select name="bussType2">
					<option value="����" selected="selected">����</option>
					<option value="����">����</option>
					</select>
				</td>
				<td width="18%" class="text">
					������ԭ��
					<font>*</font>
				</td>
				<td width="32%">
					<input type="checkbox" name="bhl" value="buling"/>��ʧ
					<input type="checkbox" name="bhl" value="huanling"/>��ʧ
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					���֤������
					<font>*</font>
				</td>
				<td>
					<select name="IDCard">
					<option value="�������֤" selected="selected">�������֤</option>
					</select>
				</td>
				<td class="text">
					�������֤������
					<font>*</font>
				</td>
				<td>
					<input type="text" name="IDCardNum" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�Ա�
					<font>*</font>
				</td>
				<td>
					<input type="radio" name="sex" value="��" checked="checked" />��
					<input type="radio" name="sex" value="Ů" />Ů
				</td>
				<td class="text">
					��������
					<font>*</font>
				</td>
				<td>
					<input type="text" class="Wdate" name="borthday" id="monthid" size="22"
onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true});"
readOnly="readonly"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�������ڵ�
					<font>*</font>
				</td>
				<td>
					<select name="household">
					<option value="����" selected="selected">����</option>
					<option value="���">���</option>
					</select>
				</td>
				<td class="text">
					��ס֤����
					<font>*</font>
				</td>
				<td>
					<input type="text" name="householdNum" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��������
					<font>*</font>
				</td>
				<td>
					<select name="carType">
					<option value="С������" selected="selected">С������</option>
					</select>
				</td>
				<td class="text">
					���ƺ���
					<font>*</font>
				</td>
				<td>
					��<input type="text" name="carNum" size="20" value="A"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					����ʶ�����
					<font>*</font>
				</td>
				<td>
					<input type="text" name="carRecogNum" size="22"/>
				</td>
				<td class="text">
					��������
					<font>*</font>
				</td>
				<td>
					<input type="text" name="engineNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��������Ƭ
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="file" name="carPhoto" size="40"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">��������׼��Ƭ��������</font></a>
		<!-- 	<font color="red" sytle="font-size: 12px;">���ֱ���Ϊ?���ϣ���ʽΪjpg��jpeg��bmp��gif��png���ļ���С�����ܳ���2M����������ʽ�淶һ�¡���</font>  -->
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					ס����ϸ��ַ
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="address" size="50"/><font color="red" sytle="font-size: 12px;">���㶫ʡ�����С�XX���� + ����ϸ��ַ����</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��������
					&nbsp;
				</td>
				<td>
					<input type="text" name="email" size="22"/>
				</td>
				<td class="text">
					�̶��绰
					<font>*</font>
				</td>
				<td>
					<input type="text" name="phoneNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�ƶ��绰
					&nbsp;
				</td>
				<td>
					<input type="text" name="mobileNum" size="22"/>
				</td>
				<td>
					
				</td>
				<td>
					
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�Ƿ�ί�д���
					&nbsp;
				</td>
				<td>
					<input type="checkbox" name="daiban" size="22" onclick="checkDaiban()" value=""/>
				</td>
				<td>
					
				</td>
				<td>
					
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					ί����
					&nbsp;
				</td>
				<td colspan="3">
					<input type="file" name="entrustbook" size="40" disabled="disabled"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">ί������������</font></a><br/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					���������֤��ӡ��
					&nbsp;
				</td>
				<td colspan="3">
					<input type="file" name="IDcardcopy" size="40" disabled="disabled"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">���֤��ӡ����������</font></a><br/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<font color="#085DB2" style="font-size:13px;font-weight:600">�����������������������������������������������ռ�����Ϣ������������������������������������������������</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�ռ�������
					<font>*</font>
				</td>
				<td>
					<input type="text" name="receiver" size="22"/>
				</td>
				<td class="text">
					�ռ����ֻ�
					<font>*</font>
				</td>
				<td>
					<input type="text" name="receiverMobileNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�ռ��˵�ַ
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="receiverAddress" size="50"/><font color="red" sytle="font-size: 12px;">���㶫ʡ�����С�XX���� + ����ϸ��ַ����</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��������֤��
					<font>*</font>
				</td>
				<td colspan="3">  
					<input type="text" name="validate" size="5"/>&nbsp;<img id="validate_img" src="<%=path %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;<a href="javascript:refreshValidate()"><font color="blue" style="font-size:12px">ˢ����֤��</font></a>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<span class="promise">���д����Ǻţ�<font color="red">*</font>����ǵĵ��ֶ��Ǳ�����ġ�</span>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<input type="checkbox" name="promise" value="" onclick="checkPromise()"/><span class="promise">���˳�ŵ������д�����Ͼ�Ϊ��ʵ��Ч</span>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<input type="submit" name="submit" disabled="disabled" value="ȷ���ύ"/>&nbsp;<input type="reset" name="reset" value="����"/>
				</td>
			</tr>
		</table>
	  </fieldset>
	  </form>
	</body>

</html>
