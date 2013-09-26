package com.suntek.gztpb.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.extra.spath.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suntek.gztpb.core.BaseContoller;
import com.suntek.gztpb.core.ServiceException;
import com.suntek.gztpb.model.ChemicalModel;
import com.suntek.gztpb.service.ChemicalService;
import com.suntek.gztpb.util.CommonUtil;
import com.suntek.gztpb.util.IdGenerator;

/** 
 * <p>Title: ChemicalController.java</p> 
 * <p>Description: 剧毒化学品业务Controller</p> 
 * <p>Copyright: Copyright (c) 2012</p> 
 * <p>Company: Suntek</p> 
 * @author lam 
 * @date 2012-8-14 
 * @version 1.0 
 */
@Controller
@RequestMapping(value="chemical")
public class ChemicalController extends BaseContoller {
	
	@Autowired
	private ChemicalService chemicalService;		
	
	//转到剧毒化学品申请页面
	@RequestMapping(value="apply.htm",method=RequestMethod.GET)
	public String toChemicalLicenseApply(){
		return "/ChemicalPassportApply";
	}
	
	@RequestMapping(value="isPurchaserExists.htm",method=RequestMethod.POST)
	public @ResponseBody String isPurchaserExists(HttpServletRequest request,HttpServletResponse response){
		request.getParameter("");
		return "0";
	}
	
	@RequestMapping(value="isVehicleExists.htm",method=RequestMethod.POST)
	public @ResponseBody String isVehicleExists(HttpServletRequest request,HttpServletResponse response){
		request.getParameter("");
		return "0";
	}
	
	@RequestMapping(value="isDriverExists.htm",method=RequestMethod.POST)
	public @ResponseBody String isDriverExists(HttpServletRequest request,HttpServletResponse response){
		String flag = request.getParameter("flag");//1:主驾驶人;0:副驾驶人
		String name = "",idNo = "";
		if("1".equals(flag)){
			name = request.getParameter("MAINDIRVERNAME");
			idNo = request.getParameter("MAINDRIVERIDNO");
		}else{
			name = request.getParameter("SECONDDIRVERNAME");
			idNo = request.getParameter("SECONDDIRVERIDNO");
		}
		chemicalService.isDriverExists(name ,idNo);
		return "0";
	}
	
	@RequestMapping(value="isEscortExists.htm",method=RequestMethod.POST)
	public @ResponseBody String isEscortExists(HttpServletRequest request,HttpServletResponse response){
		String flag = request.getParameter("flag");//1:主押运人;0:副押运人
		request.getParameter("");
		request.getParameter("");
		return "0";
	}
	
	@RequestMapping(value="isCarrierExists.htm",method=RequestMethod.POST)
    public @ResponseBody   String isCarrierExists(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
		response.setCharacterEncoding("utf-8");
		String carrierNo = "";
		try {
			carrierNo = URLDecoder.decode(request.getParameter("carrierNo"),"utf-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("[gztpbwebsite]剧毒化学品运输许可证申领填写的承运单位编号解码出错!"+e.getMessage());
		}
		if(carrierNo == "null" || carrierNo == ""){
			return "0";
		}else{
			String carrier = chemicalService.isCarrierExists(carrierNo);
			if(carrierNo.equals("0"))
				return "0";
			else
				return java.net.URLEncoder.encode(carrier,   "utf-8");  
		}
	}
	
	//剧毒化学品申请页面提交到此方法
	@RequestMapping(value="saveApply.htm",method=RequestMethod.POST)
    public @ResponseBody   String saveApply(ChemicalModel chemcial ,HttpServletRequest request,HttpServletResponse response) throws ServiceException, IOException  {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		Timestamp now = null;
		PrintWriter out = response.getWriter();
		try{
			
			now = new Timestamp(System.currentTimeMillis());
			String applyNum = IdGenerator.getInstance().getBizCode("ITMS_SEQ",5);		
			chemcial.setApplyNum(applyNum);
			chemcial.setBizType("0401"); //业务类型0401  剧毒化学品运输许可证申请
			chemcial.setApplyTime(now);
			String line = request.getParameter("beginLine")+"至"+request.getParameter("finishLine");
			chemcial.setLine(line);		
			Timestamp goBeginTime = CommonUtil.parseToTimestamp("yyyy-MM-dd HH:mm:ss", request.getParameter("beginTime").trim());
			Timestamp goFinishTime = CommonUtil.parseToTimestamp("yyyy-MM-dd HH:mm:ss", request.getParameter("finishTime").trim());
			chemcial.setGoBeginTime(goBeginTime);
			chemcial.setGoFinishTime(goFinishTime);

			chemcial.setSource(0);//申请来源：0   gztpb网站;9   其他; 
			chemcial.setCreator("admin");
			chemcial.setCreatedTime(now);
			chemcial.setSubmiTime(now);
			chemcial.setFinish(0);
			chemicalService.signUp(chemcial);
			out.write("<script>parent.saveCallback('1','"+ applyNum+"');</script>");			
		} catch (Exception e1) {			
			System.out.println("[gztpbwebsite]ChemicalController.saveApply,剧毒化学品公路运输许可证申领出错！"+e1.getMessage());
			out.write("<script>parent.saveCallback('0');</script>");
			
		}
        
		return null;
	}

}

