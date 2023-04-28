<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pwFind.css'/>" />

	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
	<!-- 아이콘 사용 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" 
		    referrerpolicy="no-referrer" />

<body> <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->


	 <div class="page-main">
	 
		 <div id = "logo_box">
			<img src="${pageContext.request.contextPath}/images/egovframework/common/logo_full.png" class="main-logo">
		</div>
		
		<br>
		
		<div id ="sentence_box">
			<a id="loginMsg"> 비밀번호 찾기 </a>		
		</div>
		
		<br> <br>
		
	 <form id="checkForm" action = "/resetPassword.do" method="post" onsubmit="return code_check();">
	 
	 <label for="email-form">이메일</label>
		<div class="find_email_box">
	  		<input type="text"  id="email-form"  name ="mem_email" required/>
	  		<input type="button" id="find_pwBtn" value="인증번호 전송"/>	
		</div>
		<br><br>
	   	
	   	<label for ="code-form">인증번호 </label>
	   	<div class="find_pw_box">
			<div class=content>
				<div class="code_box">
				<input type="text"  id ="code-form" name ="mem_auth_pwEmail" placeholder="인증번호를 입력하세요"  required>
			 	<button id="submitBtn" type = "submit" >다음</button>
			</div>
			
			<br><br>		
		
			</div>
	   	</div>
	</form> 
	
	</div> <!-- page-main end  -->
	
</body>


<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

<script type="text/javascript"> <!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->


	//<0403 최은지 비밀번호 찾기 시 이메일 인증 클릭>
	$(document).on("click", "#find_pwBtn", function(){
		
		get_email_check();
			    
		}); //onclick end
		
		
		var flag2 = true;
		var flag = true;
		
		//<0403 최은지 비밀번호 찾기 시 이메일 입력 값 전달 ajax>
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
		
		
		//<0403 최은지 비밀번호 찾기 시 이메일 인증코드 전송 ajax>
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
		}// 전체 end

		
		
		//<0403 최은지 비밀번호 찾기 시 이메일 인증코드 대조 ajax>
			
			function code_check(){
				
				console.log("코드체크실행");
				
			//이벤트 안되게 막기
			  //event.stopPropagation();
				
			 $.ajax({
			        url : "/find_pw_comparison_mail.do",
			        dataType: "text",
			        type : "post",
			        async: false,
			        data:{
				        	mem_email : $('#email-form').val(),
				        	mem_check_code : $('#code-form').val()
				        	},
		            success : function(data){		            
					            	if(0 == data){   //인증번호가 일치하지 않는다면
					                	alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
					            		flag = false;

				                } else {
				                	
			                   		alert("인증번호가 일치합니다. 비밀번호 재설정 페이지로 이동합니다. ");
			                   		flag = true;
				                	
				               	 } //else end
				          	  }, //success end
				    error : function(data){
				    	   	console.log(data);
				    	   	alert("이메일과 인증번호를 다시 확인해주세요.");
				    	   	flag = false;
				      } 	//error end
				         
			    }) //ajax end	
			    
					return flag;	
			 
				     //인증번호 일치 실패>> 
				    //분기 설정 위해서 변수 등록 후 ajax바깥으로 빼서 return값 처리
			    
			}// 전체 end
			
		
		
		//비밀번호 재설정 페이지 호출 + email 값 넘기기 >>>지금은 안씀
		function resetPwd(){
			
			console.log("함수 실행");
			 $.ajax({
			        url : "/resetPassword.do",
			        dataType: "html",
			        type : "post",
			        data:{
				        	mem_email : $('#email-form').val()
				        	},
				        	
				    success : function(data){		            
					            	console.log("성공"); 
					            	console.log(data);
				          	  }, //success end
				          	  
				    error : function(data){
				    	   	console.log(data);
				      } 	//error end
 
			    }) //ajax end	
		}
		

</script>

</html>
