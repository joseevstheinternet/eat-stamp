package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.ResveVO;
import com.EatStamp.mapper.ResveMapper;
import com.EatStamp.service.ResveService;

/**
 * resve serviceimpl
 * @version 1.0
 * @since 2023.05.12
 * @author 이예지
 */

@Service
@Transactional
public class ResveServiceImpl implements ResveService {

	@Autowired
	private ResveMapper resveMapper;
	
	@Override
	public List<ResveVO> selectListResve(Map<String, Object> map) throws Exception {
		return resveMapper.selectListResve(map);
	}

	@Override
	public int selectResveCnt(Map<String, Object> map) throws Exception {
		return resveMapper.selectResveCnt(map);
	}

	@Override
	public int updateResveStatus(Map<String, Object> map) throws Exception {
		return resveMapper.updateResveStatus(map);
	}

}
