package com.EatStamp.web;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletResponse;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.service.AdminService;

@Controller
public class MainAdminController {
	
	@Resource(name = "adminService")
	public AdminService service;
	
	//메시지 전달용 객체 생성
	String message = null;
	
	//0418 최은지 관리자 메인 페이지 이동
	@RequestMapping(value = "/mainAdmin.do")
	public String mainGo() {
			
		return "mainAdmin";
	} //메인 페이지 이동 end
	
	
	// 0421 최은지 관리자 로그아웃
	@RequestMapping(value = "/mainAdminLogout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletResponse response) throws Exception{
		
		if( null != session.getAttribute("admin")) {
					
			//세션 무효화 메서드
			session.invalidate();
			return "mainAdmin";
			
		}else {
			message = "이미 만료된 세션입니다. 다시 로그인해주세요.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>");
            out.flush();
			
			return "mainAdmin";
		}
		
	}//로그아웃 end

	
	//0418 이예지 관리자 메인 페이지 이동
	@RequestMapping(value = "/mypageAdmin.do")
	public String mypageGo(MemberVO vo, HttpSession session, Model model) throws Exception {
		
		MemberVO member = (MemberVO) session.getAttribute("admin");
		
		model.addAttribute("admin", member);
		
		return "mypageAdmin";
	} //메인 페이지 이동 end

	// <0412 이예지> 회원정보 페이지에서 비밀번호 변경
	@RequestMapping(value = "/mypageAdmin_pw.do", method = RequestMethod.POST)
	public String mypageAdmin_pw(@RequestParam("mem_num") int mem_num, @RequestParam("mem_email") String mem_email,
				@RequestParam("mem_pwCheck") String mem_pwCheck, @RequestParam("new_mem_pw") String new_mem_pw,
								HttpSession session, HttpServletResponse response) throws Exception{
		
		MemberVO member = (MemberVO) session.getAttribute("admin");
		
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
    	System.out.println("입력한 비밀번호: " + pw1);
    	System.out.println("현재 비밀번호: " + pw2);
    	
    	String newPW = new_mem_pw;
    	
    	//0426 최은지 세션 여부 분기문 추가
    	if(null != member) {
		 
	        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
	        if(!pw1.equals(pw2)) {
	        	String message = "현재 비밀번호가 일치하지 않습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            return "mypageAdmin";
	        } else {
	        	 //비밀번호 재설정
	    	    vo.setMem_pw(newPW);
	    		
	    		//db에 수정된 비밀번호 업뎃시키기
	    	    int result1 = service.reset_pw(vo);
	    		
	    	  //업데이트에 성공하지 못한다면
	    	    if(0 == result1){
	    	    	return "mypageAdmin";
	    	    }
	    	    
	    	    //업데이트에 성공시
			 	session.setAttribute("admin", member);
			 	
			 	//0426 최은지 신규 jsp 페이지 이동 후 이동 페이지에서 세션 제거하는 방식으로 변경
	            return "pwdChangeAlert";
	        }
	        
    	}//세션값 else end

    		message = "이미 만료된 세션입니다. 다시 로그인해주세요.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>");
            out.flush();
			
			return "mainAdmin";
		}
	
	
	//0420 최은지 관리자 로그인
	@RequestMapping(value = "/loginAdminCheck.do", method = RequestMethod.POST)
	public String admin_login_check(MemberVO vo, 
												HttpServletRequest req, 
												RedirectAttributes rttr,
												HttpServletResponse response,
												@RequestParam("mem_email") String mem_email,
												@RequestParam("mem_pw") String mem_pw) throws Exception {
		
		//세션 생성
		HttpSession session = req.getSession();
		
		//vo 객체 생성해서 mapper사용해 조회
		MemberVO login  = service.adminLoginCheck(vo);	
		
		//존재하지 않는 이메일 + 비밀번호 오기입 + 일반 회원 관리자 로그인 시도
		
		 //일반 회원의 관리자 로그인 여부 조회 > 병합 시 로그인 로직에 추가
		 //int member_try_admin = service.memberTryAdmin(vo);
		
		 //돌아온 값이 비어있지 않다면(관리자 로그인)
		 if(null != login) {
			 
				//이메일 존재 여부 검사
				int check_email = service.email_check(vo);

			 	if( 0 == check_email ) { //존재하지 않는 이메일의 경우
			 		message = "존재하지 않는 이메일입니다.";
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('"+ message +"');</script>");
		            out.flush();
		            
			 		return "mainAdmin"; 
			 		
			 	}else { //로그인 성공
			 		
					//관리자 닉네임 변수 저장
					String admin_nick = login.getMem_nick(); 
			 		//세션으로 정보 전달
				 	session.setAttribute("admin", login);
				 	
				 	message = admin_nick+"님 환영합니다.";
		            response.setContentType("text/html; charset=UTF-8");
		            PrintWriter out = response.getWriter();
		            out.println("<script>alert('"+ message +"');</script>");
		            out.flush();
					return "mypageAdmin"; 
			 	}
		
		//돌아온 값이 비어있다면(존재하지 않는 이메일, 비밀번호 오류, db조회 오류)
		 }else {
	        	message = "로그인 오류입니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
			 	//다시 로그인 페이지로 리턴
				return "mainAdmin"; 
		 }
	}
	
}