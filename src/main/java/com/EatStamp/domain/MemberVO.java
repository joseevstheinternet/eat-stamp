package com.EatStamp.domain;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberVO {

	private int mem_num; //회원 고유 번호
	
	@NotBlank(message = "이메일은 필수 입력 항목입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String mem_email; //회원 가입 이메일 + 카카오
	
	//@NotBlank(message = "비밀번호는 필수 입력 항목입니다.")
	//@Pattern(regexp = "(^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$)", 
			//	message = "비밀번호는 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.")
	private String mem_pw; //회원 비밀번호
	
	private String mem_birth; //회원 생년월일 + 카카오
	private String mem_nick; //회원 닉네임 + 카카오
	private String mem_genderCode; //회원 성별 코드 (f/m) + 카카오
	private String mem_profileCode; //회원 프로필 아이콘 코드 (female/male)
	private String mem_branchCode; //회원 구분 코드 (common/kakao)
	private String mem_mail_key; //비밀번호 찾기 시 인증코드 
	private int mem_mail_auth; //비밀번호 찾기 시 인증 권한 변경 용도
	
	//<0403 최은지 비밀번호 입력값 체크용 컬럼> DB에는 존재 X
	private String mem_pwCheck;
	
	//<0403 최은지 비밀번호 인증번호 저장 컬럼
	private int mem_auth_pwEmail;
	
	private int mem_admin_auth;

	
}
