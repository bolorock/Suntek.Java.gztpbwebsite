<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>

		<link rel="stylesheet" type="text/css" href="/gztpbwebsite/js/SmartWizard-2.0/styles/smart_wizard.css" />
		<link rel="stylesheet" type="text/css" href="/gztpbwebsite/css/style.css" />
		<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/datetimepicker/WdatePicker.js"></script>
		<script type="text/javascript" src="/gztpbwebsite/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="/gztpbwebsite/js/SmartWizard-2.0/js/jquery.smartWizard-2.0.js"></script>
		<script type="text/javascript" src="/gztpbwebsite/js/Validation/vanadium.js"></script>
		<script type="text/javascript" src="/gztpbwebsite/js/util.js"></script>
		<script type="text/javascript">
		
		
	/*必填字段星号显示*/
	function addAsterisk(){
		$("#wizard").find(".\\:required").each(function(){
			$(this).parent().find(".editor-label").prepend("<span class='field-impt'>*</span>");
		})
	}

	/*刷新验证码*/
	function refreshValidate(){
		var validate_img = document.getElementById("validate_img");
		validate_img.src="<%=request.getContextPath() %>/jsp/validate/makeCertPic.jsp?timeamp="+new Date().getTime();	
	}
	
		/*保存表单数据后的回调函数*/
	function saveCallback(flag,applyNum){
		if (flag=="1"){
			$(".buttonFinish").remove();
			$(".buttonNext").removeClass("buttonDisabled");
			$(".buttonNext").trigger("click");
		//alert(applyNum);
		    $("#lblApplyNum").html(applyNum);
		}
		else{
			$(".buttonFinish").addClass("buttonDisabled");
			alert("保存失败!");
		}
	}
	
   $(document).ready(function(){
   
   		$("#ipt01").change(function(){
		   	if(!(/^粤A/.test($.trim($("#ipt01").val())))){
				$("#ipt01").val('粤A');
		    }
	    });
   
    	// Smart Wizard 	
  		$('#wizard').smartWizard(
  				{
  					keyNavigation: false , // Enable/Disable key navigation(left and right keys are used if enabled)
  					/*transitionEffect: 'slide',*/ // Effect on navigation, none/fade/slide/slideleft
  					labelNext:'下一步',
  				    labelPrevious:'上一步',
  				    labelFinish:'完成',
  				    onLeaveStep: function(obj,stepIdx){
  				    	var stepNum= obj.attr('rel');
  				    	var nextStepNum=stepIdx+1; //修改了插件的源码，让它返回要跳转的步骤的序号
  				    	if (nextStepNum<stepNum) return true; //跳转到之前步骤补验证表单
  		//		    	alert("stepIdx:" + stepIdx + ",stepNum:" + stepNum + ",nextStepNum:" + nextStepNum);
  				    	return validate(stepNum);			    	
  				    },
  				  onFinish:function(){
  					  if (validate(4)){
  					//    alert("submit...");
  						var action="<%=path%>/changeDriverContactWay/success.htm";
  						 $("form").attr("action",action).submit();
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
  					
  					if (stepNum==3){
  						$(".buttonNext").addClass("buttonDisabled");
  						$btnFinish.removeClass("buttonDisabled");
  					}
  					
  				}
  				  
  				}
  			);
  			
  			addAsterisk();
  			
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
			    	$(this).after("<span class='failmsg failformcss'>文件还没有上传</span>");
			    });
			    return false;
		    }
		    	
		    return $step.find(".failmsg").length==0;
} 

  				
//////////  				
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
//////////////// 


  			}
  			);
    	
</script>


	</head>

	<body>
	 <form target="hiddenFrame"  action="<%=request.getContextPath() %>/vehiclelicense/saveApply.htm" method="post" enctype="multipart/form-data">
      <table align="center" border="0" cellpadding="0" cellspacing="0">
<tr><td> 
		<iframe name="hiddenFrame" id="hiddenFrame" style="display: none"></iframe>
		<div id="wizard" class="swMain">
			<ul>
				<li>
					<p>
						<a href="#step-1"> <label class="stepNumber">
								1
							</label> <span class="stepText">业务须知</span> </a>
					</p>
				</li>
				<li>
					<p>
						<a href="#step-2"> <label class="stepNumber">
								2
							</label> <span class="stepText">基本信息</span> </a>
					</p>
				</li>
				<li>
					<p>
						<a href="#step-3"> <label class="stepNumber">
								3
							</label> <span class="stepText">变更人信息</span> </a>
					</p>
				</li>
				<li>
					<p>
						<a href="#step-4"> <label class="stepNumber">
								4
							</label> <span class="stepText">完成</span> </a>
					</p>
				</li>
			</ul>

			<div id="step-1">
				<h4 style="text-align: center;">
					变更驾驶人联系方式业务须知
				</h4>
				<h5>
					一、业务范围（限于机动车驾驶证核发地属于广州辖区的）
				</h5>
				<p>
					机动车驾驶人的联系方式发生变化的，机动车驾驶人可向网上车管所申请变更驾驶人联系方式。
				</p>
				<h5>
					二、业务流程
				</h5>
				<p>
					<strong>（一）</strong>申请人填写《变更驾驶人联系方式申请表》。
				</p>

				<p>
					<strong>（二）</strong>输入验证码，点击提交按钮，得到流水号。
				</p>

				<p>
					<strong>（三）</strong>如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。
				</p>
				
				<p style="color:red">
				   *在办理过程中，请您如实填写相关信息，如发现采取欺瞒冒领证件或有其它违反法律法规行为的追究法律责任。
				</p>

				<div class="editor" style="text-align: center;">
					<input type="checkbox" id="checkaccept" class=":accept" />
					<label>
						同意
					</label>
				</div>
			</div>
			<div id="step-2">
			 <div class="editor">
			    <span class="editor-label">
			       <label for="biztype">业务类型：</label>
			    </span>
			    <select name="biztype" disabled="disabled" id="biztype" class="editor-field :required" style="width:160px">
					 <option value="3001" selected="selected" >变更驾驶人联系方式</option>
				</select>
			 </div>
			
			 <div class="editor">
							<span class="editor-label">
								<LABEL for=drivername>驾驶员姓名：</LABEL>
							</span>
							<input name="drivername" class="editor-field :required" id="drivername" type="text" />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=idtype>身份证明名称：</LABEL>
							</span>
							<!-- <input name="idType" class="editor-field :required :integer" id="idType" type="text" /> -->
							<select id="idtype" name="idtype">
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
								<LABEL for=idno>身份证明号码：</LABEL>
							</span>
							<input name="idno" class="editor-field " id="idno" type="text" />
						</div>
						
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=docnum>档案编号：</LABEL>
						</span>
						<input name="docnum" class="editor-field :required :docNum" id="docnum" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=driverlicensenum>驾驶证证号：</LABEL>
						</span>
						<input name="driverlicensenum" class="editor-field :required :carcard" id="driverlicensenum" type="text" />
					</div>					
					
			</div>
			<div id="step-3">
					<div class="editor">
						<span class="editor-label">
							<LABEL for=phone>固定电话：</LABEL>
						</span>
						<input name="phone" class="editor-field :tel" id="phone" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=mobile>请填写手机号码：</LABEL>
						</span>
						<input name="mobile" class="editor-field :required :mobile" id="mobile" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=email>电子邮箱：</LABEL>
						</span>
						<input name="email" class="editor-field :email" id="email" type="text" />
					</div>	
								
	                  <div class="editor">
						<span class="editor-label">
							<LABEL for=postaddress>联系地址：</LABEL>
						</span>
						<input name="postaddress" class="editor-field :required" id="postaddress" type="text" />
						<font color="red" style="font-size: 12px;">（广东省广州市“XX”区 + “详细地址”）</font>
					</div>
					
			    	<div class="editor">
						<span class="editor-label">
							<LABEL for=zip>邮编：</LABEL>
						</span>
						<input name="zip" class="editor-field :required :zipcode"  id="zip" type="text" />
					</div>
	
					<div class="editor">
						<span class="editor-label">
							<LABEL for=validateCode>请输入验证码：</LABEL>
						</span>
						<input class="editor-field :required" type="text" name="validateCode" id="validateCode"  />
					</div>	
						<p style="padding-left:138px ">
						<img id="validate_img" src="<%=request.getContextPath() %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;
						<a href="javascript:refreshValidate()"><font color="blue" style="font-size:12px">刷新验证码</font></a>
						</p>				
			</div>

			<div id="step-4">
        		<div class="form_success">
					<p><strong>您好！您已成功提交变更驾驶人联系方式业务申请！请记录申请流水号： </strong></p>
					<span id="lblApplyNum" style="color: #D84600; font-size: 15px;">000</span>
					<p><strong>您可以用此流水号在http://www.baidu.com查询您的业务办理情况。</strong></p>
        		</div>				
			</div>
		</div>
		<!-- End SmartWizard Content -->
</td>
</tr>
</table>
</form>

	</body>
</html>

