package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;

@Mapper("memberAdminMapper")
public interface MemberAdminMapper {

	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception; //회원목록
	
	public int selectMemRowCount(Map<String,Object> map)throws Exception; //검색결과 개수 구하기
	
	public int updateMemberStatus(Map<String, Object> map)throws Exception; //회원 상태 업데이트

	//0428 최은지 관리자 신고 내역 불러오기
	public List<ReportVO> getReportAdminList(Map<String, Object> map);
	
	//0428 최은지 관리자 신고 내역 갯수 세기
	public int selectReportRowCount(Map<String,Object> map); //찜한 식당 개수 구하기
	
}
