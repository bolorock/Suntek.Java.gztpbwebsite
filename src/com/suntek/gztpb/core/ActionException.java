package com.suntek.gztpb.core;

/**
 * controller ActionException
 * @author hgq
 * @date  2012-08-13
 */
public class ActionException extends Exception implements MessageAlertable,Logable{
	private static final long serialVersionUID = 1L;
   
	public ActionException(String msg,Throwable e){
		super(msg, e);
	}
	public ActionException(String msg){
		super(msg);
	}
}
