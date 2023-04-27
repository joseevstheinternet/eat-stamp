package com.EatStampAdmin.utils;

import lombok.ToString;

@ToString
public class ResultUtil {
	
	private String state = "FAIL";    
	private String msg    = "";
	private Object data = "";
	
	public String getState() {
	    return state;
	}
	    
	public void setState(String state) {
	    this.state = state;
	}    
	
	public String getMsg() {
	    return msg;
	}
	
	public void setMsg(String msg) {
	    this.msg = msg;
	}
	
	public Object getData() {
	    return data;
	}
	
	public void setData(Object data) {
	    this.data = data;
	}    

}
