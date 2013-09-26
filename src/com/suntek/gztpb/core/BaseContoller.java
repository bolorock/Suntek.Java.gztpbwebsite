package com.suntek.gztpb.core;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * action contoller的基类
 * @author hgq
 * @date  2012-08-13
 */
public class BaseContoller {
	public static final String COMMON_FAIL_PAGE = "fail";
	public static final String COMMON_FAIL_ALERT_KEY = "fail_key";
	public static final String USER_SESSION_KEY = "_user_session_key_";
	
	@RequestMapping("/{jsp}.htm")
	public String jsp(@PathVariable(value="jsp") String jsp){
		System.out.println(jsp);
		return jsp;
	}
}
