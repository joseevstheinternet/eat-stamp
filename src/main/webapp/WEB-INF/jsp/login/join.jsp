<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>    
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 회원가입</title>
</head>
	<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/join.css'/>" />
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
	<!-- 아이콘 사용 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" 
		    referrerpolicy="no-referrer" />

<body>
 
 <div class="page-main">

<div id= "join_wrap">

		<div id ="sentence_box">
                <h2 id="title">EatStamp 회원가입</h2>
         </div>
         
         <br><br>
                    <form:form modelAttribute="MemberVO" action='joinCheck.do' method="post" onsubmit="return checks()">
                    
	                           <label id="email_label"> 이메일 </label>   
								<br>
                               <div id="email_input_box">                                                   
                                   <input type="text" id="email-form" name=mem_email value="${MemberVO.mem_email}" required
                                        	placeholder="이메일 인증, 비밀번호 찾기 등에 사용됩니다. 정확하게 입력해주세요."> 	
                                     <button id= "emaliCheckBtn"  value="N">중복 확인</button>								
                              </div>
                              

							<label id="pwd_label"> 비밀번호 </label> 
							<br>
                              <div id="pwd_input_box">                            
                                   		 <input type="password" id="pass-form" name="mem_pw" value="${MemberVO.mem_pw}" 
                                   		 			placeholder="최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나를 사용해주세요." required>  
                                   		 <i class="fa fa-eye fa-lg"></i>
                                    	<div id="passCheck-msg" class="valid-msg" value="N"></div>
                              </div>
    
    
    						<label id="pwdCheck_label"> 비밀번호 확인 </label>  
    						<br>
							<div id="pwd_input_check_box">  
									 <input type="password" id="passCheck-form" name="mem_pwCheck"  value="${MemberVO.mem_pwCheck }" required>
									 <i class="fa fa-eye fa-lg"></i>
							</div>
							
							<label id="nick_label"> 닉네임 </label>  
							<br>
						    <div id="nick_box">  
									 <input type="text" id="name-form" name="mem_nick" value="${MemberVO.mem_nick}" required>
							</div>
												
												
							<div id="bitrh_label">
									<label id="email_label"> 생년월일 </label>  
									<br>
									<div class="check_font" id="birth_check"></div>		
							</div>		
							
							<div id="birth_box">  
									 <input type=number  id="birth_form" name="mem_birth" value="${MemberVO.mem_birth}"  required
									 			placeholder="8자리로 입력해주세요. ex) 19990101">		 
							</div>
							
							<div id="last_label">
								<label id="gender_label" class="gender_box"> 성별 </label>  
								<label id="profile_label"> 프로필 아이콘 </label>  		
							</div>	
							
								<br>
								
							<div id ="last_div"> <!-- 마지막 단 div -->
							
							<div id="gender_box" class="gender_box">  
									<c:set var = "mem_genderCode"  value = "${MemberVO.mem_profileCode }" /> 
									
							        	<input type="radio" id="radio-1" name="mem_genderCode" value="M"/>
							        	<label for="radio-1" class="container-radio">남성</label>       	
							        	
							       		<input type="radio" id="radio-2" name="mem_genderCode" value="F"/>
							       		<label for="radio-2">여성</label>

							</div>
											
							<div id="profile_box" class ="profile_box">  

									<c:set var = "mem_profileCode"  value = "${MemberVO.mem_profileCode }" /> 
										<input id="burgur" type="radio" name="mem_profileCode" value="i1"/>
										<label for="burgur"><i class="fa-solid fa-burger"></i></label>
										
							        	<input  id="iceCream" type="radio" name="mem_profileCode" value="i2"/>
							        	<label for="iceCream"><i class="fa-solid fa-ice-cream"></i></label>
							       
							       		<input id="pizza" type="radio" name="mem_profileCode" value="i3"/>
							       		<label for="pizza"> <i class="fa-solid fa-pizza-slice"></i></label>
							        
							        	<input id="drumStick" type="radio" name="mem_profileCode" value="i4"/>
							        	<label for="drumStick"><i class="fa-solid fa-drumstick-bite"></i></label>
							        
							       		<input id="rice" type="radio" name="mem_profileCode" value="i5"/>
							       		<label for="rice"><i class="fa-solid fa-bowl-rice"></i></label>
							</div>
                        
                       </div><!-- 마지막 단 div end-->
                       
                       <br> <br>
                        <div class="join_btn_box">
                            <button id="joinBtn" type="submit" >회원가입</button>
                        </div>
                        
                    </form:form>
                    
                           <br> <br><br> <br> <br> <br>
                    
     </div> <!--  join_wrap end -->           
</div><!--  page-main end -->   

</body> <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

	<!--  나중에 자바스크립트 파일 따로 분리 -->
	<script type="text/javascript">	
	
		//이메일 중복 체크	>> 이따 변수 저장 가능한 값 빼서 따로 작성하기
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
	    
	  //클릭시 비밀번호 확인 2
	    $('#pwd_input_check_box i').on('click',function(){
	        $('input').toggleClass('active');
	        if($('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
			
	
		//유효성 검사 + 시간 되면 keyup으로도 추가 
		 function checks(){
		      var getMail = RegExp( /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
		      var getCheck= RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/); //최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나>> Test12345678!
		      var iconCheck = false;
		      var genderCheck = false;
		      
		//이메일 공백 확인
	      if($("#email-form").val() == ""){
	        alert("이메일을 입력해주세요");
	        $("#email-form").focus();
	        return false;
	      }
	           
	      //이메일 유효성 검사
	      if(!getMail.test($("#email-form").val())){
	        alert("이메일형식에 맞춰 입력해주세요")
	        $("#email-form").val("");
	        $("#email-form").focus();
	        return false;
	      }
	      
	  	//닉네임 공백 확인
	      if($("#name-form").val() == ""){
	        alert("닉네임을 입력해주세요");
	        $("#name-form").focus();
	        return false;
	      }
	      
	    //비밀번호 공백 확인
	      if($("#pass-form").val() == ""){
	        alert("비밀번호를 입력해주세요.");
	        $("#pass-form").focus();
	        return false;
	      }
	          
	      //비밀번호 유효성검사
	      if(!getCheck.test($("#pass-form").val())){
	        alert("비밀번호를 형식에 맞게 입력해주세요.");
	        $("#pass-form").val("");
	        $("#pass-form").focus();
	        return false;
	      }
	           
	      //비밀번호 확인란 공백 확인
	      if($("#passCheck-form").val() == ""){
	        alert("비밀번호 확인란을 입력해주세요");
	        $("#passCheck-form").focus();
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
	
		  	//생일 공백 확인
		      if($("#birth_form").val() == ""){
		        alert("생년월일을 입력해주세요");
		        $("#birth_form").focus();
		        return false;
		      }
		  	
		  	//생일 유효성 검사 추가하기
		  	
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
						//통과
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{

			    	//통과
				}
				
				}else{
					//입력된 생년월일이 8자 초과
					alert("생년월일을 확인해주세요.");
					 return false;
				}

		 } //checks end
		
		// 생년월일	birthJ 유효성 검사
		var birthCheck = false;
		$('#birth_form').blur(function(){
			var dateStr = $(this).val();		
		    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		    var today = new Date(); // 날짜 변수 선언
		    var yearNow = today.getFullYear(); // 올해 년도 가져옴
			
		    if (dateStr.length <=8) {
				// 1900 보다 작거나 yearNow 보다 크다면 false를 반환
			    if (1900 > year || year > yearNow){
			    	
			    	$('#birth_check').text('년도를 확인해주세요.');
					$('#birth_check').css('color', 'red');
			    	
			    }else if (month < 1 || month > 12) {
			    		
			    	$('#birth_check').text('달을 확인해주세요.');
					$('#birth_check').css('color', 'red'); 
			    
			    }else if (day < 1 || day > 31) {
			    	
			    	$('#birth_check').text('일을 확인해주세요.');
					$('#birth_check').css('color', 'red'); 
			    	
			    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
			    	 
			    	$('#birth_check').text('달의 마지막 날짜를 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
			    	 
			    }else if (month == 2) {
			    	 
			       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			       	
			     	if (day>29 || (day==29 && !isleap)) {
			     		
			     		$('#birth_check').text('2월의 마지막 날을 확인해주세요.');
						$('#birth_check').css('color', 'red'); 
			    	
					}else{
						$('#birth_check').text('');
						birthCheck = true;
					}//end of if (day>29 || (day==29 && !isleap))
			     	
			    }else{
			    	
			    	$('#birth_check').text(''); 
			    	birthCheck = true;
				}
				
				}else{
					//입력된 생년월일이 8자 초과
					$('#birth_check').text('생년월일은 8자리로 입력해주세요.');
					$('#birth_check').css('color', 'red');  
				}
			}); 
		
					
	</script>
	
</html>