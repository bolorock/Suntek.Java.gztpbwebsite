<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>test spring</title>
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/js/SmartWizard-2.0/styles/smart_wizard.css" />
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/css/style.css" />
<script type="text/javascript" src="/gztpbwebsite/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/SmartWizard-2.0/js/jquery.smartWizard-2.0.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/Validation/vanadium.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/gztpbwebsite/js/qtip/jquery.qtip-1.0.0-rc3.min.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/util.js"></script>

<script type="text/javascript">
	var isShow=false;
	
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
		
		/*上传附件*/
		$("#cmdannounceFile").click(function(){
			var $file=$("#announceFile");
			if ($file.hasClass("failformcss")) return;
			if ($file.val()==""){
				alert("请先选取要上传的文件!");
				return;
			}
			var action="<%=request.getContextPath() %>/driverlicense/upload.htm?name=announceFile";
			 $("form").attr("action",action).submit();
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
	 	         url : "<%=request.getContextPath() %>/driverlicense/validateCode.htm?code=" + code,
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
  					keyNavigation: false, // Enable/Disable key navigation(left and right keys are used if enabled)
  					/*transitionEffect: 'slide',*/ // Effect on navigation, none/fade/slide/slideleft
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
  						var action="<%=request.getContextPath() %>/driverlicense/saveApply.htm";
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
  						if (!isShow){
  							isShow=true;
  							$("#receiver").val($("#ownerName").val());
  							$("#receivePhone").val($("#mobile").val());
  							$("#area").val($("#postArea").val());
  							$("#receiveAddress").val($("#postAddress").val());
  						}
  					}
  					
  				}
  				  
  				}
  			);
    	
    	function validate(stepNum)
    	{
    		var $step=$("#step-"+stepNum);
		    $step.find("div.editor:visible").find("input").each(function(){
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
    <form target="hiddenFrame"  action="<%=request.getContextPath() %>/driverlicense/saveApply.htm" method="post" enctype="multipart/form-data">
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
									<span class="stepText">个人基本信息</span>
							</a></p></li>
							<li><p><a href="#step-4"> <label class="stepNumber">4</label>
									<span class="stepText">个人联系信息</span>
							</a></p></li>
							<li><p><a href="#step-5"> <label class="stepNumber">5</label>
									<span class="stepText">收件人信息 </span>
							</a></p></li>
							<li><p><a href="#step-6"> <label class="stepNumber">6</label>
									<span class="stepText">完成 </span>
							</a></p></li>
						</ul>
				<div id="step-1">
<h4 style="text-align: center;">补领机动车驾驶证</h4>
<h5>一、业务范围（限于机动车驾驶证核发地属于广州辖区的）</h5>
<p>机动车驾驶证遗失的，机动车驾驶人可向网上车管所申请补发机动车驾驶证。机动车驾驶证被依法扣押、扣留或者暂扣期间，机动车驾驶人不得申请补发。</p>
<h5>二、所需资料</h5>
<p><strong>（一）</strong>机动车驾驶人的有效身份证明原件及复印件。在暂住地居住的内地居民还需提供公安机关核发的有效居住证明复印件一份。</p>

<p><strong>（二）</strong>机动车驾驶证遗失书面说明。</p>

<p><strong>（三）</strong>《广东省机动车驾驶证数字相片采集回执》原件（申请人签名）。</p>
<h5>三、业务流程</h5>
<p><strong>（一）</strong>申请人填写《机动车驾驶证申请表》。</p>

<p><strong>（二）</strong>如实填写申请人姓名、身份证号码、联系电话、领取机动车驾驶证方式以及收件地址等相关信息，如有填写不实的，一切法律责任自负。</p>
<p><strong>（三）</strong>对委托代理人办理补领机动车驾驶证的，请驾驶人打印《委托书》并亲笔签名，代理人必须与收件人一致。</p>

<p><strong>（四）</strong>根据国家发展和改革委员会、财政部发改委价格[2004]2831号规定，驾驶证工本费10元/证</p>

<p><strong>（五）</strong>申请成功后，请于2日内准备以上所需资料（身份证明采用A4纸正反两面复印）。</p>

<p><strong>（六）</strong>如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。</p>

<p><strong>（七）</strong>证件核发后，车管所会通过邮政部门把证件送到你预留的地址，邮政工作人员会收取办理所需的资料和费用，请积极配合。</p>

<p style="color:red;"><strong>*在办理过程中，请您如实填写相关信息，如发现采取欺瞒冒领证件或有其它违反法律法规行为的追究法律责任。</strong></p>

<div  class="editor" style="text-align: center;">
 <input type="checkbox" id="checkaccept" class=":accept" /><label>同意</label>
  
</div>
				</div>
				<div id="step-2">
					<div class="editor">
						<span class="editor-label">
							<LABEL for=bizType>业务类型：</LABEL>
						</span>
						<select id="bizType" name="bizType">
							 <option value="0402">补领驾驶证</option>
						</select>
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=bizReason>补证原因：</LABEL>
						</span>
						<input type="radio" name="bizReason" value="01" id="bizReason_0" class="radio" checked="checked"><label>丢失</label> 
						<input type="radio" name="bizReason" value="02" id="bizReason_1" class="radio"><label>其它</label> 
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=docNum>档案编号:</LABEL>
						</span>
						<input name="docNum" class="editor-field :required qtip" tipWidth="300" tip='<img width="280px" height="180px" src="../images/license/dabh.jpg"  alt="驾驶证" />' id="docNum" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=receiptNum>驾驶证照片回执编号:</LABEL>
						</span>
						<input name="receiptNum" class="editor-field :required qtip" tipWidth="300" tip='<img width="280px" height="180px" src="../images/license/szzp.jpg"  alt="驾驶证" />' id="receiptNum" type="text" />
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
							<input name="idNO" class="editor-field :required" id="idNO" type="text" />
						</div>
						
					   <div class="editor">
							<span class="editor-label">
								<LABEL for=country>国籍：</LABEL>
							</span>
							<input name="country" class="editor-field :required" id="country" type="text" value="中国" />
						</div>
						
						<div class="editor">
							<span class="editor-label">
								<LABEL for=sex>性别：</LABEL>
							</span>
							<input type="radio" name="sex" value="0" id="sex_0" class="radio" checked="checked"><label>男</label> 
						    <input type="radio" name="sex" value="1" id="sex_1" class="radio"><label>女</label> 
						</div>
						
						<div class="editor">
							<span class="editor-label">
								<LABEL for=birthday>出生日期：</LABEL>
							</span>
							<input name="birthday" class="Wdate :required" id="birthday" type="text"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});" />
						</div>
							
				</div>   
			
			<div id="step-4">
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=homeAddress>登记住所地址：</LABEL>
						</span>
						<input name="homeAddress" class="editor-field :required qtip" tip="请填写身份证上的详细地址" id="homeAddress" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<label for=postAddress>联系地址：</label>
						</span>
						<label>广州市</label>
						<select id="postArea" name="postArea">
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
						<input name="postAddress" style="width:150px" class="editor-field :required qtip" tip='请按照以下格式填写：广东省广州市“XX”区+“详细地址”' id="postAddress" type="text" />
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
  			
  			<div id="step-5">
               			 <div class="editor">
							<span class="editor-label">
								<LABEL for=receiveType>领取驾驶证方式：</LABEL>
							</span>
							<input type="radio" name="receiveType" value="1" id="receiveType_1" class="radio" checked="checked" /><label>邮政送达</label>
							<input type="radio" name="receiveType" value="0" id="receiveType_0" class="radio"  /><label>到车管所领取</label> 	
						</div>
					<div id="divPost">	
						<div class="editor">
							<span class="editor-label">
								
							</span>
							<label style="color:#C00;"><strong>(收件人缺省为本人,可修改为他人收件)</strong></label>
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