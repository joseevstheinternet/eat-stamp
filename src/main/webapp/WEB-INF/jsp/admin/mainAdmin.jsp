<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>

 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		

</head>

	<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/mainAdmin.css'/>" />
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
	<!-- 아이콘 사용 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" 
		    referrerpolicy="no-referrer" />

<body>
	
	 <div class="page_main">
	 
	 	<div class="admin_login_wrap">
	 	
 			<form class="admin_login_form" method="post" action="loginAdminCheck.do">
 				 <div id = "logo_wrap">
					<span class="main_text">관리자 로그인</span>
					<img class="main_logo" src="${pageContext.request.contextPath}/images/common/logo_full.png">
				</div>
 			
 				<input type="text" class="admin_email" name="mem_email" placeholder="Email">
 				<input type="password" class="admin_pwd" name="mem_pw" placeholder="Password">
 				<button type="submit" class="admin_login_btn">Login</button>
 			</form>
 			
	 		<div id="message_box">
				<a id="findPwdMsg" href="<%=request.getContextPath() %>/login.do">
				<i class="fa-solid fa-arrow-right" ></i> 회원 로그인으로 돌아가기</a>  
			</div>	
	 	
	 	</div> <!--  admin_login_wrap end-->
	 
	 </div>
	 
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>