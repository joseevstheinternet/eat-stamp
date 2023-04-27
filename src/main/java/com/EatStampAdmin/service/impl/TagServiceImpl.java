package com.EatStampAdmin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStampAdmin.mapper.TagPostMapper;
import com.EatStampAdmin.service.TagService;

@Service
@Transactional
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagPostMapper tagPostMapper;

	@Override
	public Boolean deleteTagPost(Integer s_num) {
		
		Integer result = tagPostMapper.deleteTagPost(s_num);
		
		return result == 1;
	}

}
