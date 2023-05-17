package com.EatStamp.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * resve VO
 * @version 1.0
 * @since 2023.05.12
 * @author 이예지
 */

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ResveVO {

	int resve_num; //예약 번호
	int mem_num; //회원 번호
	int r_num; //가게 번호
	String resve_date; //예약날짜
	String resve_time; //예약시간
	int resve_memCnt; //예약인원
	String resve_chk; //예약알림확인
	String resve_sttus; //예약상태
	String resve_name; //예약자성함
	String resve_phoneNum; //예약자연락처
}
