package com.EatStampAdmin.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStampAdmin.domain.MemberVO;
import com.EatStampAdmin.service.MemberService;
import com.EatStampAdmin.utils.PagingUtil;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private final int rowCount = 10;
	private final int pageCount = 10;
	
	@Autowired
	private MemberService memberService;
	
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//=========회원 목록========//
	@RequestMapping("/memberListAdmin.do")
	public ModelAndView process(
			@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchKeyword", defaultValue = "") String searchKeyword)throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchKeyword", searchKeyword);
		
		//글의 총개수(검색된 글의 개수)
		int count = memberService.selectMemRowCount(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page =
				new PagingUtil(currentPage, count, rowCount, pageCount, "/memberListAdmin.do");
		
		List<MemberVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = memberService.selectMemList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("memberListAdmin");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//=========회원 상태 변경========//
	@RequestMapping("/updateMemberStatus.do")
	@ResponseBody
	public String updateMemberStatus(@RequestParam(value = "mem_num") int mem_num, 
									 @RequestParam(value = "mem_admin_auth") int mem_admin_auth)throws Exception{
		
		//파라미터를 Map에 저장
		Map<String, Object> map = new HashMap<>();
		map.put("mem_num", mem_num);
		map.put("mem_admin_auth", mem_admin_auth);
		
		//회원 상태 업데이트 서비스 호출
		int result = memberService.updateMemberStatus(map);
		
		//업데이트 결과에 따라 성공/실패 문자열 반환
		return (result > 0) ? "success" : "failure";
	}
}
