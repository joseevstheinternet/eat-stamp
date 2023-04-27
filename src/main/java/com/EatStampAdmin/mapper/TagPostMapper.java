package com.EatStampAdmin.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper("tagPostMapper")
public interface TagPostMapper {

	Integer deleteTagPost(@Param("s_num") Integer s_num); //태그 삭제
	
}
