package com.EatStamp.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.lang.reflect.Member;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Random;

import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.EatStamp.domain.MemberVO;
import com.EatStamp.mapper.MemberMapper;
import com.EatStamp.service.MemberService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.example.cmmn.MailHandler;
import egovframework.example.cmmn.TempKey;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

	@Resource(name = "memberMapper")
	private MemberMapper memberMapper;
	
	@Autowired
	private JavaMailSender mailSender;


	//<0324 최은지> 로그인 체크
	@Override
	public MemberVO loginCheck(MemberVO vo) throws Exception {
		
		// TODO Auto-generated method stub
		return memberMapper.login_check(vo);
	}

	//<0327 최은지> 이메일 인증용 랜덤번호 저장
	@Override
	public int update_mail_key(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.update_mail_key(vo);
	}

	//<0327 최은지> 이메일 인증용 컬럼값 변경
	@Override
	public int update_mail_auth(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.update_mail_auth(vo);
	}

	//<0327 최은지> 이메일 인증여부 확인
	@Override
	public int email_auth_fail(String email) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.email_auth_fail(email);
	}
	
	//<0327 최은지> 회원가입 진행
	@Override
	public int insertMember(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return memberMapper.insertMember(vo);
	}

	
	//<0327 최은지> 이메일에 인증번호 발송
	 @Override
	    public void send_join_certification_mail(MemberVO vo) throws Exception {
		//랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
	        String mail_key = new TempKey().getKey(30,false); //랜덤키 길이 설정
	        vo.setMem_mail_key(mail_key);

	        //memberMapper.insertMember(vo);
	        memberMapper.update_mail_key(vo);

	        MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[EatStamp 인증메일 입니다.]");
	        sendMail.setText(
	        		//string 변수 선언해서 저장 
	                "<h1>EatStamp 메일인증</h1>" +
	                "<br>EatStamp에 오신것을 환영합니다!" +
	                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
	                "<br><a href='http://localhost:8282/registerEmail.do?mem_email=" + vo.getMem_email() +
	                "&mem_mail_key=" + mail_key +
	                "' target='_blank'>이메일 인증 확인</a>");
	        sendMail.setFrom("ejchoiedsk@gmail.com", "EatStamp");
	        sendMail.setTo(vo.getMem_email());
	        sendMail.send();
	        
	    }//메일 인증링크 end

	 
	//<0328 최은지> 카카오 로그인 토큰 발급
	@Override
	public String getAccessToken(String authorize_code) {
		 String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://kauth.kakao.com/oauth/token";
	        
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            
	            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            
	            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=7d9ef6c74111b87a039dd00b4b1812f6");
	            sb.append("&redirect_uri=http://localhost:8282/kakaoLogin.do");
	            sb.append("&code=" + authorize_code);
	            bw.write(sb.toString());
	            bw.flush();
	            
	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("--------------------------------------responseCode------------------------------------------- : " + responseCode);
	 
	            // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            
	            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
	            //System.out.println("access_token : " + access_Token);
	            //System.out.println("refresh_token : " + refresh_Token);
	            
	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	       
	        return access_Token;
	    } //카카오 로그인 end

	
	//<0328 최은지> 카카오 로그인시 정보 받아오기 + 저장
	@Override
	public MemberVO get_user_info(String access_token) {
		
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);
	              
	        //코드 로거로 확인하기
	        int responseCode = conn.getResponseCode();
      
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        
	        JsonParser parser = new JsonParser ();
	        JsonElement element = parser.parse(result); //문자열 변경이 왜 안되는가??? 
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        
	        //기타 정보도 추가하기
	        userInfo.put("nickname", nickname);
	        userInfo.put("email", email);
	        
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    // db정보 저장 여부 확인 
	    MemberVO result = memberMapper.find_kakao(userInfo);
	    
	    if(null == result) {  	
            //정보가 없으니 정보를 저장.
	    	memberMapper.kakao_insert(userInfo); //여기까지 정보 잘 넘어옴
            //저장하기위해 repository 로 이동
            return memberMapper.find_kakao(userInfo);
            // 정보 저장후 컨트롤러에 정보를 보냄
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
  
	} //카카오 로그인 시 정보 저장 end

	
	
	//<0330 최은지> 카카오 로그아웃
	//기존에 발급된 토큰을 만료시키게 서버에 요청, 저장했던 세션 정보를 삭제
	public void kakaoLogout(String access_Token) {
		
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	      //요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        System.out.println(result);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	}
		
	
	//<0330 최은지 비밀번호 찾기>
	@Override
	public int find_pwEmail(String mem_email) throws Exception {
		
		//이메일 존재 여부 조회
		int result = memberMapper.find_pwEmail(mem_email);
		
		return result;
	}

	
	//<0330 최은지 회원가입 시 실시간 이메일 중복 체크>
	@Override
	public int emailDuplCheck(String mem_email) {
		
		int result = memberMapper.emailDuplCheck(mem_email); //여기까지 조회값 잘 넘어옴
			
		return result;
	}

	
	//<0403 최은지 카카오 회원 일반 로그인 여부 조회>
	@Override
	public int login_kakaoCheck(String mem_email) {
		
		return memberMapper.login_kakaoCheck(mem_email);
	}

	
	//<0403 최은지 비밀번호 찾기 이메일 전송>
	@Override
	public int auth_find_pwd_mail( String mem_email ) throws Exception {
		
		Random r = new Random();
		int num = r.nextInt(999999); //랜덤난수설정
		
		MemberVO vo = new MemberVO();
		
		//난수값 컬럼에 세팅
		 vo.setMem_auth_pwEmail(num);
		 vo.setMem_email(mem_email);
		
	     //메일을 보냅시다
		 MailHandler sendMail = new MailHandler(mailSender);
	        sendMail.setSubject("[EatStamp 인증메일 입니다.]");
	        sendMail.setText(
	        		//string 변수 선언해서 저장 
	                "<h1>EatStamp 비밀번호 재설정 인증코드</h1>" +
	                "<br>아래 인증번호를 입력해주세요." +
	                "<br>회원님의 인증번호는" + num +"입니다." +
	                "<br>정확하게 입력해주세요.");
	        sendMail.setFrom("ejchoiedsk@gmail.com", "EatStamp");
	        sendMail.setTo(mem_email);
	        sendMail.send();	
	        
	        return memberMapper.update_pwd_find_mail_key(vo);        
	}

	
	//<0403 최은지 인증번호 db값 가져오기>
	@Override
	public String comparison_code(String mem_email) {
		
		//컬럼값 db에서 받아와서 controller단에서 비교
		return memberMapper.comparison_code(mem_email);
	}

	
	//<0404 최은지 비밀번호 재설정>
	@Override
	public int reset_pw(MemberVO vo) {
		
		return memberMapper.reset_pw(vo);
	}
	
	//<0410 최은지 회원 탈퇴>
	@Override
	public int delete_member(MemberVO vo) {
		
		return memberMapper.delete_member(vo);
	}

	//<0410 최은지 회원 탈퇴용 회원 비밀번호 조회>
	@Override
	public MemberVO delete_member_check(MemberVO vo) {
		
		return memberMapper.delete_member_check(vo);
	}

	@Override
	public MemberVO selectMember(Integer mem_num) {
		return memberMapper.selectMember(mem_num);
	}


	
	
	} //서비스단 전체end
