<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<head>
<script type="text/javascript" src="/gztpbwebsite/js/jquery.js"></script> 
<script type="text/javascript" src="/gztpbwebsite/js/scrollable.js"></script> 
<script type="text/javascript">

var iframe2_type ;
var iframe2_drivername ;
var iframe2_usercardType;
var iframe2_IDCardNum ;
var iframe2_driverlicense ;
		           
var iframe3_flag2 ;

var iframe3_phoneName;
var iframe3_mobileNum ;
var iframe3_email ;
var iframe3_postNum ;
var iframe3_address ;
var iframe3_validate ;

var judge_result = false;

$(function(){ 
    $("#wizard").scrollable({ 
        onSeek: function(event,i){ //切换tab样式 
            $("#status li").removeClass("active").eq(i).addClass("active"); 
        }, 
        onBeforeSeek:function(event,i){ //验证表单 
           if(i==1){
	           var iframe1_flag1 = document.getElementById('iframe1').contentWindow.checkGreet();	           
	           if(!iframe1_flag1){
	             alert("请同意须知才可执行下一步");
	             return false;
	           }
           }
           
           if(i==2){
                    iframe2_type =  document.getElementById('iframe2').contentWindow.getType();
		            iframe2_drivername = document.getElementById('iframe2').contentWindow.getDriverName();
		            iframe2_usercardType =  document.getElementById('iframe2').contentWindow.getUserCardType();
		            iframe2_IDCardNum =  document.getElementById('iframe2').contentWindow.getIDCardNum();
		            iframe2_driverlicense =  document.getElementById('iframe2').contentWindow.getDriverlicense();
		            iframe2_docNum = document.getElementById('iframe2').contentWindow.getDocNum();
//		           alert(iframe2_type+","+ iframe2_drivername+","+ iframe2_usercardType+","+
	//	               iframe2_IDCardNum+","+iframe2_driverlicense);
		                      
		           if((iframe2_type=="" || iframe2_drivername==""  || iframe2_usercardType=="" 
		              || iframe2_IDCardNum=="" || iframe2_driverlicense=="")){
		             alert("联系基本信息不能为空");
                     return false;     
		           }
           }
           
           
           
           if(i==3){
              iframe3_flag2 = document.getElementById('iframe3').contentWindow.checkPromise();
              iframe3_phoneName = document.getElementById('iframe3').contentWindow.getPhoneName();
              iframe3_mobileNum = document.getElementById('iframe3').contentWindow.getMobileNum();
              iframe3_email = document.getElementById('iframe3').contentWindow.getEmail();
              iframe3_postNum = document.getElementById('iframe3').contentWindow.getPostNum();
              iframe3_address = document.getElementById('iframe3').contentWindow.getAddress();
              iframe3_validate = document.getElementById('iframe3').contentWindow.getValidate();
           
              
              if(iframe3_flag2){
                if(iframe3_phoneName == ""){
                  alert("固定电话不能为空");
                  return false;
                }
                
                if(iframe3_address == ""){
                  alert("联系地址不能为空");
                  return false;
                }
                
                if(iframe3_validate == ""){
                  alert("请填写验证码");
                  return false;
                }
  
               var urlData = "driverName=" + iframe2_drivername + "&userCardType=" +iframe2_usercardType
                 + "&IDCardNum=" + iframe2_IDCardNum + "&driverLicense=" + iframe2_driverlicense + "&docNum=" + iframe2_docNum
                 + "&phoneName=" + iframe3_phoneName + "&mobileNum=" + iframe3_mobileNum
                 + "&email=" + iframe3_email + "&postNum=" + iframe3_postNum
                 + "&address=" + iframe3_address + "&validate=" + iframe3_validate;
                 alert(urlData);
                 
                     $.ajax({  
				         type : 'POST',  
				         contentType : 'application/json',  
				         url : "<%=path%>/changeDriverContactWay/saveTest.htm?" + urlData ,  
				         dataType : 'json', 
				         success : function(data) {  
				           alert(data);        
				         }  
				         ,   
			          error : function(data) {   
			            alert("error")   
			          }        
			         }); 
                
              }else{
                alert("勾选承诺后，才可以提交");
                return false;
              }
              
              

         
         
           }       
      }      
    });    
}); 

/////////////////////////


</script>
<style>
#wizard {border:5px solid #789;font-size:12px;height:450px;margin:20px auto; 
width:800px;overflow:hidden;position:relative;} 
#wizard .items{width:20000px; clear:both; position:absolute;height:100%} 
#wizard .right{float:right;} 
#wizard #status{height:35px;background:#123;padding-left:25px !important;} 
#status li{float:left;color:#fff;padding:10px 30px;} 
#status li.active{background-color:#369;font-weight:normal;} 
.input{width:240px; height:18px; margin:10px auto; line-height:20px;  
border:1px solid #d3d3d3; padding:2px} 
.page{padding:20px 30px;width:750px;float:left;height:80%;} 
.page h3{height:42px; font-size:16px; border-bottom:1px dotted #ccc; margin-bottom:20px; 
 padding-bottom:5px} 
.page h3 em{font-size:12px; font-weight:500; font-style:normal} 
.page p{line-height:24px;} 
.page p label{font-size:14px; display:block;} 
.btn_nav{height:36px; line-height:36px; margin:20px auto;} 
.prev,.next{width:100px; height:32px; line-height:32px; background:url(btn_bg.gif)  
repeat-x bottom; border:1px solid #d3d3d3; cursor:pointer} 
.iframe_class{width: 100%;height: 80%;}
</style>
</head>

<body>
<form action="#" method="post"> 
  <div id="wizard"> 
    <ul id="status"> 
        <li class="active"><strong>1.</strong>剧毒化学品运输许可证业务须知</li> 
        <li><strong>2.</strong>填写联系基本信息</li>
        <li><strong>3.</strong>填写联系变更信息</li> 
        <li><strong>4.</strong>完成</li> 
    </ul> 
 
    <div class="items"> 
        <div class="page"> 
           <div class="iframe_class">
              <iframe id="iframe1" src="/gztpbwebsite/chemicalController/fillFormNote.htm" width="100%" height="100%"></iframe>
           </div>
           <div class="btn_nav"> 
              <input id="next01" type="button" class="next right"   value="下一步»" /> 
           </div> 
        </div> 
        <div class="page"> 
        
           <div class="iframe_class">
              <iframe id="iframe2" src="/gztpbwebsite/chemicalController/bgjsrlxfs.htm" width="100%" height="100%"></iframe>
           </div>
           <div class="btn_nav">         
           <input type="button" class="prev" style="float:left" value="«上一步" /> 
               <input type="button" id="next2" class="next right" value="下一步»" /> 
           </div> 
        </div> 
        <div class="page"> 
           <div class="iframe_class">
              <iframe id="iframe3" src="/gztpbwebsite/changeDriverContactWay/bgjsrlxfs2.htm" width="100%" height="100%"></iframe>
           </div>
           <div class="btn_nav"> 
               <input type="button" class="prev" style="float:left" value="«上一步" /> 
               <input type="button" class="next right" id="sub" value="提交»" /> 
           </div> 
        </div> 
        
      <div class="page"> 
        
           <div class="btn_nav">         
                           操作成功！
           </div> 
        </div> 
    </div> 
  </div> 
</form> 

</body>
</html>

