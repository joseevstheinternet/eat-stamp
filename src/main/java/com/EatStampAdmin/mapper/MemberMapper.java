package com.EatStampAdmin.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStampAdmin.domain.MemberVO;

@Mapper("memberMapper")
public interface MemberMapper {

	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception; //회원목록
	
	public int selectMemRowCount(Map<String,Object> map)throws Exception; //검색결과 개수 구하기
	
	public int updateMemberStatus(Map<String, Object> map)throws Exception; //회원 상태 업데이트
	
}
