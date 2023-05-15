package com.EatStamp.mapper;

import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.StampVO;

/**
 * stampOwner mapper
 * @version 1.0
 * @since 2023.05.15
 * @author 이예지
 */

@Mapper("stampOwnerMapper")
public interface StampOwnerMapper {

	//0515 이예지 사장님 가게 리뷰 불러오기
	public List<StampVO> selectOwnerStampList(Map<String, Object> map) throws Exception;
	
	//0515 이예지 사장님 가게 리뷰 개수 구하기
	public int selectOwnerStampCnt(Map<String,Object> map) throws Exception;
	
}
