package com.EatStamp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.StampVO;
import com.EatStamp.domain.TagVO;
import com.EatStamp.mapper.TagMapper;
import com.EatStamp.mapper.TagPostMapper;
import com.EatStamp.service.TagService;

@Service
@Transactional
public class TagServiceImpl implements TagService {
	
	@Autowired
	private TagMapper tagMapper;
	@Autowired
	private TagPostMapper tagPostMapper;

	@Override
	public void createTagList(StampVO stampVO) {
		Pattern MY_PATTERN = Pattern.compile("#(\\S+)");
		Matcher mat = MY_PATTERN.matcher(stampVO.getS_tag());
		List<String> tagList = new ArrayList<>();
		
		while(mat.find()) {
			tagList.add((mat.group(1)));
		}
		
		System.out.println("Create HashTags Success! -----> " + tagList);
		saveTag(tagList, stampVO.getS_num(), stampVO.getMem_num());
	}

	@Override
	public Boolean saveTag(List<String> tagList, Integer s_num, Integer mem_num) {
		Integer result = 1;
		
		for (String tag : tagList) {
			TagVO findResult = tagMapper.findTagByContent(tag);
			
			//등록된 태그가 아니라면 태그부터 추가
			if(findResult == null) {
				tagMapper.saveTag(tag);
			}
			
			//태그-포스트 매핑 테이블에 데이터 추가
			TagVO findTag = tagMapper.findTagByContent(tag);
			result = tagPostMapper.saveTagPost(findTag.getTag_num(), s_num, mem_num);
		}
		
		return result == 1;
	}

	@Override
	public Boolean deleteTagPost(Integer s_num) {

		Integer result = tagPostMapper.deleteTagPost(s_num);
		
		return result == 1;
	}

}
