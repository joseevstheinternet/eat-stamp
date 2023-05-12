package com.EatStamp.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.EatStamp.mapper.OwnerMapper;
import com.EatStamp.service.OwnerService;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Service("ownerService")
public class OwnerServiceImpl implements OwnerService {
	
	/* 매퍼 빈 주입 */
	@Resource(name = "ownerMapper")
	private OwnerMapper ownerMapper;
	
	
}
