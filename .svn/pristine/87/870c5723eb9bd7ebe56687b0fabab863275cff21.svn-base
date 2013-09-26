package com.suntek.gztpb.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suntek.gztpb.core.BaseContoller;
import com.suntek.gztpb.dao.CarChangeDao;
import com.suntek.gztpb.model.CarChangeModel;
import com.suntek.gztpb.model.DriverChangeModel;
import com.suntek.gztpb.service.CarChangeService;
import com.suntek.gztpb.util.IdGenerator;

@Controller
@RequestMapping(value="changeCarContactWay")
public class ChangeCarControll extends BaseContoller{
	@Autowired
	private CarChangeService carChangeService ;
	
	//http://localhost:8080/gztpbwebsite/changeCarContactWay/apply.htm
	@RequestMapping(value="apply.htm",method=RequestMethod.GET)
	public String apply(){
		return "/CarContactLicenseApply";
	}	
	
	@RequestMapping(value="saveCarInfo.htm",method=RequestMethod.POST)
    public @ResponseBody   String saveTest(CarChangeModel carInfo,HttpServletRequest request,HttpServletResponse response) throws Exception{
	    response.setContentType("text/html");  
        response.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();
        
        String applyNum = IdGenerator.getInstance().getBizCode("ITMS_SEQ",5);
		carInfo.setApplynum(applyNum); 

		carInfo.setCreatedtime(new Date());
		carInfo.setFirstregdate(new Date());
		carInfo.setFinish(0);
		carInfo.setSource(0);
		carInfo.setSubmittime(new Date());
		
		carInfo.setCreator(request.getParameter("ownername"));
       
		try{
		  carChangeService.signUp(carInfo);
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
