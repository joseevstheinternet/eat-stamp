package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.StampVO;

@Mapper("stampAdminMapper")
public interface StampAdminMapper {

	public List<StampVO> selectList(Map<String, Object> map)throws Exception; //글목록
	
	public int selectRowCount(Map<String,Object> map)throws Exception; //Stamp 개수 구하기
	
	public StampVO selectStamp(Integer s_num)throws Exception; //글선택
	
	public void deleteStamp(Integer s_num)throws Exception; //글삭제
	
}
