<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
   
      		$("#platenum").change(function(){
		   	if(!(/^粤A/.test($.trim($("#platenum").val())))){
				$("#platenum").val('粤A');
		    }
	    });
   
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
  		//		    	alert("stepIdx:" + stepIdx + ",stepNum:" + stepNum + ",nextStepNum:" + nextStepNum);
  				    	return validate(stepNum);			    	
  				    },
  				  onFinish:function(){
  					  if (validate(4)){
  					//    alert("submit...");
  						var action="<%=path%>/changeCarContactWay/saveCarInfo.htm";
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
	 <form target="hiddenFrame"  action="<%=path%>/changeCarContactWay/saveCarInfo.htm" method="post" enctype="multipart/form-data">
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
					变更机动车联系人方式业务须知
				</h4>
				<h5>
					一、业务范围（限于机动车号牌核发地属于广州辖区的，只办理邮寄地址.邮政编码.固定电话.电子信箱.移动电话的变化备案)
				</h5>
				<p>
					机动车所有人联系方式变更的，机动车所有人可向网上车管所申请变更机动车联系人方式。
				</p>
				<h5>
					二、所需资料
				</h5>
				<p>
					<strong>（一）</strong>机动车所有人的有效身份证明原件及复印件一份。在暂住地居住的内地居民还需提供公安机关核发的有效居住证明复印件一份.单位车辆需单位有效组织机构代码证复印件加盖单位鲜章.加盖单位鲜章的委托书原件.经办人有效身份证明复印件.
				</p>

				<p>
					<strong>（二）</strong>《机动车行驶证》原件及复印件。
				</p>

               <h5>
                                              三、业务流程
               </h5>
               <p>
                  <strong>（一）</strong>申请人填写《机动车变更登记/备案申请表》。
                  </p>
                  
                                 <p>
                  <strong>（二）</strong>如实填写申请人姓名、身份证号码、联系电话、交.收件方式以及收件地址等相关信息，如有填写不实的，一切法律责任自负。
                  </p>
                  
                                 <p>
                  <strong>（三）</strong>输入验证码，点击提交按钮，得到流水号。
                  </p>
                  
                                 <p>
                  <strong>（四）</strong>收费标准：根据粤发改价格（2004）2831号，补（换）发机动车驾驶证10元，根据粤价函（2004）332号，补（换）机动车行驶证15元。
                  </p>
                  
                  
                  
                                 <p>
                  <strong>（五）</strong>申请成功后，请于2日内准备以上所需资料（身份证明采用A4纸正反两面复印）。
                  </p>
                  
                                 <p>
                  <strong>（六）</strong>如查询具体办理情况，请点击“信息查询”的“网上申请车管业务情况查询”栏。
                  </p>
                  
                                 <p>
                  <strong>（七）</strong>
                  业务核定后，车管所会通过邮政部门把业务受理单送到你预留的地址，邮政工作人员会收取办理所需的资料和费用，请积极配合。
                  </p>

                  <p style="color: red">
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
				<select name="biztype" id="biztype"  class="editor-field :required" style="width:220px">
					  <option value="1001" selected="selected">变更机动车所有人联系方式</option>
				</select>				
			 </div>
			
			 <div class="editor">
							<span class="editor-label">
								<LABEL for=ownername>所有人姓名：</LABEL>
							</span>
							<input name="ownername" class="editor-field :required" id="ownername" type="text" />
						</div>
						
					    <div class="editor">
							<span class="editor-label">
								<LABEL for=userCardType>身份证明名称：</LABEL>
							</span>
							<!-- <input name="idType" class="editor-field :required :integer" id="idType" type="text" /> -->
							<select id="idtype" name="idtype" class="editor-field :required" style="width:160px">
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
							<input name="idno" class="editor-field :required" id="idno" type="text" />
						</div>
						
						<div class="editor">
						  <span class="editor-label">
						     <label for=platenumtype>号牌种类：</label>
						   </span>  
											<select name="platenumtype" id="platenumtype" class="select">
												<option value="1" >
													大型汽车（黄牌）
												</option>
												<option value="2" selected="selected">
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
						    <label for=platenum>号牌号码：</label>
						  </span>
						  <input name="platenum" class="editor-field :required :cardNum" id="platenum" type="text" value="粤A" />
						</div>
						

					<div class="editor">
						<span class="editor-label">
							<LABEL for=vehicleidnum>车架号(后六位)：</LABEL>
						</span>
						<input name="vehicleidnum" class="editor-field :required :sixNum" id="vehicleidnum" type="text" />
					</div>
					
					<div class="editor">
						<span class="editor-label">
							<LABEL for=enginenum>发动机号(后四位)：</LABEL>
						</span>
						<input name="enginenum" class="editor-field :required :fourNum" id="enginenum" type="text" />
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
						<input name="zip" class="editor-field :zipcode" id="zip" type="text" />
					</div>
	
					<div class="editor">
						<span class="editor-label">
							<LABEL for=validateCode>请输入验证码：</LABEL>
						</span>
						<input class="editor-field :required" type="text" name="validateCode" id="validateCode"  />
					</div>	
					 <p style="padding-left: 138px"><img id="validate_img" src="<%=request.getContextPath() %>/jsp/validate/makeCertPic.jsp" style="position:relative;top:5px;left:10px;" width="75" height="25"/>&nbsp;&nbsp;&nbsp;<a href="javascript:refreshValidate()">
						<font color="blue" style="font-size:12px">刷新验证码</font></a></p>				
			</div>

			<div id="step-4">
        		<div class="form_success">
					<p><strong>您好！您已成功提交变更机动车所有人联系方式业务申请！请记录申请流水号： </strong></p>
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