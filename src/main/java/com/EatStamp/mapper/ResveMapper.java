package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;

/**
 * resve mapper
 * @version 1.5
 * @since 2023.05.19
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

	//0518 최은지 예약내역 리스트 확인 시 미확인 여부 알림 코드 업데이트
	public int updateAlertCheckAfter(int r_num) throws Exception;
	
	//0518 최은지 회원 예약내역 리스트 가져오기
	public List<Map<String, Object>> selectMemberResveList(Map<String, Object> map) throws Exception;
	
	//0518 최은지 회원 예약내역 총 개수 세기
	public int getCountMemberResve(int mem_num) throws Exception;
}
