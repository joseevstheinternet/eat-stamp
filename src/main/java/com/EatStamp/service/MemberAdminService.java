package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;

/**
 * memberAdmin controller
 * @version 2.0
 * @since 2023.05.15
 * @author 이예지
 */

public interface MemberAdminService {

	//이예지 관리자 회원 관리 목록
	public List<MemberVO> selectMemList(Map<String, Object> map)throws Exception;
	
	//이예지 관리자 회원 관리 목록 개수 구하기
	public int selectMemRowCount(Map<String,Object> map)throws Exception;
	
	//이예지 관리자 회원 상태 업데이트
	public int updateMemberStatus(Map<String, Object> map)throws Exception;
	
	//0428 최은지 관리자 신고 리스트 불러오기
	public List<ReportVO> getReportAdminList(Map<String, Object> map)throws Exception;

	//0428 최은지 관리자 신고 내역 총 개수 구하기
	public int selectReportRowCount(Map<String,Object> map)throws Exception; 
	
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
	
	//0504 최은지 회원 신고 리스트 검색
	public List<ReportVO> getSearchReportAdminList(Map<String, Object> map)throws Exception;
	
	//0504 최은지 회원 신고 리스트 검색 카운트
	public int selectReportSearchRowCount(Map<String,Object> map)throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 관리자 페이지의 사장님 관리 목록을 선택한다
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<MemberVO> selectListOwner(Map<String, Object> map) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 관리자 페이지의 사장님 관리 목록 개수를 구한다
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectListOwnerCnt(Map<String,Object> map) throws Exception;
}
