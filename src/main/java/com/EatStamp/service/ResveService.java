package com.EatStamp.service;

import java.util.List;
import java.util.Map;

import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;

/**
 * resve service
 * @version 1.4
 * @since 2023.05.18
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
	
	/**
	 * <pre>
	 * 식당정보선택: 회원의 식당 예약을 위해 식당 정보를 선택한다.
	 * </pre>
	 * @date : 2023. 05. 16
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 16          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @return
	 * @throws Exception
	 */
	public RestVO selectRestSetting(int r_num) throws Exception;
	
	/**
	 * <pre>
	 * 식당예약: 회원이 식당 예약을 하면 예약 테이블에 데이터를 삽입한다.
	 * </pre>
	 * @date : 2023. 05. 16
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 16          이예지            최초작성
	 * -------------------------------------------------
	 * @param resve
	 * @throws Exception
	 */
	public void insertRestResve(ResveVO resve) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 타임 슬롯 비활성화를 위한 날짜에 따른 타임별 예약 수 구하기
	 * </pre>
	 * @date : 2023. 05. 17
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 17          이예지            최초작성
	 * 2023. 05. 18          이예지            타입변경
	 * -------------------------------------------------
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectResveCntByDate(Map<String, Object> map) throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 예약내역 리스트 확인 시 미확인 여부 알림 코드 업데이트
	 * </pre>
	 * @date : 2023. 05. 18
	 * @author : 최은지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 18          최은지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @return
	 * @throws Exception
	 */
	public int updateAlertCheckAfter( int r_num )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 회원 예약내역 총 개수 세기
	 * </pre>
	 * @date : 2023. 05. 18
	 * @author : 최은지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 18          최은지            최초작성
	 * -------------------------------------------------
	 * @param mem_num
	 * @return
	 * @throws Exception
	 */
	public int getCountMemberResve( int mem_num )throws Exception;
	
	/**
	 * <pre>
	 * 처리내용 : 회원 예약내역 리스트 가져오기
	 * </pre>
	 * @date : 2023. 05. 18
	 * @author : 최은지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 18          최은지            최초작성
	 * -------------------------------------------------
	 * @param mem_num
	 * @return
	 * @throws Exception
	 */
	public  List<Map<String, Object>> selectMemberResveList( int mem_num )throws Exception;
}
