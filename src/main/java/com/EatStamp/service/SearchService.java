package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.SearchForm;
import com.EatStamp.domain.SearchVO;
import com.common.utils.ResultUtil;

public interface SearchService {
	
	//0404 최은지 일반 검색
	//public List<SearchVO> nomal_searchList(Map<String, Object> map);
	
	//0406 최은지 일반 검색 결과 개수 구하기
	//public int selectRowCount(SearchForm form)throws Exception;

	//0407 최은지 페이징 처리된 스탬프 검색
	public ResultUtil getNomalSearchList(SearchForm form) throws Exception;
	
	//0407 최은지 페이징 처리된 가게 정보 검색
	public ResultUtil getRestSearchList(SearchForm form) throws Exception;
	
	//0407 최은지 페이징 처리된 해시태그 결과 정보 검색
	public ResultUtil getTagSearchList(SearchForm form) throws Exception;
	
	//0410 최은지 해시태그 추천
	public  List<SearchVO>  getRecommendTag(int mem_num);
		
	//0410 최은지 해시태그 클릭 검색
	public List<SearchVO> getClickTagSearchList(Map<String, Object> map);
	
	//0410 최은지 해시태그 클릭 검색 개수 구하기
	public int selectClickTagRowCount(Map<String, Object> map);

}
