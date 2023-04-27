package com.EatStampAdmin.service;

import com.EatStampAdmin.domain.MemberVO;

public interface AdminService {
	
	//0420 최은지 관리자 로그인
	public MemberVO adminLoginCheck(MemberVO vo) throws Exception;
	
	//0420 최은지 일반 회원 관리자 로그인 시도 검사
	public int memberTryAdmin(MemberVO vo)throws Exception;

	//0420 최은지 이메일 존재 여부 검사> 병합 시 삭제
	public int email_check(MemberVO vo)throws Exception;
	
	//0421 이예지 비밀번호 조회
	public MemberVO delete_member_check(MemberVO vo)throws Exception;

	//0421 이예지 비밀번호 재설정
	public int reset_pw(MemberVO vo)throws Exception;
}
