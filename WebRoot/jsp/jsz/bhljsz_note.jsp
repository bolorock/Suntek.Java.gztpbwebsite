<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>补换领机动车行驶证业务须知</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="<%=path%>/css/style.css" />
</head>

<body>
	<table align="center" border="0" width="700">
		<tr>
			<td align="center">
				<h2>网上车管所办理补换领驾驶证业务须知</h2>
			</td>
		</tr>
		<tr>
			<td>
				<div class="title">一、业务范围</div>
				<div class="content">机动车驾驶证遗失的，机动车驾驶人可向网上车管所申请补发机动车驾驶证。机动车驾驶证被依法扣押、扣留或者暂扣期间，机动车驾驶人不得申请补发。</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="title">二、所需资料</div>
				<div class="content">
					（一）机动车驾驶人的有效身份证明原件及复印件。在暂住地居住的内地居民还需提供公安机关核发的有效居住证明复印件一份<br />
					（二）机动车驾驶证遗失书面说明。（<a href="#"><font color="red">遗失声明样版</font></a>）<br /> 
					（三）《广东省机动车驾驶证数字相片采集回执》原件（申请人签名）
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="title">三、业务流程</div>
				<div class="content">
					（一）申请人填写《机动车牌证申请表》。<br />
					（二）上传申请人近期免冠白底背景的相片（人头像约占相片长度三分之二的彩色正面光学相片4张（规格为32mm×22mm，300dpi）。<br />
					（三）如实填写申请人姓名、身份证号码、联系电话、领取机动车驾驶证方式以及收件地址等相关信息，如有填写不实的，一切法律责任自负。<br />
					（四）输入验证码，点击提交按钮，得到流水号。<br /> 
					（五）申请人通过网银缴交费用。<br />
					（六）申请成功后，请于2日内准备以上所需资料（身份证明采用A4纸正反两面复印）。<br />
					（七）如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。<br />
					（八）证件核发后，车管所会通过邮政部门把证件送到你预留的地址，邮政工作人员会收取办理所需的资料和费用，请积极配合。
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="title">四、服务条款</div>
				<div class="content">
					（一）申请人填写《机动车驾驶证申请表》。<br />
					（二）本人承诺提供真实有效的资料及信息，并如实正确填报行驶证办理信息及收件人信息<br />
					（三）在线办理补换领机动车行驶证业务全程办结时限为?个工作日，申请人登陆网上车管所可通过流水号或拨打020-87220001凭业务受理号查询行驶证的办理情况。<br />
					（四）申请人委托别人代办的，代办人必须了解并同意<a href="#"><font color="red">委托书</font></a>中的相关条款。<br /> 
					（五）申请人通过在线申请行驶证业务后，不得中途取消速递服务。<br />
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
			<input type="checkbox" name="greet" value="" onclick="checkGreet()" />
			<span class="greet">同意</span> &nbsp;
				<input type="button" value="下一步" name="next" onclick="next()"/>
			</td>
		</tr>
	</table>
	<script>
	function next() {
		var flag = document.getElementsByName("greet")[0];
		if (flag.checked) {
			window.location.href = "<%=path%>/jsp/jsz/bhljsz.jsp";
		}
	}
	function checkGreet() {
		var flag = document.getElementsByName("greet")[0];
		if (flag.checked) {
			document.getElementsByName("next")[0].disabled = "";
		} else {
			document.getElementsByName("next")[0].disabled = "disabled";
		}
	}
	checkGreet();
</script>
</body>
</html>
