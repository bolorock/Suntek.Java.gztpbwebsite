<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����������������ϵ��ʽ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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

#jdc_table,#sub_table{
	font-size: 12px;
	color:#4A4A4A;
	margin-top:5px;
}

.text font {
	color: red;
	font-size: 12px;
}
.cardnum{
	border-bottom:1px solid #D0D0BF;
	border-top:none;
	border-left:none;
	border-right:none;
}
</style>
<script>
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
</script>
  </head>
  
  <body>
    <div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">�����������������ϵ��ʽ�����</font></div>
    <form action="/gzitms/vehicle/VehicleInfoServlet" method="post" onsubmit="return chackAll()" style="margin:0px;">
	  <fieldset style="margin-bottom:5px;">
	  <legend><font size="3" color="#085DB2">������Ϣ</font></legend>
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
				<td class="text" width="18%">
					����������
					<font>*</font>
				</td>
				<td width="30%">
					<input type="text" name="userName" size="22" />
				</td>
				
			</tr>
			<tr height="32px">
				<td class="text">
					���֤������
					<font>*</font>
				</td>
				<td>
					<select name="userCardType" id="userCardType" class="select">
						<option selected="selected" value="A">�������֤</option>
						<option value="B">��֯��������֤</option>
						<option value="C">����֤</option>
						<option value="D">ʿ��֤</option>
						<option value="E">����������֤</option>
						<option value="F">������Ա���֤��</option>
						<option value="G">�⽻��Ա���֤��</option>
					</select>
				</td>
				<td class="text">
					�������֤������
					<font>*</font>
				</td>
				<td>
					<input type="text" name="IDCardNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					���ƺ���
					<font>*</font>
				</td>
				<td>
					��A<input name="cardNum" type="text" class="cardNum" size="15"/>
				</td>
				<td class="text">
					����ʶ�����(����λ)
					<font>*</font>
				</td>
				<td>
					<input type="text" name="descernCode" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��������(����λ)
					<font>*</font>
				</td>
				<td>
					<input type="text" name="engineNum" size="22" />
				</td>
				<td class="text">
					�������Ǽ�֤����
					<font>*</font>
				</td>
				<td>
					<input type="text" name="registerNum" size="21" />&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">��֤о���</font></a>
				</td>
			</tr>
			<tr>
			<td width="20%" class="text">
					��������
					<font>*</font>
				</td>
				<td width="32%">
					<select name="carType" id="carType" class="select">
						<option value="0">������ѡ���͡���</option>
						<option value="01">�������������ƣ�</option>
						<option value="02">С�����������ƣ�</option>
						<option value="03">ʹ������</option>
						<option value="04">�������</option>
						<option value="05">��������</option>
						<option value="06">�⼮���������ƣ�</option>
						<option value="07">��ͨĦ�г�</option>
						<option value="08">���Ħ�г�</option>
						<option value="09">ʹ��Ħ�г�</option>
						<option value="10">���Ħ�г�</option>
						<option value="11">����Ħ�г�</option>
						<option value="12">�⼮Ħ�г�</option>
						<option value="13">ũ�����䳵</option>
						<option value="14">������</option>
						<option value="15">�ҳ�</option>
						<option value="16">��������</option>
						<option value="17">����Ħ�г�</option>
						<option value="18">��������</option>
						<option value="19">����Ħ�г�</option>
						<option value="20">��ʱ�뾳����</option>
						<option value="21">��ʱ�뾳Ħ�г�</option>
						<option value="22">��ʱ��ʻ��</option>
						<option value="23">�������������ƣ�</option>
						<option value="24">����Ħ��</option>
					</select>
				</td>
			</tr>
		</table>
	  </fieldset>
	  <fieldset>
	  <legend><font size="3" color="#085DB2">�����Ϣ</font></legend>
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="2" cellpadding="0" style="">
			<tr height="32px">
				<td class="text" width="18%">
					�̶��绰
					<font>*</font>
				</td>
				<td width="30%">
					<input type="text" name="phoneName" size="22" />
				</td>
				<td width="20%" class="text">
					�ƶ��绰
					&nbsp;
				</td>
				<td width="32%">
					<input type="text" name="mobileNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					�����ʼ�
					&nbsp;
				</td>
				<td>
					<input type="text" name="email" size="22" />
				</td>
				<td class="text">
					��������
					&nbsp;
				</td>
				<td>
					<input type="text" name="postNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					��ϵ��ַ
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="address" size="50"/><font color="red" sytle="font-size: 12px;">���㶫ʡ�����С�XX���� + ����ϸ��ַ����</font>
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
					<input type="submit" name="submit" disabled="disabled" value="ȷ���ύ"/>
					<input type="reset" name="reset" value="����"/>
				</td>
			</tr>
		</table>
	  </fieldset>
	  </form>
  </body>
</html>
