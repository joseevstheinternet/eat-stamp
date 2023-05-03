package com.EatStamp.web;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;
import com.EatStamp.service.MemberAdminService;
import com.common.utils.PagingUtil;
import com.google.gson.Gson;

@Controller
public class MemberAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);
	private final int rowCount = 10;
	private final int pageCount = 10;
	
	@Autowired
	private MemberAdminService memberService;
	
	//메시지 전달용 객체 생성
	String message = null;
	
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
	
	
	//0428 최은지 관리자 신고 페이지 이동 + 리스트 출력
	@RequestMapping("/reportListAdmin.do")
	public ModelAndView goReportListAdmin(@RequestParam(value = "pageNum",defaultValue = "1") int currentPage) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		List<ReportVO> list = null;
		Map<String,Object> map = new HashMap<>();
		
		int count = memberService.selectReportRowCount(map);
		
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,"/reportListAdmin.do");
		
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			//리스트 조회
			list = memberService.getReportAdminList(map);
			
			map.put("list", list);
		}
		
		//업데이트 리스트
		List<ReportVO> updatedList = new ArrayList<>();
				
		//회원 닉네임+이메일 추가 조회
			for (ReportVO reportVO : list) {
				   int mem_num1 = reportVO.getMem_num(); //신고자
				   int mem_num2 = reportVO.getMem_num2(); //피신고자
				    
				    //기존 vo조회값 백업
				    int report_num = reportVO.getReport_num();
				    String report_why = reportVO.getReport_why();
				    String report_ynCode = reportVO.getReport_ynCode();
				    int s_num = reportVO.getS_num();
				    int cmt_num = reportVO.getCmt_num();
				    String report_return = reportVO.getReport_return();
				    
				   //신고 회원 조회
				    reportVO = memberService.getMemselectOne(mem_num1);
				   String mem_nick = reportVO.getMem_nick();
				   String mem_email = reportVO.getMem_email();
				   
				   
				   //피신고 회원 조회
				   ReportVO reportVO2 = new ReportVO();
				   reportVO2.setMem_num2(mem_num2);
				   
				   reportVO2 = memberService.getMemselectTwo(mem_num2);
				   String mem_nick2 = reportVO2.getMem_nick();
				   
				   //다시 값 세팅
				   	reportVO.setMem_num(mem_num1);
				   	reportVO.setMem_num2(mem_num2);
				    reportVO.setMem_nick(mem_nick);
				    reportVO.setMem_nick2(mem_nick2);
				    reportVO.setReport_num(report_num);
				    reportVO.setReport_why(report_why);
				    reportVO.setReport_ynCode(report_ynCode);
				    reportVO.setS_num(s_num);
				    reportVO.setCmt_num(cmt_num);
				    reportVO.setReport_return(report_return);
				    
				    updatedList.add(reportVO);
				    
				}
				
				mav.addObject("count", count);
				mav.addObject("list", list);
				mav.addObject("list", updatedList);
				mav.addObject("page", page.getPage());
				mav.setViewName("reportListAdmin");
		
		return mav;
		
	}//goReportListAdmin end
	
	
	//0502 최은지 신고 상세 정보 조회(모달창)
		@ResponseBody
		@RequestMapping("/getReportDetail.do")
		public String getReportDetail(@RequestParam(value = "report_num") int report_num) throws Exception {
			
			//vo 생성하고 값 세팅
			ReportVO vo = new ReportVO();
			vo.setReport_num(report_num);
			
			ReportVO detailList = memberService.getReportDetailContent(vo);
			
			String jsonData = new Gson().toJson(detailList);
			
			return jsonData;
			
		}//신고 상세 end
		
		
		//0502 최은지 신고 처리하기
		@RequestMapping("/insertReportAdmin.do")
		public ModelAndView insertReport(HttpServletResponse response,
											@RequestParam(value = "report_num") int report_num,
											@RequestParam(value = "report_return") String report_return,
											@RequestParam(value = "mem_email1") String mem_email1) throws Exception {

			ModelAndView mav = new ModelAndView();
			String text = "";
			
			//반려사유가 입력되지 않았을 때(승인 처리)
			if(report_return.equals(text)) {
				
				MemberVO vo = new MemberVO();
				vo.setMem_email(mem_email1);
				
				int result = memberService.acceptReport(vo);
				
				if(1==result) { //1차 업뎃 성공 시
					
					//2차 코드 업뎃
					int result2 = memberService.changeCode(report_num);
					
					if(1 == result2) {//코드 업뎃까지 성공 시
						
						message = "해당 신고 요청이 승인 처리되었습니다.";
			            response.setContentType("text/html; charset=UTF-8");
			            PrintWriter out = response.getWriter();
			            out.println("<script>alert('"+ message +"');</script>"); 
			            out.println("<script>location.replace('/reportListAdmin.do');</script>");
			            out.flush();
					}else {
						System.out.println("승인 2차 오류메시지 추가하기");
					}
					
				}else { //1차 업뎃 실패 시
					System.out.println("승인 1차 오류메시지 추가하기");
				}
				
				return mav; //승인 시 return
				
			//반려사유가 입력되었을 때(반려 처리)
			}else {
				
				ReportVO vo = new ReportVO();
				vo.setReport_num(report_num);
				vo.setReport_return(report_return);
				
				int result = memberService.denidedReport(vo);
				
				if(1 == result) {//반려요청 처리 성공 시
					message = "해당 신고 요청이 반려 처리되었습니다.";
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('"+ message +"');</script>"); 
		            out.println("<script>location.replace('/reportListAdmin.do');</script>");
		            out.flush();
					
				}else { //반려요청 처리 실패 시
					System.out.println("반려 처리 메시지 추가하기");
				}				
				return mav; //반려 시 return

			}//리턴 내용 분기 end
		
		}//신고 상세 end
		
}
