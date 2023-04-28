package com.EatStamp.domain;

import java.sql.Time;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RestVO {
	private int r_num; //가게 고유번호
	private String r_name; //상호명
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
	
	private int r_like_num; //가게 좋아요 번호
	private int mem_num; //회원번호
}
