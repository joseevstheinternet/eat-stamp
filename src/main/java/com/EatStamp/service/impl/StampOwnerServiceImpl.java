package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.StampVO;
import com.EatStamp.mapper.StampOwnerMapper;
import com.EatStamp.service.StampOwnerService;

/**
 * stampOwner serviceimpl
 * @version 1.0
 * @since 2023.05.15
 * @author 이예지
 */

@Service
@Transactional
public class StampOwnerServiceImpl implements StampOwnerService{

	@Autowired
	private StampOwnerMapper stampOwnerMapper;
	
	@Override
	public List<StampVO> selectOwnerStampList(Map<String, Object> map) throws Exception {
		return stampOwnerMapper.selectOwnerStampList(map);
	}

	@Override
	public int selectOwnerStampCnt(Map<String, Object> map) throws Exception {
		return stampOwnerMapper.selectOwnerStampCnt(map);
	}

}
