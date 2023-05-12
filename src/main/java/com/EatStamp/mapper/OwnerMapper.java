package com.EatStamp.mapper;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.EatStamp.domain.MemberVO;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Mapper("ownerMapper")
public interface OwnerMapper {

	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 처리
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */	
	public MemberVO selectLoginOwnerInforCheck(MemberVO memberVO) throws Exception;
	
}
