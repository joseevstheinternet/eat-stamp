package com.EatStamp.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.SearchVO;
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
	
	/*비밀번호 암호화용 클래스 빈 주입 */
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	
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
 	 *					mem_pw
	 * @return
	 * @throws Exception
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
	            
	            case 4: // 승인 사장 로그인 시도, 이 경우에만 로그인 허용, 
	            			//비밀번호 매치 로직 추가
	            	
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
 	*  @return
	 * @throws Exception
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
	 * @return
	 */
	@RequestMapping(value = "/ownerMypage.do")
	public String ownerMypage() {
		
		return "/owner/ownerMypageView";
	}
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 비밀번호 변경
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 이예지
	 * @history :
	 * -----------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * -----------------------------------------------------------
	 * 2023.05.15				이예지					최초작성
	 * -----------------------------------------------------------
	 * @param mem_num
	 * @param mem_email
	 * @param mem_pwCheck
	 * @param new_mem_pw
	 * @param session
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/ownerPW.do", method = RequestMethod.POST)
	public String mypageAdmin_pw (@RequestParam("mem_num") int mem_num, 
								  @RequestParam("mem_email") String mem_email,
								  @RequestParam("mem_pwCheck") String mem_pwCheck, 
								  @RequestParam("new_mem_pw") String new_mem_pw,
								  HttpSession session, HttpServletResponse response) throws Exception {
		
		MemberVO owner = (MemberVO) session.getAttribute("owner");
		
		//vo에 값 세팅>>service단으로 넘겨주기
		MemberVO vo = new MemberVO();	
		vo.setMem_num(mem_num);
		vo.setMem_email(mem_email);
		vo.setMem_pw(new_mem_pw);
		
		//멤버 비밀번호 받아오기
    	MemberVO result = ownerService.selectOwnerPW(vo);
		
    	//입력값과 확인값 일치하나 확인
    	//탈퇴 페이지에서 입력한 비밀번호 확인값 
    	String pw1 = mem_pwCheck;
    	
		//db에 저장된 멤버 비밀번호
    	String pw2 = result.getMem_pw();
    	System.out.println("입력한 비밀번호: " + pw1);
    	System.out.println("현재 비밀번호: " + pw2);
    	
    	String newPW = new_mem_pw;
    	
    	if(null != owner) {
	        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
	        if(!pw1.equals(pw2)) {
	        	String message = "현재 비밀번호가 일치하지 않습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            return "/owner/ownerMypageView";
	        } else {
	        	 //비밀번호 재설정
	    	    vo.setMem_pw(newPW);
	    		
	    		//db에 수정된 비밀번호 업뎃시키기
	    	    int result1 = ownerService.updateOwnerPW(vo);
	    		
	    	  //업데이트에 성공하지 못한다면
	    	    if(0 == result1){
	    	    	return "/owner/ownerMypageView";
	    	    }
	    	    
	    	    //업데이트에 성공시
			 	session.setAttribute("owner", owner);
			 	
			 	//0426 최은지 신규 jsp 페이지 이동 후 이동 페이지에서 세션 제거하는 방식으로 변경
	            return "/owner/ownerPWChangeAlert";
	        }
	        
    	}//세션값 else end

    		message = "이미 만료된 세션입니다. 다시 로그인해주세요.";
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('"+ message +"');</script>");
            out.flush();
			
			return "/owner/ownerLoginView";
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
	 * @return 
	 * @throws Exception
	 */
	@RequestMapping(value = "/ownerSignUp.do")
	public String ownerSignUp() {
		
		return "/owner/ownerSignUpView";
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 상호명 검색 팝업 페이지 이동
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/goRestSearchPopUp.do")
	public String goRestNameSearchPopUp() throws Exception {
		
		return "/owner/ownerRestSearchPopup";
	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 회원가입 중 상호명 검색 처리
	 * </pre>
	 * @date : 2023.05.15
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.15					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 *  @param : search_keyword //검색 키워드
	 * @throws Exception
	 * @return
	 */
	@RequestMapping(value = "/selectSearchRestName.do",  method = RequestMethod.POST)
	public ModelAndView selectRestList(@RequestParam("search_keyword") String search_keyword) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();
		List<SearchVO> list = null;
	
		/* 검색 키워드 set */
		map.put("search_keyword", search_keyword);
		
		/* 검색된 결과물 수 조회 */
		int count = ownerService.selectRestRowCount(map);
		logger.debug("<<count>> : " + count);
		
		if ( 0 < count ) {
			/* 검색 결과 조회 */
			list = ownerService.selectRestList(map);
			
			mav.addObject("count", count);
			mav.addObject("list", list);
			
		} else {
			mav.addObject("count", count);
		}
		
		mav.setViewName("/owner/ownerRestSearchPopup");
		
		return mav;
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
	 *  @param	mem_email //회원 입력 이메일
	 *  				mem_pw //회원 입력 비밀번호
	 *  				mem_pwCheck //회원 입력 비밀번호 확인
	 *  				mem_nick //회원 닉네임(기존 db 등록 상호명)
	 *  				mem_new_nick //회원 닉네임(기존 db 미등록 신규 상호명)
	 *  				r_add //회원 입력 가게 주소
	 *  				r_semi_add //회원 입력 가게 세부주소
	 * @throws Exception
	 * @return
	 */	
	@RequestMapping(value = "/insertOwnerSignUpInfo.do",  method = RequestMethod.POST)
	public ModelAndView insertOwnerSignUpInfo(@RequestParam("mem_email") String mem_email, 
																	@RequestParam("mem_pw") String mem_pw, 
																	@RequestParam("mem_pwCheck") String mem_pwCheck, 
																	@RequestParam("mem_nick") String mem_nick,
																	@RequestParam("mem_new_nick") String mem_new_nick,
																	@RequestParam("r_add") String r_add,
																	@RequestParam("r_semi_add") String r_semi_add
		) throws Exception {
		
		/* ModelAndView 객체 생성 */
	    ModelAndView mav = new ModelAndView();
	   
	    if ( mem_new_nick.equals( "" ) ) { //신규 상호명 입력값이 공백일 경우(기존 db데이터 등록 가게)
	    	//r_name으로 사전 가입여부 조회
	    	//가입이 되지 않았을 경우에만 비밀번호 암호화 후 회원가입 insert 진행
	    	//rest 테이블에 r_num을 통해 조회, r_block = 1, r_resveCode =N 컬럼 update
	    	//이메일 인증코드 전송
	    	//알림 메시지 출력 
	    	
	    } else { //신규 상호명 입력값이 있을 경우 (기존 db 데이터 미등록 가게)
	    	//비밀번호 암호화 후 회원가입 insert 진행 
	    	//rest 테이블에 r_num, r_name 컬럼만 넣어 insert 진행
	    	//이메일 인증코드 전송
	    	//알림메시지 출력
	    }
	    
	    
	    return mav;
	}
	

	
}
