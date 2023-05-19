package com.EatStamp.service;

import com.EatStamp.domain.RestVO;

/**
 * restOwner service
 * @version 1.0
 * @since 2023.05.19
 * @author 이예지
 */

public interface RestOwnerService {

	/**
	 * <pre>
	 * 처리내용: 사장님 가게의 상세 정보를 선택한다
	 * </pre>
	 * @date : 2023. 05. 19
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 19          이예지            최초작성
	 * -------------------------------------------------
	 * @param rest
	 * @return
	 * @throws Exception
	 */
	public RestVO getRestOwnerDetail(String mem_nick) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용: 사장님 가게의 상세 정보를 업데이트한다
	 * </pre>
	 * @date : 2023. 05. 19
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 19          이예지            최초작성
	 * -------------------------------------------------
	 * @param rest
	 * @return
	 * @throws Exception
	 */
	public int updateRestOwner(RestVO rest) throws Exception;
	
}
