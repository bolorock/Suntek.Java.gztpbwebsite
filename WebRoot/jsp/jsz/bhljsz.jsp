<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>补/换领驾驶证</title>

<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="<%=path%>/css/style.css" />
<link type="text/css" rel="stylesheet" href="<%=path%>/js/datetimepicker/datetimepicker/skin/WdatePicker.css" />
</head>

<body>
<div style="text-align:center;margin-bottom:5px;"><font size="4" color="#085DB2">补换领驾驶证申请表</font></div>
	<form action="#" method="post">
		<fieldset>
			<table id="jdc_table" width="734" height="auto" align="center"
				border="0" cellspacing="2" cellpadding="0" style="">
				<tr height="32px">
					<td class="text" width="18%">
					             业务类型
					<font>*</font>
					</td>
					<td width="32%"><select name="type" disabled="disabled">
							<option value="补换领驾驶证" selected="selected">补换领驾驶证</option>
					</select>
					</td>
					<td width="18%" class="text">
					                    姓名
					   <font>*</font>
					   </td>
					<td width="32%"><input class="required" type="text" name="username" size="22" />
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					       身份证明名称
					<font>*</font>
					</td>
					<td><select name="identity">
							<option value="居民身份证" selected="selected">居民身份证</option>
					</select>
					</td>
					<td class="text">
					居民身份证明号码
					<font>*</font>
					</td>
					<td><input class="required" type="text" name="identitynum" size="22" id="creditId"/>
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					性别
					<font>*</font>
					</td>
					<td><input type="radio" name="sex" value="男" checked="checked" />男
						<input type="radio" name="sex" value="女" />女</td>
					<td class="text">
					出生日期
					<font>*</font>
					</td>
					<td><input id="datetime" class="Wdate required" dateFormat="yyyy-mm-dd" type="text" name="borthday" size="22" />
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					户籍所在地
					<font>*</font>
					</td>
					<td><select name="household">
							<option value="广州" selected="selected">广州</option>
							<option value="外地">外地</option>
					</select>
					</td>
					<td class="text">
					居住证号码
					<font>*</font>
					</td>
					<td><input class="required" type="text" name="householdnum"
						size="22" />
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					国籍
					<font>*</font>
					</td>
					<td><input class="required" type="text" name="country"
						size="22" />
					</td>
					<td class="text">
					驾驶证证号
					<font>*</font>
					</td>
					<td><input class="required" type="text" name="creditnum"
						size="22" />
					</td>
				</tr>
				<tr height="32px">
				  <td class="text">
				           驾驶人照片提交方式
				    <font>*</font>
				  </td>
				  <td colspan="3">
				  <input type="radio" name="imgtype" value="upload" checked="checked"/>上传驾驶人照片
				    <input type="radio" name="imgtype" value="return" />输入驾驶证照片回执编号
				    
				  </td>
				</tr>
				<tr height="32px" class="imgtype" id="imgtype_return" style="display:none;">
				   <td class="text">
				        驾驶证照片回执编号
				   <font>*</font>
				   </td>
				   <td colspan="3">
				   <input class="required" type="text" name="returnphoto" size="40" />
				   </td>
				</tr>
				<tr height="32px" class="imgtype" id="imgtype_upload">
					<td class="text">
					驾驶人照片
					<font>*</font>
					</td>
					<td colspan="3"><input class="required" type="file" name="driverphoto" size="40" />&nbsp;
					<!-- 	<font color="red">（分辨率为?以上，格式为jpg、jpeg、bmp、gif、png，文件大小都不能超过2M，必须与样式规范一致。）</font>  -->
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					遗失书面说明
					<font>*</font>
					</td>
					<td colspan="3"><input class="required" type="file"
						name="lostillustration" size="40" /> <a href="#"><font
							color="blue">遗失声明样版</font>
					</a></td>
				</tr>
				<tr height="32px">
					<td class="text">
					住所详细地址
					<font>*</font>
					</td>
					<td colspan="3">
					    <input class="required" type="text" name="address" size="50" /> 
						<font color="red">（广东省广州市“XX”区  +“详细地址”）</font>
						</td>
				</tr>
				<tr height="32px">
					<td class="text">
					  电子邮箱
					 &nbsp;
					</td>
					<td><input type="text" name="email" size="22" id="email"/>
					</td>
					<td class="text">
					固定电话
					&nbsp;
					</td>
					<td><input type="text" name="phonenum" size="22" />
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					移动电话
					&nbsp;
					</td>
					<td><input type="text" name="mobilenum" size="22" />
					</td>
				
				</tr>
				<tr height="32px">
					<td class="text">
					是否委托代办
					&nbsp;
					</td>
					<td><input type="checkbox" name="daiban" size="22"
						onclick="checkDaiban()" value="" />
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr height="32px">
					<td class="text">
					委托书
					&nbsp;
					</td>
					<td colspan="3"><input type="file" name="entrustbook"
						size="40" disabled="disabled" />&nbsp;<a href="#"> <font
							color="blue">委托书样本链接</font> </a><br />
					</td>
				</tr>
				<tr height="32px">
					<td class="text">
					代办人身份证复印件
					&nbsp;
                    </td>
					<td colspan="3"><input type="file" name="IDcardcopy" size="40"
						disabled="disabled" />&nbsp;<a href="#"> <font color="blue">身份证复印件样本链接</font>
					</a><br />
					</td>
				</tr>
				<tr>
				<td class="text">
				驾驶证领取方式
				<font>*</font>
				</td>
				<td>
				<input type="radio" name="gettype" checked="checked" id="scenetype"/>现场取证
				<input type="radio" name="gettype" id="postaltype"/>邮政配送
				</td>
				</tr>
				<tr class="receivermsg">
					<td align="center" colspan="4"><font color="#085DB2"
						style="font-size: 13px; font-weight: 600">———————————————————————收件人信息————————————————————————</font>
					</td>
				</tr>
				<tr height="32px" class="receivermsg">
					<td class="text">
					收件人姓名
					<font>*</font>
					</td>
					<td><input class="required" type="text" name="receiver"
						size="22" />
					</td>
					<td class="text">
					收件人手机
					<font>*</font></td>
					<td><input class="required" type="text"
						name="receivermobilenum" size="22" />
					</td>
				</tr>
				<tr height="32px" class="receivermsg">
					<td class="text">
					收件人地址
					<font>*</font>
					</td>
					<td colspan="3"><input class="required" type="text"
						name="receiveraddress" size="50" /> <font color="red">（广东省广州市“XX”区+“详细地址”）</font>
					</td>
				</tr>
				<tr height="32px">
				<td class="text">
				请输入验证码
				<font>*</font>
				</td>
				<td colspan="3">
					<input class="required" type="text" name="validate" size="5"/>&nbsp;<img id="validate_img" src="<%=path %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;<a href="javascript:refreshValidate()"><font color="blue" style="font-size:12px">刷新验证码</font></a>
				</td>
			    </tr>    
				<tr height="32px">
					<td colspan="4" align="center">
					<p><span>所有带有星号（<font color="red">*</font>）标记的的字段是必填项的。</span></p>
					<input type="checkbox" name="promise" value="" onclick="checkPromise()" /> 
						<span class="promise">本人承诺以上填写的资料均为真实有效</span>
					</td>
				</tr>
				<tr height="32px">
					<td colspan="2" align="right" class="button_right">
					<input class="submit" type="submit" name="submit" disabled="disabled" value="确认提交" />
					</td>
					<td colspan="3" align="left" class="button_left"><input
						type="reset" name="reset" value="重置" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
	<script type="text/javascript" src="/gztpbwebsite/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="/gztpbwebsite/js/check.js"></script>
	<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/datetimepicker/WdatePicker.js"></script>
	<script type="text/javascript">
	    function convert_format(ft) {
		  return ft.replace(/m/g, "M").replace(/n/g, "N").replace(/h/g, "H");
	    }
	    $(":radio[name='imgtype']").click(function(){
	    	$("tr.imgtype").hide();
	    	$("#imgtype_"+$(this).val()).show();
	    });
	    $(".receivermsg").hide();
	    $("#postaltype").click(function(){
	    	$(".receivermsg").show();
	    });
	    $("#scenetype").click(function(){
	    	$(".receivermsg").hide();
	    });
	    
	    /*$("input.submit").click(function(){
	    	var requireds = $("input.required");
			for ( var i=0;i<requireds.length;i++) {
				
				if (requireds[i].value == "") {
					var text = $(requireds[i]).parent().prev().html();
					alert(text.replace(/<font>.+<\/font>/i," ")+"不能为空！");
					if(requireds[i].innerHTML.indexOf("datetime")!=-1){
				    	$(requireds[i]).focus();
					}
					return true;
				}
			}
			var check=checkCreditId($("#creditId").val());
			if(check!=""){
				alert(check);
				$("#creditId").focus();
				return false;
			}
			if($("#email").val()!=""){
				if(!checkEmail($("#email").val())){
					alert("电子邮箱格式出错！");
					$("#email").focus();
					return false;
				}
			}
			return true;
	    });*/
	    
		function checkDaiban() {
			var flag = document.getElementsByName("daiban")[0];
			if (flag.value == "") {
				flag.value = "y";
				document.getElementsByName("entrustbook")[0].disabled = "";
				document.getElementsByName("IDcardcopy")[0].disabled = "";
			} else {
				flag.value = "";
				document.getElementsByName("entrustbook")[0].disabled = "disabled";
				document.getElementsByName("IDcardcopy")[0].disabled = "disabled";
			}
		}
		function checkPromise() {
			var flag = document.getElementsByName("promise")[0];
			if (flag.value == "") {
				flag.value = "y";
				document.getElementsByName("submit")[0].disabled = "";
			} else {
				flag.value = "";
				document.getElementsByName("submit")[0].disabled = "disabled";
			}
		}
		function refreshValidate(){
			var validate_img = document.getElementById("validate_img");
			validate_img.src="<%=path %>/jsp/validate/makeCertPic.jsp?timeamp="+new Date().getTime();	
		}
		var dp_datetime = $('#datetime');
		dp_datetime.focus(function() {
			WdatePicker({
				skin : 'default',
				dateFmt : convert_format($(this).attr('dateFormat')),
				isShowToday : true,
				readOnly : false
			});
		});
	</script>
</body>

</html>
