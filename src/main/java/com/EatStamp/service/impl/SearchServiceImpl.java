package com.EatStamp.service.impl;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.EatStamp.domain.CommonVO;
import com.EatStamp.domain.SearchForm;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.mapper.SearchMapper;
import com.EatStamp.service.SearchService;
import com.common.utils.CommonForm;
import com.common.utils.PagingUtil2;
import com.common.utils.ResultUtil;

@Service("searchService")
public class SearchServiceImpl implements SearchService {

	@Resource(name = "searchMapper")
	private SearchMapper searchMapper;
	
	//0404 최은지 일반 검색 게시글 수 구하기
	//@Override
	//public int selectRowCount(SearchForm form)throws Exception {

		//return searchMapper.selectStampRowCount(form);
	//}

	//0407 최은지 페이징 처리된 일반 검색
	@Override
	public ResultUtil getNomalSearchList(SearchForm form) throws Exception {
		
		 ResultUtil resultUtil = new ResultUtil();
		 
	        CommonVO commonVO = new CommonVO();
	 
	        //검색결과 수 구하기
	        int totalCount = searchMapper.selectStampRowCount(form);
	        
	        if (totalCount != 0) {
	            CommonForm commonForm = new CommonForm();
	            commonForm.setFunction_name(form.getFunction_name());
	            commonForm.setCurrent_page_no(form.getCurrent_page_no());
	            commonForm.setCount_per_page(10);
	            commonForm.setCount_per_list(5);
	            commonForm.setTatal_list_count(totalCount);
	            commonVO = PagingUtil2.setPageUtil(commonForm);
	        }
	 
	        form.setLimit(commonVO.getLimit());
	        form.setOffset(commonVO.getOffset());
	 
	        List<SearchVO> list = searchMapper.nomal_searchCheck(form); //게시글 정보 리스트 가져오는 메소드 
	 
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("list", list);
	        resultMap.put("totalCount", totalCount);
	        resultMap.put("pagination", commonVO.getPagination());
	 
	        resultUtil.setData(resultMap);
	        resultUtil.setState("SUCCESS");
	 
	        return resultUtil;
		
	}

	
	//0407 최은지 페이징 처리된 가게 정보 검색
	@Override
	public ResultUtil getRestSearchList(SearchForm form) throws Exception {
		 ResultUtil resultUtil = new ResultUtil();
		 
	        CommonVO commonVO = new CommonVO();
	 
	        //검색결과 수 구하기
	        int totalCount = searchMapper.selectRestRowCount(form);
	        
	        if (totalCount != 0) {
	            CommonForm commonForm = new CommonForm();
	            commonForm.setFunction_name(form.getFunction_name());
	            commonForm.setCurrent_page_no(form.getCurrent_page_no());
	            commonForm.setCount_per_page(10);
	            commonForm.setCount_per_list(5);
	            commonForm.setTatal_list_count(totalCount);
	            commonVO = PagingUtil2.setPageUtil(commonForm);
	        }
	 
	        form.setLimit(commonVO.getLimit());
	        form.setOffset(commonVO.getOffset());
	 
	        List<SearchVO> list = searchMapper.rest_searchCheck(form); //식당 정보 리스트 가져오는 메소드 
	 
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("list", list);
	        resultMap.put("totalCount", totalCount);
	        resultMap.put("pagination", commonVO.getPagination());
	 
	        resultUtil.setData(resultMap);
	        resultUtil.setState("SUCCESS");
	 
	        return resultUtil;
	} //식당 정보 end


	
	//0407 최은지 페이징된 해시태그 결과값 검색
	@Override
	public ResultUtil getTagSearchList(SearchForm form) throws Exception {

		 ResultUtil resultUtil = new ResultUtil();
		 
	        CommonVO commonVO = new CommonVO();
	 
	        //검색결과 수 구하기
	        int totalCount = searchMapper.selectTagRowCount(form);
	        
	        if (totalCount != 0) {
	            CommonForm commonForm = new CommonForm();
	            commonForm.setFunction_name(form.getFunction_name());
	            commonForm.setCurrent_page_no(form.getCurrent_page_no());
	            commonForm.setCount_per_page(10);
	            commonForm.setCount_per_list(5);
	            commonForm.setTatal_list_count(totalCount);
	            commonVO = PagingUtil2.setPageUtil(commonForm);
	        }
	 
	        form.setLimit(commonVO.getLimit());
	        form.setOffset(commonVO.getOffset());
	        
	        
	        //태그 문자열 가져오기
	        String arr_tag = form.getSearch_keyword();
	        
	        //태그 문자열 배열로 변환
	        String[] arr = arr_tag.split(",");
	        
	        //foreach사용 list생성
	        List<String> tag_list = new ArrayList<>(Arrays.asList(arr));
	        
	        //form.setTag_list(tag_list);
	        
	        //리스트 검색 결과가 전부 0으로 잡힘
	        List<SearchVO> list = searchMapper.tag_searchCheck(form); //해시태그 정보 리스트 가져오는 메소드 
	 
	        HashMap<String, Object> resultMap = new HashMap<String, Object>();
	        resultMap.put("list", list);
	        resultMap.put("totalCount", totalCount);
	        resultMap.put("pagination", commonVO.getPagination());
	 
	        resultUtil.setData(resultMap);
	        resultUtil.setState("SUCCESS");
	 
	        return resultUtil;
	        
	}


	//0410 최은지 해시태그 추천
	@Override
	public List<SearchVO> getRecommendTag(int mem_num) {
		
		List<SearchVO> result = searchMapper.random_tagResult(mem_num);
		
		System.out.println("result>>>>>>>>>>>>>>" + result);
		
		return result;
	}


	//0410 최은지 해시태그 클릭 검색 개수 구하기
	@Override
	public int selectClickTagRowCount(Map<String, Object> map) {
		
		return searchMapper.selectClickTagRowCount(map);
		
	}
	
	//0410 최은지 해시태그 클릭 검색
	@Override
	public List<SearchVO> getClickTagSearchList(Map<String, Object> map) {

		return searchMapper.selectClickTagList(map);
	}
	
	
	
}
