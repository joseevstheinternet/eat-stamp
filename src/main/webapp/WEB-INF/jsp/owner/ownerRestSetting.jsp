<%--
시스템명 : 가게 사장 식당 관리 화면
파일명: ownerRestSetting.jsp
작성자: 이예지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 식당 관리 페이지이다.
History: 이예지, 2023.05.15 최초 작성
 --%>

<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/common/ownerHeader.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />

<style>
div.mypage-menu{
	height: 190px;
}

div.mypage-section2{
	margin: 30px 0;
    background-color: white;
    border-radius: 20px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    padding: 40px 50px;
}

div.box-text{
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

span.resve-font1{
    font-size: 16px;
    letter-spacing: -1;
    font-weight: bold;
    flex: 1;
}
span.resve-font2{
	font-size: 15px;
	flex: 3;
}

div.box-explain{
    margin-left: 160px;
    margin-bottom: 10px;
}

span.resve-font-ex{
	font-size: 13px;
    color: #afafaf;
}

div.box-btn{
    display: flex;
    justify-content: flex-end;
}

button.update-btn{
    background-color: #ffc06c;
    color: white;
    padding: 5px 25px;
    border-radius: 20px;
    font-size: 16px;
}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 사장님 - 식당 관리</title>
</head>
<body>
<div class="page-main">
	<c:choose>
		<c:when test="${!empty owner}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
				<div class="mypage-menu second">
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/ownerMypage.do" style="color: #9d9d9d;">사장님 정보</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="#" style="color: #9d9d9d;">식당 정보 수정</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/ownerRestSetting.do">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerResveList.do" style="color: #9d9d9d;">예약 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerStampList.do" style="color: #9d9d9d;">식당 리뷰</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">식당 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<div class="box-text box-resveCode">
							<span class="resve-font1">예약 가능 여부 설정</span>
							<span class="resve-font2">${rest.r_resveCode}</span>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i> 예약 가능 여부를 '비공개'로 변경하면
													<br>　 회원으로부터 예약을 받을 수 없습니다.</span>
						</div>
						<div class="box-text box-resveDay">
							<span class="resve-font1">예약 날짜 주기 설정</span>
							<span class="resve-font2">${rest.r_resveDay} 일</span>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i> 예약 날짜 주기는 기본 14 일로 설정되어 있으며,<br>　 예약 날짜 주기를 설정하면
													<br>　 오늘로부터 설정한 예약 주기만큼 예약을 받을 수 있습니다.</span>
						</div>
						<div class="box-text box-resveTime">
							<span class="resve-font1">예약 시간 주기 설정</span>
							<span class="resve-font2">${rest.r_resveTime} 분</span>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i> 예약 시간 주기는 기본 120 분으로 설정되어 있으며,<br>　 예약 시간 주기를 설정하면 오픈 시간부터 마감 시간까지
													<br>　 설정한 예약 시간 주기마다 예약을 받을 수 있습니다.</span>
						</div>
						<div class="box-text box-resveMemCnt">
							<span class="resve-font1">최대 수용 인원 설정</span>
							<span class="resve-font2">${rest.r_resveMemCnt} 인</span>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i> 최대 수용 인원은 기본 8 인으로 설정되어 있으며,
													<br>　 한 테이블 당 최대 수용 인원입니다.</span>
						</div>
						<div class="box-text box-resveTableCnt">
							<span class="resve-font1">최대 수용 테이블 설정</span>
							<span class="resve-font2">${rest.r_resveTableCnt} 테이블</span>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i> 최대 수용 테이블은 기본 1 테이블로 설정되어 있으며,
													<br>　 한 타임 당 최대 수용 테이블 수입니다.</span>
						</div>
						<div class="box-btn">
							<button class="update-btn" onclick="#">설정</button>
						</div>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="no-admin">
				<span class="no-admin">잘못된 접근입니다.</span>
				<span class="no-admin">사장님 ID로 로그인하세요.</span>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>