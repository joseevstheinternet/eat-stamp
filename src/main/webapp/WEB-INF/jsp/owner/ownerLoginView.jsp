<%--
시스템명 : 가게 사장 로그인 화면
파일명: ownerLoginView.jsp
작성자: 최은지
작성일자: 2023.05.12
처리내용: 가게 사장 전용 로그인 페이지이다.
History: 최은지, 2023.05.12 최초 작성
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 								prefix="c" %>
<%-- 헤더 삽입 --%>
<%@ include file="/WEB-INF/jsp/common/ownerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 사장님 - 로그인</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/ownerLogin.css'/>" />	

<%-- fontawsome 아이콘 사용 CDN --%>
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
		referrerpolicy="no-referrer" />

<%-- jquery 사용 CDN --%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<body>

	 <div class="div_page">

		<div class = "div_all_wrap">
		
			 <div id = "div_logoWrap">
				<span class="txt_ownerLogin">사장님 로그인</span>
				<img class="img_mainLogo" src="${pageContext.request.contextPath}/images/common/logo_full.png">
			</div>
			
			<form class = "frm_ownerLogin"  method="post" action="selectOwnerInfoLoginCheck.do">
				<div class = "div_loginInputWrap">
					<input class = "txt_emailInput" placeholder ="EMAIL" name = "mem_email">
					<input class = "pwd_passwordInput"  type ="password" name ="mem_pw" placeholder ="PASSWORD">
				</div> <!-- div_login_wrap end  -->
				
				<div class ="div_btnWrap">
					<button class = "btn_ownerJoin" type="button" onclick="location.href='/ownerSignUp.do'">SignUp</button>
					<button class = "sbm_ownerLogin" type="submit">LOGIN</button>
				</div> <!-- div_login_btn_wrap end  -->
			</form>
				 			
			<div class = "div_messageWrap">
		 		<div class="div_messageBox">
					<a class="goMessage" href="<%=request.getContextPath() %>/login.do">
					<i class="fa-solid fa-arrow-right" ></i> 회원 로그인으로 돌아가기</a>  
				</div>		
		 		<div class="div_messageBox">
					<a class="goMessage" href="<%=request.getContextPath() %>/mainAdmin.do">
					<i class="fa-solid fa-arrow-right" ></i> 관리자 로그인으로 돌아가기</a>  
				</div>	
			</div>
			
		</div><!-- div_all_wrap end -->	
		
	</div><!-- div_page end -->	

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>