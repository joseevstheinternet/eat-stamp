package com.EatStamp.domain;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//<0404 최은지 최초 생성>
//검색용 vo

@Getter
@Setter
@ToString
public class SearchVO extends CommonVO {
	
	private int mem_num; //회원 고유번호
	private int s_num; //게시글 고유번호
	private String s_title; //게시글 제목
	private String s_FileName; //게시글 이미지
	private String s_content; //게시글 내용
	private Date reg_date; //등록일
	private String search_keyword; //검색 키워드
	private String s_fileLoca; //파일 폴더 이름
	
	private int r_num; //식당 고유번호
	private String r_name; //식당 이름
	private String r_add; //식당 주소
	private String r_food; //식당 업태명
	private String r_tel; //식당 전화번호
	private String r_fileName;// 식당 게시 사진
	private String r_detail; //식당 세부정보
	private String r_menu; //식당 메뉴
	private String r_open; //식당 개점 시간
	private String r_close; //식당 폐점 시간
	private String r_category; //식당 카테고리 ex. 한식, 분식, 중식.... 
	private int r_block; //가게 공개 여부
	
	private String tag_content;
	private int tag_num;
	
	private String field; //0424 최은지 검색 옵션 
	
	 String result; //페이징용 결과값
	 
	 List<String> tag_list = new ArrayList<String>();

}
