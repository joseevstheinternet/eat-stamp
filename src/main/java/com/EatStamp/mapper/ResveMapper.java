package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;

/**
 * resve mapper
 * @version 1.4
 * @since 2023.05.18
 * @author 이예지
 */

@Mapper("resveMapper")
public interface ResveMapper {

	//0512 이예지 사장님 - 예약 목록
	public List<ResveVO> selectListResve(Map<String, Object> map) throws Exception;
	
	//0512 이예지 사장님 - 예약 개수 구하기
	public int selectResveCnt(Map<String, Object> map) throws Exception;
	
	//0512 이예지 사장님 - 예약 상태 업데이트
	public int updateResveStatus(Map<String, Object> map) throws Exception;
	
	//0515 이예지 사장님 - 식당 관리(예약 정보) 선택
	public RestVO selectOwnerSetting(String r_name) throws Exception;
	
	//0515 이예지 사장님 - 식당 관리(예약 정보) 업데이트
	public void updateOwnerSetting(RestVO rest) throws Exception;
	
	//0516 이예지 회원 - 식당 정보 선택
	public RestVO selectRestSetting(int r_num) throws Exception;
	
	//0516 이예지 회원 - 식당 예약
	public void insertRestResve(ResveVO resve) throws Exception;
	
	//0517 이예지 날짜에 따른 타임별 예약 수 구하기
	public List<Map<String, Object>> selectResveCntByDate(Map<String, Object> map) throws Exception;
	
	//0518 이예지 예약 불가능 시간(이미 예약된 시간) 구하기
	public List<String> getUnableTimes(Map<String, Object> map) throws Exception;

}
