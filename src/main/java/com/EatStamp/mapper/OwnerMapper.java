package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
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
	
	//0515 최은지 사장 회원가입 중 상호명 검색결과 개수 조회
	public int selectCountOwnerSignUpRestResult(Map<String, Object> map)throws Exception; 
	
	//0515 최은지 사장 회원가입 중 상호명 검색 결과 조회
	public List<SearchVO> selectOwnerSignUpRestResult(Map<String, Object> map)throws Exception; 
	
	//0516 최은지 사장 회원가입 중 기존 가입여부 조회
	public RestVO getDuplSignUpCheck(String mem_nick)throws Exception;
	
	//0516 최은지 가게 사장 회원가입 정보 DB등록
	public int insertOwnerSignUpInfo(MemberVO memberVO)throws Exception;
	
	//0516 최은지 가게 사장 회원가입 시 해당 가게 정보 DB 업데이트
	 public int updateRestInfoSignUp(RestVO restVO)throws Exception;
	 
	//0516 최은지 신규 가게 사장 회원가입 시 해당 가게 정보 DB 업데이트
	 public int insertOwnerSignUpNewRestInfo(RestVO restVO)throws Exception;
	 
	 //0518 최은지 사장 헤더 알림 갱신용 DB정보 조회
	 public MemberVO getMemNickEqualRestName( String mem_nick )throws Exception;
	 
	 //0518 최은지 사장 헤더 알림 갱신용 미확인 알림 조회
	 public int getCountUnidentifiedAlert( int r_num )throws Exception;
}
