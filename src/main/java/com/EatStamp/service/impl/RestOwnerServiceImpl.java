package com.EatStamp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.RestVO;
import com.EatStamp.mapper.RestOwnerMapper;
import com.EatStamp.service.RestOwnerService;

@Service
@Transactional
public class RestOwnerServiceImpl implements RestOwnerService {

	@Autowired
	private RestOwnerMapper restOwnerMapper;
	
	@Override
	public RestVO getRestOwnerDetail(String mem_nick) throws Exception {
		return restOwnerMapper.getRestOwnerDetail(mem_nick);
	}

	@Override
	public int updateRestOwner(RestVO rest) throws Exception {
		return restOwnerMapper.updateRestOwner(rest);
	}

}
