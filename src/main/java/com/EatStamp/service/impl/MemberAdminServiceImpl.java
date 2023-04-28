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
	public int selectReportRowCount(Map<String, Object> map) {

		return memberMapper.selectReportRowCount(map);
	}

}
