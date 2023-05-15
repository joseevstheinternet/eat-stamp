package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;

/**
 * resve service
 * @version 1.1
 * @since 2023.05.15
 * @author 이예지
 */

public interface ResveService {

	/**
	 * <pre>
	 * 예약목록: 사장님 페이지의 예약 목록을 선택한다
	 * </pre>
	 * @date : 2023. 05. 12
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 12          이예지            최초작성
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<ResveVO> selectListResve(Map<String, Object> map) throws Exception;

	/**
	 * <pre>
	 * 예약개수: 사장님 식당의 예약 개수를 구한다
	 * </pre>
	 * @date : 2023. 05. 12
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 12          이예지            최초작성
	 * 2023. 05. 15			 이예지			 Type 변경
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int selectResveCnt(Map<String, Object> map) throws Exception;
	
	/**
	 * <pre>
	 * 예약상태: 예약 목록에서 예약 상태를 업데이트한다
	 * </pre>
	 * @date : 2023. 05. 12
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 12          이예지            최초작성
	 * 2023. 05. 15			 이예지			 Type 변경
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public int updateResveStatus(Map<String, Object> map) throws Exception;
	
	/**
	 * <pre>
	 * 식당설정: 사장님의 식당 예약 설정을 선택한다
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
	public RestVO selectOwnerSetting(String r_name) throws Exception;

	/**
	 * <pre>
	 * 식당설정변경: 사장님의 식당 예약 설정을 업데이트한다
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
	public void updateOwnerSetting(RestVO rest) throws Exception;
}
