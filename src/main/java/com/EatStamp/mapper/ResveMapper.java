package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.ResveVO;

/**
 * resve mapper
 * @version 1.0
 * @since 2023.05.12
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
}
