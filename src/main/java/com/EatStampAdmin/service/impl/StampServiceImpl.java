package com.EatStampAdmin.service.impl;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStampAdmin.domain.StampVO;
import com.EatStampAdmin.mapper.StampMapper;
import com.EatStampAdmin.service.StampService;

@Service
@Transactional
public class StampServiceImpl implements StampService {
	
	@Autowired
	private StampMapper stampMapper;

	@Override
	public List<StampVO> selectList(Map<String, Object> map)throws Exception {
		return stampMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map)throws Exception {
		return stampMapper.selectRowCount(map);
	}

	@Override
	public StampVO selectStamp(Integer s_num)throws Exception {
		return stampMapper.selectStamp(s_num);
	}

	@Override
	public void deleteStamp(Integer s_num)throws Exception {
		stampMapper.deleteStamp(s_num);
	}

}
