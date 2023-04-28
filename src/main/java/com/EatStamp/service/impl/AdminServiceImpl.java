package com.EatStamp.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.mapper.AdminMapper;
import com.EatStamp.service.AdminService;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name = "adminMapper")
	private AdminMapper mapper;

	//0420최은지 관리자 로그인
	@Override
	public MemberVO adminLoginCheck(MemberVO vo) throws Exception {

		return mapper.admin_login_check(vo);
	}

	//0420 최은지 일반 회원 관리자 로그인 시도 검사
	@Override
	public int memberTryAdmin(MemberVO vo) throws Exception {
		
		return mapper.member_try_admin(vo);
	}

	//0420 최은지 이메일 존재 여부 검사> 병합 시 삭제
	@Override
	public int email_check(MemberVO vo) throws Exception {

		return mapper.check_email(vo);
	}

	//0421 이예지 비밀번호 변경용 회원 비밀번호 조회
	@Override
	public MemberVO delete_member_check(MemberVO vo) throws Exception {
		return mapper.delete_member_check(vo);
	}

	@Override
	public int reset_pw(MemberVO vo) throws Exception {
		return mapper.reset_pw(vo);
	}

}
