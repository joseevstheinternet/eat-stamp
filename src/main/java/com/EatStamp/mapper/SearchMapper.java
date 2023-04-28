package com.EatStamp.mapper;

import com.EatStamp.domain.SearchForm;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.domain.StampVO;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

@Mapper("searchMapper")
public interface SearchMapper { //여기도 예외처리 추가하기
	
	//<0404 최은지> 일반 검색 조회
	public List<SearchVO> nomal_searchCheck(SearchForm form); 
	
	//<0406 최은지> 일반 검색 개수 조회
	public int selectStampRowCount(SearchForm form); 
	
	//<0407 최은지> 식당 검색 조회
	public List<SearchVO> rest_searchCheck(SearchForm form); 
	
	//<0407 최은지> 식당 정보 검색 개수 조회
	public int selectRestRowCount(SearchForm form); 

	//<0407 최은지> 일반 검색 해시태그 조회
	public List<SearchVO> tag_searchCheck(SearchForm form); 
	
	//<0407 최은지> 일반 검색 해시태그 개수 조회
	public int selectTagRowCount(SearchForm form); 
	
	//<0410 최은지> 태그 랜덤 출력
	public List<SearchVO> random_tagResult(int mem_num); 
	
	//<0407 최은지> 일반 검색 해시태그 조회
	public List<SearchVO> tag_searchCheck2(SearchForm form); 
	
	//<0407 최은지> 일반 검색 해시태그 개수 조회
	public int selectTagRowCount2(SearchForm form); 
	
	//<0411 최은지 해시태그 클릭 검색>
	public List<SearchVO> selectClickTagList(Map<String, Object> map); 
	
	//<0411 최은지 해시태그 클릭 검색 개수 구하기>
	public int selectClickTagRowCount(Map<String,Object> map); 
	
	
}
