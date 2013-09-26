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
    
    <title>剧毒化学品公路运输通行证申领业务须知</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style>
body {
	border-left: 1px solid #D9E0EA;
	border-right: 1px solid #D9E0EA;
	margin: 0px;
	padding: 15px 8px;
}
.title{
	font-size:18px;
	font-weight:600;
	margin-bottom:5px;
}
.content{
	margin-bottom:5px;
	font-size:14px;
	word-spacing:3px;
	line-height:22px;
}
.greet{
	font-size:13px;
}
</style>
<script>
location="#top";
function next(){
	var flag = document.getElementsByName("greet")[0];
	if(flag.checked){
		//window.location.href="/gztpbwebsite/jsp/jdc/bhljdcz.jsp";
		//window.location.href="/gztpbwebsite/jsp/hxjd/fillForm.html";
		window.location.href="/gztpbwebsite/jsp/hxjd/fillForm2.jsp";
	}
}
function checkGreet(){
	var flag = document.getElementsByName("greet")[0];
	if(flag.checked){
		document.getElementsByName("next")[0].disabled="";
	}else{
		document.getElementsByName("next")[0].disabled="disabled";
	}	
}
</script>
	</head>

	<body>
					<a name="#top"></a>
		<table align="center" border="0" width="700">
			<tr>
				<td align="center">
					<h2> 
						剧毒化学品公路运输通行证申领业务须知 
					</h2>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">一、业务范围</div>
				<div class="content">机动车通过道路载运化学物品及危险物品，可向网上车管所申请剧毒化学品公路运输通行证。</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">二、所需资料</div>
				<div class="content">
				（一）机动车所有人的身份证明原件及复印件。(<a href="#"><font color="red">标准样版</font></a>)<br/>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">三、业务流程</div>
				<div class="content">
				（一）申请人阅读填表说明。<br/>
				（二）申请人填写《剧毒化学品公路运输通行证申请表》。<br/>
（三）如实填写申请人姓名、身份证号码、联系电话、领取机动车行驶证方式以及收件方式、地址等相关信息，如有填写不实的，一切法律责任自负。<br/>
（四）申请信息可由承运单位通过车管所网办系统提交，但承运人仍然要来交警支队现场进行车辆检验，只有两者都通过审核后，才能核发通行证。<br/>		
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">四、服务条款</div>
				<div class="content">
				（一）本人自愿选择通过互联网在线办理补换领机动车行驶证业务（机动车所有人为个人，号牌种类为小型汽车），并使用邮政速递服务，同意支付邮政速递费用?元/件。<br/>
                                          （二）本人承诺提供真实有效的资料及信息，并如实正确填报行驶证办理信息及收件人信息<br/>
			          （三）在线办理补换领机动车行驶证业务全程办结时限为?个工作日，申请人登陆网上车管所可通过流水号或拨打020-87220001凭业务受理号查询行驶证的办理情况。<br/>
				</div>
				</td>
			</tr>
			<tr>
				<td align="center">
				    <br/>
					<h2> 
						剧毒化学品公路运输通行证申请表填写说明 
					</h2>
				</td>
			</tr>
			<tr>
				<td>
				<div class="content">
				一、本表“经营许可证号”栏填写运输单位从事危险货物道路运输的道路运输经营许可证的颁发机关和证号。<br/>
                                          二、本表“道路运输证号”栏填写运输车辆从事危险货物道路运输的道路运输证的颁发机关和证号。<br/>
			          三、本表有关“上岗资格证号”栏分别填写承担本次运输任务的驾驶人、押运人员从事危险货物道路运输的上岗资格证的颁发机关和证号。<br/>
                                          四、本表“身份证件号码”栏分别填写有关人员的居民身份证、护照等身份证明的名称和号码。<br/>
				</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="checkbox" name="greet" value="greet" onclick="checkGreet()"/><span class="greet">同意</span> &nbsp;<input type="button" value="下一步" name="next" onclick="next()" disabled="disabled"/>
				</td>
			</tr>
		</table>
	</body>
</html>
