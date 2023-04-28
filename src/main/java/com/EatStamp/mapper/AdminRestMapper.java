package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.SearchVO;


@Mapper("adminRestMapper")
public interface AdminRestMapper {
	
	//0421 최은지 식당 전체 목록
	public List<RestVO> selectRestList(Map<String, Object> map); 
	
	//0421 최은지 식당 전체 개수
	public int selectRestRowCount(Map<String,Object> map);
	
	//0421 최은지 식당 검색
	public List<SearchVO>selectAdminSearchRestList(Map<String, Object> map);
	
	//0421 최은지 식당 검색 리스트 개수 
	public int selectSearchRestRowCount(Map<String, Object> map);
	
	//0421 최은지 레스토랑 세부정보
	public RestVO getAdminRestDetail(RestVO vo);
	
	//0424 최은지 레스토랑 비공개
	public int goRestBlock(int r_num);
	
	//0424 최은지 레스토랑 공개
	public int goRestUnblock(int r_num);
	
	//0424 최은지 가게 삭제
	public int restDelete(int r_num);
	
	//0425 최은지 가게 업데이트
	public int restUpdate(RestVO vo);
	
	//0428 최은지 가게 등록
	public int restInsert(RestVO vo);
}
