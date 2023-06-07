# Eat Stamp
> **2023-03-14 ~ 2023-04-14	/ Web Project**

OJT 기간 동안 전자정부 프레임워크를 사용하여 표준 개발 및 프로젝트 진행 과정의 흐름 이해도를 높임

서울시 공공 데이터를 사용해 강남구에 위치한 모범 음식점들의 상세 정보 제공

**먹은 음식을 일기 형식으로 매일 기록하고, 자주 쓰인 키워드 분석을 통해 데이터상의 음식점 추천 및 예약**

<br/>

- - -

<br/>

## OBJECTIVES

- 전자정부 프레임워크 숙련도 증가

- 프로젝트 서클 파악
- 사전에 계획된 개발 일정 준수
- 깔끔하고 직관적인 디자인과 세부 기능을 통해 접근성 좋은 사용자 환경 조성

<br/>

## STACKS
>**Environment**


<img src="https://img.shields.io/badge/Eclipse-FE7A16.svg?style=for-the-badge&logo=Eclipse&logoColor=white"> <img src="https://img.shields.io/badge/egovFramework-6DB33F?style=for-the-badge&logo=spring&logoColor=white">  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">


**`TortoiseSVN`** 

<br/>

>**Development**


<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"> <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 


<br/>


>**Communication**


 <img src="https://img.shields.io/badge/Notion-%23000000.svg?style=for-the-badge&logo=notion&logoColor=white">


<br/>


>**ETC**


<img src="https://img.shields.io/badge/fontawesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white"> 


**`DBeaver` `Moqups`**

<br/>

## TEAM MEMBERS

- **이예지** 


`Layout` `메인화면` `키워드 추출` `게시글` `댓글` `신고` `마이페이지` `식당 예약`<br>
`관리자 메인` `관리자 회원 관리` `관리자 사장님 관리` `관리자 게시글 관리`<br>
`사장님 메인` `사장님 예약 관리` `사장님 식당 관리` `사장님 리뷰 관리`

- **최은지** 


`회원가입/탈퇴` `로그인/로그아웃` `식당상세` `검색` `찜한 식당` `세션 타임아웃`<br>
`관리자 로그인` `관리자 식당 관리` `관리자 식당 등록` `관리자 신고 관리`<br>
`사장님 로그인` `사장님 회원가입` `사장님 예약 알림`

<br/>

## INDEX
- [화면 구성](#화면-구성)
- [구현](#구현)
- [트러블 슈팅](#트러블-슈팅)

<br/>

- - -

<br/>

## 화면 구성

### 회원 페이지
> 로그인/회원가입

| 로그인 | 회원가입 | 비밀번호 찾기 |
| --- | --- | --- |
| ![](./docs/로그인.png)  | ![](./docs/회원가입.png)  | ![](./docs/pw찾기.png)  |

<br/>

> 메인화면

| 비회원 메인화면 | 회원 메인화면 | 헤더 드롭다운 |
| --- | --- | --- |
| ![](./docs/메인비회원.gif)  | ![](./docs/메인회원.gif)  | ![](./docs/헤더드롭다운.gif)  |

<br/>

> 글 작성

| 이미지 첨부 | 식당명 검색 | 태그 등록 |
| --- | --- | --- |
| ![](./docs/글쓰기1.gif)  | ![](./docs/글쓰기2.gif)  | ![](./docs/글쓰기3.gif)  |

| 글 상세 | 글 수정 | 글 삭제 |
| --- | --- | --- |
| ![](./docs/글상세.gif)  | ![](./docs/글수정.gif)  | ![](./docs/글삭제.gif)  |

<br/>

> 검색

| 기본 검색 | 추천 태그 클릭해서 검색 |
| --- | --- | 
| ![](./docs/검색기본.gif) | ![](./docs/검색태그클릭.gif) |

| 단일 태그 입력해서 검색 | 다중 태그 입력해서 검색 |
| --- | --- | 
| ![](./docs/검색태그입력.gif) | ![](./docs/검색다중태그입력.gif) |

<br/>

> 식당 상세 페이지

| 식당 상세 |
| --- |
| ![](./docs/식당찜하기.gif) |

<br/>

> 마이페이지

| 마이페이지 | 비밀번호 변경 |
| --- | --- | 
| ![](./docs/마이페이지.gif) | ![](./docs/마이페이지pw.gif) |

| 회원 탈퇴 | 탈퇴 유효성 검사 |
| --- | --- | 
| ![](./docs/탈퇴.gif) | ![](./docs/탈퇴유효성.gif) |

<br/>

### 0511 추가된 페이지

| 전체 글 보기 | 댓글 | 내가 쓴 댓글 |
| --- | --- | --- |
| ![](./docs/전체글보기.gif) | ![](./docs/댓글등록수정삭제.gif) | ![](./docs/내가쓴댓글.png) |

| 신고 | 신고 내역 |
| --- | --- | 
| ![](./docs/댓글신고.gif) | ![](./docs/신고내역.gif) |

| 식당 예약 | 찜한 가게 MAP |
| --- | --- | 
| ![](./docs/예약하기.gif) | ![](./docs/찜한가게map.gif) |

<br/>

### 관리자 페이지

| 관리자 로그인 | 게시글 및 신고 관리 |
| --- | --- | 
| ![](./docs/관리자로그인pw변경.gif) | ![](./docs/관리자게시글,신고관리.gif) |

| 회원 관리 | 사장님 관리 |
| --- | --- | 
| ![](./docs/관리자회원관리.gif) | ![](./docs/관리자사장님관리.gif) |

| 식당 등록 | 식당 수정 및 삭제 |
| --- | --- | 
| ![](./docs/관리자식당등록.gif) | ![](./docs/관리자식당수정삭제.gif) |

<br/>

### 사장님 페이지

| 사장님 로그인 | 기존 식당 회원가입 | 신규 식당 회원가입 |
| --- | --- | --- |
| ![](./docs/사장님로그인.gif) | ![](./docs/사장님회원가입.gif) | ![](./docs/사장님회원가입신규.gif) |

| 식당 관리 | 예약 관리 | 식당 리뷰 |
| --- | --- | --- |
| ![](./docs/사장님식당관리.gif) | ![](./docs/사장님예약관리.gif) | ![](./docs/사장님식당리뷰.gif) |

<br/>

- - -

<br/>

## 구현


<details><summary> 로그인 </summary>


- `일반 로그인` 및 `카카오 API`를 이용한 로그인 가능
	```java
	// 카카오 로그인 로직
	@RequestMapping(value = "kakaoLogin.do") //카카오로그인 버튼 클릭했을 때로 제한. 
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		
		String access_token = service.getAccessToken(code);
		MemberVO userInfo = service.get_user_info(access_token);		
		session.setAttribute("member", userInfo);
		
		return "main";
		
	}//카카오로그인 end
	

	//카카오 로그인 토큰 발급
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
	            
	            // 결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	 
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
	            br.close();
	            bw.close();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } 
	       
	        return access_Token;
	    } //카카오 로그인 end
	
	
	//카카오 로그인시 정보 받아오기 + 저장
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
	        JsonElement element = parser.parse(result); 
	        
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
	    	memberMapper.kakao_insert(userInfo); 
            //저장하기위해 repository 로 이동
            return memberMapper.find_kakao(userInfo);
            // 정보 저장후 컨트롤러에 정보를 보냄
        }else {
            return result;
            //정보가 있으므로 result 를 리턴함
        }
  
	} //카카오 로그인 시 정보 저장 end
	```

-  `카카오 아이콘` 클릭 시 회원가입이 되어 있지 않으면 `회원가입`, 되어 있으면 `카카오 로그인`으로 이동
-  `로그인` 버튼 클릭 시 `유효성 검사` 수행
   
   ``` 
   - 이메일/비밀번호 미입력 또는 불일치 시 ‘아이디, 비밀번호를 확인하세요.’ alert 출력
   - 일치 시 로그인 후 회원 메인화면으로 이동
   ```
	```java
	@RequestMapping(value = "/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = req.getSession();
		MemberVO login = service.loginCheck(vo);
		boolean pwdMatch;

		//카카오 회원의 일반 로그인 시도 검사
		int kakao_result = service.login_kakaoCheck(vo.getMem_email());
			if(kakao_result == 1) {
				return "/login/kakaoLoginAlert";
			}   

		//이메일 존재 여부 검사
		int result = service.find_pwEmail(vo.getMem_email());
			
		String sResult = Integer.toString(result);
		int finalResult = Integer.parseInt(sResult);
		if(finalResult != 1) {
			return "/login/doNotFindEmail";
		}
					
				
		//이메일 인증 여부 확인
		if (service.email_auth_fail(vo.getMem_email()) != 1 ) {
			return "/login/emailAuthFail";
		}		
			

		//null값 확인 + 비밀번호 암호화 매치 + jsp에 정보 전송
		if(login != null) { 
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
	
	}//로그인 end
	```

- `회원가입` 버튼 클릭 시 `회원가입 페이지`로 이동
- `비밀번호를 잊으셨나요?` 텍스트 클릭 시 `비밀번호 찾기 페이지`로 이동
</details>


<details><summary> 회원가입 </summary>

- `중복 확인` 버튼 클릭 시 입력한 이메일의 중복 여부 확인

 
   ```
   중복 이메일로 회원가입 진행 시 FAIL
   ```
	```js
	//이메일 중복 체크
	$(document).on("click", "#emaliCheckBtn", function(){
		$.ajax({
			url : "/emailDupl.do",
			dataType: "text",
			type : "post",
			data:{
					mem_email : $('#email-form').val()
					},
			success : function(data){		            
						if(data == 1){ 
								alert("중복된 이메일입니다.");
						} else { 
									$("#emalCheck").attr("value", "Y");
									alert("사용 가능한 이메일입니다.");
							} //else end
						}, //success end
				error : function(data){
					console.log(data);
				} 	//error end
					
		}) //ajax end	
	}); //onclick end
	```


- 비밀번호 제약 조건: `8 자 이상`, `숫자/대소문자/특수문자 포함`

- `감긴 눈 아이콘` 클릭 시 입력한 비밀번호 숨기기 해제
	```js
	//클릭시 비밀번호 확인
	$('#pwd_input_box i').on('click',function(){
		$('input').toggleClass('active');
		if($('input').hasClass('active')){
			$(this).attr('class',"fa fa-eye-slash fa-lg")
			.prev('input').attr('type',"text");
		}else{
			$(this).attr('class',"fa fa-eye fa-lg")
			.prev('input').attr('type','password');
		}
	});
	```
- 성별/프로필 아이콘 `라디오 버튼` 형식으로 선택
- `회원가입` 버튼 클릭 시 빈 정보 유무 확인
   ```
   - SUCCESS: ‘회원가입 완료’ alert 출력 후 비회원 메인화면으로 이동
   - FAIL: 경고 alert 출력
   ```
	```java
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
        
    	// 이메일이 중복일 때
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
	```	
- `form`의 `onsubmit()` 기능을 이용한 `유효성 검사`
	```js
	//조건 미충족시 false값을 반환하는 유효성 검사 함수 
	 function checks(){
		var getMail = RegExp( /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		//최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나>> Test12345678!
		 var getCheck= RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/); 
		 var iconCheck = false;
		 var genderCheck = false;
		      
	           
	      //이메일 유효성 검사
	      if(!getMail.test($("#email-form").val())){
	        alert("이메일형식에 맞춰 입력해주세요")
	        $("#email-form").val("");
	        $("#email-form").focus();
	        return false;
	      }
	          
	      //비밀번호 유효성검사
	      if(!getCheck.test($("#pass-form").val())){
	        alert("비밀번호를 형식에 맞게 입력해주세요.");
	        $("#pass-form").val("");
	        $("#pass-form").focus();
	        return false;
	      }
	           
	      //비밀번호 매치 확인
	      if($("#pass-form").val() != $("#passCheck-form").val()){
	          alert("비밀번호가 상이합니다");
	          $("#pass-form").val("");
	          $("#passCheck-form").val("");
	          $("#pass-form").focus();
	          return false;
	      } 
	          
	      //라디오버튼 체크(성별) 여부 확인
	      if($(':radio[name="mem_genderCode"]:checked').length < 1){
		  alert('성별을 선택해주세요');                        
		  return false;
		}
	  	
	      //라디오버튼 체크(프로필 아이콘) 여부 확인
	      if($(':radio[name="mem_profileCode"]:checked').length < 1){
		  alert('프로필 아이콘을 선택해주세요');                        
		  return false;
		}
		  	
		//생년월일 
		var dateStr = $("#birth_form").val();		
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 년도 가져옴

			if (dateStr.length <=8) {
			// 1900 보다 작거나 yearNow 보다 크다면 false를 반환
			if (1900 > year || year > yearNow){
				alert("생년월일을 확인해주세요.");
					return false;
				
			}else if (month < 1 || month > 12) {
				alert("생년월일을 확인해주세요.");	
					return false;
			
			}else if (day < 1 || day > 31) {
				alert("생년월일을 확인해주세요.");
					return false;
				
			}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				alert("생년월일을 확인해주세요."); 
					return false;
					
			}else if (month == 2) {
					
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				
				if (day>29 || (day==29 && !isleap)) {
					alert("생년월일을 확인해주세요.");
						return false;

			}else{
				//입력된 생년월일이 8자 초과
				alert("생년월일을 확인해주세요.");
				return false;
			}

	} //checks end
	```

- `유효성 검사` 통과 시 `spring security`를 이용한 `비밀번호 암호화`를 통해 `DB`에 저장
</details>


<details><summary> 비밀번호 찾기 </summary>


- 이메일을 입력하고 `인증번호 전송` 버튼 클릭 시 입력한 이메일의 존재 여부 확인

 
   ```
   - 존재하지 않는 이메일일 경우 ‘존재하지 않는 이메일입니다.’ 메시지 출력
   - 존재하는 이메일일 경우 인증번호 메일 전송
   ```
	```js
	//유효성 검사용 변수 생성
	var flag = true;
	var flag2 = true;
	
	//비밀번호 찾기 시 이메일 입력 값 전달 ajax
		function get_email_check(){
			
		    $.ajax({
				url : "/findPw_check.do",
				dataType: "text",
				type : "post",
				data:{
						mem_email : $('#email-form').val()
						},
				success : function(data){		            
							if(data == 0){ 
									//조회 데이터가 없다면
									alert("가입 내역이 없는 이메일입니다. 다시 확인해주세요.");
									flag2 = false;
									
							} else { 
									//조회 데이터가 존재한다면
									//이메일 인증번호 전송 함수 실행 
									pwd_regist_email();
									flag2 = true;
										
									//error1 = true;
								} //else end
							}, //success end
				error : function(data){
						console.log(data);
					} 	//error end
				         
			}) //ajax end	
			    	
			return flag2;	
			
		} //getemailcheck end
		
		
	//비밀번호 찾기 시 이메일 인증코드 전송 ajax
	function pwd_regist_email(){
		
			$.ajax({
				url : "/find_pw_register_mail.do",
				type : "post",
				data:{
						mem_email : $('#email-form').val()
						},
				success : function(data){		            
						if(data == 1){   
									//인증번호 전송에 성공했다면
									alert("인증번호가 전송되었습니다. ");
							} else { 
								alert("인증번호 전송에 실패했습니다. 다시 시도해주세요.");
								} //else end
							}, //success end
				error : function(data){
						console.log(data);
					} 	//error end
						
			}) //ajax end	
	}// pwd_regist_email end
	```
	```java
	//비밀번호 찾기 이메일 인증번호 전송
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
	```

- 발송된 인증번호 입력 후 `다음` 버튼 클릭 시 `일치 여부 유효성 검사`
   ```
   - SUCCESS: 비밀번호 재설정 화면으로 이동
   - FAIL: ‘인증번호가 일치하지 않습니다.’ 메시지 출력
   ```

- 새로운 비밀번호 설정
   ```
   - 제약조건: 8 자 이상, 숫자/대소문자/특수문자 포함
   - 제약조건에 맞지 않는 상태로 변경 시 ‘비밀번호를 다시 확인해 주세요.’ 메시지 출력
   ```

- 새로운 비밀번호 확인
   ```
   - 불일치 상태로 변경 시 ‘비밀번호가 일치하지 않습니다.’ 메시지 출력
   ```

- `감긴 눈 아이콘` 클릭 시 입력한 비밀번호 숨기기 해제

- 비밀번호 변경 성공 시 `로그인 페이지`로 이동
</details>

<details><summary> 비회원 메인화면 </summary>


- 비회원과 회원 메인 화면의 헤더 아이콘 상이

 
   ```
   - 비회원: 로그인, 회원가입으로 이동하는 아이콘
   ```

- 랜덤 추천 식당을 2 개 출력 (새로고침 시마다 변경)
   ```java
   Random random = new Random();
  int randomNumber = random.nextInt(340) + 1; // 1~341 범위의 랜덤 숫자 생성
  
  Map<String, Object> restMap = new HashMap<String, Object>();
  restMap.put("start", randomNumber);
  restMap.put("end", randomNumber+1);
  
  List<RestVO> rest1 = null;
  rest1 = restService.selectRestList(restMap);
   ```
</details>

<details><summary> 회원 메인화면 </summary>

- 비회원과 회원 메인 화면의 헤더 아이콘 상이

 
   ```
   - 검색 페이지로 이동하는 아이콘
   - 마이페이지 및 로그아웃 페이지로 이동하는 아이콘 (Mouseover > Mini menu bar Dropdown)
   ```

- 헤더 `Dropdown`

   ```html
    <!--jsp/egovframework/common/header.jsp-->

    <div class="dropdown">
	   <i class="fa-regular fa-user header_user"></i>
	   <div class="dropdown-content">
			   <a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
			   <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
	   </div>
   </div>

   <style>
	/* 드롭다운 */
	.dropdown {
		positive: relative;
		display: inline-block;
	}
	
	.dropbtn {
		cursor: pointer;
	}
	
	.dropdown-content {
		font-family: 'Noto Sans KR', sans-serif;
		display: none;
		position: absolute;
		z-index: 1; /*다른 요소들보다 앞에 배치*/
		font-weight: 400;
		background-color: #f9f9f9;
		min-width: 100px;
	}
	
	.dropdown-content a {
		font-family: 'Noto Sans KR', sans-serif;
		display: block;
		text-decoration: none;
		color: rgb(37, 37, 37);
		font-size: 12px;
		padding: 12px 20px;
	}
	
	.dropdown-content a:hover {
		background-color: #ececec
	}
	
	.dropdown:hover .dropdown-content {
		display: block;
	}
	</style>
   ```

- 내가 쓴 글에서 형태소 분석`komoran library`을 통해 키워드 추출
   - 사용한 빈도수가 높은 순으로 8 개 출력
   ```java
    // com.EatStamp.service.impl.WordAnalysisServiceImpl

	@Override
	public Map<String, Integer> selectText(Map<String, Object> map) throws Exception {
		
		List<StampVO> stampList = keywordMapper.selectText(map); //내가 쓴 글의 content만 추출해서 분석할 문장에 삽입
		Map<String, Integer> rMap = new HashMap<String, Integer>()	; //분석된 결과
		List<Map<String, Integer>> rList = new ArrayList<Map<String, Integer>>(); //분석된 결과값 여러 개를 List로 통합
		
		if(stampList.size() > 0) { //분석할 문장이 있으면
			for(StampVO vo : stampList) {
				String content = vo.getS_content();
				rMap = doWordAnalysis(content); //분석 실행
				if (rMap.size()>0) { //분석할 문장에 명사가 있으면 (= 분석할 문장 사이즈가 0보다 크면) rList에 추가
					rList.add(rMap);
				}
				//System.out.println("rMap1: " + rMap);
			}

	        for (Map<String, Integer> map2 : rList) {
	            for (Map.Entry<String, Integer> entry : map2.entrySet()) {
	                String key = entry.getKey();
	                Integer value = entry.getValue();

	                //rMap에 Key가 이미 존재한다면 (map.containKey() 메소드 = 특정 key가 Map에 존재하는지 체크)
	                if (rMap.containsKey(key)) { 
	                    rMap.put(key, rMap.get(key) + value); //key에 value값 추가?
	                } else { //rMap에 존재하지 않는 key라면
	                    rMap.put(key, value); //key와 value값 같이 추가
	                }
	            }
	        }
	        System.out.println("키워드=빈도: " + rMap);
	        
	        // 내림차순 정렬
	        List<Map.Entry<String, Integer>> sortedList = new ArrayList<>(rMap.entrySet());
	        sortedList.sort(Map.Entry.<String, Integer>comparingByValue().reversed());

	        // 상위 8개 출력
	        int count = 0;
	        Map<String, Integer> result = new LinkedHashMap<>();
	        for (Map.Entry<String, Integer> entry : sortedList) {
	            result.put(entry.getKey(), entry.getValue());
	            count++;
	            if (count == 8) {
	                break;
	            }
	        }
	        System.out.println("빈도 높은 순으로 8 개 추출: " + result);
	        return result;
			}
		  return rMap;
	}

    // com.EatStamp.web.MemberController

	//================키워드 가져오기==============//
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
   ```
   - `랜덤 색상 추출 방식`으로 색상 출력 (새로고침 시마다 변경)
   ```html
    <!--jsp/main.jsp-->

	<span class="main-title">가장 많이 등록된 키워드</span>
		<table>
			<tr>
		        <c:choose>
		            <c:when test="${!empty rMap}">
		                <c:forEach var="rMap" items="${rMap}">
		                    <td>${rMap.key}</td>
		                </c:forEach>
		            </c:when>
		            <c:otherwise>
		            	<div class="no-list">
		            		<span class="no-list">더 많은 기록을 남겨 보세요!</span>
		            	</div>
		            </c:otherwise>
		        </c:choose>
			</tr>
		</table>

		<script type="text/javascript">
		function randomDullColor() {
			  const colors = [
			    "#BFC8D7","#E2D2D2","#A2B59F","#D2D5B8","#BDC2BB",
			    "#C9BA9B","#D18063","#C9CBE0","#909FA6","#D5CB8E",
			    "#ECD4D4","#CCDBE2","#DEB3CF","#EECFBB","#F6B99D",
			    "#D5E1DF","#EACACB","#E2B3A3","#A3B6C5","#B1D3C5",
			    "#CFDD8E","#E4BEB3","#F5DDAD","#F1BCAE","#C9DECF",
			  ];
			  const randomIndex = Math.floor(Math.random() * colors.length);
			  const mixColor = colors[randomIndex];
			  
			  // 선택된 색상을 배열에서 제거 (색상이 중복되지 않도록)
			  colors.splice(randomIndex, 1);
			  
			  console.log(mixColor);
			  return mixColor;
			}
		
		for(td of document.getElementsByTagName('td')){
			  td.style.backgroundColor = randomDullColor();
			}
		</script>
   ```

- 추출한 키워드에 적합한 `추천 식당 데이터`를 2 개 출력
   ```java
    // com.EatStamp.web.MemberController

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
	
	int recCount = restService.selectRecRowCount(comMap);
	
	List<RestVO> recRest = null;
	recRest = restService.selectRecList(comMap);
	
	model.addAttribute("recRest", recRest);
	model.addAttribute("recCount", recCount);
   ```

- `내 기록/찜한 식당`을 2 개 출력
   ```
   더보기 클릭 시 마이페이지 내의 내 기록/찜한 식당 목록 화면으로 이동
   ```

</details>

<details><summary> 글 작성 </summary>

- 이미지 첨부
   ```
   - 업로드 가능 확장자: png, jps, jpeg, bmp
   - 파일명을 랜덤 생성해서 저장 
   ```
   ```java
    // com.EatStamp.web.StampController

	//날짜별로 폴더를 생성해서 파일을 관리
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	Date date = new Date();
	String fileLoca = sdf.format(date);
	
	//저장할 폴더 경로
	String uploadPath = "D:/java/workspace/EatStamp3/src/main/webapp/images/imageUpload/upload" + fileLoca;
	
	File folder = new File(uploadPath);
	if(!folder.exists()) {
		folder.mkdir(); //폴더가 존재하지 않는다면 생성
	}
	
	String fileRealName = file.getOriginalFilename();
	
	//파일명을 고유한 랜덤 문자로 생성
	UUID uuid = UUID.randomUUID();
	String uuids = uuid.toString().replaceAll("-", "");
	
	//확장자 추출
	String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());
	
	System.out.println("저장할 폴더 경로: " + uploadPath);
	System.out.println("실제 파일명: " + fileRealName);
	System.out.println("폴더명: " + fileLoca);
	System.out.println("확장자: " + fileExtension);
	System.out.println("고유랜덤문자: " + uuids);
	
	String fileName = uuids + fileExtension;
	System.out.println("변경해서 저장할 파일명: " + fileName);
	
	//업로드한 파일을 서버의 지정한 경로 내에 실제로 저장
	File saveFile = new File(uploadPath + "\\" + fileName);
	file.transferTo(saveFile);
   ```

- 이미지 첨부 시 `실시간 미리보기` 출력
   ```java
    // com.EatStamp.web.StampController

	//게시글의 이미지 파일 전송 요청
	//ResponseEntity: 응답으로 변환될 정보를 모두 담은 요소들을 객체로 만들어서 반환해 줌
	@GetMapping("/display")
	public ResponseEntity<byte[]> getFile(String fileLoca, String fileName) throws IOException{
		
		File file = new File("/EatStamp3/src/main/webapp/images/imageUpload" + fileLoca + "\\" + fileName);
		System.out.println(file);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		//probeContentType: 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메서드
		//사용자에게 보여 주고자 하는 데이터가 어떤 파일인지를 검사해서 응답 상태 코드를 다르게 리턴할 수도 있음
		headers.add("Content-Type", Files.probeContentType(file.toPath()));
		
		result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		
		return result;
	}
   ```
   ```html
    <!--jsp/stamp/write.jsp-->

	<!-- 이미지 미리보기 -->
	<div class="fileDiv">
		<img class="fileImg" src="${pageContext.request.contextPath}/images/egovframework/common/no_image.png">
	</div>

   <script type="text/javascript">
	function readURL(input){
		if(input.files && input.files[0]){
			
			var reader = new FileReader(); //비동기 처리를 위한 파일을 읽는 자바스크립트 객체
			reader.readAsDataURL(input.files[0]); //readAsDataURL 메서드는 컨텐츠를 특정 Blob이나 File에서 읽어 오는 역할
			$(".fileDiv").css("display","block"); //파일업로드 시 화면에 숨겨져 있는 클래스 fileDiv를 보이게 한다
			
			reader.onload = function(event){ //읽기 동작이 성공적으로 완료되었을 때 실행되는 익명함수
				$('.fileImg').attr("src", event.target.result);
				console.log(event.target); //event.target은 이벤트로 선택된 요소를 의미
			}
		}
	}
	$("#file").change(function(){
		readURL(this); //this는 #file 자신 태그를 의미
	});
   </sctipt>
   ```
- 제목 및 내용 입력 시 `입력한 글자 수/제한 글자 수` 실시간 출력
   ```javascript
	//========글자수 카운트========//
	//제목 textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','#s_title',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength<=60){ //60자 이하인 경우
		    //남은 글자수 구하기
		    let remain = inputLength;
		    let text = remain + '/60';
		    //글자수 카운트 업데이트
		    $('#re_first .letter-count').text(text);
		  }else{ //60자를 넘어선 경우
		    $(this).val($(this).val().substring(0,60));
		  }
	});
	//내용 textarea에 내용 입력시 글자수 체크
	$(document).on('keyup','#s_content',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength<=140){ //140자 이하인 경우
		    //남은 글자수 구하기
		    let remain = inputLength;
		    let text = remain + '/140';
		    //글자수 카운트 업데이트
		    $('#re_first .letter-count2').text(text);
		  }else{ //140자를 넘어선 경우
		    $(this).val($(this).val().substring(0,140));
		  }
	});
   ```
- `검색` 버튼 클릭 시 `자식창`에서 `검색 기능`으로 상호명 검색, `부모창`으로 값 전송
   ```java
    // com.EatStamp.web.StampController

	//상호명 검색 폼
	@GetMapping("/stamp/rest.do")
	public String restForm() {
		return "stamp/rest";
	}
	
	//상호명 검색 폼에서 전송된 데이터 처리
	@PostMapping(value = "/stamp/rest_ok.do", produces = "text/plain; charset=UTF-8")
	@ResponseBody
	public String rest_ok(String r_name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", r_name);
		
		//int count = restService.selectR_nameRowCount(map);

		List<RestVO> list = restService.selectR_nameList(map);
		
		StringBuilder sb = new StringBuilder();
		if (list != null && list.size() > 0) {
			sb.append("<table>");
			sb.append("<tbody>");
			for (RestVO rest : list) {
				sb.append("<tr><td>")
				  .append("<a href=\"javascript:setParentText('").append(rest.getR_name()).append("');\">")
				  .append(rest.getR_name())
				  .append("</a></td></tr>")
				  .append("<tr><td>").append(rest.getR_add()).append("/ ").append(rest.getR_category()).append("</td></tr>");
			}
			sb.append("</tbody></table>");
		} else {
			sb.append("<p>검색 결과를 찾을 수 없습니다.</p>");
		}

		return sb.toString();
	}
   ```

   ```html
    <!--jsp/stamp/write.jsp-->

	<!-- 가게 검색 -->
	<div class="section2">
		<span class="rest-name">식당명</span>
		<textarea class="form-control" 
			rows="1" name="rest" id="pInput" placeholder="검색 버튼을 눌러 검색하세요" readonly></textarea>
		<label class="input-file-btn" for="searchBtn">검색</label>
		<input id="searchBtn" type="button" value="검색" onclick="rest();" style="display: none;"/>
	</div>
	
	
	<script>
		function rest(){
			url = "rest.do";
			window.open(url,"rest",'width=500,height=400, scrollbars=no, resizable=no');
		}
	</script>
   ```

   ```html
    <!--jsp/stamp/rest.jsp-->

   <script type="text/javascript">
	$(document).ready(function() {
		$("#search-form").submit(function(event) {
			event.preventDefault();
			$.ajax({
				type : "POST",
				url : "rest_ok.do",
				data : $("#search-form").serialize(),
				success : function(result) {
					$("#result-container").html(result);
				}
			});
		});
	});
	
	function setParentText(r_name) {
		  opener.document.getElementById("pInput").value = r_name;
		  window.close();
		}
   </script>
   ```

- 식당 검색이 완료되면 평가를 `단일 선택 체크박스`로 선택
   ```html

	<!-- 체크박스 -->
	<div class="section3-1">				
		<input type="checkbox" name="s_rate" id="s_rate2" value=2 onclick='checkOnlyOne(this)' style="display: none;"/>
		<label for="s_rate2" class="check-text"><i class="fa-solid fa-check"></i>  좋아요!</label>				
	</div>
	<div class="section3-2">
		<input type="checkbox" name="s_rate" id="s_rate1" value=1 onclick='checkOnlyOne(this)' style="display: none;"/>
		<label for="s_rate1" class="check-text"><i class="fa-solid fa-check"></i>  보통이에요</label>
	</div>
	<div class="section3-3">
		<input type="checkbox" name="s_rate" id="s_rate0" value=0 onclick='checkOnlyOne(this)' style="display: none;"/>
		<label for="s_rate0" class="check-text"><i class="fa-solid fa-check"></i>  별로였어요</label>
	</div>

   <script type="text/javascript">
	//========체크박스========//
	//중복 체크 불가능
	function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("s_rate");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
   </script>
   ```

- `#`으로 구분되는 `태그` 등록 가능
   ```java
    // com.EatStamp.service.impl.TagServiceImpl

	@Override
	public void createTagList(StampVO stampVO) {
		Pattern MY_PATTERN = Pattern.compile("#(\\S+)");
		Matcher mat = MY_PATTERN.matcher(stampVO.getS_tag());
		List<String> tagList = new ArrayList<>();
		
		while(mat.find()) {
			tagList.add((mat.group(1)));
		}
		
		System.out.println("Create HashTags Success! -----> " + tagList);
		saveTag(tagList, stampVO.getS_num(), stampVO.getMem_num());
	}

	@Override
	public Boolean saveTag(List<String> tagList, Integer s_num, Integer mem_num) {
		Integer result = 1;
		
		for (String tag : tagList) {
			TagVO findResult = tagMapper.findTagByContent(tag);
			
			//등록된 태그가 아니라면 태그부터 추가
			if(findResult == null) {
				tagMapper.saveTag(tag);
			}
			
			//태그-포스트 매핑 테이블에 데이터 추가
			TagVO findTag = tagMapper.findTagByContent(tag);
			result = tagPostMapper.saveTagPost(findTag.getTag_num(), s_num, mem_num);
		}
		
		return result == 1;
	}
   ```
   ```javascript
   //jsp/write.jsp

	//========태그에 #으로 시작하지 않는 문자열 입력 시 삭제========//
	let tagInput = document.getElementById("s_tag");

	tagInput.addEventListener("input", function() {
	  if (!tagInput.value.startsWith("#")) {
	    tagInput.value = "";
	  }
	});
   ```

- `등록` 버튼 클릭 후 `SUCCESS` 시 작성글 상세페이지로 이동
- `취소` 버튼 클릭 시 `기록을 취소하시겠습니까?` `alert` 출력 후 이전 페이지로 복귀
</details>

<details><summary> 글 상세 </summary>

- `사용자의 프로필` `글 제목` `작성일시` `이미지` `내용` `태그` 출력

- `글 작성에서 검색한 장소`와 `평가` 표시
- `수정` 버튼 클릭 시 `글 수정 페이지`로 이동
-  `삭제` 버튼 클릭 시 `삭제하시겠습니까?` `alert` 출력 후 `예`를 선택하면 `게시글 삭제` 및 `목록 페이지`로 이동
- `목록` 버튼 클릭 시 마이페이지 내의 `내 글 목록 페이지`로 이동
</details>

<details><summary> 글 수정 </summary>

- 이미 등록된 이미지가 있다면 초기 미리보기 이미지 세팅
   ```html
   <!--jsp/stamp/update.jsp-->
   <!-- 이미지 미리보기 -->
     <div class="fileDiv">
         <c:if test="${stamp.s_fileName == null}">				
		       <img class="fileImg" src="${pageContext.request.contextPath}/images/egovframework/common/no_image.png">
				</c:if>
				<c:if test="${stamp.s_fileName != null}">
					<img class="fileImg" src="${pageContext.request.contextPath}
						/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}">
				</c:if>
     </div>
   ```

- 이미지 파일 변경 시 이미 등록된 이미지 삭제 후 재등록
   ```java
    // com.EatStamp.web.StampController

    // 기존 파일 정보 가져오기
    String oldUploadPath = stamp.getS_uploadPath();
    String oldFileLoca = stamp.getS_fileLoca();
    String oldFileName = stamp.getS_fileName();

    if (file != null && !file.isEmpty()) {
        // 기존 파일 삭제
        if (oldFileName != null && !oldFileName.isEmpty()) {
            File oldFile = new File(oldUploadPath + "\\" + oldFileName);
            if (oldFile.exists()) {
                oldFile.delete();
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        String fileLoca = sdf.format(date);

        String uploadPath = "D:/java/workspace/EatStamp3/src/main/webapp/images/imageUpload/upload" + fileLoca;

        File folder = new File(uploadPath);
        if (!folder.exists()) {
            folder.mkdir();
        }

        String fileRealName = file.getOriginalFilename();

        UUID uuid = UUID.randomUUID();
        String uuids = uuid.toString().replaceAll("-", "");

        String fileExtension = fileRealName.substring(fileRealName.indexOf("."), fileRealName.length());

        String fileName = uuids + fileExtension;

        File saveFile = new File(uploadPath + "\\" + fileName);
        file.transferTo(saveFile);

        stamp.setS_uploadPath(uploadPath);
        stamp.setS_fileLoca(fileLoca);
        stamp.setS_fileName(fileName);
        stamp.setS_fileRealName(fileRealName);
    }
   ```

   ```javascript
   //jsp/stamp/update.jsp

    const formData = new FormData();
    const data = $('#file');
    
    if ($('#file').val()) {
        let file = $('#file').val();
        console.log('mem_num: ', member);
        console.log('file: ', file);
        
        formData.append('file', data[0].files[0]);

        file = file.slice(file.indexOf('.') + 1).toLowerCase();
        console.log('확장자: ', file);
        if (file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
            alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
            $('#file').val('');
            return;
        } else if (member === '') {
            alert('로그인이 필요한 서비스입니다.');
            return;
        }
    }
   ```

- `수정` 버튼 클릭 후 `SUCCESS` 시 `작성 내용 수정`, `게시글 상세 페이지`로 이동
- `취소` 버튼 클릭 시 `취소하시겠습니까?` `alert` 출력 후 `예`를 선택하면 `게시글 상세 페이지`로 이동
</details>

<details><summary> 내 글 목록 </summary>

- `+` 아이콘 클릭 시 `글 작성 페이지`로 이동

- 사용자가 작성한 글을 한 페이지에 5 개씩 출력

- 작성글이 6 개 이상일 경우 `PagingUtil`을 이용해 페이지 목록 표시 및 이동
   ```xml
    <!--StampMapper.xml-->
    <!--Oracle rnum을 MySQL rnum으로 변환-->

	<!-- 글목록 -->
	<select id="selectList" parameterType="map" resultType="stampVO">
		SELECT 
			s_num, 
			s_title, 
			s_content, 
			s_uploadPath,
			s_fileLoca, 
			s_fileName, 
			s_fileRealName, 
			s_rate, 
			reg_date, 
			r_name, 
			mem_num
		FROM(
			SELECT
				@rownum:=@rownum+1 AS rn,
				s_num,
				s_title,
				s_content,
				s_uploadPath,
				s_fileLoca, 
				s_fileName, 
				s_fileRealName, 
				s_rate,
				reg_date,
				r_name,
				mem_num
			FROM eatstamp.stamp, (SELECT @rownum:=0) TMP
			WHERE mem_num = #{mem_num}
			ORDER BY s_num DESC
			) t1
		WHERE rn BETWEEN #{start} and #{end}
		
	</select>
   ```
</details>

<details><summary> 식당 상세 </summary>

- `상호명` `업태명` `대표 이미지` `전화번호` `위치` `기타 세부 정보` 출력

- `식당 찜하기` 기능
   ```
   - 빈 하트 아이콘 클릭 시 찜한 식당에 추가되고 채운 하트 아이콘으로 변경
   - 채운 하트 아이콘 클릭 시 찜한 식당에서 삭제되고 빈 하트 아이콘으로 변경
   ```
	```js
	//찜하기 클릭 시 실행 ajax
	function addR_like(){
		$.ajax({    
			url : "/add_rest_like.do",
			data : {
					r_num : $('#r_num').val()
					},
			dataType : "json",
			type     : "post",
			async    : true,
			success  : function(data) {	            	
						
					if(data == 1){   
						//가게 등록에 성공했다면
						//아이콘 변경
					document.getElementById("empty_heart").innerHTML = "<i class='fa-solid fa-heart'></i>";
									
						//아이디값 변경
						$("#empty_heart").attr('id', 'full_heart');
								
								alert("해당 가게가 찜 목록에 추가되었습니다.");
								
						//찜하기 취소 ajax용으로 r_like_num을 새로 받아오기, ajax함수 추가 
							plusR_like();
								
						} else { 
								alert("찜하기에 실패했습니다. 다시 시도해주세요.");
						} //else end 	
				
					},  //success end    
					
					error : function(data) {
						console.log("찜하기 오류");
						alert("찜하기에 실패했습니다. 다시 시도해주세요. 222");
					
					}//error end
					
			}); //ajax end
		}//찜하기 등록 함수 end

	function plusR_like(){
		$.ajax({    
			url : "/plus_rest_like.do",
			data : {
						r_num : $('#r_num').val()
					},
			dataType : "json",
			type     : "post",
			async    : true,
			success  : function(data) {	            	
							
						if(null != data){   
									
							$("#r_like_num").attr('value', data);
									
							} else { 
								alert("찜하기 오류입니다.");
							} //else end 	
					
						},  //success end    
						
			error : function(data) {
						console.log("추가로 받아오기 오류");
						
						}//error end
						
			}); //ajax end
		}//찜하기 등록 함수 end

	//찜하기 취소 클릭 시 실행 ajax
	function deleteR_like(){
		$.ajax({    
							
			url : "/delete_rest_like.do",
			data : {
					r_num : $('#r_num').val(),
					r_like_num : $('#r_like_num').val()
				},
			dataType : "json",
			type     : "post",
			async    : true,
			success  : function(data) {	            	
								
					if(data == 1){   
							//가게 삭제에 성공했다면
							//아이콘 변경
						document.getElementById("full_heart").innerHTML = "<i class='fa-regular fa-heart'></i>";
										
						//아이디값 변경
						$("#full_heart").attr('id', 'empty_heart');
										
							alert("해당 가게가 찜하기 목록에서 삭제되었습니다..");
											
						} else { 
									alert("삭제에 실패했습니다. 다시 시도해주세요.");
						} //else end 	
					
					},  //success end    
							
			error : function(data) {
					console.log("찜하기 삭제 오류");
					alert("찜하기 삭제 에 실패했습니다. 다시 시도해주세요. 222");
							
				}//error end
							
		}); //ajax end
	}//찜하기 삭제 함수 end
	```


- 위치를 `카카오 지도 API`를 이용해 표시
	```js
	//지도 불러오기용 변수 설정
	var view_add = $('#rest_add').val();

	//지도 생성하기
	var mapContainer = document.getElementById('map'), // 지도 표시 div 
		mapOption = {
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도 중심좌표
			level: 3 // 지도 확대 레벨
	};  

	// 지도를 생성  
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색 >>검색값 view_add
	geocoder.addressSearch(view_add , function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">식당 정보</div>'
			});
			infowindow.open(map, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동
			map.setCenter(coords);
			} else{
				
				alert("지도표시오류");
			}
		});    
	```


- `목록으로` 버튼 클릭 시 뒤로가기 동작

</details>

<details><summary> 검색 </summary>

- 검색 전 초기 세팅
   ```
   - 검색창과 로그인한 사용자가 작성한 적 있는 추천 해시태그 목록, 토글 버튼만 출력
   - 토글 버튼 클릭 시 전체 식당 목록과 내가 쓴 글 목록 출력
   ```
   ```html
    <!--jsp/searchPage.jsp-->

	<form id="searchForm" name="searchForm">
	<!--  페이징 요청하는 자바스크립트 함수명 // 검색 버튼 바뀔 때마다 js단에서 처리해주기 -->
		<input type="hidden" id="function_name" name="function_name" value="getSearchNomalList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				<input type = "hidden"  id ="mem_num" name ="mem_num" value = "${member.mem_num}">
		<input type="text" id="search_text" name="search_keyword">   
		<button type="button" id = "searchBtn"> <i  class="fa-solid fa-magnifying-glass header_search"></i> </button>	
	</form>
		
	<br>
	<!-- 추천 해시 출력 영역 -->
	<div id="tag_result"> </div>
					
	<!--  검색 전환용 토글 출력-->			
	<div class="centerer">
		<div class="switcher">
				<input type="radio" name="balance" value="yin" id="yin" class="switcher__input switcher__input--yin" >
				<label for="yin" class="switcher__label" id="popular"> 식당 </label>
				
				<input type="radio" name="balance" value="yang" id="yang" class="switcher__input switcher__input--yang" checked="">
				<label for="yang" class="switcher__label" id="recent"> 내 스탬프 </label>
				
			<span class="switcher__toggle"></span>
	</div>
   ```

- `추천 해시태그 목록` 클릭 시 해당 해시태그가 존재하는 게시글 검색 및 출력
   ```javascript
	//페이지 실행 시 추천 태그
	function getRecommendTag(){		
		$.ajax({    
							
			url : "/get_recommendTag.do",
			data : {
				mem_num : $('#mem_num').val()
				},
			dataType : "json",
			type     : "post",
			success  : function(data) {
									
					var div = "";
							
					$(data).each(function(){
								
					div += "<div class= 'oneTag'>";
					div += "<span style='font-size: 20px;' class ='tag_mix' href= '/tag_semiSearch.do?tag_content="
							+ this.tag_content + "&mem_num=" + this.mem_num+" '>"+ "#"  +this.tag_content +"</span>";    
					div += "</div>";         
		
					})//each end
							
						$("#tag_result").html(div);
										
					},  //success end    
							
			error : function(data) {
						console.log("태그 추천 오류");
				}//error end
							
			}); //ajax end
	}//태그 추천 호출 함수 end
   ```

- 일반 검색 시 해당 키워드가 존재하는 게시글 및 식당 정보 출력
- `토글 버튼`으로 `게시글/식당 정보` 이동
   ```js
   //검색 버튼 클릭 시 ajax > 기본 내 글 검색
	$(document).on("click", "#searchBtn", function(){
		
		textElement.value = "getSearchNomalList";
		
		console.log(textElement.value);
	
		getSearchNomalList();
		   
	}); //onclick end
		
		
	//스위치 버튼 클릭 시 ajax > 기본 내 글 검색
	$(document).on("click", "#yang", function(){
	
		textElement.value = "getSearchNomalList";
	
		console.log(textElement.value);
		
		getSearchNomalList();
			   
	}); //onclick end
		
	//스위치 버튼 다시 클릭 시 ajax > 레스토랑 정보 검색
	$(document).on("click", "#yin", function(){
			
			textElement.value = "getSearchRestList";
			
			console.log(textElement.value);
		
			getSearchRestList();
				   
	}); //onclick end
   ```

- `#` 붙여서 검색 시 해당 해시태그가 존재하는 게시글만 검색 및 출력
   ```
   - 단일 태그 검색 및 다중 태그 검색 가능
   - 다중 태그 검색(해시태그를 두 개 이상 검색) 시 검색한 해시태그가 존재하는 게시글 모두 출력
   ```
	```java
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
	```

	```java

	@Override
		public ResultUtil getNomalSearchList(SearchForm form) throws Exception {
			
			ResultUtil resultUtil = new ResultUtil();
			
				CommonVO commonVO = new CommonVO();
		
				//검색결과 수 구하기
				int totalCount = searchMapper.selectStampRowCount(form);
				
				if (totalCount != 0) {
					CommonForm commonForm = new CommonForm();
					commonForm.setFunction_name(form.getFunction_name());
					commonForm.setCurrent_page_no(form.getCurrent_page_no());
					commonForm.setCount_per_page(10);
					commonForm.setCount_per_list(5);
					commonForm.setTatal_list_count(totalCount);
					commonVO = PagingUtil2.setPageUtil(commonForm);
				}
		
				form.setLimit(commonVO.getLimit());
				form.setOffset(commonVO.getOffset());
		
				List<SearchVO> list = searchMapper.nomal_searchCheck(form); //게시글 정보 리스트 가져오는 메소드 
		
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("list", list);
				resultMap.put("totalCount", totalCount);
				resultMap.put("pagination", commonVO.getPagination());
		
				resultUtil.setData(resultMap);
				resultUtil.setState("SUCCESS");
		
				return resultUtil;
			
		}
	```
- 검색 결과가 6 건 이상이면 `PagingUtil`을 이용해 페이지 목록 표시 및 이동
	```java
	@getter
	@setter
	@toString
	public class CommonForm {
		
		String function_name;
		int current_page_no;
		int count_per_page;
		int count_per_list;
		int tatal_page_count;
		int tatal_list_count;
		int limit;
		int offset;
	}
				
	```

	```java
	public class PagingUtil {
		
		public static CommonVO setPageUtil(CommonForm commonForm) {
			
		CommonVO commonVO = new CommonVO();
	
			String pagination = ""; // 페이징 결과 값
			String functionName = commonForm.getFunction_name(); // 페이징 목록을 요청하는 자바스크립트 함수명
			int currentPage = commonForm.getCurrent_page_no(); // 현재 페이지 번호
			int countPerList = commonForm.getCount_per_list(); // 한 화면에 출력될 게시물 수
			int countPerPage = commonForm.getCount_per_page(); // 한 화면에 출력될 페이지 수
			int totalListCount = commonForm.getTatal_list_count(); // 총 게시물 수
			int totalPageCount = totalListCount / countPerList; // 총 페이지 수
			if (totalListCount % countPerList > 0) { // 총 페이수를 구할 때 int형으로 계산하면 나머지가 있는 경우 게시물이 존재하기 때문에 총 페이지의 수를 수정
				totalPageCount = totalPageCount + 1;
			}
	
			int viewFirstPage = (((currentPage - 1) / countPerPage) * countPerPage) + 1; // 한 화면에 첫 페이지 번호
			int ViewLastPage = viewFirstPage + countPerPage - 1; // 한 화면에 마지막 페이지 번호
			if (ViewLastPage > totalPageCount) { // 마지막 페이지의 수가 총 페이지의 수보다 큰 경우는 게시물이 존재하지 않기 때문에 마지막 페이지의 수를 수정
				ViewLastPage = totalPageCount;
			}
	
			int totalFirstPage = 1; // 전체 페이지 중에 처음 페이지
			int totalLastPage = totalPageCount; // 전체 페이지 중에 마지막 페이지
			int prePerPage = 0; // 이전 화면에 첫번째 번호
			if (viewFirstPage - countPerPage > 0) {
				prePerPage = viewFirstPage - countPerPage;
			} else {
				prePerPage = totalFirstPage;
			}
			int nextPerPage = 0; // 이후 화면에 첫번째 번호
			if (viewFirstPage + countPerPage < totalPageCount) {
				nextPerPage = viewFirstPage + countPerPage;
			} else {
				nextPerPage = totalPageCount;
			}
	
			// 페이지 네이게이션 설정
			pagination += "<div class='pagination'>";
			pagination += "<a href='javascript:" + functionName + "(\"" + totalFirstPage + "\");' class=\"direction_left01\">[<<]</a>";
			pagination += "<a href='javascript:" + functionName + "(" + prePerPage + ");' class=\"direction_left01\">[<]</a>";
			for (int a = viewFirstPage; a <= ViewLastPage; a++) {
				if (a == currentPage) {
					pagination += "<a href='javascript:" + functionName + "(\"" + a + "\");' class='onpage'>[" + a + "]</a>";
				} else {
					pagination += "<a href='javascript:" + functionName + "(\"" + a + "\");'>[" + a + "]</a>";
				}
			}
			pagination += "<a href='javascript:" + functionName + "(" + nextPerPage + ");' class=\"direction_right01\">[>]</a>";
			pagination += "<a href='javascript:" + functionName + "(" + totalLastPage + ");' class=\"direction_right01\">[>>]</a>";
			pagination += "</div>";
	
			int offset = ((currentPage - 1) * countPerList); // 한 화면의 표출되는 게시물의 시작 번호 (쿼리 조건절)
	
			// LIMIT는 가져올 row의 수, OFFSET은 몇 번째 row부터 가져올지를 결정
			commonVO.setLimit(countPerList);
			commonVO.setOffset(offset);
			commonVO.setPagination(pagination);
	
			return commonVO;
		}

	```
</details>

<details><summary> 마이페이지 </summary>

- 페이지 좌측에 고정되어 있는 `네비게이션 메뉴 바`에서 메뉴 선택 가능 `회원 정보` `내 식사 기록` `찜한 가게` `회원 탈퇴`

- 사용자의 `프로필 아이콘` `닉네임` `성별` `나이` `이메일` 출력
   - `yyyy-MM-dd`로 등록되어 있는 `회원 생년월일 데이터`를 `만 나이`로 변경해서 출력
   
   <br/>
   
   ```java
    // com.EatStamp.web.MemberController

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
   ```

- 카카오 회원인 경우 `카카오 아이콘` 출력, 일반 회원일 경우 `잇스탬프 로고 아이콘` 출력

- 비밀번호 변경
   ```
   - 제약조건: 8 자 이상, 숫자/대소문자/특수문자 포함
   1) 현재 비밀번호와 입력한 비밀번호의 일치 여부 확인 후 불일치 시 ‘현재 비밀번호가 일치하지 않습니다.’ alert 출력
   2) 새로운 비밀번호와 제약조건이 맞지 않으면 ‘새로운 비밀번호를 다시 조합해 주세요.’ alert 출력
   3) 새로운 비밀번호와 새로운 비밀번호 확인이 서로 일치하지 않으면 alert 출력
   ```
   ```java
    // com.EatStamp.web.MemberController

	@RequestMapping(value = "/mypage_pw.do", method = RequestMethod.POST)
	public String mypage_pw(@RequestParam("mem_num") int mem_num, @RequestParam("mem_email") String mem_email,
				@RequestParam("mem_pwCheck") String mem_pwCheck, @RequestParam("new_mem_pw") String new_mem_pw,
								HttpSession session, HttpServletResponse response) throws Exception{
		
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
	    	    
	    	    //업데이트에 성공시
	    	    return "/login/resetSuccess";
	        }
   ```
   ```javascript
    //jsp/mypage.jsp

	function checks(){
	  var pwCheck = document.getElementById("mem_pwCheck").value;
	  var newPw = document.getElementById("new_mem_pw").value;
	  var newPwCheck = document.getElementById("new_mem_pwCheck").value;
	  
		//최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나>> Test12345678!
	  var getCheck= RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);

		//비밀번호 유효성검사
	  if (!getCheck.test(newPw)) {
		  alert("비밀번호를 형식에 맞게 입력해주세요.");
		  document.getElementById("new_mem_pw").value = "";
		  document.getElementById("new_mem_pw").focus();
		  return false;
		}
		
	  if (pwCheck === "" || newPw === "" || newPwCheck === "") {
	    alert("빈칸을 모두 입력해주세요.");
	    return false;
	  }
	  
		
	  if (newPw !== newPwCheck) {
	    alert("새로운 비밀번호가 일치하지 않습니다.");
	    return false;
	  }
	  
	  // 현재 비밀번호와 일치하지 않을 경우
	  if ("${pwdMatch}" === "false") {
	    alert("현재 비밀번호가 일치하지 않습니다.");
	    return false;
	  }

	  return true;
	} //checks() end
   ```

</details>

<details><summary> 회원 탈퇴 </summary>

- 회원 탈퇴 주의사항 안내 및 안내사항 동의를 위한 `체크박스`
	```js
	//체크박스 체크 누락 여부 확인
	function CheckTest(){
		
		var selectCheck = document.getElementByName("checkSelect");
		
		for (var i =0; i<selectCheck.length; i++){
			
			if(selectCheck[i].checked){
				return true;
			}
		}
		
		alert("체크박스를 확인해주세요");
		return false;	
	}
	```

- 현재 비밀번호와 입력한 비밀번호의 일치 여부 확인
   ```
   - 미입력 시 ‘필수 정보입니다.’ alert 출력
   - 불일치 시 ‘현재 비밀번호가 일치하지 않습니다.’ alert 출력
   ```

- `회원 탈퇴` 버튼 클릭 시 `탈퇴 완료되었습니다` `alert` 출력
   ```
   해당 회원 정보, 작성글, 찜 정보 삭제 후 비회원 메인페이지로 이동
   ```
	```java
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

	```

</details>

<br/>

- - -

<br/>

## 트러블 슈팅

### `ServiceImpl`에 **`@Autowired`** `Mapper` 시 오류
💣 오류 메시지
```
Error creating bean with name '': Unsatisfied dependency expressed through field ''; nested exception is 
No qualifying bean of type '' available: expected at least 1 bean which qualifies as autowire candidate.
Dependency annotations: {@org.springframework.beans.factory.annotation.Autowired(required=true)}
```
💡 해결
```
문제가 되는 Mapper(Bean으로 등록되지 않은 Mapper)에서
import org.apache.ibatis.annotations.Mapper; 를
import org.egovframe.rte.psl.dataaccess.mapper.Mapper; 로 수정하고

@Mapper("tagMapper")
이런 식으로 Mapper 이름을 명시
```

<br/>

### `Oracle` 페이징을 `MySQL`로 전환

💡 [Notion - Oracle 페이징을 MySQL로 전환](https://off-odd-white.notion.site/Oracle-MySQL-4fea327cedaf424188d9c76199b77815)

<br/>

### `Spring` `Mybatis` `komoran` 형태소 분석

💡 [Notion - Spring Mybatis komoran 형태소 분석](https://off-odd-white.notion.site/Spring-Mybatis-komoran-ebb49741345e48c9b4d18288c80ecbc2)

<br/>

### 작성한 글이 없을 때 회원 메인화면 오류
💣 문제
   - 키워드 기반 추천 식당을 검색하는 쿼리에 `rMap`의 `key`(키워드) 8 개를 삽입할 때 `key`가 존재하지 않는 경우를 고려하지 않음

💡 해결

   ```java
   Map<String, Object> comMap = new HashMap<String, Object>();
   comMap.put("k1", rMap.keySet().toArray()[0]);
   comMap.put("k2", rMap.keySet().toArray()[1]);
   comMap.put("k3", rMap.keySet().toArray()[2]);
   comMap.put("k4", rMap.keySet().toArray()[3]);
   comMap.put("k5", rMap.keySet().toArray()[4]);
   comMap.put("k6", rMap.keySet().toArray()[5]);
   comMap.put("k7", rMap.keySet().toArray()[6]);
   comMap.put("k8", rMap.keySet().toArray()[7]);
   comMap.put("start", 1);
   comMap.put("end", 2);
   ```
   - 위의 코드를 아래의 코드로 변경해 `rMap`에 `key`가 없을 경우 `Default Value` 삽입
   ```java
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
   ```

<br/>

### 비밀번호 재설정 시 유효성 검사를 통과하지 못한 경우에도 `form`이 `submit`되는 오류
💣 문제
   - `form` 안에서 `AJAX`를 사용해 결과값을 받아 온 후, `SUCCESS`시 결과값을 `if문`으로 나눠 `true`와 `false`로 배당했음에도 모든 `return`값을 `true`로 인식해 `form`의 `onsubit return`을 통과

💡 해결

   - 미리 `true` 값의 `전역변수` 선언

      ```js
      var flag = true;
      ```
   - 이후 아래의 코드처럼 `AJAX` 바깥에서 `return flag`의 분기 설정
      ```js
      $.ajax({
	 url : "/findPw_check.do",
	 dataType: "text",
	 type : "post",
	 data:{
			mem_email : $('#email-form').val()
		},
	      success : function(data){		            
			 if(data == 0){ 
				    //조회 데이터가 없다면
					 flag = false;
				                   		
				} else { 
				     //조회 데이터가 존재한다면
				       flag = true;
				                   		 
				 } //else end
			}, //success end
           error : function(data){
					flag = false;
		   }//error end
				         
      }) //ajax end	
			    	
	 return flag;	
      ```

<br/>

### `AJAX`를 통한 검색 시 `Paging` 처리가 되지 않는 문제
💣 문제
   - 검색 결과 리스트를 불러올 수는 있으나, 지속적인 페이징 처리 불가능

💡 해결
   - 미리 `변수`와 `리스트`의 양식을 지정해 놓은 함수를 작성하고, `AJAX` 실행 시마다 현재 `form`의 정보를 넘겨 주는 방식으로 해결

		```html
		<!--  페이징 요청하는 자바스크립트 함수명, 검색 버튼 바뀔 때마다 js단에서 처리 -->
		<input type="hidden" id="function_name" name="function_name" value="getSearchNomalList" />
		<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
		```

		```js
		//검색 클릭 시 호출 함수
		function getSearchNomalList(currentPageNo){
					
			if(currentPageNo === undefined){
					currentPageNo = "1";
				}
					
			$("#current_page_no").val(currentPageNo);
						
			$.ajax({    
								
			url : "/search_stampCheck.do",
			data : $("#searchForm").serialize(),
			dataType : "JSON",
			type     : "POST",    
			success  : function(obj) {
						//콜백함수 호출
						getSearchNomalListCallBack(obj);
												
					},  //success end    
								
				}); //ajax end
		}//일반 검색 호출 함수 end


		//호출 함수
		//일반 검색 콜백함수
		function getSearchNomalListCallBack(obj){
			
			var state = obj.state;        
			if(state == "SUCCESS"){
						
				var data = obj.data;            
				var list = data.list;
				var listLen = list.length;        
				var totalCount = data.totalCount;
				var pagination = data.pagination;
								
				var div = "";
					
				if(listLen >  0){
							
					for(var a=0; a<listLen; a++){
								
						var mem_num = list[a].mem_num; 
						var s_num = list[a].s_num; 
						var s_title = list[a].s_title; 
						var s_FileName   = list[a].s_FileName; 
						var s_fileLoca   = list[a].s_fileLoca; 
						var s_content  = list[a].s_content; 
						var reg_date = list[a].reg_date; 
						var r_num = list[a].r_num; 
						var search_keyword = list[a].search_keyword;
								
							//이하 리스트 div구성 
					} 
							
					} else {
							
						div += "<div>";
						div += "<span'>검색된 게시글이 존재하지 않습니다.</span>";
						div += "</div>";
					}
						
			$("#search_result").html(div);
			$("#total_count").text(totalCount);
			$("#pagination").html(pagination);
		}     	
					
		}//일반 호출 콜백 함수 end	

		```

<br/>

### `가게 찜하기` → `찜하기 취소` 기능이 연달아 작동하지 않는 문제
💣 문제
   - `<c:if>` 태그를 사용하여 해당 가게의 찜 여부 ui를 분리하였으나 `AJAX`를 사용해 작업을 반복하는 과정에서 찜 삭제에 필요한 컬럼(`r_like_num`)값이 들어있지 않았음

💡 해결
   - 찜하지 않은 가게에도 정보 전송용으로 `hidden type`의 `input`을 설정해준 후, 해당 `AJAX` 실행 다음에 필요한 파라미터값을 조회하는 `AJAX` 추가

		```html					
		<!-- ajax용 r_num, r_rlike_num  -->
		<input type="hidden"  id="r_num"  value="${list.r_num }"/> 
		<input type="hidden"  id="r_like_num" />
		``` 
   - 받아 온 파라미터로 미리 설정해 둔 `input`에 `attr` 메소드를 사용해 값 할당
		```js
		$("#r_like_num").attr('value', data);
		```

<br/>

### (admin) 비밀번호 변경 시 입력한 비밀번호와 현재 비밀번호가 같음에도 일치하지 않음으로 넘어가는 문제
💣 문제
   - 아래 코드에서 pw1과 pw2가 같은데도 "현재 비밀번호가 일치하지 않습니다." 메시지가 뜸
		```java					
		//입력한 비밀번호 확인값 
		    String pw1 = mem_pwCheck;

			//db에 저장된 멤버 비밀번호
		    String pw2 = result.getMem_pw();

			String newPW = new_mem_pw;

		  //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 때
		  if(pw1 != pw2) {
			String message = "현재 비밀번호가 일치하지 않습니다.";
		``` 

💡 해결
   - Java에서는 문자열을 비교할 때 **`==`**  또는 **`!=`**  연산자를 사용하지 않기 때문
    - 이러한 연산자는 참조 변수의 주소를 비교하므로, 두 문자열의 내용이 동일하더라도 다른 객체를 참조할 경우 false를 반환
   - Java에서 문자열의 내용을 비교하려면 **`equals()`**  메서드를 사용해야 함
		```java					
		  //입력한 비밀번호와 비밀번호 확인 입력값이 상이할 때
		  if(!pw1.equals(pw2)) {
			String message = "현재 비밀번호가 일치하지 않습니다.";
		``` 

