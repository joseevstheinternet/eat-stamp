package com.EatStampAdmin.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.EatStampAdmin.domain.RestVO;
import com.EatStampAdmin.domain.SearchVO;
import com.EatStampAdmin.mapper.AdminMapper;
import com.EatStampAdmin.mapper.AdminRestMapper;
import com.EatStampAdmin.service.AdminRestService;

@Service("adminRestService")
public class AdminRestServiceImpl implements AdminRestService {
	
	@Resource(name = "adminRestMapper")
	private AdminRestMapper mapper;

	//0421 최은지 레스토랑 화면 이동 시 첫 화면(전체 리스트 출력)
	@Override
	public List<RestVO> selectAdminRestList(Map<String, Object> map) throws Exception {

		return mapper.selectRestList(map);
	}

	//0421 최은지 레스토랑 전체 리스트 개수 구하기
	@Override
	public int selectRestListRowCount(Map<String, Object> map) {

		return mapper.selectRestRowCount(map);
	}

	//0421 최은지 레스토랑 검색
	@Override
	public List<SearchVO> selectSearchRestList(Map<String, Object> map) throws Exception {
		

		return mapper.selectAdminSearchRestList(map);
	}

	//0421 최은지 레스토랑 검색 전체 리스트 개수 구하기
	@Override
	public int selectSearchRestListRowCount(Map<String, Object> map) throws Exception {
		
		return mapper.selectSearchRestRowCount(map);
	}

	//0421 최은지 레스토랑 세부정보
	@Override
	public RestVO getRestDetailList(RestVO vo) {

		return mapper.getAdminRestDetail(vo);
	}

	//0424 최은지 레스토랑 비공개
	@Override
	public int goRestBlock(int r_num) {
		
		return mapper.goRestBlock(r_num);
	}
	
	//0424 최은지 레스토랑 비공개
	@Override
	public int goRestUnblock(int r_num) {

		return mapper.goRestUnblock(r_num);
	}

	//0424 최은지 가게 삭제
	@Override
	public int restDelete(int r_num) {

		return mapper.restDelete(r_num);
	}

	//0425 최은지 가게 업데이트 
	@Override
	public int restUpdate(RestVO vo) {

		return mapper.restUpdate(vo);
	}


}
