package com.EatStamp.service;

import java.util.List;
import java.util.Map;
import com.EatStamp.domain.MemberVO;
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
	public MemberVO selectOwnerInfoLoginCheck(MemberVO vo) throws Exception;
	
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
	public MemberVO selectOwnerPW(MemberVO memberVO) throws Exception;
	
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
	public int updateOwnerPW(MemberVO memberVO) throws Exception;
	
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
	public int selectRestRowCount(Map<String,Object> map)throws Exception;
	
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
	public List<SearchVO> selectRestList(Map<String, Object> map)throws Exception;
}
