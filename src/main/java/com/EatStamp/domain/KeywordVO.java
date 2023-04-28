package com.EatStamp.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KeywordVO {
	
	private int k_num; //키워드 번호
	private String k_word; //키워드
	private int frequency; //키워드의 빈도
	private int mem_num; //회원번호
}
