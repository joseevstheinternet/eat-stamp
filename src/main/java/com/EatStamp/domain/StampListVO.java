package com.EatStamp.domain;

import java.util.Date;

import org.springmodules.validation.bean.conf.loader.annotation.handler.NotEmpty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class StampListVO {
	private int s_num;
	@NotEmpty
	private String s_title; //제목
	@NotEmpty
	private String s_content; //내용
	private String s_fileName; //업로드파일명
	private String s_fileRoot; //업로드파일경로
	private String s_fileSize; //업로드파일크기
	private Date reg_date; //등록일
	
	private int s_rate; //가게 평가
	private int r_num; //식당번호
	
	private int mem_num; //회원번호
}
