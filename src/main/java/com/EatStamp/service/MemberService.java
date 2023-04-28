package com.EatStamp.service;

import java.util.HashMap;

import com.EatStamp.domain.MemberVO;

public interface MemberService {

	//0324 최은지 로그인 체크
	public MemberVO loginCheck(MemberVO vo) throws Exception;
	
	//<0327 최은지> 이메일 인증용 랜덤번호 저장
	public  int update_mail_key(MemberVO vo) throws Exception;
	 
	//<0327 최은지> 이메일 인증 후 권한 컬럼값 변경
	 public  int update_mail_auth(MemberVO vo) throws Exception;
	 
	//<0327 최은지> 이메일 인증여부 확인
	 public int email_auth_fail(String email) throws Exception;
	 
	//<0327 최은지> 회원가입용 이메일 전송
	 public  void send_join_certification_mail(MemberVO vo) throws Exception;

	//<0327 최은지> 회원가입 진행
	 public int insertMember(MemberVO vo) throws Exception;
	
	//<0328 최은지> 카카오로그인용 토큰 발급
	public String getAccessToken(String authorize_code);
	
	//<0328 최은지> //카카오 로그인 데이터 받아오기
	public MemberVO get_user_info(String access_token);
	
	//<0330 최은지> //카카오 로그아웃
	public void kakaoLogout(String access_Token);
	
	//<0330 최은지> //이메일 중복 체크
	public int emailDuplCheck(String mem_email);
	
	//<0330 최은지> //비밀번호 찾기 시 이메일 존재 여부 조회 
	public int find_pwEmail(String mem_email)throws Exception; 
	
	//<0403 최은지> // 카카오 회원 일반 로그인 시도 조회
	public int login_kakaoCheck(String mem_email);
	
	//<0403 최은지> //비밀번호 찾기 시 이메일 인증번호 발송
	public int auth_find_pwd_mail(String mem_email)throws Exception;
	
	//<0403 최은지> //비밀번호 찾기 시 인증번호 비교
	public String comparison_code(String mem_email);
	
	//<0404 최은지> //비밀번호 찾기 시 재설정
	public int reset_pw(MemberVO vo);
	
	//<0410 최은지> //회원 탈퇴
	public int delete_member (MemberVO vo);
	
	//<0410 최은지> //회원 탈퇴용 비밀번호 조회
	public MemberVO delete_member_check (MemberVO vo);
	
	//<0412 이예지> 회원 정보 조회
	public MemberVO selectMember(Integer mem_num);
	
	//<0428 최은지> 관리자 조회
	public int selectAdminOkay(String mem_email);
}