package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.KeywordVO;
import com.EatStamp.domain.StampVO;

@Mapper("keywordMapper")
public interface KeywordMapper {

	public List<StampVO> selectText(Map<String,Object> map) throws Exception; //분석할 텍스트 선택
	
}
