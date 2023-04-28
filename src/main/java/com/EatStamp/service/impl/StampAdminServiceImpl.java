package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.StampVO;
import com.EatStamp.mapper.StampAdminMapper;
import com.EatStamp.service.StampAdminService;

@Service
@Transactional
public class StampAdminServiceImpl implements StampAdminService {
	
	@Autowired
	private StampAdminMapper stampMapper;

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
