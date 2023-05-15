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
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 받아오기
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectOwnerPW(MemberVO memberVO) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 변경
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public int updateOwnerPW(MemberVO memberVO) throws Exception;
}
