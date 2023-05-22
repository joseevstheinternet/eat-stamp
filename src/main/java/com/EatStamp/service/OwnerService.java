package com.EatStamp.service;

import java.util.List;
import java.util.Map;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.SearchVO;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
public interface OwnerService {
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 받아오기
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectOwnerInfoLoginCheck( MemberVO vo ) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 받아오기
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public MemberVO selectOwnerPW( MemberVO memberVO ) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 변경
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public int updateOwnerPW( MemberVO memberVO ) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 상호명 검색결과 개수 조회
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectRestRowCount( Map<String,Object> map )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 상호명 검색결과 조회
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<SearchVO> selectRestList( Map<String, Object> map )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 기존 가입여부 확인
	 * </pre>
	 * @date : 2023.05.16
	 * @author : 최은지
	 * @param r_name
	 * @return
	 * @throws Exception
	 */
	public RestVO getDuplSignUpCheck( String r_name )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 정보 DB등록
	 * </pre>
	 * @date : 2023.05.16
	 * @author : 최은지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	public int insertOwnerSignUpInfo( MemberVO memberVO )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 기존 가입여부 확인
	 * </pre>
	 * @date : 2023.05.22
	 * @author : 최은지, 이예지
	 * @param mem_nick
	 * @return
	 * @throws Exception
	 */
	public int updateRestInfoSignUp(String mem_nick)throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 시 이메일 유효 여부 확인용 인증 링크 전송
	 * </pre>
	 * @date : 2023.05.16
	 * @author : 최은지
	 * @param MemberVO
	 * @return
	 * @throws Exception
	 */
	 public void ownerOriginSignUpEmailSend( MemberVO vo ) throws Exception;
	 
	/**
	 * <pre>
	* 처리내용: 가게 사장 신규 회원가입 시 해당 가게 정보 DB 업데이트
	* </pre>
	* @date : 2023.05.16
	* @author : 최은지
	* @param restVO
	 * @return
	 * @throws Exception
	*/
	public int insertOwnerSignUpNewRestInfo( RestVO restVO )throws Exception;
	 
	/**
	 * <pre>
	* 처리내용: 사장 헤더 알림 갱신용 DB정보 조회
	* </pre>
	* @date : 2023.05.18
	* @author : 최은지
	* @param mem_nick
	 * @return
	 * @throws Exception
	*/
	public MemberVO getMemNickEqualRestName( String mem_nick )throws Exception;
	
	
	/**
	 * <pre>
	* 처리내용: 사장 헤더 알림 갱신용 미확인 알림 조회
	* </pre>
	* @date : 2023.05.18
	* @author : 최은지
	* @param r_num
	 * @return
	 * @throws Exception
	*/
	public int getCountUnidentifiedAlert( int r_num )throws Exception;

}
