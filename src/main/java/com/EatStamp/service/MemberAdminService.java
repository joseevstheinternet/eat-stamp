package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;

public interface MemberAdminService {

	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception; //회원목록
	
	public int selectMemRowCount(Map<String,Object> map)throws Exception; //검색결과 개수 구하기
	
	public int updateMemberStatus(Map<String, Object> map)throws Exception; //회원 상태 업데이트
	
	//0428 최은지 관리자 신고 리스트 불러오기
	public List<ReportVO> getReportAdminList(Map<String, Object> map)throws Exception;

	//0428 최은지 관리자 신고 내역 총 개수 구하기
	public int selectReportRowCount(Map<String,Object> map)throws Exception; //찜한 식당 개수 구하기
	
	//0502 최은지 관리자 신고 내역 세부 확인
	public ReportVO getReportDetailContent(ReportVO vo)throws Exception;
		
	//0502 최은지 신고회원 닉네임, 이메일 조회
	public ReportVO getMemselectOne(int mem_num)throws Exception;
		
	//0502 최은지 피신고회원 닉네임, 이메일 조회
	public ReportVO getMemselectTwo(int mem_num2)throws Exception;
	
	//0503 최은지 회원 신고 승인
	public int acceptReport(MemberVO vo)throws Exception;
	
	//0503 최은지 회원 신고 승인 시 컬럼 업데이트
	public int changeCode(int report_num)throws Exception;
	
	//0503 최은지 회원 신고 반려
	public int denidedReport(ReportVO vo)throws Exception;
	
}
