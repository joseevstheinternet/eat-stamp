package com.EatStamp.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.RestVO;

/**
 * restOwner Mapper
 * @version 1.0
 * @since 2023.05.19
 * @author 이예지
 */

@Mapper("restOwnerMapper")
public interface RestOwnerMapper {
	
	//0519 이예지 사장님 가게 정보 선택
	public RestVO getRestOwnerDetail(String mem_nick) throws Exception;
	
	//0519 이예지 사장님 가게 정보 수정
	public int updateRestOwner(RestVO rest) throws Exception;

}
