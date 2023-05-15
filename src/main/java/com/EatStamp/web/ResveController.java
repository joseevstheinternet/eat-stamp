package com.EatStamp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.OwnerInfoVO;
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
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private ResveService resveService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public ResveVO initCommand() {
		return new ResveVO();
	}
	
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
	
	
	
	
	
	
	
}
