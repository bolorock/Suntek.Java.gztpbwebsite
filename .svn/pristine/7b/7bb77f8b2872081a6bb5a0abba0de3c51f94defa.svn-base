<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>变更机动车所有人联系方式</title>
    
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
    <div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">变更机动车所有人联系方式申请表</font></div>
    <form action="/gzitms/vehicle/VehicleInfoServlet" method="post" onsubmit="return chackAll()" style="margin:0px;">
	  <fieldset style="margin-bottom:5px;">
	  <legend><font size="3" color="#085DB2">基本信息</font></legend>
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
				<td class="text" width="18%">
					所有人姓名
					<font>*</font>
				</td>
				<td width="30%">
					<input type="text" name="userName" size="22" />
				</td>
				
			</tr>
			<tr height="32px">
				<td class="text">
					身份证明种类
					<font>*</font>
				</td>
				<td>
					<select name="userCardType" id="userCardType" class="select">
						<option selected="selected" value="A">居民身份证</option>
						<option value="B">组织机构代码证</option>
						<option value="C">军官证</option>
						<option value="D">士兵证</option>
						<option value="E">军官离退休证</option>
						<option value="F">境外人员身份证明</option>
						<option value="G">外交人员身份证明</option>
					</select>
				</td>
				<td class="text">
					居民身份证明号码
					<font>*</font>
				</td>
				<td>
					<input type="text" name="IDCardNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					号牌号码
					<font>*</font>
				</td>
				<td>
					粤A<input name="cardNum" type="text" class="cardNum" size="15"/>
				</td>
				<td class="text">
					车辆识别代码(后四位)
					<font>*</font>
				</td>
				<td>
					<input type="text" name="descernCode" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					发动机号(后六位)
					<font>*</font>
				</td>
				<td>
					<input type="text" name="engineNum" size="22" />
				</td>
				<td class="text">
					机动车登记证书编号
					<font>*</font>
				</td>
				<td>
					<input type="text" name="registerNum" size="21" />&nbsp;<a href="#"><font color="blue" sytle="font-size: 12px;">即证芯编号</font></a>
				</td>
			</tr>
			<tr>
			<td width="20%" class="text">
					号牌种类
					<font>*</font>
				</td>
				<td width="32%">
					<select name="carType" id="carType" class="select">
						<option value="0">——请选择车型——</option>
						<option value="01">大型汽车（黄牌）</option>
						<option value="02">小型汽车（蓝牌）</option>
						<option value="03">使馆汽车</option>
						<option value="04">领馆汽车</option>
						<option value="05">境外汽车</option>
						<option value="06">外籍汽车（黑牌）</option>
						<option value="07">普通摩托车</option>
						<option value="08">轻便摩托车</option>
						<option value="09">使馆摩托车</option>
						<option value="10">领馆摩托车</option>
						<option value="11">境外摩托车</option>
						<option value="12">外籍摩托车</option>
						<option value="13">农用运输车</option>
						<option value="14">拖拉机</option>
						<option value="15">挂车</option>
						<option value="16">教练汽车</option>
						<option value="17">教练摩托车</option>
						<option value="18">试验汽车</option>
						<option value="19">试验摩托车</option>
						<option value="20">临时入境汽车</option>
						<option value="21">临时入境摩托车</option>
						<option value="22">临时行驶车</option>
						<option value="23">警用汽车（白牌）</option>
						<option value="24">警用摩托</option>
					</select>
				</td>
			</tr>
		</table>
	  </fieldset>
	  <fieldset>
	  <legend><font size="3" color="#085DB2">变更信息</font></legend>
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="2" cellpadding="0" style="">
			<tr height="32px">
				<td class="text" width="18%">
					固定电话
					<font>*</font>
				</td>
				<td width="30%">
					<input type="text" name="phoneName" size="22" />
				</td>
				<td width="20%" class="text">
					移动电话
					&nbsp;
				</td>
				<td width="32%">
					<input type="text" name="mobileNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					电子邮件
					&nbsp;
				</td>
				<td>
					<input type="text" name="email" size="22" />
				</td>
				<td class="text">
					邮政编码
					&nbsp;
				</td>
				<td>
					<input type="text" name="postNum" size="21" />
				</td>
			</tr>
			<tr height="32px">
				<td class="text">
					联系地址
					<font>*</font>
				</td>
				<td colspan="3">
					<input type="text" name="address" size="50"/><font color="red" sytle="font-size: 12px;">（广东省广州市“XX”区 + “详细地址”）</font>
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
					<input type="submit" name="submit" disabled="disabled" value="确认提交"/>
					<input type="reset" name="reset" value="重置"/>
				</td>
			</tr>
		</table>
	  </fieldset>
	  </form>
  </body>
</html>
