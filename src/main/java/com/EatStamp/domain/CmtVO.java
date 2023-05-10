package com.EatStamp.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CmtVO {

	public int cmt_num;
	public String cmt_content;
	public String reg_date;
	public Date reg_date2;
	public String cmt_ip;
	
	public int s_num;
	public int mem_num;
	
	public String mem_nick;
	
	private String s_title;
	private String s_uploadPath;
	private String s_fileLoca;
	private String s_fileName;
}