package com.EatStamp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.mapper.TagPostAdminMapper;
import com.EatStamp.service.TagAdminService;

@Service
@Transactional
public class TagAdminServiceImpl implements TagAdminService {
	
	@Autowired
	private TagPostAdminMapper tagPostMapper;

	@Override
	public Boolean deleteTagPost(Integer s_num) {
		
		Integer result = tagPostMapper.deleteTagPost(s_num);
		
		return result == 1;
	}

}
