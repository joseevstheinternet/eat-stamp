package com.EatStamp.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;
import java.time.LocalDate;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskRejectedException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.EatStamp.service.MemberService;
import com.EatStamp.service.RestService;
import com.EatStamp.service.StampService;
import com.EatStamp.service.WordAnalysisService;
import com.common.utils.PagingUtil;
import com.google.gson.Gson;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.ReportVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.StampVO;

@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	public MemberService service;
	
	@Autowired
	public StampService stampService;
	
	@Autowired
	public RestService restService;
	
	@Autowired
	public WordAnalysisService wordAnalysisService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	private final int rowCount = 10;
	private final int pageCount = 10;
	private String message = null;

	// 메인 페이지 작동
	@RequestMapping(value = "main.do", produces = "application/text; charset=utf8")
	public String main(MemberVO vo, StampVO stamp, HttpSession session, Model model, HttpServletRequest req,
			RedirectAttributes rttr) throws Exception {

		if (session.getAttribute("member") != null) {

			System.out.println("멤버값 있음>>>>>");
			MemberVO member = (MemberVO) session.getAttribute("member");

			model.addAttribute("member", member);
			
			//================StampVO 가져오기==============//
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mem_num", member.getMem_num());
			map.put("start", 1);
			map.put("end", 2);

			int count = stampService.selectRowCount(map);

			List<StampVO> stamp1 = null;
			stamp1 = stampService.selectList(map);

			model.addAttribute("count", count);
			model.addAttribute("stamp", stamp1);

			System.out.println("map: " + map);
			
			//================키워드 가져오기==============//
			//log.info(this.getClass().getName() + ".inputForm !");
			
			//분석할 문장
			//String text = "떡볶이와 어묵은 순대 그리고 튀김과 같이 먹어야 한다. 양꼬치와 마라탕은 쯔란에 찍어 먹어야 한다.";
			
			//신조어 및 새롭게 생겨난 가수 및 그룹명은 제대로 된 분석이 불가능합니다.
			// 새로운 명사 단어들은 어떻게 데이터를 처리해야 할까?? => 데이터사전의 주기적인 업데이트

			//Map<String, Integer> rMap = wordAnalysisService.doWordAnalysis(text);
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("mem_num", member.getMem_num());
			
			Map<String, Integer> rMap = (Map<String, Integer>) wordAnalysisService.selectText(paramMap);

			
			if(rMap == null) {
				rMap = new HashMap<String, Integer>();
			}
			
			List<Map.Entry<String, Integer>> list = rMap.entrySet()
					.stream()
					.collect(Collectors.toList());
			
			model.addAttribute("rMap", rMap);
			
			//================키워드 기반 추천 식당 가져오기==============//
			Map<String, Object> comMap = new HashMap<String, Object>();
			Object[] keyArray = rMap.keySet().toArray();
			
			for (int i = 0; i < 8; i++) {
				if(i < keyArray.length) {
					comMap.put("k" + (i + 1), keyArray[i]);
				}else {
					comMap.put("k" + (i + 1), "null"); 
					//분석할 text가 없어서 rMap에 key가 안 들어가 있을 때 default value 넣어 줌
				}
			}
			
			comMap.put("start", 1);
			comMap.put("end", 2);
			
			System.out.println("comMap: " + comMap);
			
			int recCount = restService.selectRecRowCount(comMap);
			System.out.println(recCount);
			
			List<RestVO> recRest = null;
			recRest = restService.selectRecList(comMap);
			
			model.addAttribute("recRest", recRest);
			model.addAttribute("recCount", recCount);
			
			//================찜한 식당 가져오기==============//
			int likeCount = restService.selectLikeRowCount(map);

			List<RestVO> likeRest = null;
			likeRest = restService.selectLikeList(map);

			model.addAttribute("likeCount", likeCount);
			model.addAttribute("likeRest", likeRest);
			
			//================RestVO 가져오기==============//
			
			Random random = new Random();
			int randomNumber = random.nextInt(340) + 1; // 1~341 범위의 랜덤 숫자 생성
			
            Map<String, Object> restMap = new HashMap<String, Object>();
            restMap.put("start", randomNumber);
            restMap.put("end", randomNumber+1);

            List<RestVO> rest1 = null;
            rest1 = restService.selectRestList(restMap);
            
            model.addAttribute("rest", rest1);
			
		} else {
			System.out.println("멤버값 없음>>>>>");
			
			//================RestVO 가져오기==============//
			
			Random random = new Random();
			int randomNumber = random.nextInt(340) + 1; // 1~341 범위의 랜덤 숫자 생성
			
            Map<String, Object> restMap = new HashMap<String, Object>();
            restMap.put("start", randomNumber);
            restMap.put("end", randomNumber+1);

            List<RestVO> rest1 = null;
            rest1 = restService.selectRestList(restMap);
            
            model.addAttribute("rest", rest1);
		}

		return "main";
	}
		
	
	// <0323 최은지>로그인 페이지 이동
	@RequestMapping(value = "/login.do")
		public String login() {
			return "login/login";
	}
	
	
	// <0323 최은지>회원가입 페이지 이동
	@RequestMapping(value = "/join.do")
		public String join() {
			return "login/join";
	}
	
  // <0403 최은지> 비밀번호 찾기 페이지 이동
	@RequestMapping(value = "/findPassword.do")
	public String findPw() {
		return "/login/pwFind";
	}
	
	
	// <0323 최은지>로그인 로직
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr, HttpServletResponse response) throws Exception {
		
		HttpSession session = req.getSession();
		MemberVO login = service.loginCheck(vo);
		boolean pwdMatch;
		String message = null;
		
			//0428 관리자 로그인 확인
			int admin_result = service.selectAdminOkay(vo.getMem_email());
				if(1 == admin_result) {
					message = "일반 회원은 접근 불가능한 이메일입니다.";
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('"+ message +"');</script>");
		            out.flush();
		            
		            return "login/login";
				}else { //일반 회원 로그인일 시 
					
				 //카카오 회원의 일반 로그인 시도 검사
				    int kakao_result = service.login_kakaoCheck(vo.getMem_email());
				     	if(1 == kakao_result) {
				     		return "/login/kakaoLoginAlert";
				     		
				    	}else { //일반 회원이라면
				    		
				    		 //이메일 여부 조회	
							int result = service.find_pwEmail(vo.getMem_email());
							String sResult = Integer.toString(result);
							int finalResult = Integer.parseInt(sResult);
							
							if(finalResult != 1) {
								 return "/login/doNotFindEmail";
								 
							}else {
								//이메일 인증 했는지 확인
								if (1 != service.email_auth_fail(vo.getMem_email())) {
									return "/login/emailAuthFail";
									
								}else {
									//정지회원 여부 확인
									String mem_blockYn = vo.getMem_email();
									if(1 ==  service.check_block_member(mem_blockYn)) {
										
										message = "정지된 회원입니다. 문의사항은 하단의 관리자 이메일로 접수해주시기 바랍니다.";
							            response.setContentType("text/html; charset=UTF-8");
							            PrintWriter out = response.getWriter();
							            out.println("<script>alert('"+ message +"');</script>");
							            out.flush();
										
							            return "login/login";
									}else {//정지회원이 아니라면
										
										  //null값 확인  + 비밀번호 암호화 매치  + jsp에 정보 전송
											  if(null != login) { 
												  pwdMatch = pwEncoder.matches(vo.getMem_pw(), login.getMem_pw());
											  } else { 
												  pwdMatch = false; 
											  }
												if(login != null && pwdMatch == true) {
													session.setAttribute("member", login);
													
												} else { //비밀번호 불일치
													return "/login/passwordNotEqualAlert";
												}
												return "redirect:/";
		
									}//정지회원 여부 확인 end
									
							}//이메일 인증 여부 end
										
						}//이메일 여부 조회 end
				    		
				   	}//카카오회원 로그인 end
					
				}//관리자 검사 end
			
	 
	}//로그인 end
	
	
	// <0323 최은지>로그아웃
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		if( null != session.getAttribute("member")) {
			//세션 무효화 메서드
			session.invalidate();
			
			return "redirect:/";
			
		}else {
			return "redirect:/";
		}
		
	}//로그아웃 end
	
	
	// <0327 최은지>
	// 인증메일 컨트롤러 매핑 > 이메일 인증 완료 페이지 이동
	@RequestMapping(value = "registerEmail.do")
    public String emailConfirm(MemberVO vo)throws Exception{
		
		service.update_mail_auth(vo);

        return "/login/emailAuthSuccess";
    }
	
	
	// <0327 최은지>
	// 회원가입 로직
	@RequestMapping(value = "joinCheck.do")
    public String joinCheck(MemberVO vo, Errors errors, Model model, String mem_email) throws Exception{
		
    	//비밀번호 칸 입력값
    	String pw1 = vo.getMem_pw();
    	//비밀번호 확인 칸 입력값
    	String pw2=vo.getMem_pwCheck();
	
        //작성한 정보를 유지, joinSuccessForm에 name전송
		model.addAttribute("MemberVO", vo);

        //만약 회원가입에 실패한다면
        if (errors.hasErrors()) {
            //작성중이던 폼 그대로 유지
            return "/login/join";
        }
        
        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
        if(! pw1.equals(pw2)) {
        	 return "/login/joinPwNotEqual";	
        }
        
    	// 이메일 중복이라면 다시 회원가입 페이지로 돌아가기 
        int email_result = service.emailDuplCheck(mem_email);
    		if(email_result == 1) {
    			return "/login/joinEmailDupl";
    	}       
    		
        //유효성 검사를 통과하면 insert 후 페이지 이동
 	   //비밀번호 암호화
	    String inputPass = pw1;
	    String pwd = pwEncoder.encode(inputPass);
	    vo.setMem_pw(pwd);
	    
        int result = service.insertMember(vo);
        if(result == 1){
           try { 
               service.send_join_certification_mail(vo); //인증메일 보내기
                
         } catch (TaskRejectedException e) {
        	 
        	 return "/login/emailAuthFail";
          }
            return "/login/joinSuccess"; //회원가입 성공 페이지로 이동
        }
        return "/login/join";
    } //회원가입end
	
	
	// <0328 최은지>
	// 카카오 로그인 로직
	@RequestMapping(value = "kakaoLogin.do") //카카오로그인 버튼 클릭했을 때로 제한. 
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		
		String access_token = service.getAccessToken(code);
		MemberVO userInfo = service.get_user_info(access_token);		
		session.setAttribute("member", userInfo);
		
		return "main";
		
	}//카카오로그인 end
	
	
	// <0330 최은지>
	// 카카오 로그아웃 로직
		@RequestMapping(value="kakaoLogout.do")
		public String kakaoLogout(HttpSession session, MemberVO vo) throws Exception {
			service.kakaoLogout((String)session.getAttribute("access_token"));
			session.invalidate();
			return "redirect:/";
		}
		
		
	//<0331 최은지>
	//이메일 중복 여부 체크
	@ResponseBody
	@RequestMapping(value = "/emailDupl.do", method = RequestMethod.POST)
	public String emailDuplCheck(@RequestParam("mem_email") String mem_email) { //예외처리
			
		int result = service.emailDuplCheck(mem_email);
		String sResult = Integer.toString(result);
			
		return sResult;
	}
		
	
	//<0403 최은지>
	// 비밀번호 찾기 시 아이디 존재 여부 확인 
	@ResponseBody
	@RequestMapping(value = "findPw_check.do", method = RequestMethod.POST) 
	public String findPw(@RequestParam("mem_email") String mem_email) throws Exception{
			
		//이메일 존재 여부 조회
		int result = service.find_pwEmail(mem_email);
		
		String sResult = Integer.toString(result);
		
		return sResult;
	}
	
	//<0403 최은지>
	@ResponseBody
	@RequestMapping(value = "find_pw_register_mail.do",  method = RequestMethod.POST)
	public String find_pwd_email1(@RequestParam("mem_email") String mem_email) throws Exception {
	
		//인증번호 메일을 보내고 DB에 비교값 업데이트
		 int result = service.auth_find_pwd_mail(mem_email);
		 
		 String sResult = Integer.toString(result);
		 
		return sResult;
	}
	
	
	//<0403 최은지>
	@ResponseBody
	@RequestMapping(value = "find_pw_comparison_mail.do",  method = RequestMethod.POST)
	public String find_pwd_email2(@RequestParam("mem_email") String mem_email, 
												@RequestParam("mem_check_code") int mem_check_code) throws Exception {
		
		//받아온 입력값을 db에 등록되어 있는 컬럼과 비교 
		String result = service.comparison_code(mem_email);
		
		int sResult = Integer.parseInt(result);
		
		if(sResult == mem_check_code) {
				
			return "1"; //1 <일치함
		}else {
			return "0"; //0 <일치하지 않음
		}	
	}
	

	// <0403 최은지> 비밀번호 재설정 페이지 이동
	@RequestMapping(value = "/resetPassword.do", method = RequestMethod.POST)
	public String resetPw1(@RequestParam("mem_email") String mem_email, 
									@RequestParam("mem_auth_pwEmail") String mem_auth_pwEmail, 
									Model model) {

		model.addAttribute("mem_email", mem_email); 
			
		return "/login/pwNew";
		
		}
	

	//<0404 최은지 비밀번호 재설정
	@RequestMapping(value = "reset_pw_final.do", method = RequestMethod.POST)
	public String resetPw2(@RequestParam("mem_email") String mem_email, 
									@RequestParam("mem_pw") String mem_pw, 
									@RequestParam("mem_pwCheck")String mem_pwCheck) {
		
		
		//vo에 값 세팅>>service단으로 넘겨주기
		MemberVO vo = new MemberVO();	
    	
    	vo.setMem_email(mem_email);
    	vo.setMem_pw(mem_pw);
    	vo.setMem_pwCheck(mem_pwCheck);

 
    	//입력값과 확인값 일치하나 확인
		//비밀번호 칸 입력값
    	String pw1 = mem_pw;
    	//비밀번호 확인 칸 입력값
    	String pw2=mem_pwCheck;
    	
        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
        if(! pw1.equals(pw2)) {
        	
        	return "/login/resetPwFail"; //비밀번호 업데이트 실패
        } 
 
        //비밀번호 암호화 시키기
        String inputPass = pw1;
	    String pwd = pwEncoder.encode(inputPass);
	    vo.setMem_pw(pwd);
		
		//db에 수정된 비밀번호 업뎃시키기
	    int result = service.reset_pw(vo);
	    
	    //업데이트에 성공하지 못한다면
	    if(0 == result){
	    	return "/redirect";
	    }
	    
	    //덥데이트에 성공시
	    return "/login/resetSuccess";
	}
	
	
	// <0323 최은지>회원탈퇴 페이지 이동
	@RequestMapping(value = "/withdraw.do")
		public String draw() {
		
			return "/login/drawPage";
	}
	

	// <0410 최은지> 회원탈퇴
	@RequestMapping(value = "/delete_member.do", method = RequestMethod.POST)
	public String delete_member(@RequestParam("mem_num") int mem_num, 
											@RequestParam("mem_pwCheck")String mem_pwCheck,
											HttpSession session) throws Exception{
		

		//vo에 값 세팅>>service단으로 넘겨주기
		MemberVO vo = new MemberVO();	
    	vo.setMem_num(mem_num);
		
		//멤버 비밀번호 받아오기
    	MemberVO result = service.delete_member_check(vo);
		
    	//입력값과 확인값 일치하나 확인
    	//탈퇴 페이지에서 입력한 비밀번호 확인값 
    	String pw1 = mem_pwCheck;
    	
		//db에 저장된 멤버 비밀번호
    	String pw2 = result.getMem_pw();

    	//암호화 매치용 변수 생성
        boolean pwdMatch;
        
        //비밀번호 암호화 매치 
		 pwdMatch = pwEncoder.matches(pw1, pw2);
		 
		 	//일치해도 false값 출력....
		 
	        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
	        if(false == pwdMatch ) {
	        	
	        	 return "/login/drawPwNotEqual";	
	        } else {
	        	 //회원 탈퇴 service실행
	    
	    		int deletResult = service.delete_member(vo);
	    		
	    		if( 0 == deletResult) { //성공값 1
	    			System.out.println("회원 탈퇴 실패 메시지");
	    		}
	    		
	    		//세션 종료
	    		session.invalidate();
	    		return "/login/successDraw"; 
	        }

		}
		
	// <0412 이예지> 회원정보 페이지 이동
	@RequestMapping(value = "mypage.do")
	public String mypage(MemberVO vo, HttpSession session, Model model) throws Exception{
	
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		 // 생년월일 계산
	    String birthYear = member.getMem_birth().substring(0, 4);
	    String birthMonth = member.getMem_birth().substring(5, 7);
	    String birthDay = member.getMem_birth().substring(8, 10);
	    String birthDate = birthYear + "-" + birthMonth + "-" + birthDay;

	    // 생년월일을 Date 객체로 변환
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Date birth = format.parse(birthDate);

	    // 오늘 날짜와의 차이 계산
	    Calendar cal = Calendar.getInstance();
	    int currYear = cal.get(Calendar.YEAR);
	    int currMonth = cal.get(Calendar.MONTH) + 1;
	    int currDay = cal.get(Calendar.DAY_OF_MONTH);

	    cal.setTime(birth);
	    int birthYearInt = cal.get(Calendar.YEAR);
	    int birthMonthInt = cal.get(Calendar.MONTH) + 1;
	    int birthDayInt = cal.get(Calendar.DAY_OF_MONTH);

	    int age = currYear - birthYearInt;
	    if (currMonth < birthMonthInt || (currMonth == birthMonthInt && currDay < birthDayInt)) {
	        age--;
	    }

	    model.addAttribute("age", age);

		model.addAttribute("member", member);
		
		return "mypage";
	}
	
	// <0412 이예지> 회원정보 페이지에서 비밀번호 변경
	@RequestMapping(value = "/mypage_pw.do", method = RequestMethod.POST)
	public String mypage_pw(@RequestParam("mem_num") int mem_num, @RequestParam("mem_email") String mem_email,
				@RequestParam("mem_pwCheck") String mem_pwCheck, @RequestParam("new_mem_pw") String new_mem_pw,
								HttpSession session, HttpServletResponse response) throws Exception{
		
		System.out.println(mem_num);
		System.out.println(mem_email);
		System.out.println(mem_pwCheck);
		System.out.println(new_mem_pw);
		
		
		//vo에 값 세팅>>service단으로 넘겨주기
		MemberVO vo = new MemberVO();	
    	vo.setMem_num(mem_num);
    	vo.setMem_email(mem_email);
    	vo.setMem_pw(new_mem_pw);
		
		//멤버 비밀번호 받아오기
    	MemberVO result = service.delete_member_check(vo);
		
    	//입력값과 확인값 일치하나 확인
    	//탈퇴 페이지에서 입력한 비밀번호 확인값 
    	String pw1 = mem_pwCheck;
    	
		//db에 저장된 멤버 비밀번호
    	String pw2 = result.getMem_pw();
    	
    	String newPW = new_mem_pw;

    	//암호화 매치용 변수 생성
        boolean pwdMatch;
        
        //비밀번호 암호화 매치 
		pwdMatch = pwEncoder.matches(pw1, pw2);
		 
	        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
	        if(!pwdMatch ) {
	        	String message = "현재 비밀번호가 일치하지 않습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            return "mypage";
	        } else {
	        	 //비밀번호 암호화 시키기
	            String inputPass = newPW;
	    	    String pwd = pwEncoder.encode(inputPass);
	    	    vo.setMem_pw(pwd);
	    		
	    		//db에 수정된 비밀번호 업뎃시키기
	    	    int result1 = service.reset_pw(vo);
	    		
	    	  //업데이트에 성공하지 못한다면
	    	    if(0 == result1){
	    	    	return "mypage";
	    	    }
	    	    
	    	    //덥데이트에 성공시
	    	    return "/login/resetSuccess";
	        }

		}
	
	
	//<0508 최은지 회원 개인 신고내역 확인>
	@RequestMapping(value = "/check_report.do", method = RequestMethod.GET)
	public ModelAndView mypage_report_list(@RequestParam(value = "pageNum", defaultValue = "1") int currentPage,
																HttpSession session, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		List<ReportVO> list = null;
		Map<String,Object> map = new HashMap<>();
		
		//세션에서 멤버값 가져오기
		MemberVO member = (MemberVO) session.getAttribute("member");
		int mem_num = member.getMem_num();
		
		//맵에 값 넣기
		map.put("mem_num", mem_num);
		map.put("start", 1);
		map.put("end", 2);
		
		//글 개수 세기
		int count = service.selectMemberReportListRowCount(map); 
		
		//페이징 처리
		PagingUtil page = new PagingUtil(currentPage,count,rowCount,pageCount,"/check_report.do");
		
		if(count > 0) {
			map.put("start", page.getStartRow());
			map.put("end", page.getEndRow());
			
			//리스트 조회
			list = service.selectMemberReport(map);
			
			map.put("list", list);
		}
		
		mav.setViewName("myReportList");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("page", page.getPage());
		
		return mav;
		
	}//신고내역 확인 end
	
	
	//<0508 최은지 회원 신고내역 취소>
	@RequestMapping(value = "/cancelReportMember.do", method = RequestMethod.POST)
	public ModelAndView mypage_report_cancel(@RequestParam(value = "report_num") int report_num,
																	HttpSession session, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		ReportVO vo = new ReportVO();
		vo.setReport_num(report_num);
		
		int result = service.deleteReportMember(vo);
		
		if(1 == result) {
			
			message = "해당 신고 요청이 취소 처리되었습니다.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>"); 
            out.println("<script>location.replace('/check_report.do');</script>");
            out.flush();
			
		}else {
			message = "취소 요청 중 오류가 발생했습니다. 다시 시도해주세요.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>"); 
            out.println("<script>location.replace('/check_report.do');</script>");
            out.flush();
			
		}
		
		return mav;
		
	}
	
	// <0508 최은지>세션 갱신용 요청
	@RequestMapping(value = "/window_reload.do")
		public ModelAndView reload() {
			ModelAndView mav = new ModelAndView();
			
			return mav;
	}
	

	

}//전체 컨트롤러단 end
