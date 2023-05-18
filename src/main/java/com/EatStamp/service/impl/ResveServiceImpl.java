package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;
import com.EatStamp.mapper.ResveMapper;
import com.EatStamp.service.ResveService;

/**
 * resve serviceimpl
 * @version 1.2
 * @since 2023.05.16
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

	@Override
	public RestVO selectOwnerSetting(String r_name) throws Exception {
		return resveMapper.selectOwnerSetting(r_name);
	}

	@Override
	public void updateOwnerSetting(RestVO rest) throws Exception {
		resveMapper.updateOwnerSetting(rest);
	}

	@Override
	public RestVO selectRestSetting(int r_num) throws Exception {
		return resveMapper.selectRestSetting(r_num);
	}

	@Override
	public void insertRestResve(ResveVO resve) throws Exception {
		resveMapper.insertRestResve(resve);
	}

	@Override
	public List<Map<String, Object>> selectResveCntByDate(Map<String, Object> map) throws Exception {
		return resveMapper.selectResveCntByDate(map);
	}

	@Override
	public List<String> getUnableTimes(Map<String, Object> map) throws Exception {
		return resveMapper.getUnableTimes(map);
	}

}
