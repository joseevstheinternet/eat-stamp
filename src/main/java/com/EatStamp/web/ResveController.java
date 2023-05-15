package com.EatStamp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.OwnerInfoVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.ResveVO;
import com.EatStamp.service.ResveService;
import com.common.utils.PagingUtil;

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
	
	
	
}
