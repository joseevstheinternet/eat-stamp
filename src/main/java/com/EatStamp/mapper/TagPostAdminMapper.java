package com.EatStamp.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper("tagPostAdminMapper")
public interface TagPostAdminMapper {

	Integer deleteTagPost(@Param("s_num") Integer s_num); //태그 삭제
	
}
