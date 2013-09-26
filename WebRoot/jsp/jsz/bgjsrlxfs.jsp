<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>变更驾驶人联系方式</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="<%=path%>/css/style.css" />
  </head>
  
  <body>
    <div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">变更驾驶人联系方式申请表</font></div>
    <form action="#" method="post" onsubmit="return chackAll()" style="margin:0px;">
	  <fieldset style="margin-bottom:5px;">
	  <legend><font size="3" color="#085DB2">基本信息</font></legend>
		<table id="jdc_table" width="734" height="auto" align="center"
			border="0" cellspacing="2" cellpadding="0" style="">
			<tr height="32px">
				<td class="text" width="18%">
					 业务类型
					<font>*</font>
				</td>
				<td width="30%">
					<select name="type" disabled="disabled">
							<option value="变更驾驶人联系方式" selected="selected">变更驾驶人联系方式</option>
							</select>
				</td>
				<td width="20%" class="text">
					所有人姓名
					<font>*</font>
				</td>
				<td width="32%">
					<input type="text" name="drivername" size="22"/>
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
			<tr>
			<td class="text">
					驾驶证证号
					<font>*</font>
				</td>
				<td>
					<input type="text" name="driverlicense" size="22"/>
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
					<input type="text" name="mobileNum" size="22" />
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
					<input type="text" name="postNum" size="22" />
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
					<input type="checkbox" name="promise" value="" onclick="checkPromise()"/><span class="promise">本人承诺以上填写的资料均为真实有效</span>
				</td>
			</tr>
			<tr height="32px">
					<td colspan="2" align="right" class="button_right"><input type="submit"
						name="submit" disabled="disabled" value="确认提交" /></td>
						<td colspan="3" align="left" class="button_left">
						<input type="reset" name="reset" value="重置" />
						</td>
				</tr>
		</table>
	  </fieldset>
	  </form>
	  <script>
       function checkPromise(){
	    var flag = document.getElementsByName("promise")[0];
	    if(flag.checked){
		  document.getElementsByName("submit")[0].disabled="";
	    }else{
		   document.getElementsByName("submit")[0].disabled="disabled";
	    }
       }
       checkPromise();
       function refreshValidate(){
			var validate_img = document.getElementById("validate_img");
			validate_img.src="<%=path %>/jsp/validate/makeCertPic.jsp?timeamp="+new Date().getTime();	
		}

</script>
  </body>
</html>
