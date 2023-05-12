package com.EatStamp.service;

import com.EatStamp.domain.MemberVO;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
public interface OwnerService {

	//0512 최은지 가게 사장 로그인
	public MemberVO selectOwnerInfoLoginCheck(MemberVO vo) throws Exception;
	
}
