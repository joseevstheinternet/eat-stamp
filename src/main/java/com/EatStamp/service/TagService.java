package com.EatStamp.service;

import java.util.List;

import com.EatStamp.domain.StampVO;

public interface TagService {

	public void createTagList(StampVO stampVO);
	
	public Boolean saveTag(List<String> tagList, Integer s_num, Integer mem_num);
	
	public Boolean deleteTagPost(Integer s_num);
	
}
