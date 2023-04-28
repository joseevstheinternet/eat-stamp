package com.EatStamp.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper("tagPostMapper")
public interface TagPostMapper {
	Integer saveTagPost(@Param("tag_num") Integer tag_num, 
			@Param("s_num") Integer s_num, @Param("mem_num") Integer mem_num); //태그 저장
	Integer deleteTagPost(@Param("s_num") Integer s_num); //태그 삭제
	
}
