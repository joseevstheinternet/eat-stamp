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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.service.RestService;
import com.common.utils.PagingUtil;
import com.google.gson.Gson;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.StampVO;

@Controller
public class RestController {
	private static final Logger logger = LoggerFactory.getLogger(RestController.class);
	private int rowCount = 5;
	private int pageCount = 10;
	
	@Autowired
	private RestService restService;
	
	//자바빈(VO) 초기화
	@ModelAttribute
	public RestVO initCommand() {
		return new RestVO();
	}
	
	
	//==========찜한 식당 리스트=========//
	@RequestMapping("/rest_list.do")
	public ModelAndView process(
			HttpSession session,
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage) {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_num", user.getMem_num());
		
		//글의 총개수(검색된 글의 개수)
		int count = restService.selectLikeRowCount(map);
		logger.debug("<<count>> : " + count);
		
		//페이지 처리
		PagingUtil page = 
				new PagingUtil(currentPage,count,rowCount,pageCount,"/rest_list.do");
		
		List<RestVO> list = null;
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			list = restService.selectLikeList(map);
			
			map.put("list", list);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("rest_list");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
	}
	
	//==========식당 상세=========//
	
	//<0411 최은지>
	//가게 상세 페이지 이동 + 정보 전달
	@RequestMapping(value = "/rest_detail.do")
	public ModelAndView search(@RequestParam("r_num") int r_num,
												HttpSession session) throws Exception{
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		int mem_num = member.getMem_num();
		
		ModelAndView mav = new ModelAndView();
		
		//vo객체 생성해서 조회할 r_num값 set
		RestVO vo = new RestVO();
		vo.setR_num(r_num);
		vo.setMem_num(mem_num);
		
		
		//가게정보 받아오기
		RestVO list = restService.getRestDetailList(vo);
		
		//좋아요 여부 정보 받아오기 >>
		RestVO like_list = restService.getLikeRest(vo);
		
		//가게 정보 전달
		mav.addObject("list", list);
		
		//찜 여부 전달
		mav.addObject("like_list", like_list);
		
		//view페이지 설정
		mav.setViewName("rest/restDetailPage");
		
		return mav;
	}
	
	
	//<0411 최은지 가게 찜하기
	@ResponseBody
	@RequestMapping(value = "/add_rest_like.do")
		public String add_like(@RequestParam("r_num") int r_num, HttpSession session) throws Exception{
		
		//세션에서 mem_num받아오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		int mem_num =  member.getMem_num();
		
		//vo 생성하고 값 세팅
		RestVO vo = new RestVO();
		
		vo.setMem_num(mem_num);
		vo.setR_num(r_num);
		
		//서비스 실행
		int result = restService.add_rest_like(vo);
		
		String sResult = Integer.toString(result);
		
		return sResult;
	}
	
	//<0412 최은지 가게찜하기 취소용 r_like_num callback>
	@ResponseBody
	@RequestMapping(value = "/plus_rest_like.do")
	public String add_like_num(@RequestParam("r_num") int r_num, 
											HttpSession session) throws Exception{
		
		//세션에서 mem_num받아오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		int mem_num =  member.getMem_num();
		
		//vo 생성하고 값 세팅
		RestVO vo = new RestVO();
		
		vo.setMem_num(mem_num);
		vo.setR_num(r_num);
		
		String list = restService.get_plusRlike(vo);
		
		System.out.println("추가로받아오기1!!!!!!!!!!!!!!!!!!!!!" + list);
		
		String json = new Gson().toJson(list);
		
		return json;
	}
	
	//<0411 최은지 가게 찜하기 취소
	@ResponseBody
	@RequestMapping(value = "/delete_rest_like.do")
		public String delete_like(@RequestParam("r_num") int r_num, 
											@RequestParam("r_like_num") int r_like_num, 
											HttpSession session) throws Exception{
		
		System.out.println("가게찜 삭제 컨트롤러실행!!!!!!!!!!!!!!!!");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		int mem_num =  member.getMem_num();
		
		//vo 생성하고 값 세팅
		RestVO vo = new RestVO();
		
		vo.setMem_num(mem_num);
		vo.setR_num(r_num);
		vo.setR_like_num(r_like_num);
		
		int result = restService.delete_rest_like(vo);
		
		String sResult = Integer.toString(result);
		
		return sResult;
	}
		
		
	
	
}
