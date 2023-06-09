package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;
import com.EatStamp.mapper.MemberAdminMapper;
import com.EatStamp.service.MemberAdminService;

/**
 * memberAdmin serviceimpl
 * @version 2.0
 * @since 2023.05.15
 * @author 이예지
 */

@Service
@Transactional
public class MemberAdminServiceImpl implements MemberAdminService {
	
	@Autowired
	private MemberAdminMapper memberMapper;

	@Override
	public List<MemberVO> selectMemList(Map<String, Object> map) throws Exception {
		return memberMapper.selectMemList(map);
	}

	@Override
	public int selectMemRowCount(Map<String, Object> map) throws Exception {
		return memberMapper.selectMemRowCount(map);
	}

	@Override
	public int updateMemberStatus(Map<String, Object> map) throws Exception {
		return memberMapper.updateMemberStatus(map);
	}

	//0428 최은지 관리자 신고 내역 리스트 출력
	@Override
	public List<ReportVO> getReportAdminList(Map<String, Object> map) throws Exception {

		return memberMapper.getReportAdminList(map);
	}

	//0428 최은지 관리자 신고 내역 개수 구하기
	@Override
	public int selectReportRowCount(Map<String, Object> map)throws Exception {

		return memberMapper.selectReportRowCount(map);
	}
	
	//0502 최은지 관리자 신고 세부 내역 확인
	@Override
	public ReportVO getReportDetailContent(ReportVO vo) throws Exception {

		return memberMapper.selectReportDetailContent(vo);
	}

	//0502 최은지 신고회원 닉네임, 이메일 조회
	@Override
	public ReportVO getMemselectOne(int mem_num) throws Exception {
			
		return memberMapper.getMemberOne(mem_num);
	}

	//0502 최은지 피신고회원 닉네임, 이메일 조회
	@Override
	public ReportVO getMemselectTwo(int mem_num2) throws Exception {

		return memberMapper.getMemberTwo(mem_num2);
	}

	//0503 최은지 회원 신고 승인
	@Override
	public int acceptReport(MemberVO vo) throws Exception {

		return memberMapper.acceptMemberReport(vo);
	}

	//0503 최은지 회원 신고 승인 시 컬럼 업데이트
	@Override
	public int changeCode(int report_num) throws Exception {

		return memberMapper.changeYncode(report_num);
	}

	//0503 최은지 회원 신고 반려
	@Override
	public int denidedReport(ReportVO vo) throws Exception {

		return memberMapper.denidedMemberReport(vo);
	}

	//0504 최은지 회원 신고 리스트 검색
	@Override
	public List<ReportVO> getSearchReportAdminList(Map<String, Object> map) throws Exception {

		return memberMapper.getSearchReportAdminList(map);
	}

	//0504 최은지 회원 신고 리스트 검색 카운트
	@Override
	public int selectReportSearchRowCount(Map<String, Object> map) throws Exception {

		return memberMapper.countReportAdminList(map);
	}

	@Override
	public List<MemberVO> selectListOwner(Map<String, Object> map) throws Exception {
		return memberMapper.selectListOwner(map);
	}

	@Override
	public int selectListOwnerCnt(Map<String, Object> map) throws Exception {
		return memberMapper.selectListOwnerCnt(map);
	}

	@Override
	public int updateRestStatus(Map<String, Object> map) throws Exception {
		return memberMapper.updateRestStatus(map);
	}

}
