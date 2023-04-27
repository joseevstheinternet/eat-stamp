package com.EatStampAdmin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.ResponseBody;

import com.EatStampAdmin.domain.RestVO;
import com.EatStampAdmin.domain.SearchVO;


public interface AdminRestService {

	//0421 최은지 레스토랑 검색(페이지 이동 시 첫 화면)
	public List<RestVO> selectAdminRestList(Map<String, Object> map)throws Exception;

	//0421 최은지 레스토랑 전체 리스트 개수 구하기
	public int selectRestListRowCount(Map<String,Object> map)throws Exception;
	
	//0421 최은지 레스토랑 검색
	public List<SearchVO>selectSearchRestList(Map<String,Object> map)throws Exception;
	
	//0421 최은지 레스토랑 검색 전체 리스트 개수 구하기
	public int selectSearchRestListRowCount(Map<String,Object> map)throws Exception;
	
	//0421 최은지 레스토랑 세부정보
	public RestVO getRestDetailList(RestVO vo)throws Exception;
	
	//0424 최은지 레스토랑 비공개
	public int goRestBlock(int r_num);
	
	//0424 최은지 레스토랑 공개
	public int goRestUnblock(int r_num);
	
	//0424 최은지 가게 삭제
	public int restDelete(int r_num);
	
	//0425 최은지 가게 업데이트
	public int restUpdate(RestVO vo);

}
