package com.EatStamp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */

@Getter
@Setter
@ToString
public class OwnerInfoVO {
	
	private int mem_num; //회원 고유 번호
	private String mem_email; //회원 이메일
	private String mem_pw; //회원 비밀번호
	private  String mem_pwCheck; //회원 비밀번호 체크
	private String mem_nick; //회원 닉네임(상호명)
	private String r_name;//상호명
	int r_num; //가게 고유 번호
	private String r_add; //가게 주소
	private String r_food; //주된 음식
	private String r_tel; //가게 번호
	private String r_fileName; //파일명
	private String r_fileRoot; //파일경로
	private String r_detail; //상세정보
	private String r_menu; //가게 메뉴
	private String r_open; //개점시간
	private String r_close; //폐점시간
	private int r_rate; //가게 평가점수
	private String r_category; //업종
	private int r_block; //가게 공개 여부	


}
