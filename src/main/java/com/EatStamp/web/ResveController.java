package com.EatStamp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;
import com.EatStamp.service.OwnerService;
import com.EatStamp.service.ResveService;
import com.common.utils.PagingUtil;
import com.google.gson.Gson;

/**
 * resve controller
 * @version 1.0
 * @since 2023.05.15
 * @author 이예지
 */
@Controller
public class ResveController {

	private static final Logger logger = LoggerFactory.getLogger(ResveController.class);
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	private ResveService resveService;
	
	/*서비스 빈 주입 */
	@Resource(name = "ownerService")
	public OwnerService ownerService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ResveVO initCommand() {
		return new ResveVO();
	}
	
	/**
	 * <pre>
	 * 예약목록: 사장님 페이지의 예약 목록을 출력한다
	 * </pre>
	 * @date : 2023. 05. 15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * 2023. 05. 18			 최은지			헤더 알림 확인용 UPDATE문 추가
	 * -------------------------------------------------
	 * @param session
	 * @param currentPage
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/owner/ownerResveList.do")
	public ModelAndView resveOwner (HttpSession session, 
									@RequestParam(value="pageNum",defaultValue="1") int currentPage) throws Exception {
		
		MemberVO owner = (MemberVO)session.getAttribute("owner");
				
	    /* 가게정보 조회 결과 확인용 vo객체 */
	    MemberVO checkRestInfo = new MemberVO();
	    /* 세션에서 받아올 mem_nick 문자 */
	    String mem_nick = null;
	    /* 가게 고유번호 숫자 */
	    int r_num = 0;
	    
		mem_nick = owner.getMem_nick(); 
		// 멤버 닉네임이 일치하는 상호명 조회 (가게 이름, 가게 고유번호),
		checkRestInfo = ownerService.getMemNickEqualRestName( mem_nick );
		r_num = checkRestInfo.getR_num();
		
		int updateCheckResveAlert = resveService.updateAlertCheckAfter( r_num ); //알림 확인 update
		System.out.println("???????????>>" + updateCheckResveAlert);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_nick", owner.getMem_nick());
		
		//총 예약 수
		int count = resveService.selectResveCnt(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, "/owner/ownerResveList.do");
		
		List<ResveVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = resveService.selectListResve(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/ownerResveList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	/**
	 * <pre>
	 * 예약상태변경: 사장님 페이지의 예약 상태를 업데이트한다
	 * </pre>
	 * @date : 2023. 05. 15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param resve_num
	 * @param resve_sttus
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/owner/updateResveStatus.do")
	@ResponseBody
	public String updateResveStatus (@RequestParam(value = "resve_num") int resve_num, 
									 @RequestParam(value = "resve_sttus") String resve_sttus) throws Exception {
		
		//파라미터를 Map에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("resve_num", resve_num);
		map.put("resve_sttus", resve_sttus);
		
		//회원 상태 업데이트 서비스 호출
		int result = resveService.updateResveStatus(map);
		
		//업데이트 결과에 따라 성공/실패 문자열 반환
		return (result > 0) ? "success" : "failure";
	}
	
	/**
	 * <pre>
	 * 식당관리: 사장님 페이지의 식당 관리 설정을 불러온다
	 * </pre>
	 * @date : 2023. 05. 15
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 15          이예지            최초작성
	 * -------------------------------------------------
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ownerRestSetting.do")
	public String ownerSettingForm (HttpSession session, Model model) throws Exception{
		
		MemberVO owner = (MemberVO)session.getAttribute("owner");
		String r_name = owner.getMem_nick();
		RestVO rest = resveService.selectOwnerSetting(r_name);
		
		model.addAttribute("rest", rest);
		
		return "owner/ownerRestSetting";
	}
	
	/**
	 * <pre>
	 * 식당설정변경: 사장님 페이지의 식당 관리 설정을 업데이트한다
	 * </pre>
	 * @date : 2023. 05. 16
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 16          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_resveCode
	 * @param r_resveTime
	 * @param r_resveDay
	 * @param r_resveMemCnt
	 * @param r_resveTableCnt
	 * @param session
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ownerRestSettingUpdate.do")
	@ResponseBody
	public String ownerSettingUpdate (String r_resveCode, int r_resveTime, int r_resveDay, int r_resveMemCnt, 
								int r_resveTableCnt, HttpSession session, HttpServletRequest request) throws Exception {
		
		try {
			MemberVO owner = (MemberVO)session.getAttribute("owner");
			String r_name = owner.getMem_nick();
			
			RestVO rest = resveService.selectOwnerSetting(r_name);
			
			rest.setR_resveCode(r_resveCode);
			rest.setR_resveDay(r_resveDay);
			rest.setR_resveTime(r_resveTime);
			rest.setR_resveMemCnt(r_resveMemCnt);
			rest.setR_resveTableCnt(r_resveTableCnt);
			
			resveService.updateOwnerSetting(rest);
			
			return "success";
			
			
		} catch (Exception e) {
			
			System.out.println("업데이트 중 에러 발생: " + e.getMessage());
	        return "fail";
		}
	}
	
	/**
	 * <pre>
	 * 예약일시 선택 폼: 회원 전용 예약일시 선택 폼
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
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/restResveForm={r_num}.do")
	public ModelAndView resveForm (@PathVariable int r_num, HttpSession session) throws Exception {
		
		logger.debug("<<r_num>> : " + r_num);
		RestVO rest = resveService.selectRestSetting(r_num);
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rest/restResveForm");
		mav.addObject("rest", rest);
		mav.addObject("member", member);
		
		return mav;
	}
	
	/**
	 * <pre>
	 * 예약정보 입력 폼: 회원 전용 예약정보 입력 폼
	 * </pre>
	 * @date : 2023. 05. 17
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 17          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @param selectedDate
	 * @param selectedTime
	 * @param selectedDay
	 * @param mem_num
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/restResveFormInfo={r_num}.do", method = RequestMethod.POST)
	public ModelAndView resveFormInfo (@PathVariable("r_num") int r_num,
										@RequestParam("selectedDate") String selectedDate,
										@RequestParam("selectedTime") String selectedTime,
										@RequestParam("selectedDay") String selectedDay,
										@RequestParam("mem_num") int mem_num,
										HttpSession session) throws Exception {

	    // selectedDate, selectedTime, r_num, mem_num을 사용하여 예약 정보를 처리
		
		logger.debug("<<r_num>> : " + r_num);
		RestVO rest = resveService.selectRestSetting(r_num);
		
		MemberVO member = (MemberVO) session.getAttribute("member");

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("rest/restResveFormInfo");
	    mav.addObject("selectedDate", selectedDate);
	    mav.addObject("selectedTime", selectedTime);
	    mav.addObject("selectedDay", selectedDay);
	    mav.addObject("rest", rest);
		mav.addObject("member", member);
	    
	    return mav;
	}
	
	/**
	 * <pre>
	 * 예약정보 전송 : 회원이 예약한 정보를 DB에 저장
	 * </pre>
	 * @date : 2023. 05. 17
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 17          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @param resve_date
	 * @param resve_time
	 * @param resve_memCnt
	 * @param resve_name
	 * @param resve_phoneNum
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/insertResve.do")
	@ResponseBody
	public String insertResve(@RequestParam int r_num, 
							  @RequestParam String resve_date,
							  @RequestParam String resve_time,
							  @RequestParam int resve_memCnt,
							  @RequestParam String resve_name,
							  @RequestParam String resve_phoneNum,
							  HttpSession session) throws Exception {
		
		try {
			int mem_num = ((MemberVO)session.getAttribute("member")).getMem_num();
			
			ResveVO resve = new ResveVO();
			
			resve.setR_num(r_num);
			resve.setMem_num(mem_num);
			resve.setResve_date(resve_date);
			resve.setResve_time(resve_time);
			resve.setResve_memCnt(resve_memCnt);
			resve.setResve_name(resve_name);
			resve.setResve_phoneNum(resve_phoneNum);
			
			System.out.println("예약내용: " + resve);
			
			resveService.insertRestResve(resve);
			
			return "success";
		} catch (Exception e) {
			
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail";
		}
	}

	/**
	 * <pre>
	 * 예약 완료 : 예약 완료 페이지
	 * </pre>
	 * @date : 2023. 05. 17
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 17          이예지            최초작성
	 * -------------------------------------------------
	 */
	@RequestMapping("/restResveFormSuccess.do")
	public String restResveFormSuccess () {
		
		return "rest/restResveFormSuccess";
	}
	
	/**
	 * <pre>
	 * 처리 내용 : 예약 불가능 표시를 위한 이미 예약된 내역 넘기기
	 * </pre>
	 * @date : 2023. 05. 18
	 * @author : 이예지
	 * @history :
	 * -------------------------------------------------
	 * 변경일                  변경자            변경내용
	 * -------------------------------------------------
	 * 2023. 05. 18          이예지            최초작성
	 * -------------------------------------------------
	 * @param r_num
	 * @param date
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getUnableTimes.do", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getUnableTimes(@RequestParam int r_num, @RequestParam String date) throws Exception {

	    logger.debug("<<r_num>>: " + r_num);
	    logger.debug("<<date>>: " + date);

	    Map<String, Object> map = new HashMap<>();
	    map.put("r_num", r_num);
	    map.put("date", date);

	    List<Map<String, Object>> reservationsByTime = resveService.selectResveCntByDate(map);
	    logger.debug("reservationsByTime: " + reservationsByTime);

	    String jsonData = new Gson().toJson(reservationsByTime);
	    
	    return jsonData;
	}

}
