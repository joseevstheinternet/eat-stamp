package com.EatStampAdmin.mapper;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStampAdmin.domain.MemberVO;

@Mapper("adminMapper")
public interface AdminMapper {
	
	//<0420 최은지> 로그인 체크
	public MemberVO admin_login_check(MemberVO memberVO) throws Exception;

	//0420 최은지 일반 회원 관리자 로그인 체크
	public int member_try_admin(MemberVO memberVO)throws Exception;
	
	public int check_email(MemberVO memberVO)throws Exception;
	
	//0421 이예지 비밀번호 조회
	public MemberVO delete_member_check(MemberVO memberVO)throws Exception;
	
	//0421 이예지 비밀번호 재설정
	public int reset_pw(MemberVO memberVO)throws Exception;
	
}