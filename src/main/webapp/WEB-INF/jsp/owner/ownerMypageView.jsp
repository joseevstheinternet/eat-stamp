<%--
시스템명 : 가게 사장 로그인 화면
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
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
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
	<c:choose>
		<c:when test="${!empty owner}">
			 <div class="div_page">
			 
			 	<h2> 내용입력 </h2>
			 	
			 </div><!-- div_page end  -->
		</c:when>
			<c:otherwise>
				<div class="div_noOwnerSession">
					<span class="txt_noOwnerSession">잘못된 접근입니다.</span>
					<span class="txt_noOwnerSession">사장님 ID로 로그인하세요.</span>
				</div>
			</c:otherwise>
	</c:choose>	

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>