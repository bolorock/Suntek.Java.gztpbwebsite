package com.suntek.gztpb.controller;


import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.suntek.gztpb.core.BaseContoller;
import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.model.VehicleLicenseModel;
import com.suntek.gztpb.service.VehicleLicenseService;
import com.suntek.gztpb.util.CommonUtil;
import com.suntek.gztpb.util.IdGenerator;

import org.apache.log4j.Logger;

@Controller
@RequestMapping(value="vehiclelicense")
public class VehicleLicenseController extends BaseContoller implements ServletContextAware {
	@Autowired
	private VehicleLicenseService vehicleLicenseService;
	private static Logger logger = Logger.getLogger(VehicleLicenseController.class);
	
	private ServletContext servletContext;
	
	public void setServletContext(ServletContext servletContext) {
		  this.servletContext = servletContext;
	}
	
	//http://localhost:8080/gztpbwebsite/vehiclelicense/apply.htm
	@RequestMapping(value="apply.htm",method=RequestMethod.GET)
	public String apply(){
		return "/VehicleLicenseApply";
	}
	
	@RequestMapping(value="saveApply.htm",method=RequestMethod.POST)
    public String saveApply(VehicleLicenseModel apply,HttpServletRequest request,HttpServletResponse response) throws ServiceException, IOException{
	    response.setContentType("text/html");  
        response.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();
		try {
			   String picPath=this.servletContext.getRealPath("/picUpload/")+"\\";
			   String applyNum=IdGenerator.getInstance().getBizCode("ITMS_SEQ",5);
			   apply.setApplyNum(applyNum);
			   
			   byte[] fileStream=CommonUtil.getFileByte(picPath+apply.getVehicleImage());
			   vehicleLicenseService.saveApply(apply,fileStream);
			   out.write("<script>parent.saveCallback(1,'"+ applyNum+"')</script>"); 
			} catch (Exception e) {
				logger.error(e.getMessage());
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
	
	
	@RequestMapping(value="upload.htm", method = RequestMethod.POST) //将文件上传请求映射到该方法
	public String  handleFormUpload(HttpServletRequest request,HttpServletResponse response) throws IOException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        String inputName=request.getParameter("name");  
        CommonsMultipartFile mFile = (CommonsMultipartFile) multipartRequest.getFile(inputName);  
        
		if (!mFile.isEmpty()) {
			String path = this.servletContext.getRealPath("/picUpload/");
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String fileName=format.format(new Date())+"_"+mFile.getOriginalFilename();
			File fold=new File(path);
            if (!fold.exists()){
            	fold.mkdir();
            }
			path=path+"\\"+ fileName; // 获取本地存储路径
			
			File file = new File(path); // 新建一个文件
			
	        response.setContentType("text/html");  
	        response.setCharacterEncoding("utf-8");  
	        PrintWriter out = response.getWriter();

			try { 
				mFile.getFileItem().write(file); // 将上传的文件写入新建的文件中
		        out.write("<script>parent.callback(1,'"+fileName+"','"+inputName+"')</script>"); 
			} catch (Exception e) {
				logger.error(e.getMessage());
			    out.write("<script>parent.callback(0)</script>"); 
			}
		} 
	        return null;  
	}
	
	
}
