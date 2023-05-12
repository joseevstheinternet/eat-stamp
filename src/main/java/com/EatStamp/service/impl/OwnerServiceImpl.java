package com.EatStamp.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.mapper.OwnerMapper;
import com.EatStamp.service.OwnerService;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Service("ownerService")
public class OwnerServiceImpl implements OwnerService {
	
	/* 매퍼 빈 주입 */
	@Resource(name = "ownerMapper")
	private OwnerMapper ownerMapper;

	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 처리
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.12					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@Override
	public MemberVO selectOwnerInfoLoginCheck(MemberVO vo) throws Exception {
			
		return ownerMapper.selectLoginOwnerInforCheck(vo);
	}
	
	
}
