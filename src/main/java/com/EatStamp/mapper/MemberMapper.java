package com.EatStamp.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;
import com.EatStamp.domain.StampVO;

@Mapper("memberMapper")
public interface MemberMapper {
	
	//<0324 최은지> 로그인 체크
	public MemberVO login_check(MemberVO memberVO) throws Exception;
	 
	//<0327 최은지> 이메일 인증용 랜덤번호 저장
	public int update_mail_key(MemberVO memberVO) throws Exception;
	 
	//<0327 최은지> 이메일 인증용 컬럼값 변경
	public int update_mail_auth(MemberVO memberVO) throws Exception;
	 
	//<0327 최은지> 이메일 인증여부 확인
	public int email_auth_fail(String email) throws Exception;
	 
	//<0327 최은지> 회원가입
	public int insertMember(MemberVO memberVO);
	 
	 //<0329 최은지> 카카오 로그인 시 회원 정보 검색
	public MemberVO find_kakao(HashMap<String, Object>userInfo);
	 
	//<0329 최은지> 카카오 로그인 시 정보 없을 경우, 해당 회원 정보 member테이블에 등록
	public void kakao_insert(HashMap<String, Object> userInfo); 
	
	//<0329 최은지> 카카오 회원 탈퇴 시 해당 회원 정보 삭제
	public void kakao_delete(MemberVO memberVO)throws Exception;
	
	//<0330 최은지> 회원가입 시 실시간 이메일 중복 체크 
	public int emailDuplCheck(String mem_email);
	
	//<0403 최은지> 카카오 회원 일반 로그인 시도 여부 체크
	public int login_kakaoCheck(String mem_email);
	
	//<0403 최은지> 비밀번호 찾기 시 이메일 존재여부 조회
	public int find_pwEmail(String mem_email);	
	
	//<0403 최은지> 비밀번호 찾기 시 인증번호 업데이트
	public int update_pwd_find_mail_key(MemberVO MemberVO) throws Exception;	
	
	//<0403 최은지> 비밀번호 찾기 시 db컬럼 조회
	public String comparison_code(String mem_email);
	
	//<0404 최은지> 비밀번호 재설정
	public int reset_pw(MemberVO MemberVO);
	
	//<0410 최은지> 회원 탈퇴
	public int delete_member(MemberVO MemberVO);
	
	//<0410 최은지> 회원 탈퇴용 비밀번호 조회
	public MemberVO delete_member_check(MemberVO MemberVO);
	
	//<0412 이예지> 회원 정보 조회
	public MemberVO selectMember(Integer mem_num);
	
	//<0428 최은지> 관리자 이메일 확인
	public int selectAdminOkay(String mem_email);
	
	//<0508 최은지 회원 신고 리스트 조회
	public List<ReportVO>selectMemberReportList(Map<String, Object> map)throws Exception;
	
	//<0508 최은지 회원 신고 리스트 개수 세기
	public int selectMemberReportRowCount(Map<String, Object> map)throws Exception;
	 
	//<0508 최은지 회원 신고 취소>
	public int deleteReportMember(ReportVO vo)throws Exception;
	
	//<0508 최은지 정지회원 검사>
	public int checkBlockMember(String mem_email)throws Exception;
}

