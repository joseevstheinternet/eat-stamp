package com.EatStamp.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.service.OwnerService;

/**
 * owner controller
 * @version 1.0
 * @since 2023.05.12
 * @author 최은지
 */
@Controller
public class OwnerController {
	
	/* logger 사용*/
	private static final Logger logger = LoggerFactory.getLogger(OwnerController.class);
	
	/*한 페이지에 출력되는 게시물 수*/
	private final int ROW_COUNT = 10;
	
	/*한 페이지에 보여줄 페이지 수*/
	private final int PAGE_COUNT = 10;
	
	/*메시지 문자 */
	public String message = null;
	
	/*서비스 빈 주입 */
	@Resource(name = "ownerService")
	public OwnerService ownerService;
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 페이지로 이동
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.12					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@RequestMapping(value = "/ownerLogin.do")
	public String ownerLogin() {
		
		return "/owner/ownerLoginView";
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그인 처리
	 * </pre>
	 * @date : 2023.05.12
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.12					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 *  @param	mem_email,
	 *  			 	mem_pw
	 */
	@RequestMapping(value = "/selectOwnerInfoLoginCheck.do", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public ModelAndView selectLoginOwnerInfo(MemberVO vo, 
																	HttpServletRequest req, 
																	RedirectAttributes rttr, 
																	HttpServletResponse response, 
																	@RequestParam( "mem_email" ) String mem_email, //회원 입력 이메일
																	@RequestParam( "mem_pw" ) String mem_pw//회원 입력 비밀번호
		) throws Exception {
		
	    /* 세션 생성 */
	    HttpSession session = req.getSession();
	    
	    /* 인코딩 타입 설정 */
    	response.setContentType( "text/html; charset=UTF-8" );
    	response.setCharacterEncoding( "UTF-8" );
    	
	    /* 텍스트 출력 클래스 */
    	PrintWriter out = response.getWriter();
    	
	    /* mav 객체 생성 */
	    ModelAndView mav = new ModelAndView();
	    
	    vo.setMem_email( mem_email ); //조회용 회원 입력 비밀번호 set
	    
	    MemberVO login = ownerService.selectOwnerInfoLoginCheck(vo); // 회원이 입력한 정보를 db에서 조회
	    
	    if ( null != login ) { // 입력한 정보가 존재한다면
	        int checkMemberAuth = login.getMem_admin_auth(); // 멤버 권한 등급 저장용 변수

	        switch ( checkMemberAuth ) { // 권한 등급에 따라 분류
	            case 0: // 일반 회원 로그인 시도
	                message = "가게 사장님만 로그인할 수 있는 페이지입니다.\n일반 회원 로그인 페이지를 이용해주세요.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/login.do');</script>" );
	                out.flush();

	                mav.setViewName( "redirect:/login.do" );
	                return mav;

	            case 1: // 관리자 로그인 시도
	                message = "가게 사장님만 로그인할 수 있는 페이지입니다.\n관리자 로그인 페이지를 이용해주세요.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/mainAdmin.do');</script>" );
	                out.flush();

	                mav.setViewName("redirect:/mainAdmin.do");
	                return mav;

	            case 2: // 정지 회원 로그인 시도
	                message = "정지회원입니다. 문의사항은 하단의 관리자 이메일을 통해 접수해주세요.";
	                out.println("<script>alert('" + message + "');</script>");
	                out.println("<script>location.replace('/login.do');</script>");
	                out.flush();
	                mav.setViewName( "/login/login" );

	                return mav;

	            case 3: // 미승인 사장 로그인 시도
	                message = "아직 승인되지 않은 이메일입니다. 승인이 될 때까지 기다려주세요.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/login.do');</script>" );
	                out.flush();
	                
	                mav.setViewName( "/login/login" );
	                return mav;
	            
	            case 4: // 승인 사장 로그인 시도, 이 경우에만 로그인 허용, 회원가입 페이지 작성 후 비밀번호 매치 로직 추가
	            	
	            	session.setAttribute("owner", login); //로그인 정보 전달
	            	
	            	/*해당 가게 사장 닉네임(상호명) 문자 */
	            	String ownerNick;
	            	ownerNick = login.getMem_nick();

	                message = ownerNick + "사장님, 반갑습니다.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/ownerMypage.do');</script>" );
	                out.flush();
	            	
	                mav.setViewName( "/owner/ownerMypageView" );
	                return mav;
	            
	            default:
	                throw new RuntimeException( "해당 유저 권한등급 정보 없음" );
	        }
	        
	    } else { // 입력한 정보가 존재하지 않을 시 로그인 페이지로 return
	        message = "존재하지 않는 이메일입니다. 다시 확인해주세요.";
	        out.println( "<script>alert('" + message + "');</script>" );
	        out.println( "<script>location.replace('/login.do');</script>" );
	        out.flush();
	        
	        mav.setViewName( "/login/login" );
	        return mav;
	    }
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 로그아웃 처리
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @throws IOException 
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@RequestMapping(value = "/ownerLogout.do")
	public String ownerLogout(HttpSession session, HttpServletResponse response) throws IOException {
		
		if( null != session.getAttribute ( "owner" ) ) {
			session.invalidate();
			
			return "redirect:/";
			
		} else {
		    /* 인코딩 타입 설정 */
	    	response.setContentType( "text/html; charset=UTF-8" );
	    	response.setCharacterEncoding( "UTF-8" );
	    	
			message = "이미 만료된 세션입니다. 다시 로그인해주세요.";
            response.setContentType( "text/html; charset=UTF-8" );
            PrintWriter out = response.getWriter();
            out.println( "<script>alert('"+ message +"');</script>" );
            out.flush();
			
            return "redirect:/";
		}
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 관리 메인 페이지로 이동
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@RequestMapping(value = "/ownerMypage.do")
	public String ownerMypage() {
		
		return "/owner/ownerMypageView";
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 페이지로 이동
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 */
	@RequestMapping(value = "/ownerSignUp.do")
	public String ownerSignUp() {
		
		return "/owner/ownerSignUpView";
	}
	
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 처리
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 *  @param	
	 */
	public ModelAndView insertOwnerSignUpInfo(
			
		) throws Exception {
		
		/* mav 객체 생성 */
	    ModelAndView mav = new ModelAndView();
		
	    return mav;
	}
	
	
	
}
