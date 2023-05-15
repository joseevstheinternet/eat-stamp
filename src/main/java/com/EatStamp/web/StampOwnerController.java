package com.EatStamp.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.CmtVO;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ResveVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.service.StampOwnerService;
import com.EatStamp.service.StampService;
import com.common.utils.PagingUtil;
import com.common.utils.StringUtil;
import com.google.gson.Gson;

/**
 * stampOwner controller
 * @version 1.0
 * @since 2023.05.15
 * @author 이예지
 */
@Controller
public class StampOwnerController {

	private static final Logger logger = LoggerFactory.getLogger(ResveController.class);
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Autowired
	public StampOwnerService stampOwnerService;
	
	@Autowired
	private StampService stampService;
	
	/**
	 * <pre>
	 * 가게리뷰: 사장님 가게의 리뷰 목록을 출력한다
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
	 * @param searchType
	 * @param searchKeyword
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/owner/ownerStampList.do")
	public ModelAndView stampOwner (HttpSession session, 
									@RequestParam(value="pageNum",defaultValue="1") int currentPage,
									@RequestParam(value = "searchType", defaultValue = "") String searchType,
									@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) throws Exception {
		
		MemberVO owner = (MemberVO)session.getAttribute("owner");
		
		Map<String, Object> map = new HashMap<>();
		map.put("mem_nick", owner.getMem_nick());
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		//총 예약 수
		int count = stampOwnerService.selectOwnerStampCnt(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = new PagingUtil(currentPage, count, rowCount, pageCount, "/owner/ownerStampList.do");
		
		List<StampVO> list = null;
		if (count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = stampOwnerService.selectOwnerStampList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/ownerStampList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//========글상세===========//
	@RequestMapping("/owner/ownerStampDetail.do")
	public ModelAndView detail (@RequestParam int s_num, HttpSession session) throws Exception {

		logger.debug("<<s_num>> : " + s_num);
		StampVO stamp = stampService.selectStamp(s_num);
		stampService.updateViewCnt(s_num);
		int cmtCnt = stampService.selectCmtCount(s_num);
		
		MemberVO member = (MemberVO) session.getAttribute("owner");

		// 제목에 태그를 허용하지 않음
		stamp.setS_title(StringUtil.useBrNoHtml(stamp.getS_title()));

		// 뷰 이름 속성명 속성값
		ModelAndView mav = new ModelAndView();
		mav.setViewName("owner/ownerStampDetail");
		mav.addObject("stamp", stamp);
		mav.addObject("member", member);
		mav.addObject("cmtCnt", cmtCnt);
		
		return mav;
	}
	
	//===========댓글 목록=============//
	@RequestMapping("/owner/listCmt.do")
	@ResponseBody
	public String listCmt(@RequestParam int s_num, HttpSession session) throws Exception {
		
		logger.debug("<<s_num>>: " + s_num);
		
		int cmt = stampService.selectCmtCount(s_num);
		
		List<CmtVO> list = null;
		if(cmt > 0) {
			list = stampService.selectCmtList(s_num);
			
		}else {
			list = Collections.emptyList();
		}
		
		Map<String, Object> mapAjax = new HashMap<>();
		mapAjax.put("cmt", cmt);
		mapAjax.put("cmtList", list);
		
		//로그인한 회원정보 세팅
		MemberVO user = (MemberVO)session.getAttribute("owner");
		if(user!=null) {
			mapAjax.put("mem_num", user.getMem_num());
		}
		
		String jsonData = new Gson().toJson(mapAjax);
				
		return jsonData;
	}
	
	//===========댓글 등록===========//
	@RequestMapping("/owner/writeCmt.do")
	@ResponseBody
	public String writeCmt(@RequestParam int s_num, String cmt_content, 
				HttpSession session, HttpServletRequest request) throws Exception {
		
		try {
			int mem_num = ((MemberVO)session.getAttribute("owner")).getMem_num();
			
			CmtVO cmt = new CmtVO();
			
			cmt.setCmt_content(cmt_content);
			cmt.setReg_date(null);
			cmt.setCmt_ip(request.getRemoteAddr());
			cmt.setS_num(s_num);
			cmt.setMem_num(mem_num);
			
			System.out.println("cmt: " + cmt);
			
			stampService.insertCmt(cmt);
			
			return "success";
		} catch (Exception e) {
			
			System.out.println("업로드 중 에러 발생: " + e.getMessage());
			return "fail";
		}
	}
	
	
	//===========댓글 수정===========//
	@RequestMapping("/owner/updateCmt.do")
	@ResponseBody
	public String modifyCmt(@RequestParam int cmt_num, String cmt_content, 
				HttpSession session, HttpServletRequest request) throws Exception {
		
		try {
			CmtVO cmt = stampService.selectCmt(cmt_num);
			
			cmt.setCmt_content(cmt_content);
			cmt.setReg_date(null);
			
			stampService.updateCmt(cmt);
			
			return "success";
			
			
		} catch (Exception e) {
			
			System.out.println("업데이트 중 에러 발생: " + e.getMessage());
	        return "fail";
		}
	}
	
	
	//===========댓글 삭제===========//
	@RequestMapping("/owner/deleteCmt.do")
	@ResponseBody
	public String deleteCmt(@RequestParam int cmt_num, HttpSession session) throws Exception {
		
		try {
			stampService.deleteCmt(cmt_num);
			
			return "success";
			
		} catch (Exception e) {
			System.out.println("업데이트 중 에러 발생: " + e.getMessage());
	        return "fail";
		}
	}
	
}
