<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<!-- 부트스트랩 사용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- css -->
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampList.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/memberResveListView.css'/>" />	
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	

<style>

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 예약 내역</title>
</head>

 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		

<body>

<div class="page-main">
	<c:choose>
		<c:when test="${!empty member}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
				<div class="mypage-menu">
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/mypage.do" style="color: #9d9d9d;">회원 정보</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stamp/list.do" style="color: #9d9d9d;">내 식사 기록</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stamp/myCmtList.do" style="color: #9d9d9d;">내가 쓴 댓글</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/rest_list.do" style="color: #9d9d9d;">찜한 가게</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/selectMemberResveList.do"> 예약 내역 </a></p>
					<p class="menu-list"><a class="menu-list"
						href="${pageContext.request.contextPath}/check_report.do" style="color: #9d9d9d;">신고 내역</a></p>
					<p class="menu-list"><a class="menu-list"
						href="${pageContext.request.contextPath}/withdraw.do" style="color: #c5c5c5">회원 탈퇴</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">예약 내역</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<c:if test="${count == 0}">
							<div class="no-list"><span class="no-list">예약 내역이 없습니다.</span></div>
						</c:if>
						<c:if test="${count > 0}">
							<ul class="list-ul">
								<div class="stamp-table-name">
									<span class="table-image table">예약일시</span>
									<span class="table-title table">예약자 성함</span>
									<span class="table-rname table">식당명</span>
									<span class="table-regdate table">인원</span>
									<span class="table-writer table">상태</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="list" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="list-span01 box-parent">
											<div class="box-section1">
												<div class="box-no">
													<span class="font-set2">${list.resve_date} ${list.resve_time}</span>
												</div>
												<div class="box-title">
													<span class="font-set2" >${list.resve_name}</span>
												</div>
												<div class="box-rname">
													<span class="font-set2" >${list.r_name}</span>
												</div>
												<div class="box-date">
													<span class="font-set2">${list.resve_memCnt}명</span>
												</div>
												<div class="box-mem4">
												    <c:if test="${'w' == list.resve_sttus}">
														<span class="font-set2">대기</span>
													</c:if>
													<c:if test="${'n' == list.resve_sttus}">
														<span class="font-set2">거절</span>
													</c:if>
													<c:if test="${'y' == list.resve_sttus}">
														<span class="font-set2">승인</span>
													</c:if>
													<c:if test="${'c' == list.resve_sttus}">
														<span class="font-set2">취소</span>
													</c:if>
												</div>
											</div>
										</div>
										<c:if test="${not status.last}">
											<hr class="line"/>
										</c:if>
									</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="no-admin">
				<span class="no-admin">잘못된 접근입니다.</span>
				<span class="no-admin">다시 로그인해주세요.</span>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<script>

</script>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>