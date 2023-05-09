package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.StampVO;
import com.EatStamp.mapper.StampMapper;
import com.EatStamp.service.StampService;

@Service
@Transactional
public class StampServiceImpl implements StampService {
	
	@Autowired
	private StampMapper stampMapper;

	@Override
	public List<StampVO> selectList(Map<String, Object> map) {
		return stampMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return stampMapper.selectRowCount(map);
	}

	@Override
	public void insertStamp(StampVO stamp) {
		stampMapper.insertStamp(stamp);
	}

	@Override
	public StampVO selectStamp(Integer s_num) {
		return stampMapper.selectStamp(s_num);
	}

	@Override
	public void updateStamp(StampVO stamp) {
		stampMapper.updateStamp(stamp);
	}

	@Override
	public void deleteStamp(Integer s_num) {
		stampMapper.deleteStamp(s_num);
	}

}