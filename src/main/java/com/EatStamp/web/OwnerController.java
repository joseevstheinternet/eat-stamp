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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.domain.RestVO;
import com.EatStamp.domain.SearchVO;
import com.EatStamp.service.OwnerService;
import com.google.gson.Gson;

/**
 * owner controller
 * @version 1.1
 * @since 2023.05.19
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
	 * 2023.05.16 					최은지					spring security 통한 비밀번호 매치 로직 추가
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

	                mav.setViewName( "/login.do" );
	                return mav;

	            case 1: // 관리자 로그인 시도
	                message = "가게 사장님만 로그인할 수 있는 페이지입니다.\n관리자 로그인 페이지를 이용해주세요.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/mainAdmin.do');</script>" );
	                out.flush();

	                mav.setViewName( "/mainAdmin.do" );
	                return mav;

	            case 2: // 정지 회원 로그인 시도
	                message = "정지회원입니다. 문의사항은 하단의 관리자 이메일을 통해 접수해주세요.";
	                out.println( "<script>alert('" + message + "');</script>" );
	                out.println( "<script>location.replace('/login.do');</script>" );
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
	            			//회원가입 후 비밀번호 매치 로직 추가
	            	
	        		/*비밀번호 매치용 변수  */
	        		boolean pwdMatch;
	        		
	        			pwdMatch = pwEncoder.matches(vo.getMem_pw(), login.getMem_pw());
	        			
						if(null != login && pwdMatch == true) { //조회정보 누락 여부, 비밀번호 일치 여부 확인
							
							session.setAttribute("owner", login); //로그인 정보 전달
			            	
			            	/*해당 가게 사장 닉네임(상호명) 문자 */
			            	String ownerNick;
			            	ownerNick = login.getMem_nick();

			                message = ownerNick + " 사장님 반갑습니다.";
			                out.println( "<script>alert('" + message + "');</script>" );
			                out.println( "<script>location.replace('/ownerMypage.do');</script>" );
			                out.flush();
			            	
			                mav.setViewName( "/owner/ownerMypageView" );
			                return mav;
							
						} else { //비밀번호 불일치
							message = "비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
				            out.println( "<script>alert('" + message + "');</script>" );
				            out.println( "<script>location.replace('/ownerLogin.do');</script>" );
				            out.flush();
							mav.setViewName( "/owner/ownerLoginView" );
							return mav;
						}

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
	 * @date : 2023.05.19
	 * @author : 이예지
	 * @history :
	 * -----------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * -----------------------------------------------------------
	 * 2023.05.15				이예지					최초작성
	 * 2023.05.19               이예지                    비밀번호 암호화
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
    	
    	//암호화 매치용 변수 생성
    	boolean pwdMatch;
    	//비밀번호 암호화 매치
    	pwdMatch = pwEncoder.matches(pw1, pw2);
    	
    	if(null != owner) {
	        //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 떄
	        if(!pwdMatch) {
	        	String message = "현재 비밀번호가 일치하지 않습니다.";
	            response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('"+ message +"');</script>");
	            out.flush();
	            return "/owner/ownerMypageView";
	        } else {
	        	//비밀번호 암호화
	        	String inputPass = newPW;
	        	String pwd = pwEncoder.encode(inputPass);
	        	
	        	 //비밀번호 재설정
	    	    vo.setMem_pw(pwd);
	    		
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
	 *  				r_num //가게 고유 번호
	 * @throws Exception
	 * @return
	 */	
	@RequestMapping(value = "/insertOwnerSignUpInfo.do",  method = RequestMethod.POST )
	public ModelAndView insertOwnerSignUpInfo(@RequestParam( "mem_email" ) String mem_email, 
																	@RequestParam( "mem_pw" ) String mem_pw, 
																	@RequestParam( "mem_pwCheck" ) String mem_pwCheck, 
																	@RequestParam(value = "mem_nick", required = false) String mem_nick,
																	@RequestParam( value = "mem_newNick", required = false) String mem_newNick,
																	@RequestParam( value = "r_add", required = false) String r_add,
																	@RequestParam( value = "r_semi_add", required = false) String r_semi_add,
																	@RequestParam( value = "r_num", required = false) int r_num,
																	HttpServletResponse response
		) throws Exception {
		
		/* ModelAndView 객체 */
	    ModelAndView mav = new ModelAndView();
		/* memberVO 객체 */
	    MemberVO memberVO = new MemberVO();
		/* restVO 객체 */
	    RestVO restVO = new RestVO();
	    /* 사전 가입 여부 확인 */
	    RestVO duplSignUpCheckRnum = new RestVO();
	    /* 식당 정보 업데이트 성공 여부 확인용 숫자 */
	    int restSignUpUpdateCheck = 0;
	    /* 암호화 비밀번호 저장용 문자 */
	    String pwEncoding = null;
	    /* 주소 + 세부주소 통합 문자 */
	    String plusAdd = null;

	    int test = 0;
	    
	    if( mem_newNick.equals( "" ) && !mem_nick.equals( "" ) ){ //신규 상호명이 비어있고 기존 상호명이 비어있지 않을 경우
	    	test = 1;
	    }
	    
	    if ( 1 == test ) { //(기존 db데이터 등록 가게)
	    	
	    	String r_name = mem_nick;
	    	
	    	duplSignUpCheckRnum =  ownerService.getDuplSignUpCheck( r_name ); //r_name으로 사전 가입여부 조회
	    	
	    	if ( null == duplSignUpCheckRnum) { //가입이 되어있지 않을 경우에만

					pwEncoding = pwEncoder.encode( mem_pw ); //비밀번호 암호화
	      
	            	memberVO.setMem_email( mem_email ); //회원 이메일
	            	memberVO.setMem_nick( mem_nick ); //회원 닉네임(상호명)
	            	memberVO.setMem_pw( pwEncoding ); //암호화된 회원 비밀번호
	            	
	            	int ownerSignUpinsertCheck = ownerService.insertOwnerSignUpInfo( memberVO ); //회원 정보 insert

	            	if ( 1 == ownerSignUpinsertCheck ) { //insert에 성공 시
	            		
	            		restVO.setR_num( r_num ); //식당 고유 번호
	            		
	            		restSignUpUpdateCheck = ownerService.updateRestInfoSignUp( restVO ) ; //기존 식당 정보 update
	            		
	            		//ownerService.ownerOriginSignUpEmailSend(memberVO); //인증링크 담긴 이메일 전송
	            		
	            		//알림메시지 출력
	            		message = "회원가입 신청이 완료되었습니다.\n작성하신 이메일로 전송된 인증 링크를 확인해주세요.";
	            		mav.addObject( "message", message );
			            mav.setViewName( "main" );
		            	return mav;	
	            		
	            	} else {
	            		logger.debug( "기존 식당 사장 회원가입 중 insert오류 발생" );
	            	}
	 
	    		
	    	} else { //가입이 되어있는 경우
	    		message = "이미 가입된 회원입니다. 기존 아이디로 로그인을 진행해주세요.";
	            response.setContentType( "text/html; charset=UTF-8" );
	            PrintWriter out = response.getWriter();
	            out.println( "<script>alert('"+ message +"');</script>" );
	            out.flush();
				
	            mav.setViewName( "owner/ownerLoginView" );
				return mav;
	    	}
	    	
	    } else { //신규 상호명 입력값이 있을 경우 (기존 db 데이터 미등록 가게)
	   
	            	pwEncoding = pwEncoder.encode( mem_pw ); //비밀번호 암호화
	      
	            	memberVO.setMem_email( mem_email ); //회원 이메일
	            	memberVO.setMem_nick( mem_newNick ); //회원 닉네임(상호명)
	            	memberVO.setMem_pw( pwEncoding ); //암호화된 회원 비밀번호
	            	
	            	int ownerSignUpinsertCheck = ownerService.insertOwnerSignUpInfo( memberVO ); //회원 정보 insert
	            	
	            	if ( 1 == ownerSignUpinsertCheck ) { //insert에 성공 시
	            		
	            		plusAdd = r_add + r_semi_add; //주소 합치기
	            		
	            		restVO.setR_name( mem_newNick ); //신규 식당 이름 정보 set
	            		restVO.setR_add( plusAdd ); //신규 식당 주소 정보 set
	            		
	            		int insertownerSignUpNewRestInfo = ownerService.insertOwnerSignUpNewRestInfo( restVO ); //신규 식당 정보 임시 insert
	            		
	            			if ( 1 == insertownerSignUpNewRestInfo ) { //insert 성공 시
	            				ownerService.ownerOriginSignUpEmailSend( memberVO ); //인증링크 담긴 이메일 전송
	    	            		
	    	            		//알림메시지 출력
	    	            		message = "회원가입 신청이 완료되었습니다.\n작성하신 이메일로 전송된 인증 링크를 확인해주세요.";
	    	            		mav.addObject( "message", message );
	    			            mav.setViewName( "main" );
	    		            	return mav;	
	    		            	
	            			} else {
	            				logger.debug( "신규 식당 사장 회원가입 중 식당 정보 insert오류 발생" );
	            			}
	            		
	            	} else {
	            		logger.debug( "신규 식당 사장 회원가입 중 insert오류 발생" );
	            	}
	           }
		return mav;

	}
	
	
	/**
	 * <pre>
	 * 처리내용: 가게 사장 헤더에 미확인 알림 표시
	 * </pre>
	 * @date : 2023.05.18
	 * @author : 최은지
	 * @history :
	 * ------------------------------------------------------------------------
	 * 변경일						작성자					변경내용
	 * ------------------------------------------------------------------------
	 * 2023.05.18					최은지					최초작성
	 *  ------------------------------------------------------------------------
	 * @throws Exception
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/selectAlertResve.do",  method = RequestMethod.POST )
	public String insertOwnerSignUpInfo(HttpSession session
		) throws Exception {
		
		/* ModelAndView 객체 */
	    ModelAndView mav = new ModelAndView();
	    /* 세션에서 받아올 mem_nick 문자 */
	    String mem_nick = null;
	    /* 알림 갱신 확인용 숫자 */
	    int checkAlert = 0;
	    /* 가게정보 조회 결과 확인용 vo객체 */
	    MemberVO checkRestInfo = new MemberVO();
	    /* 가게 고유번호 숫자 */
	    int r_num = 0;
	    /* 오류 retrun용 문자  */
	    String errorReturnNum = "-1";
	    
		MemberVO owner = ( MemberVO ) session.getAttribute( "owner" ); //세션에서 정보 가져오기
		mem_nick = owner.getMem_nick();
		
		// 멤버 닉네임이 일치하는 상호명 조회 (가게 이름, 가게 고유번호),
		checkRestInfo = ownerService.getMemNickEqualRestName( mem_nick );
		r_num = checkRestInfo.getR_num();
		
		// 해당 상호명의 알림 정보를 추가적으로 받아와 갱신 
		checkAlert = ownerService.getCountUnidentifiedAlert( r_num ); //미확인 알림 개수 count로 가져오기
		
		if ( 0 < checkAlert ) { //미확인 알림이 있다면

			String jsonAlert = new Gson().toJson( checkAlert );
			
			return jsonAlert;
			
		} else if ( 0 == checkAlert) { //미확인 알림이 없다면

			String jsonAlert = new Gson().toJson( checkAlert );
			
			return jsonAlert;
			
		} else { //오류상황 
			
			logger.debug( "알림 정보 갱신 중 오류 발생" );
			return errorReturnNum;
		}
		
	}//selectAlertResve end

	
}
