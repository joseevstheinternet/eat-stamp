<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>    
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp LoginPage</title>
</head>
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/login.css'/>" />	
	
	<link rel="stylesheet"
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
					integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
					crossorigin="anonymous" referrerpolicy="no-referrer" />
					
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<body><!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->
	 
	 <div class="page-main">
	 	<form name='loginForm' method="post" action="<%=request.getContextPath() %>/login_check.do" >
			
		<div id = "logo_box">
		<img src="${pageContext.request.contextPath}/images/egovframework/common/logo_full.png" class="main-logo">
		</div>
		
		<c:if test="${member == null}">
		<div id="login_wrap">
		
			<div id ="sentence_box">
				<a id="loginMsg"> 로그인하기 </a>		
			</div>
			
			<div id ="kakao_box">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=7d9ef6c74111b87a039dd00b4b1812f6&redirect_uri=http://localhost:8282/kakaoLogin.do&response_type=code">
				      <img src="${pageContext.request.contextPath}/images/egovframework/common/kakao_img.jpg" class="kakao-logo">
				</a>
			</div>
		
			<div id="email_box">
				<label for="mem_email"></label>
				<input type="text" id="mem_email" name="mem_email" placeholder="Email"/>
			</div>
			
			<div id="pw_box">
				<label for="mem_pw"></label>
				<input type="password" id="mem_pw" name="mem_pw"  placeholder="Password"/>
			</div>
			
			<div id="button_box">
				<button type="submit" id="loginBtn">Login</button>
				<button type="button" id="JoinBtn" onclick="location.href='<%=request.getContextPath() %>/join.do'">SignUp</button>
			</div>
			
			<div id="message_box">
				 <a id="findPwdMsg" href="<%=request.getContextPath() %>/findPassword.do">
				  <i class="fa-solid fa-arrow-right" ></i> 비밀번호를 잊으셨나요?</a>
			</div>		
					
			<div id="adminMessageBox">
				<!-- 사장님 로그인 -->
				 <a id="adminMsg" href="<%=request.getContextPath() %>/ownerLogin.do">
				  <i class="fa-solid fa-arrow-right" ></i>가게 사장님이신가요?</a>
			</div>
			
			<div id="adminMessageBox">
				<!-- 관리자 로그인 -->
				 <a id="adminMsg" href="<%=request.getContextPath() %>/mainAdmin.do">
				  <i class="fa-solid fa-arrow-right" ></i>관리자이신가요?</a>
			</div>
			
		</div>
		</c:if>
	
		<c:if test="${member != null }">
			<div class="member-box">
				<p class="mem_nick">${member.mem_nick} 님 환영합니다.</p>
				<button class="outBtn" id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
			
	</form>

</div> 	<!-- 전체 감싸기  -->

<br><br><br>

<!-- footer page -->
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

</body><!--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  -->


	<!-- 0327 카카오 로그인 화면 띄우기 -->
	<script type="text/javascript">	
		Kakao.init('c708fc10e6ae62d00a01cdd6dad561ed'); 
		console.log(Kakao.isInitialized()); // sdk초기화여부판단
		//카카오로그인
		function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
		
		//카카오로그아웃  
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  
			
		//카카오 데이터 전송용
		function kakaoLoginPro(response){
			var data = {id:response.id,email:response.kakao_account.email}
			$.ajax({
				type : 'POST',
				url : 'kakaoLogin.do',
				data : data,
				dataType : 'json',
				success : function(data){
					console.log(data)
					if(data.JavaData == "YES"){
						alert("로그인되었습니다.");
						location.href = '/user/usermain.do'
					}else if(data.JavaData == "register"){
						$("#kakaoEmail").val(response.kakao_account.email);
						$("#kakaoId").val(response.id);
						$("#kakaoForm").submit();
					}else{
						alert("로그인에 실패했습니다");
					}
					
				},
				error: function(xhr, status, error){
					alert("로그인에 실패했습니다."+error);
				}
			});
			
		</script>
</html>