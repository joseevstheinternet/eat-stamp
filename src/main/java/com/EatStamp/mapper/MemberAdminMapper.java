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
	public List<ReportVO> getReportAdminList(Map<String, Object> map)throws Exception;
	
	//0428 최은지 관리자 신고 내역 갯수 세기
	public int selectReportRowCount(Map<String,Object> map)throws Exception; //찜한 식당 개수 구하기
	
	//0502 최은지 관리자 신고 상세 내역 확인하기
	public ReportVO selectReportDetailContent(ReportVO vo)throws Exception;
		
	//0502 최은지 신고회원 닉네임, 이메일 조회
	public ReportVO getMemberOne(int mem_num)throws Exception;
		
	//0502 최은지 피신고회원 닉네임, 이메일 조회
	public ReportVO getMemberTwo(int mem_num2)throws Exception;
	
	//0503 최은지 회원 신고 승인 시 신고횟수 추가
	public int acceptMemberReport(MemberVO vo)throws Exception;
	
	//0503 최은지 회원 신고 승인 시 ynCode업데이트
	public int changeYncode(int report_num)throws Exception;
	
	//0503 최은지 회원 신고 반려 처리
	public int denidedMemberReport(ReportVO vo)throws Exception;
	
}
