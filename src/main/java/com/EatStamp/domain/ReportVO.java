package com.EatStamp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//0428 최은지 최초 생성

@ToString
@Setter
@Getter
public class ReportVO {

	private int report_num; //신고번호
	private int mem_num; //신고한 회원
	private int mem_num2; //신고당한 회원
	private String report_why; //신고 사유
	private String report_ynCode; //신고 상태 (y> 신고 승인 / n> 신고 반려 / w> 처리 대기 상태)
	private int s_num; //신고와 관련된 글 번호 
	private int cmt_num; //신고와 관련된 댓글 번호
	private String report_return; //신고 반려 사유
	
	private String mem_nick; //신고자 닉네임
	private String mem_nick2; //피신고자 닉네임
	private String mem_email;//신고자 이메일
	private String mem_email2; //피신고자 이메일
	
	//db조회용
	private String mem_nick1; //피신고자 닉네임
	private String mem_email1; //피신고자 이메일
	private int mem_num1; //피신고자 이메일
	//검색용
	private String field;
	private String search_keyword;
	
	//<0510 이예지>
	private String reporter_nick; //신고자 닉네임
	private String reporter_email; //피신고자 이메일
	private String reported_nick; //피신고자 닉네임
	private String reported_email; //피신고자 이메일
	private String s_title; //신고 글 제목
	private String s_content; //신고 글 내용
	private String cmt_content; //신고 댓글 내용
}
