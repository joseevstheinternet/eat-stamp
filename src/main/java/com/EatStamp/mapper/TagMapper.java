package com.EatStamp.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.apache.ibatis.annotations.Param;

import com.EatStamp.domain.TagVO;


@Mapper("tagMapper")
public interface TagMapper {
	TagVO findTagByContent(@Param("tag_content") String tag_content);
	Integer saveTag(@Param("tag_content") String tag_content);
}
