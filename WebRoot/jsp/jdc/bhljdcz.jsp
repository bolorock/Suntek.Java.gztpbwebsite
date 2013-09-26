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
		<title>补/换领机动车证</title>

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
	<div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">补换领机动车行驶证申请表</font></div>
	  <form action="/gzitms/vehicle/VehicleServlet" method="post" onsubmit="return chackAll()" style="margin:0px;">
	  <fieldset>
	  <!-- <legend><font></font></legend> -->
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="2" cellpadding="0" style="">
			<tr height="32px">
				<td class="text" width="18%">
					业务类型
					<font>*</font>
				</td>
				<td width="32%">
					<select name="bussType" disabled="disabled">
					<option value="补换领机动车行驶证" selected="selected">补换领机动车行驶证</option>
					</select>
				</td>
				<td width="18%" class="text">
					机动车所有人姓名
					<font>*</font>
				</td>
				<td width="32%">
					<input type="text" name="userName" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text" width="18%">
					补换领类型
					<font>*</font>
				</td>
				<td width="32%">
					<select name="bussType2">
					<option value="补领" selected="selected">补领</option>
					<option value="换领">换领</option>
					</select>
				</td>
				<td width="18%" class="text">
					补换领原因
					<font>*</font>
				</td>
				<td width="32%">
					<input type="checkbox" name="bhl" value="buling"/>丢失
					<input type="checkbox" name="bhl" value="huanling"/>灭失
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					身份证明名称
					<font>*</font>
				</td>
				<td>
					<select name="IDCard">
					<option value="居民身份证" selected="selected">居民身份证</option>
					</select>
				</td>
				<td class="text">
					居民身份证明号码
					<font>*</font>
				</td>
				<td>
					<input type="text" name="IDCardNum" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					性别
					<font>*</font>
				</td>
				<td>
					<input type="radio" name="sex" value="男" checked="checked" />男
					<input type="radio" name="sex" value="女" />女
				</td>
				<td class="text">
					出生日期
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
					户籍所在地
					<font>*</font>
				</td>
				<td>
					<select name="household">
					<option value="广州" selected="selected">广州</option>
					<option value="外地">外地</option>
					</select>
				</td>
				<td class="text">
					居住证号码
					<font>*</font>
				</td>
				<td>
					<input type="text" name="householdNum" size="22" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					号牌种类
					<font>*</font>
				</td>
				<td>
					<select name="carType">
					<option value="小型汽车" selected="selected">小型汽车</option>
					</select>
				</td>
				<td class="text">
					号牌号码
					<font>*</font>
				</td>
				<td>
					粤<input type="text" name="carNum" size="20" value="A"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					车辆识别代号
					<font>*</font>
				</td>
				<td>
					<input type="text" name="carRecogNum" size="22"/>
				</td>
				<td class="text">
					发动机号
					<font>*</font>
				</td>
				<td>
					<input type="text" name="engineNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					机动车相片
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="file" name="carPhoto" size="40"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">机动车标准相片样板链接</font></a>
		<!-- 	<font color="red" sytle="font-size: 12px;">（分辨率为?以上，格式为jpg、jpeg、bmp、gif、png，文件大小都不能超过2M，必须与样式规范一致。）</font>  -->
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					住所详细地址
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="address" size="50"/><font color="red" sytle="font-size: 12px;">（广东省广州市“XX”区 + “详细地址”）</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					电子邮箱
					&nbsp;
				</td>
				<td>
					<input type="text" name="email" size="22"/>
				</td>
				<td class="text">
					固定电话
					<font>*</font>
				</td>
				<td>
					<input type="text" name="phoneNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					移动电话
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
					是否委托代办
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
					委托书
					&nbsp;
				</td>
				<td colspan="3">
					<input type="file" name="entrustbook" size="40" disabled="disabled"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">委托书样本链接</font></a><br/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					代办人身份证复印件
					&nbsp;
				</td>
				<td colspan="3">
					<input type="file" name="IDcardcopy" size="40" disabled="disabled"/>&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">身份证复印件样本链接</font></a><br/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="4">
					<font color="#085DB2" style="font-size:13px;font-weight:600">———————————————————————收件人信息————————————————————————</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					收件人姓名
					<font>*</font>
				</td>
				<td>
					<input type="text" name="receiver" size="22"/>
				</td>
				<td class="text">
					收件人手机
					<font>*</font>
				</td>
				<td>
					<input type="text" name="receiverMobileNum" size="22"/>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					收件人地址
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="receiverAddress" size="50"/><font color="red" sytle="font-size: 12px;">（广东省广州市“XX”区 + “详细地址”）</font>
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					请输入验证码
					<font>*</font>
				</td>
				<td colspan="3">  
					<input type="text" name="validate" size="5"/>&nbsp;<img id="validate_img" src="<%=path %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;<a href="javascript:refreshValidate()"><font color="blue" style="font-size:12px">刷新验证码</font></a>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<span class="promise">所有带有星号（<font color="red">*</font>）标记的的字段是必填项的。</span>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<input type="checkbox" name="promise" value="" onclick="checkPromise()"/><span class="promise">本人承诺以上填写的资料均为真实有效</span>
				</td>
			</tr>
			<tr height="32px">
				<td colspan="4" align="center">
					<input type="submit" name="submit" disabled="disabled" value="确认提交"/>&nbsp;<input type="reset" name="reset" value="重置"/>
				</td>
			</tr>
		</table>
	  </fieldset>
	  </form>
	</body>

</html>
