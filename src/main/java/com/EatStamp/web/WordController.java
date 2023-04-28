package com.EatStamp.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.StampVO;
import com.EatStamp.service.WordAnalysisService;

@Controller("WordController")
public class WordController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="WordAnalysisService")
	private WordAnalysisService wordAnalysisService;
	
	@RequestMapping(value = "analysis.do", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView analysis(HttpSession session) throws Exception {
		
		MemberVO user = (MemberVO)session.getAttribute("member");
		
		//log.info(this.getClass().getName() + ".inputForm !");
		
		//분석할 문장
		//String text = "떡볶이와 어묵은 순대 그리고 튀김과 같이 먹어야 한다. 양꼬치와 마라탕은 쯔란에 찍어 먹어야 한다.";
		
		//신조어 및 새롭게 생겨난 가수 및 그룹명은 제대로 된 분석이 불가능합니다.
		// 새로운 명사 단어들은 어떻게 데이터를 처리해야 할까?? => 데이터사전의 주기적인 업데이트

		//Map<String, Integer> rMap = wordAnalysisService.doWordAnalysis(text);
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("mem_num", user.getMem_num());
		
		Map<String, Integer> rMap = (Map<String, Integer>) wordAnalysisService.selectText(paramMap);

		
		if(rMap == null) {
			rMap = new HashMap<String, Integer>();
		}
		
		List<Map.Entry<String, Integer>> list = rMap.entrySet()
				.stream()
				.collect(Collectors.toList());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("rMap", rMap);
		return mav;
	}
	
}
