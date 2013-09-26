<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String validate = request.getParameter("validate");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>test spring</title>
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/js/SmartWizard-2.0/styles/smart_wizard.css" />
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/css/style.css" />
<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/datetimepicker/WdatePicker.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/SmartWizard-2.0/js/jquery.smartWizard-2.0.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/Validation/vanadium.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/util.js"></script>
<script type="text/javascript">
	
	
	/*刷新验证码*/
	function refreshValidate(){
		var validate_img = document.getElementById("validate_img");
		validate_img.src="<%=request.getContextPath() %>/jsp/validate/makeCertPic.jsp?timeamp="+new Date().getTime();	
	}
	
	/*上传附件的回调*/
	function callback(flag,fileName,inputName){
		if (flag==1){
			var $input=$("#cmd"+inputName);
			$input.hide();

			$input.prevAll("input:hidden").first().val(fileName);
			$input.nextAll("span.failmsg").remove();
			$input.after('<span class="form_ok" style="display: inline; "></span>');
			//alert("上传成功！");
		}
		else{
			alert("上传失败！");
		}
	}
	
	/*保存表单数据后的回调函数*/
	function saveCallback(flag,applyNum){
		if (flag=="1"){
			Util.addSuccessMsg(applyNum,$("#step-6"));
			$(".buttonFinish").remove();
			$(".buttonNext").removeClass("buttonDisabled");
			$(".buttonNext").trigger("click");
			Util.setWaiting(false);
		}
		else{
			$(".buttonFinish").addClass("buttonDisabled");
			alert("保存失败!");
			Util.setWaiting(false);
		}
	}
	
	
	function init()
	{	
		Util.addAsterisk();
		Util.setTip();
		/*上传附件*/
		$("#cmdletterFile").click(function(){
			var $file=$("#letterFile");
			if ($file.hasClass("failformcss")) return;
			if ($file.val()==""){
				alert("请先选取要上传的文件!");
				return;
			}
			var action="<%=request.getContextPath() %>/vehiclelicense/upload.htm?name=letterFile";
			 $("form").attr("action",action).submit();
		});
		
		$("#cmdproxyFile").click(function(){
			var $file=$("#proxyFile");
			if ($file.hasClass("failformcss")) return;
			if ($file.val()==""){
				alert("请先选取要上传的文件!");
				return;
			}
			var action="<%=request.getContextPath() %>/vehiclelicense/upload.htm?name=proxyFile";
			 $("form").attr("action",action).submit();
		});
		
		$("#cmdvehicleFile").click(function(){
			var $file=$("#vehicleFile");
			if ($file.hasClass("failformcss")) return;
			if ($file.val()==""){
				alert("请先选取要上传的文件!");
				return;
			}
			var action="<%=request.getContextPath() %>/vehiclelicense/upload.htm?name=vehicleFile";
			 $("form").attr("action",action).submit();
		});
		
		$("#bizType").change(function(){
			$("#divText").find(".failmsg").remove();
			$("#divText").find("input.failformcss").removeClass("failformcss");
			var val=$(this).val();
			if (val=="0201"){
				$("#divRadio").show();
				$("#divText").hide();
			}
			else if (val=="0202"){
				$("#divText").show();
				$("#divRadio").hide();
			}
			else{
				$("#divText").hide();
				$("#divRadio").hide();
			}
		});
		
		$("#step-5").find(".radio").click(function(){
			$("#divPost").find(".failmsg").remove();
			$("#divPost").find("input.failformcss").removeClass("failformcss");
			var val=$("#step-5").find('input[name=receiveType]:checked').val();
			if (val=="1"){
				$("#divPost").show();
				$("#divSelf").hide();
			}
			else{
				$("#divPost").hide();
				$("#divSelf").show();
			}
		});
		
	      
	      $("#validateCode").keydown(function(){
	    	  $(this).nextAll("span.failmsg").remove();
	      });
	      
	      $("#validateCode").blur(function(){
	    	  var $this=$(this);
	    	  var code=$this.val();
	    	  if (code.length==0) return;
	    	  $this.nextAll("span.failmsg").remove();
	    	  $this.nextAll("span.form_ok").remove();
	    	  if (code.length<4){
	    		  $this.after("<span class='failmsg failformcss'>验证码输入有误，请重新输入</span>");
	    		  return;
	    	  }
	    	  $.ajax( {  
	 	         type : 'POST',  
	 	         url : "<%=request.getContextPath() %>/vehiclelicense/validateCode.htm?code=" + code,
	 	         success : function(msg) {  
	 	           flag=msg=="true";
	 	           if (!flag){
	 	        		$this.after("<span class='failmsg failformcss'>验证码输入有误，请重新输入</span>");
	 	           }
	 	           else{
	 	        	   $this.after('<span class="form_ok" style="display: inline; "></span>');
	 	           }
	 	         },  
	 	        
	 	         error : function() {  
	 	          alert("系统出错！");  
	 	         }  
	 	        
	          });  
	      });
	}
	
    $(document).ready(function(){
    	
    	init();
    	// Smart Wizard 	
  		$('#wizard').smartWizard(
  				{
  					keyNavigation: false,
  					labelNext:'下一步',
  				    labelPrevious:'上一步',
  				    labelFinish:'完成',
  				    onLeaveStep: function(obj,stepIdx){
  				    	var stepNum= obj.attr('rel');
  				    	var nextStepNum=stepIdx+1; //修改了插件的源码，让它返回要跳转的步骤的序号
  				    	if (nextStepNum<stepNum) return true; //跳转到之前步骤补验证表单
  				    	return validate(stepNum);			    	
  				    },
  				  onFinish:function(){
  					  if (validate(5)){
  						var action="<%=request.getContextPath() %>/vehiclelicense/saveApply.htm";
  						 $("form").attr("action",action).submit();
  						Util.setWaiting(true);
  					  }
  				  },
  				onShowStep:function(obj){
  					Util.autoScroll();
  					$("#wizard").find("ul > li").removeClass();
  					
  					var cls=obj.attr("class");
  					obj.parent().parent().addClass(cls);
  					
  					var $btnFinish=$(".buttonFinish");
  					if ($btnFinish.length==0) return;
  					var stepNum= obj.attr('rel');
  					
  					if (stepNum==5){
  						$(".buttonNext").addClass("buttonDisabled");
  						$btnFinish.removeClass("buttonDisabled");
  					}
  					
  				}
  				  
  				}
  			);

    	
    	function validate(stepNum)
    	{
    		var $step=$("#step-"+stepNum);
    		var $editor=$step.find("div.editor:visible");
		    $editor.find("input").each(function(){
		    		Vanadium.validateAndDecorate($(this)[0]);
		    });  
		    
		    $editor.find("select").each(function(){
	    		Vanadium.validateAndDecorate($(this)[0]);
	    }); 
		    
		    var $btns=$step.find(".editor_button:visible");
		    
		    if ($btns.length>0){
			    $btns.each(function(){
			    	$(this).nextAll().remove();
			    	$(this).after("<span class='failmsg failformcss'>请先上传文件</span>");
			    });
			    return false;
		    }
		    	
		    return $step.find(".failmsg").length==0;
        }  
      
		});
</script>
</head>
  <body>
    <form target="hiddenFrame"  action="<%=request.getContextPath() %>/vehiclelicense/saveApply.htm" method="post" enctype="multipart/form-data">
      <table align="center" border="0" cellpadding="0" cellspacing="0">
<tr><td> 
			<iframe name="hiddenFrame" id="hiddenFrame" style="display:none"></iframe>
<!-- Smart Wizard -->
  		<div id="wizard" class="swMain">
						<ul>
							<li><p><a href="#step-1"> <label class="stepNumber">1</label>
									<span class="stepText">业务须知</span>
							</a></p></li>
							<li><p><a href="#step-2"> <label class="stepNumber">2</label>
									<span class="stepText">业务信息</span>
							</a></p></li>
							<li><p><a href="#step-3"> <label class="stepNumber">3</label>
									<span class="stepText">所有人信息</span>
							</a></p></li>
							<li><p><a href="#step-4"> <label class="stepNumber">4</label>
									<span class="stepText">机动车信息</span>
							</a></p></li>
							<li><p><a href="#step-5"> <label class="stepNumber">5</label>
									<span class="stepText">收件人信息 </span>
							</a></p></li>
							<li><p><a href="#step-6"> <label class="stepNumber">6</label>
									<span class="stepText">完成 </span>
							</a></p></li>
						</ul>
				<div id="step-1">
<h4 style="text-align: center;">补领机动车行驶证</h4>
<h5>一、业务范围（限于行驶证核发地属于广州辖区的）</h5>
<p>凡灭失、丢失或者损毁的机动车行驶证，可向网上车管所申请补领机动车行驶证。</p>
<h5>二、所需资料</h5>
<p><strong>（一）</strong>机动车所有人的身份证明原件及复印件。</p>

<p><strong>（二）</strong>对灭失、丢失或者损毁的正证或副证的，应交回未灭失、丢失的机动车行驶证。</p>

<p><strong>（三）</strong>机动车标准相片。</p>
<h5>三、业务流程</h5>
<p><strong>（一）</strong>申请人填写《机动车牌证申请表》。</p>

<p><strong>（二）</strong>如实填写申请人姓名、身份证号码、联系电话、领取机动车行驶证方式以及收件方式、地址等相关信息，如有填写不实的，一切法律责任自负。设定“委托代办”的选项，链接委托书样本，设有代理人身份证复印件上传选项。</p>
<p><strong>（三）</strong>上传机动车的相片（其规格为长度88mm+0.5mm,宽度60mm+0.5mm,圆角半径4mm+0.1mm。遮挡机动车号牌的全车外部彩色照片。拍摄汽车相片时，应当从车前方左侧45度角拍摄，
拍摄摩托车和挂车相片时应当从车后方左侧45度角拍摄；机动车影像应占相片的三分之一；机动车相片应当能够清晰辨认机动车号牌号码和车身颜色）。</p>

<p><strong>（四）</strong>对委托代理人办理补/换领机动车行驶证业务的，请机动车所有人打印《委托书》并亲笔签名，代理人必须与收件人一致。</p>

<p><strong>（五）</strong>根据国家发展和改革委员会、财政部发改委价格[2004]2831号规定，驾驶证工本费10元/证。</p>

<p><strong>（六）</strong>申请成功后，请于2日内准备以上所需资料（身份证明采用A4纸正反两面复印）。</p>

<p><strong>（七）</strong>如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。</p>

<p><strong>（八）</strong>证件核发后，车管所会通过邮政部门把证件送到你预留的地址，邮政工作人员会收取办理所需的资料和费用，请积极配合。</p>

<p style="color:red;"><strong>*在办理过程中，请您如实填写相关信息，如发现采取欺瞒冒领证件或有其它违反法律法规行为的追究法律责任。</strong></p>

<div  class="editor" style="text-align: center;">
 <input type="checkbox" id="checkaccept" class=":accept" /><label>同意</label>
 
 
</div>
				</div>
				<div id="step-2" style="height:239px;">
					<div class="editor">
						<span class="editor-label">
							<LABEL for=bizType>业务类型：</LABEL>
						</span>
						<select id="bizType" class=":required" name="bizType">
							 <option value="">--请选择--</option>
							 <option value="0201">补领机动车行驶证</option>
							 <option value="0202">换领机动车行驶证</option>
						</select>
					</div>
					
					<div id="divText" class="editor" style="display:none;">
						<span class="editor-label">
							<LABEL for=reason>换领原因：</LABEL>
						</span>
						<label name="reason" id="reason">正常签满</label>
					</div>
					
					<div id="divRadio" class="editor" style="display:none;">
						<span class="editor-label">
							<LABEL for=bizReason>补领原因：</LABEL>
						</span>
						<input type="radio" name="bizReason" value="01" id="bizReason_0" checked="checked" /><label>丢失</label> 
						<input type="radio" name="bizReason" value="02" id="bizReason_1" /><label>灭失</label>
					</div>
					
 
							
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=proxyFlag>是否委托代办：</LABEL>
						</span>
						<input type="hidden" name="proxyFlag" id="proxyFlag" value="0" type="text" />
						<input name="tproxyFlag" id="tproxyFlag" type="checkbox" />
					</div>

				</div>
			<div id="step-3">
				 <div class="editor">
							<span class="editor-label">
								<LABEL for=ownerName>姓名：</LABEL>
							</span>
							<input name="ownerName" class="editor-field :required" id="ownerName" type="text" />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=idType>身份证明名称：</LABEL>
							</span>
							<!-- <input name="idType" class="editor-field :required :integer" id="idType" type="text" /> -->
							<select id="idType" name="idType">
							 <option selected="selected" value="1">
													居民身份证
												</option>
												<option value="2">
													组织机构代码证
												</option>
												<option value="3">
													军官证
												</option>
												<option value="4">
													士兵证
												</option>
												<option value="5">
													军官离退休证
												</option>
												<option value="6">
													境外人员身份证明
												</option>
												<option value="7">
													外交人员身份证明
												</option>
							</select>
						</div>
						
						 <div class="editor">
							<span class="editor-label">
								<LABEL for=idNO>身份证明号码：</LABEL>
							</span>
							<input name="idNO" class="editor-field :required " id="idNO" type="text" />
						</div>
						
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=homeAddress>住所详细地址：</LABEL>
						</span>
						<input name="homeAddress" class="editor-field :required qtip" tip="请填写身份证上的详细地址" id="homeAddress" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=phone>固定电话：</LABEL>
						</span>
						<input name="phone" class="editor-field :tel" id="phone" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=mobile>移动电话：</LABEL>
						</span>
						<input name="mobile" class="editor-field :required :mobile qtip" tip="请填写手机号码" id="mobile" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=email>电子邮箱：</LABEL>
						</span>
						<input name="email" class="editor-field :email" id="email" type="text" />
					</div>
				
				</div>                     
  			<div id="step-4">
                  		 <div class="editor">
							<span class="editor-label">
								<LABEL for=plateNumType>号牌种类：</LABEL>
							</span>
							<select id="plateNumType" name="plateNumType" class="qtip :required" tipWidth="300" tip='<img width="280px" height="180px" src="../images/license/cllx.jpg"  alt="行驶证" />'>
							 <option value="">--请选择--</option>
							 <option value="1" >
													大型汽车（黄牌）
												</option>
												<option value="2">
													小型汽车（蓝牌）
												</option>
												<option value="3">
													使馆汽车
												</option>
												<option value="4">
													领馆汽车
												</option>
												<option value="5">
													境外汽车
												</option>
												<option value="6">
													外籍汽车（黑牌）
												</option>
												<option value="7">
													普通摩托车
												</option>
												<option value="8">
													轻便摩托车
												</option>
												<option value="9">
													使馆摩托车
												</option>
												<option value="10">
													领馆摩托车
												</option>
												<option value="11">
													境外摩托车
												</option>
												<option value="12">
													外籍摩托车
												</option>
												<option value="13">
													农用运输车
												</option>
												<option value="14">
													拖拉机
												</option>
												<option value="15">
													挂车
												</option>
												<option value="16">
													教练汽车
												</option>
												<option value="17">
													教练摩托车
												</option>
												<option value="18">
													试验汽车
												</option>
												<option value="19">
													试验摩托车
												</option>
												<option value="20">
													临时入境汽车
												</option>
												<option value="21">
													临时入境摩托车
												</option>
												<option value="22">
													临时行驶车
												</option>
												<option value="23">
													警用汽车（白牌）
												</option>
												<option value="24">
													警用摩托
												</option>
							</select>
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=plateNum>号牌号码：</LABEL>
							</span>
							粤A<input name="plateNum" class="editor-field :required :CarNum" id="plateNum" type="text" style="width:220px;" />
						</div>
						
						 <div class="editor">
							<span class="editor-label">
								<LABEL for=vehicleIdNum>车架号(后六位)：</LABEL>
							</span>
							<input name="vehicleIdNum" class="editor-field :required :sixNum qtip" tipWidth="300" tip='<img width="280px" height="180px" src="../images/license/cjh.jpg"  alt="行驶证 "/>' id="vehicleIdNum" type="text" />
						</div>
						
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=engineNum>发动机号(后四位)：</LABEL>
						</span>
						<input name="engineNum" class="editor-field :required :fourNum qtip" tipWidth="300" tip='<img width="280px" height="180px" src="../images/license/fdjh.jpg"  alt="行驶证" />' id="engineNum" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<span class='field-impt'>*</span><LABEL for=vehicleImage>机动车照片：</LABEL>
						</span>
						<input style="display:none;" name="vehicleImage" id="vehicleImage" type="text" />
						<input id="vehicleFile" size="26px" type="file" value="浏览..." class="editor-field :picture qtip" tip="请上传(jpg | jpeg | bmp | gif)格式的图片文件" name="vehicleFile" />
						<input class="editor_button" type="button" id="cmdvehicleFile" value="上传" />
					</div>
		        
        	</div>
  			<div id="step-5" style="height:319px;">
               			 <div class="editor">
							<span class="editor-label">
								<LABEL for=receiveType>领取行驶证方式：</LABEL>
							</span>
							<input type="radio" name="receiveType" value="1" id="receiveType_1" class="radio"  checked="checked" /><label>邮政送达</label> 
							<input type="radio" name="receiveType" value="0" id="receiveType_0" class="radio" /><label>到车管所领取</label>	
						</div>
						
						<div id="divPost">
							<div class="editor">
							<span class="editor-label">
								
							</span>
							<label style="color:#C00;"><strong>(收件人必须为机动车所有人或业务代办人)</strong></label>
							</div>
						    <div class="editor">
								<span class="editor-label">
									<LABEL for=receiver>收件人姓名：</LABEL>
								</span>
								<input name="receiver" class="editor-field :required" id="receiver" type="text" />
							</div>
							
							 <div class="editor">
								<span class="editor-label">
									<LABEL for=receivePhone>收件人联系电话：</LABEL>
								</span>
								<input name="receivePhone" class="editor-field :required" id="receivePhone" type="text" />
							</div>
							
						
						<div class="editor">
						<span class="editor-label">
							<LABEL for=receiveAddress>收件人详细地址：</LABEL>
						</span>
						<label>广州市</label>
						<select id="area" name="area">
							<option value="天河区">天河区</option>
							<option value="越秀区">越秀区</option>
							<option value="海珠区">海珠区</option>
							<option value="白云区">白云区</option>
							<option value="荔湾区">荔湾区</option>
							<option value="番禺区">番禺区</option>
							<option value="黄埔区">黄埔区</option>
							<option value="萝岗区">萝岗区</option>
							<option value="南沙区">南沙区</option>
							<option value="花都区">花都区</option>
							<option value="增城市">增城市</option>
							<option value="从化市">从化市</option>
						</select>
						<input name="receiveAddress" style="width:150px" class="editor-field :required qtip" tip='请按照以下格式填写：广东省广州市“XX”区+“详细地址' id="receiveAddress" type="text" />
					</div>
						
					</div>	
						
						<div class="editor">
							<span class="editor-label">
								<LABEL for=validateCode>请输入验证码：</LABEL>
							</span>
							<input class="editor-field :required" type="text" name="validateCode" id="validateCode" />
						</div>
						
						<div class="editor">
							<span class="editor-label">
								
							</span>
							<img id="validate_img" src="<%=request.getContextPath() %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;<a href="javascript:refreshValidate()"><font color="blue" style="font-size:12px">刷新验证码</font></a>
						</div>
						
						<div id="divSelf" class="form_Prompt" style="display:none;">
							请到广州市天河区岑村华观路1732号车管所1号窗口领取
						</div>
			</div>
        	<div id="step-6">
        		
        	</div>
  		</div>
  		
  		
<!-- End SmartWizard Content -->  		
 		
</td></tr>

</table>
    </form>
   
  </body>
</html>