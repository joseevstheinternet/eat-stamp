<%--
시스템명 : 가게 사장 회원가입 화면
파일명: ownerMyPageView.jsp
작성자: 최은지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 마이 페이지이다.
History: 최은지, 2023.05.15 최초 작성
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
<title>Owner My Page</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />

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

	<div class ="div_page">
		
		<div class ="div_allWrap">
		
		<form action="insertOwnerSignUpInfo.do" method="post" class ="frm_ownerSignUp" name ="ownerSignUpInfo">
				<div class = "div_txtWrap">
					<span class ="txt_textLogo">사장님 회원가입</span>
				</div> <!--div_txtWrap end  -->
				
				<div class = "div_wrapEmailBox">
					<span class = "txt_email">이메일</span>
					<div class = "div_inputEmailBox">
						<input class ="txt_emailInput" type="text" name ="mem_email" placeholder="로그인 및 비밀번호 찾기에 사용될 이메일을 입력해주세요." required="required">
						<button class = "btn_checkDuplEmail">중복확인</button>
					</div>
				</div>
				
				<div class = "div_wrapPwdOneBox">
					<span class = "txt_pwdOne">비밀번호</span>
					<input class="pwd_inputOne"  name = "mem_pwd" type="password" placeholder="숫자, 영문, 특수문자 조합 최소 8자 최대 15자">
				</div>
				
				<div class = "div_wrapPwdTwoBox">
					<span class = "txt_pwdTwo">비밀번호 확인</span>
					<input class="pwd_inputTwo" name = "mem_pwdCheck" type="password" placeholder="비밀번호를 다시 입력해주세요.">
				</div>
				
				<div class = "div_wrapSearchRestName">
					<span class = "txt_restName">상호명 검색</span>
					<input class="txt_restNameInput" type="text" placeholder="우측 버튼을 클릭해 상호명을 검색해주세요." readonly="readonly">
				</div>
				
				<div class = "div_wrapInsertRestName">
					<span class = "txt_restName">검색된 상호명이 없나요?</span>
					<input class="txt_restNameInput" type="text" placeholder="직접 상호명을 등록해주세요.">
				</div>
			
				<button class = "sbm_ownerSignUp" type="submit"> Sign Up</button>
		</form>
		
		</div><!-- div_allWrap end  -->
			 	
	 </div><!-- div_page end  -->
	

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>