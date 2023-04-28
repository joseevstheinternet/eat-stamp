package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.RestVO;

@Mapper("restMapper")
public interface RestMapper {

	public List<RestVO> selectRestList(Map<String, Object> map); //식당 목록
	
	public List<RestVO> selectRecList(Map<String,Object> map); //키워드 기반 추천 리스트
	
	public int selectRecRowCount(Map<String,Object> map); //키워드 기반 추천 식당 개수 구하기
	
	public List<RestVO> selectLikeList(Map<String,Object> map); //찜한 식당 리스트

	public int selectLikeRowCount(Map<String,Object> map); //찜한 식당 개수 구하기
	
	public RestVO selectRest(Integer r_num); //식당 상세
	
	public List<RestVO> selectR_nameList(Map<String,Object> map); //상호명 검색
	
	public int selectR_nameRowCount(Map<String,Object> map); //상호명 검색 결과 개수 구하기
	
	//<0411 최은지 가게 상세 페이지 정보>
	public RestVO getRestDetail(RestVO vo);
	
	//<0411 최은지 가게 좋아요 어부 조회>
	public RestVO getRestLike(RestVO vo);
	
	//<0411 최은지 가게 찜
	public int add_rest_like(RestVO vo);
	
	//<0411 최은지 가게 찜 삭제
	public int delete_rest_like(RestVO vo);
	
	//<0411 최은지 가게 찜 추가 시 ajax삭제용 r_like_num받아오기
	public String get_plus_rLike(RestVO vo);

	
}
