<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/restResveForm.css'/>" />
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- jQuery UI CSS -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 예약하기</title>
</head>

<body>

<div class="page-main">
	<div id="wrap">
		<div class="mypage-div02">
			<!-- 상단 타이틀 -->
			<div class="mypage-section1">
				<span class="mypage-title">${rest.r_name} 예약하기</span>
			</div>
			<!-- 상단 타이틀 끝 -->
			<!-- 예약 폼 시작 -->
			<div class="mypage-section2">
				<ul class="list-ul">
					<div class="progress">
						<div class="step completed">예약 일시 선택</div>
						<i class="fa-solid fa-chevron-right arrowIcon completed"></i>
						<div class="step completed">예약 정보 입력</div>
						<i class="fa-solid fa-chevron-right arrowIcon completed"></i>
						<div class="step current">예약 완료</div>
					</div>
					<span class="success-msg">
						예약이 완료되었습니다.<br>[마이페이지 - 예약 내역]에서 예약 정보를 확인할 수 있습니다.
					</span>

					<div class="div_btn">
						<button type="button" onclick="location.href='mypage.do'" class="box-button btn_cancel">목록으로</button>
					</div>
				</ul>
			</div>
			<!-- 예약 폼 끝 -->
		</div>
	</div>
</div>

<script type="text/javascript">
// 뒤로가기 금지
history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
};
</script>


<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>