package com.EatStamp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.EatStamp.domain.RestVO;
import com.EatStamp.mapper.RestMapper;
import com.EatStamp.service.RestService;


@Service
@Transactional
public class RestServiceImpl implements RestService{

	@Autowired
	private RestMapper restMapper;

	@Override
	public List<RestVO> selectRestList(Map<String, Object> map) {
		return restMapper.selectRestList(map);
	}

	@Override
	public List<RestVO> selectRecList(Map<String, Object> map) {
		return restMapper.selectRecList(map);
	}
	
	@Override
	public int selectRecRowCount(Map<String, Object> map) {
		return restMapper.selectRecRowCount(map);
	}

	@Override
	public List<RestVO> selectLikeList(Map<String, Object> map) {
		return restMapper.selectLikeList(map);
	}

	@Override
	public int selectLikeRowCount(Map<String, Object> map) {
		return restMapper.selectLikeRowCount(map);
	}

	@Override
	public RestVO selectRest(Integer r_num) {
		return restMapper.selectRest(r_num);
	}

	@Override
	public List<RestVO> selectR_nameList(Map<String,Object> map) {
		return restMapper.selectR_nameList(map);
	}

	@Override
	public int selectR_nameRowCount(Map<String,Object> map) {
		return restMapper.selectR_nameRowCount(map);
	}
	
	//<0411 최은지 가게 상세 페이지 정보>
	@Override
	public RestVO getRestDetailList(RestVO vo) {

		return restMapper.getRestDetail(vo);
	}

	//<0411 최은지 가게 찜 여부 조회>
	@Override
	public RestVO getLikeRest(RestVO vo) {
		
		return restMapper.getRestLike(vo);
	}

	//<0411 최은지 가게 찜하기>
	@Override
	public int add_rest_like(RestVO vo) {
		
		return restMapper.add_rest_like(vo);
	}

	//<0411 최은지 가게 찜하기 삭제>
	@Override
	public int delete_rest_like(RestVO vo) {
		
		return restMapper.delete_rest_like(vo);
	}

	//<0411 최은지 가게 찜 추가 시 ajax삭제용 r_like_num받아오기
	@Override
	public String get_plusRlike(RestVO vo) {
		
		return restMapper.get_plus_rLike(vo);
	}

	@Override
	public List<RestVO> selectRestLikeMapList(Map<String, Object> map) {
		return restMapper.selectRestLikeMapList(map);
	}
}
