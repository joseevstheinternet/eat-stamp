package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;

/**
 * memberAdmin mapper
 * @version 2.0
 * @since 2023.05.15
 * @author 이예지
 */

@Mapper("memberAdminMapper")
public interface MemberAdminMapper {

	//이예지 관리자 회원 관리 목록
	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception;
	
	//이예지 관리자 회원 관리 목록 개수 구하기
	public int selectMemRowCount(Map<String,Object> map)throws Exception;
	
	//이예지 관리자 회원 상태 업데이트
	public int updateMemberStatus(Map<String, Object> map)throws Exception;

	//0428 최은지 관리자 신고 내역 불러오기
	public List<ReportVO> getReportAdminList(Map<String, Object> map)throws Exception;
	
	//0428 최은지 관리자 신고 내역 갯수 세기
	public int selectReportRowCount(Map<String,Object> map)throws Exception; 
	
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
	
	//0504 최은지 회원 신고 리스트 검색
	public List<ReportVO> getSearchReportAdminList(Map<String, Object> map)throws Exception;
	
	//0504 최은지 회원 신고 리스트 카운트
	public int countReportAdminList(Map<String,Object> map)throws Exception; 
	
	//0515 이예지 관리자 - 사장님 관리 목록
	public List<MemberVO> selectListOwner(Map<String, Object> map) throws Exception;
	
	//0515 이예지 관리자 - 사장님 관리 목록 개수 구하기
	public int selectListOwnerCnt(Map<String,Object> map) throws Exception;
	
	//0522 이예지 관리자 - 사장님 가입 승인 시 식당 정보 변경
	public int updateRestStatus(Map<String, Object> map) throws Exception;
}
