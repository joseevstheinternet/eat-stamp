package com.EatStampAdmin.service;

import java.util.List;
import java.util.Map;

import com.EatStampAdmin.domain.MemberVO;

public interface MemberService {

	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception; //회원목록
	
	public int selectMemRowCount(Map<String,Object> map)throws Exception; //검색결과 개수 구하기
	
	public int updateMemberStatus(Map<String, Object> map)throws Exception; //회원 상태 업데이트
	
}
