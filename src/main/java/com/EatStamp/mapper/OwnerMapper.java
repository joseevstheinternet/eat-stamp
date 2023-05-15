package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.SearchVO;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Mapper("ownerMapper")
public interface OwnerMapper {

	public MemberVO selectLoginOwnerInforCheck(MemberVO memberVO) throws Exception;
	
	//0515 이예지 가게 사장 비밀번호 받아오기
	public MemberVO selectOwnerPW(MemberVO memberVO) throws Exception;
	
	//0515 이예지 가게 사장 비밀번호 변경
	public int updateOwnerPW(MemberVO memberVO) throws Exception;
	
	//0515 최은지 회원가입 중 상호명 검색결과 개수 조회
	public int selectCountOwnerSignUpRestResult(Map<String, Object> map)throws Exception; 
	
	//0515 최은지 회원가입 중 상호명 검색 결과 조회
	public List<SearchVO> selectOwnerSignUpRestResult(Map<String, Object> map)throws Exception; 
}
