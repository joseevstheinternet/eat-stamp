package com.EatStamp.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.SearchForm;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.service.SearchService;
import com.common.utils.PagingUtil;
import com.common.utils.ResultUtil;
import com.google.gson.Gson;

//<0404 최은지 최초 생성>

@Controller
public class SearchController {

	@Resource(name = "searchService")
	private SearchService service;
	
	private int rowCount = 5;
	private int pageCount = 10;
	
	//<0404 최은지>
	//검색 페이지 이동
	@RequestMapping(value = "/search.do")
	public String search(MemberVO vo, 
								HttpSession session,
								Model model) throws Exception{
		
		return "searchPage";
	}
	
	
	//<0404 최은지>
	//검색 로직 실행 >>내 글에서 검색(기본 설정)
	@ResponseBody
	@RequestMapping(value = "/search_stampCheck.do", method = RequestMethod.POST, produces = "application/text; charset=utf8" )
	public String search_check_stamp(HttpSession session, 
													SearchForm form,
													HttpServletResponse response,
													HttpServletRequest request) throws Exception {
		
			
		//세션에서 넘버값 받아오기
		MemberVO vo = (MemberVO)session.getAttribute("member");
				
		//#문자열 구분하기 위해 파라미터값을 담아서 변수 지정
		String hash_markOff = form.getSearch_keyword(); 
		
		//파싱용 해시태그 정규식 패턴 생성 >> 테스트
		Pattern pattern = Pattern.compile("#(\\S+)");
		
		//들어온 검색어에 #(해시태그용 검색)이 있다면
		if(hash_markOff.contains("#")) {
			
			//패턴 검사
			Matcher matcher = pattern.matcher(hash_markOff);
			
			List<String> tags = new ArrayList<String>();
			
			//반복문 사용해서 일치하는 문자열 등록
			while (matcher.find()) {
				tags.add(matcher.group(1));
			}
			
			System.out.println("해시태그 파싱 결과>>>> " + tags.toString()); //# 떨어진 파싱값 확인 
			
			//util사용하기 전에 #떨어진 문자열 form에 set
		
			form.setTag_list(tags);
			
			form.setSearch_keyword(tags.toString());

			ResultUtil resultUtils = service.getTagSearchList(form);
			
			// json 파싱해서 넘기기
			String json = new Gson().toJson(resultUtils);
			
			return json;
			
		}else { //해시태그 검색이 아니라면
			
			ResultUtil resultUtils = service.getNomalSearchList(form);
			
			// json 파싱해서 넘기기
			String json = new Gson().toJson(resultUtils);
			
			return json;
		}
	} //일반 검색end
	
	
	
	//<0407 최은지 가게 정보 검색>
	@ResponseBody
	@RequestMapping(value = "/search_restCheck.do", method = RequestMethod.POST, produces = "application/text; charset=utf8" )
	public String search_check_rest(HttpSession session,
												SearchForm form, 
												HttpServletResponse response, 
												HttpServletRequest request) throws Exception {
		
		ResultUtil resultUtils = service.getRestSearchList(form);
		
		String json = new Gson().toJson(resultUtils);
		
		return json;
	}
	
	
	//0410최은지 추천 해시태그 출력
		@ResponseBody
		@RequestMapping(value = "/get_recommendTag.do", method = RequestMethod.POST, produces = "application/text; charset=utf8" )
		public String get_tag_list(@RequestParam("mem_num") int mem_num,
											HttpSession session, 
											HttpServletResponse response, 
											HttpServletRequest request) throws Exception {
			
				List<SearchVO> result = service.getRecommendTag(mem_num);
			
				String json = new Gson().toJson(result);
				
				return json;
		}
		
		
		//0410최은지 해시태그 클릭 시 검색
		@RequestMapping(value = "/tag_semiSearch.do", method = RequestMethod.GET )
		public ModelAndView get_tag_semiSearch(@RequestParam("mem_num") int mem_num,
																    @RequestParam("tag_content") String tag_content, 
																	HttpSession session, 
																	HttpServletResponse response, 
																	HttpServletRequest request, 
																	SearchForm form,
																	@RequestParam(value="pageNum",defaultValue="1") int currentPage) throws Exception {
		
			//맵 생성해서 필요한 값 넣기
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("mem_num", mem_num);
			map.put("tag_content", tag_content);
			
			//service단에서 count받아오게 수정해서 페이징하기
			int count = service.selectClickTagRowCount(map);
			
			//페이징 처리
			PagingUtil page = 
					new PagingUtil(currentPage,count,rowCount,pageCount,"/tag_semiSearch.do");
			
			
			List<SearchVO> list = null;
			if(count > 0) {
				map.put("start", page.getStartRow());
				map.put("end", page.getEndRow());
				
				list = service.getClickTagSearchList(map);
				
				map.put("list", list);
			}
			
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list", list);
			mav.addObject("count", count);
			mav.addObject("page", page.getPage());
			mav.setViewName("tagFindPage");
			
			return mav;
			
		}
		
	
	
}
