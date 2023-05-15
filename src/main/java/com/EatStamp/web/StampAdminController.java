package com.EatStamp.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.service.StampAdminService;
import com.EatStamp.service.TagAdminService;
import com.common.utils.PagingUtil;
import com.common.utils.StringUtil;
import com.EatStamp.domain.StampVO;

@Controller
public class StampAdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(StampAdminController.class);
	private final int rowCount = 10;
	private final int pageCount = 10;
	
	@Autowired
	private StampAdminService stampService;
	
	@Autowired
	private TagAdminService tagService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public StampVO initCommand() {
		return new StampVO();
	}
	
	//=========글 목록========//
	@RequestMapping("/stampListAdmin.do")
	public ModelAndView process(
			@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword) throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		//글의 총개수(검색된 글의 개수)
		int count = stampService.selectRowCount(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page =
				new PagingUtil(currentPage, count, rowCount, pageCount, "/stampListAdmin.do");
		
		List<StampVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = stampService.selectList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/stampListAdmin");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//=========글 상세========//
	@RequestMapping("/stampDetailAdmin.do")
	public ModelAndView detail(@RequestParam int s_num) throws Exception {
		
		logger.debug("<<s_num>> : " + s_num);
		StampVO stamp = stampService.selectStamp(s_num);
				
		//제목에 태그를 허용하지 않음
		stamp.setS_title(StringUtil.useBrNoHtml(stamp.getS_title()));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/stampDetailAdmin");
		mav.addObject("stamp", stamp);
		
		return mav;
	}
	
	//=========글 삭제========//
	@RequestMapping("/stampDeleteAdmin.do")
	public String submitDelete(
					@RequestParam int s_num,
					Model model,
					HttpServletRequest request) throws Exception {
		
		logger.debug("<<글 삭제>> : " + s_num);
		
		//s_num을 기반으로 관련 태그 정보 삭제
		tagService.deleteTagPost(s_num);
		
		//글삭제
		stampService.deleteStamp(s_num);
		
		//View에 표시할 메시지
		model.addAttribute("message", "글 삭제 완료");
		model.addAttribute("url", request.getContextPath()+"/stampListAdmin.do");
		
		return "common/resultView";
	}
}