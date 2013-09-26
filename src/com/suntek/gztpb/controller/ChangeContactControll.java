package com.suntek.gztpb.controller;


import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;

import com.suntek.gztpb.model.DriverChangeModel;
import com.suntek.gztpb.service.DriverChangeService;
import com.suntek.gztpb.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.suntek.gztpb.core.BaseContoller;
import com.suntek.gztpb.core.ServiceException;


@Controller
@RequestMapping(value="changeDriverContactWay")

public class ChangeContactControll extends BaseContoller {
	@Autowired
	private DriverChangeService driverChangeService ;
	
	//http://localhost:8080/gztpbwebsite/changeDriverContactWay/apply.htm
	@RequestMapping(value="apply.htm",method=RequestMethod.GET)
	public String apply(){
		return "/DriverContactLicenseApply";
	}	
	
	@RequestMapping(value="success.htm",method=RequestMethod.POST)
    public  @ResponseBody  String saveTest(DriverChangeModel driverInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		    response.setContentType("text/html");  
	        response.setCharacterEncoding("utf-8");  
	        PrintWriter out = response.getWriter();
				String applyNum = IdGenerator.getInstance().getBizCode("ITMS_SEQ",5);
				
				driverInfo.setApplynum(applyNum);
				System.out.println("applyNum=" + applyNum);
				
				driverInfo.setBiztype("3001");
		        driverInfo.setCreatedtime(new Date());
		        driverInfo.setCreator("admin");
		        driverInfo.setSource(0);
		        driverInfo.setSubmittime(new Date());
		        driverInfo.setFinish(0);
		        
		          
			  try{
		        driverChangeService.signUp(driverInfo);
		        out.write("<script>parent.saveCallback(1,'"+ applyNum+"')</script>"); 
			  }catch(Exception e){
				e.printStackTrace();
				out.write("<script>parent.saveCallback(0)</script>");
			  }
				return null;


    }
	
	@RequestMapping(value="validateCode.htm",method=RequestMethod.POST)
    public @ResponseBody String validateCode(HttpServletRequest request) throws Exception{
		String certCode = request.getSession().getAttribute("certCode").toString();
		String code = request.getParameter("code");
		if(code.equalsIgnoreCase(certCode)){
			return "true";
		}
		return "false";
	}

}
