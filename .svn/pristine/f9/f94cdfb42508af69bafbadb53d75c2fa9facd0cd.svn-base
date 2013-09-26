<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>变更机动车所有人联系方式须知</title>
    
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
function next(){
	var flag = document.getElementsByName("greet")[0];
	if(flag.checked){
		window.location.href="<%=path%>/jsp/jdc/bgjdclxfs.jsp";
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
		<table align="center" border="0" width="700">
			<tr>
				<td align="center">
					<h2> 
						网上车管所办理变更机动车所有人联系方式业务须知 
					</h2>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">一、业务范围</div>
				<div class="content">机动车所有人联系方式变更的，机动车所有人可向网上车管所申请变更机动车联系人方式。只办理邮寄地址.邮政编码.固定电话.电子信箱.移动电话的变化备案。</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">二、所需资料</div>
				<div class="content">
				（一）机动车所有人的有效身份证明原件及复印件一份。在暂住地居住的内地居民还需提供公安机关核发的有效居住证明复印件一份。单位车辆需单位有效组织机构代码证复印件加盖单位鲜章。加盖单位鲜章的委托书原件，经办人有效身份证明复印件。<br/>
                                          （二）《机动车行驶证》原件及复印件。<br/>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">三、业务流程</div>
				<div class="content">
				（一）申请人填写《机动车变更登记/备案申请表》。<br/>
（二）如实填写申请人姓名、身份证号码、联系电话、交.收件方式以及收件地址等相关信息，如有填写不实的，一切法律责任自负。<br/>
（三）输入验证码，点击提交按钮，得到流水号。<br/>
（四）申请人通过网银缴交费用。<br/>
（五）申请成功后，请于2日内准备以上所需资料（身份证明采用A4纸正反两面复印）。<br/>
（六）如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。<br/>
（七）业务核定后，车管所会通过邮政部门把业务受理单送到你预留的地址，邮政工作人员会收取办理所需的资料和费用，请积极配合。
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div class="title">四、服务条款</div>
				<div class="content">
				（一）本人自愿选择通过互联网在线办理机动车所有人联系方式变更业务。<br/>
                                          （二）本人承诺提供真实有效的资料及信息，并如实正确填报行驶证办理信息<br/>
                <!-- （三）申请人在线办理行驶证业务，录入相关信息并通过比对审核后，邮政部门在次日内上门收取申请人的办证材料，请事先准备好相关办证材料，以便投递员成功收件。<br/> -->
			          （三）在线办理机动车所有人联系方式变更业务全程办结时限为?个工作日，申请人登陆网上车管所可通过流水号或拨打020-87220001凭业务受理号查询业务的办理情况。<br/>
                                          （四）申请人委托别人代办的，代办人必须了解并同意<a href="#"><font color="red">委托书</font></a>中的相关条款。<br/>
                                          （五）申请人通过在线申请机动车所有人联系方式变更业务后，不得中途取消服务。<br/>                                                    
				</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="checkbox" name="greet" value="greet" onclick="checkGreet()"/><span class="greet">同意</span> &nbsp;<input type="button" value="下一步" name="next" onclick="next()" disabled="disabled"/></a>
				</td>
			</tr>
		</table>
	</body>
</html>
