package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.StampVO;

/**
 * stampOwner service
 * @version 1.0
 * @since 2023.05.15
 * @author 이예지
 */

public interface StampOwnerService {

	/**
	 * <pre>
	 * 리뷰관리: 사장님 가게의 리뷰 목록 출력
	 * </pre>
	 * @date : 2023. 05. 15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<StampVO> selectOwnerStampList(Map<String, Object> map) throws Exception;
	
	/**
	 * <pre>
	 * 리뷰개수: 사장님 가게의 리뷰 개수 구하기
	 * </pre>
	 * @date : 2023. 05. 15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectOwnerStampCnt(Map<String,Object> map) throws Exception;
	
}
