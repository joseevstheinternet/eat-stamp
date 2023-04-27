package com.EatStampAdmin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStampAdmin.domain.MemberVO;
import com.EatStampAdmin.mapper.MemberMapper;
import com.EatStampAdmin.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper memberMapper;

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

}
