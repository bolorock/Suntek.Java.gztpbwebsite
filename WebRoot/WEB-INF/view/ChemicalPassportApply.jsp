<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
//String validate = request.getParameter("validate");
String path = request.getContextPath();
 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>test spring</title>
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/js/SmartWizard-2.0/styles/smart_wizard.css" />
<link rel="stylesheet" type="text/css" href="/gztpbwebsite/css/style.css" />
<script type="text/javascript" src="/gztpbwebsite/js/datetimepicker/WdatePicker.js"></script> 
<script type="text/javascript" src="/gztpbwebsite/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/SmartWizard-2.0/js/jquery.smartWizard-2.0.js"></script>
<script type="text/javascript" src="/gztpbwebsite/js/Validation/vanadium.js"></script>
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
			
			/*$("#applyNum").html(applyNum);*/ 			           				         
		}
		else{
		    
			$(".buttonFinish").addClass("buttonDisabled");
			alert("保存失败!");
		}
	}
	
	function init()
	{
	    Util.addAsterisk();

	    $("#carrierNo").blur(function(){
	    var carrierNo = $.trim($("#carrierNo").val());
	    if(carrierNo != ""){
			    $.ajax( {  
			 	         type : 'POST',  
			 	         url : "<%=path%>/chemical/isCarrierExists.htm?carrierNo=" + encodeURI(encodeURI(carrierNo,"utf-8"),"urf-8"),
			 	         async : false,
			 	         success : function(msg) {  
			 	           //flag=msg=="true";
			 	           if(msg == '0'){
				 	            $("#isCarrierExists").val("0");
			 	                $("#carrier").val("该承运单位编号不存在对应的承运单位！");			 	                
			 	                $("#carrierDiv").show();
			 	               
			 	           }else{
			 	                $("#isCarrierExists").val("1");
			 	                msg = decodeURI(msg,'utf-8');
			 	                if(msg == "null") msg = "";
			 	           		$("#carrier").val(msg);
			 	           		$("#carrierDiv").show();
			 	           		$("#purchaserDiv").show();
			 	           		$("#sellerDiv").show();
			 	           		$("#proofTypeDiv").show();
			 	           		$("#proofNoDiv").show();
			 	                
			 	           }
			 	          
			 	         },  
			 	        
			 	         error : function() {  
			 	          alert("系统出错！");  
			 	         }  
			 	        
			          });  
	          }
	    }
	    );
	    
	      <%-- 验证码校验 begin --%>
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
	      <%-- 验证码校验 end --%>
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
  				      if (validate(6)){

  				         var action="<%=request.getContextPath() %>/chemical/saveApply.htm";
  						 $("#from1").attr("action",action).submit();
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
    		
    		//validate carrierNo start
    		var isCarrierExists = $("#isCarrierExists").val();
    		if(isCarrierExists == "0" && stepNum == 2){
    			$("#carrier").val("该承运单位编号不存在对应的承运单位！");
    			$("#carrierDiv").show();
    			alert("该承运单位编号不存在对应的承运单位！");
    			return false;
    		}
    		//validate carrierNo end
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
		    	
		    
    		if($step.find(".failmsg").length==0){
    		    /*
	    		if(stepNum ==1){
	    			location.href="#top";
	    		}
	    		*/	
    		   return true;
    		}else{
    		     return false;
    		}
		    /*return $step.find(".failmsg").length==0;*/
		    
        }  
      
		});
</script>
</head>
  <body>
    <form id="from1" target="hiddenFrame"  action="<%=path%>/chemical/saveApply.htm" method="post">
      <!-- 1:存在;0:不存在(默认) -->
      <input type="hidden" id="isCarrierExists" name="isCarrierExists" value="0" />
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
									<span class="stepText">单位信息</span>
							</a></p></li>
							<li><p><a href="#step-3"> <label class="stepNumber">3</label>
									<span class="stepText">承运信息</span>
							</a></p></li>
							<li><p><a href="#step-4"> <label class="stepNumber">4</label>
									<span class="stepText">运输路线信息</span>
							</a></p></li>							
							<li><p><a href="#step-5"> <label class="stepNumber">5</label>
									<span class="stepText">申请人信息</span>
							</a></p></li>
							<li><p><a href="#step-6"> <label class="stepNumber">6</label>
									<span class="stepText">完成</span>
							</a></p></li>
						</ul>
				<div id="step-1" style="width:735px;">
<h4 style="text-align: center;">剧毒化学品公路运输通行证申领</h4>
<h5>一、业务范围</h5>
<p>&nbsp;&nbsp;&nbsp;&nbsp;除个人购买农药、灭鼠药、灭虫药外，通过公路运输剧毒化学品，应当依法申请取得《剧毒化学品公路运输通行证》。未取得上述证件，任何单位和个人不得通过公路运输剧毒化学品。</p>
<h5>二、办理条件</h5>
<p>（1）从事剧毒化学品道路运输的企业，应当具有从事剧毒化学品道路运输的《道路运输经营许可证》。</p>

<p>（2）从事剧毒化学品道路运输的车辆应当符合以下要求：</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;①应当具有从事剧毒化学品道路运输的《道路运输证》；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;②应当安装剧毒化学品道路运输专用标识和安全标示牌。安全标示牌应当标明剧毒化学品品名、种类、罐体容积、载质量、施救方法、运输企业联系电话等。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;③承运车辆应当配备隔离式防毒面具和交通主管部门规定其他防护装备和应急处置器材；</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;④承运车辆应当安装GPS卫星定位系统和行驶记录仪。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;⑤承运车辆无私自加装罐体、小车大罐和其他非法改装行为。</p>
<p>&nbsp;&nbsp;&nbsp;&nbsp;⑥承运车辆轮胎花纹深度应符合《机动车运行安全技术条件》（GB7258）的要求。</p>
<p>（3）剧毒化学品道路运输车辆的驾驶员应当具有从事危险货物运输的驾驶员《从业资格证》。</p>
<p>（4）押运人员必须具有从事危险货物运输的押运员《从业资格证》。</p>
<h5>三、所需资料</h5>
<p>（1）《剧毒化学品公路运输通行证申请表》；</p>

<p>（2）治安管理部门核发的《剧毒化学品购买凭证》、《剧毒化学品准购证》或环境保护部门颁发的危险化学品进口或者出口登记证（原件及复印件）；</p>

<p>（3）运输企业的《道路运输经营许可证》；</p>

<p>（4）运输车辆的《行驶证》、《道路运输证》；</p>
<p>（5）驾驶员身份证、驾驶证、从业资格证；</p>

<p>（6）押运人员身份证、从业资格证；</p>

<p>（7）运输企业对每辆运输车辆制作的运输路线图和运行时间表；</p>

<p>（8）本省籍的运输车辆还需提供《广东省危险化学品道路运输车辆联检本》（原件及复印件）</p>
<h5>四、业务流程</h5>
<p>（一）申请单位网上填写《剧毒化学品公路运输通行证申请表》、购买单位和剧毒化学品购买凭证相关信息，选择运输目的地（路线简称）。</p>

<p>（二）申请单位到勤务管理处办证窗口提交相关纸质资料，接受发证机关对剧毒化学品购买凭证的验证，凭《车辆检验联系单》将运输车辆开到指定地点接受车辆查验。</p>

<p>（三）发证机关通过6合1系统审核通行时间、路线后内部审批。</p>

<p>（四）发证机关制作了《剧毒化学品公路运输通行证》的，主动通知申请单位到办理窗口领取《剧毒化学品公路运输通行证》，申请单位委托经办人领证后签收。</p>

<p>（五）如查询具体办理情况，请点击“信息查询”的“网上办理剧毒化学品公路运输通行证系统”查询办理情况。</p>

<div  class="editor" style="text-align: center;">
 <input type="checkbox" id="checkaccept" class=":accept" /><label>同意</label>
 
 
</div>
				</div>
				<div id="step-2" style="width:735px;height:310px;">
					<div class="editor">
					    <!-- <a href="#top"></a> -->
						<span class="editor-label">
							<LABEL for=carrierNo>承运单位编号：</LABEL>
						</span>
						<input name="carrierNo" class="editor-field :required" id="carrierNo" type="text" /> 						
					</div>
					<div id="carrierDiv" class="editor"  style="display:none;">
					    <span class="editor-label">
					    	<label for=carrier>承运单位名称：</label>
					    </span>
					    <input name="carrier" class="editor-field" style="border:0;color:red" readOnly="readOnly" id="carrier" type="text" />					    
					</div>					
					<div id="purchaserDiv" class="editor" >
						<span class="editor-label">
							<LABEL for=purchaser>购买单位名称：</LABEL>
						</span>
						<input name="purchaser" class="editor-field :required" id="purchaser" type="text" /> 
					</div>					
					<div id="sellerDiv" class="editor" >
						<span class="editor-label">
							<LABEL for=seller>销售单位名称：</LABEL>
						</span>
						<input name="seller" class="editor-field :required" id="seller" type="text" /> 
					</div>
					<div id="proofTypeDiv" class="editor">
						<span class="editor-label">
							<LABEL for=proofType>购买凭证类型：</LABEL>
						</span>
						<select id="proofType" name="proofType" class="required">
				            <option value='1'>购买凭证</option>
				            <option value='2'>准购证</option>
				        </select>
					</div>					
					<div id="proofNoDiv" class="editor" >
						<span class="editor-label">
							<LABEL for=proofNo>购买凭证编号：</LABEL>
						</span>
						<input name="proofNo" class="editor-field :required" id="proofNo" type="text" /> 
					</div>							
				</div>
			<div id="step-3" style="width:735px;">
				 <div class="editor">
							<span class="editor-label">
								<LABEL for=vehicleType>承运车辆种类：</LABEL>
							</span>
							<select id="vehicleType" name="vehicleType" class="required">
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
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=carrierVehicle>承运车辆牌号：</LABEL>
							</span>						
							<input name="carrierVehicle" class="editor-field :required :allCarNum" id="carrierVehicle" type="text"  />														
						</div>
						
					<div class="editor">
						<span class="editor-label">
							<LABEL for=plateLicense1>挂车号牌：</LABEL>
						</span>
						<input name="plateLicense1" class="editor-field :allCarNum" id="plateLicense1" type="text"  />
					</div>
					
                  		<div class="editor">
							<span class="editor-label">
								<LABEL for=mainDirverName>主驾驶人姓名：</LABEL>
							</span>
					 	 	<input name="mainDirverName" class="editor-field :required" id="mainDirverName" type="text" /> 						
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=mainDriverIdNo>主驾驶人身份证号码：</LABEL>
							</span>
							<input name="mainDriverIdNo" class="editor-field :required :idcard" id="mainDriverIdNo" type="text" />
						</div>
						
						 <div class="editor">
							<span class="editor-label">
								<LABEL for=secondDirverName>副驾驶人姓名：</LABEL>
							</span>
					 	 	<input name="secondDirverName" class="editor-field :required" id="secondDirverName" type="text" /> 						
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=secondDirverIdNo>副驾驶人身份证号码：</LABEL>
							</span>
							<input name="secondDirverIdNo" class="editor-field :required :idcard" id="secondDirverIdNo" type="text"    />
						</div>
		               	
               			<div class="editor">
							<span class="editor-label">
								<LABEL for=mainEscortName>主押运人姓名：</LABEL>
							</span>
							<input name="mainEscortName" class="editor-field :required" id="mainEscortName" type="text"  />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=mainEscortIdNo>主押运人身份证号码：</LABEL>
							</span>
							<input name="mainEscortIdNo" class="editor-field :required :idcard" id="mainEscortIdNo" type="text"  />
						</div>
						
						<div class="editor">
							<span class="editor-label">
								<LABEL for=secondeScortName>副押运人姓名：</LABEL>
							</span>
							<input name="secondeScortName" class="editor-field" id="secondeScortName" type="text"  />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=secondeScortIdNo>副押运人身份证号码：</LABEL>
							</span>
							<input name="secondeScortIdNo" class="editor-field :idcard" id="secondeScortIdNo" type="text"   />
						</div>
					
        	</div>
        	<div id="step-4" style="width:735px;">        	           
			        	<div class="editor">
								<span class="editor-label">
									<LABEL for=beginLine>运输路线始发地：</LABEL>
								</span>
							   <input name="beginLine" class="editor-field :required" id="beginLine" type="text" />
			        	</div>
			        	<div class="editor">
								<span class="editor-label">
									<LABEL for=finishLine>运输路线目的地：</LABEL>
								</span>
							   <input name="finishLine" class="editor-field :required" id="finishLine" type="text" />
			        	</div>
			        	
			        	<div class="editor">
							<span class="editor-label">
								<LABEL for=beginTime>运输开始时间：</LABEL>
							</span>
							<input type="text" class="Wdate :required" name="beginTime" id="beginTime" size="25" style="margin-left: 5px;"
							onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});"
							readOnly="readonly"/>
						</div>
						<div class="editor">
							<span class="editor-label">
								<LABEL for=finishTime>运输结束时间：</LABEL>
							</span>
							<input type="text" class="Wdate :required" name="finishTime" id="finishTime" size="25" style="margin-left: 5px;"
							onfocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true});"
							readOnly="readonly"/>
						</div>
			        	
			</div>
        	<div id="step-5" style="width:735px;">
        				<div class="editor">
							<span class="editor-label">
								<LABEL for=applicant>申请人员姓名：</LABEL>
							</span>
							<input name="applicant" class="editor-field :required" id="applicant" type="text"   />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=applicantIdNo>申请人身份证号码：</LABEL>
							</span>
							<input name="applicantIdNo" class="editor-field :required :idcard" id="applicantIdNo" type="text"   />
						</div>
						
						<div class="editor">
							<span class="editor-label">
								<LABEL for=applicantTelNo>申请人联系电话：</LABEL>
							</span>
							<input name="applicantTelNo" class="editor-field :required :tel" id="applicantTelNo" type="text"    />
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
        	</div>
        	<div id="step-6" style="width:735px;height:260px;">
	        	
        	</div>
  		</div>
<!-- End SmartWizard Content -->  		
 		
</td></tr>

</table>
    </form>
   
  </body>
</html>
