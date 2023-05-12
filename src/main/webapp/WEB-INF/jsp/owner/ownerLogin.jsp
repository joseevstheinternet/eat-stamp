<%--
시스템명 : 가게 사장 로그인 화면
파일명: ownerLogin.jsp
작성자: 최은지
작성일자: 2023.05.12
처리내용: 가게 사장 전용 로그인 페이지이다.
History: 최은지, 2023.05.12 최초 작성
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 								prefix="c" %>
<%-- 헤더 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner Login Page</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css//ownerLogin.css'/>" />	

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
			
			<form class = "frm_owner_login"  method="post" action="ownerLoginCheck.do">
				<div class = "div_login_input_wrap">
					<input class = "txt_email_input" placeholder="EMAIL">
					<input class = "pwd_password_input"  type="password" placeholder="PASSWORD">
				</div> <!-- div_login_wrap end  -->
				
				<div class ="div_login_btn_wrap">
					<button class = "sbm_owner_login" type="submit">LOGIN</button>
					<button class = "btn_owner_join">JOIN</button>
				</div> <!-- div_login_btn_wrap end  -->
			</form>
		
		</div><!-- div_all_wrap end -->	
		
	</div><!-- div_page end -->	

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>