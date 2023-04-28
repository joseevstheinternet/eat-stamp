package com.EatStamp.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class TagPostMappingVO {
	//Integer map_num;
	Integer tag_num;
	Integer s_num;
	String tag_content;
	
	public TagPostMappingVO(Integer tag_num, Integer s_num) {
		this.tag_num = tag_num;
		this.s_num = s_num;
	}
}
