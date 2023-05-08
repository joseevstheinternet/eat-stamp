package com.EatStamp.domain;

import java.util.Date;
import java.util.List;

import org.springmodules.validation.bean.conf.loader.annotation.handler.NotEmpty;

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
public class StampVO {
	public StampVO(String s_title, String s_content, String s_uploadPath, String s_fileLoca, String s_fileName,
			String s_fileRealName, Date reg_date, int s_rate, String r_name, int mem_num, String s_tag) {
	}
	

	private int s_num;
	@NotEmpty
	private String s_title; //제목
	@NotEmpty
	private String s_content; //내용
	
	private String s_uploadPath; //저장할 폴더 경로
	private String s_fileLoca; //폴더명
	private String s_fileName; //변경해서 저장되는 파일명
	private String s_fileRealName; //실제 파일명
	
	private Date reg_date; //등록일
	
	private int s_rate; //가게 평가
	private String r_name; //식당 상호명
	
	private int mem_num; //회원번호
	
	private String s_tag;
	
	private String mem_nick; //회원 닉네임
	private String mem_email; //회원 이메일
	private String mem_profileCode; //회원 프로필코드
	
	private int r_num; //식당번호
	
	private int s_view_cnt; //조회수
	private int s_publicCode; //공개여부
}
