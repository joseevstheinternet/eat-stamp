package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.StampVO;


public interface StampService {
	
	public List<StampVO> selectList(Map<String,Object> map); //리스트 선택
	public int selectRowCount(Map<String,Object> map); //Stamp 개수 구하기
	public void insertStamp(StampVO stamp); //글쓰기
	public StampVO selectStamp(Integer s_num); //글선택
	public void updateStamp(StampVO stamp); //글수정
	public void deleteStamp(Integer s_num); //글삭제
}