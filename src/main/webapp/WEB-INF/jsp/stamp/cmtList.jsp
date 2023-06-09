<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampList.css'/>" />	



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 내가 쓴 댓글</title>
</head>

<body>

<div class="page-main">
	<div id="wrap">
		<!-- 좌측 메뉴바 -->
		<div class="mypage-menu">
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/mypage.do" style="color: #9d9d9d;">회원 정보</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/stamp/list.do" style="color: #9d9d9d;">내 식사 기록</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/stamp/myCmtList.do">내가 쓴 댓글</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/rest_list.do" style="color: #9d9d9d;">찜한 가게</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/selectMemberResveList.do" style="color: #9d9d9d;"> 예약 내역 </a></p>
			<p class="menu-list"><a class="menu-list"
				href="${pageContext.request.contextPath}/check_report.do" style="color: #9d9d9d">신고 내역</a></p>
			<p class="menu-list"><a class="menu-list"
				href="${pageContext.request.contextPath}/withdraw.do" style="color: #c5c5c5">회원 탈퇴</a></p>
		</div>
		<!-- 좌측 메뉴바 종료 -->
		
		<!-- 내가 쓴 글 폼 시작 -->
		<div class="mypage-div02">
			<!-- 상단 타이틀 -->
			<div class="mypage-section1">
				<span class="mypage-title">내가 쓴 댓글</span>
			</div>
			<!-- 상단 타이틀 끝 -->
			<!-- 리스트 -->
			<div class="mypage-section2">
				<c:if test="${count == 0}">
					<div class="no-list"><span class="no-list">내가 쓴 댓글이 없습니다.</span></div>
				</c:if>
				<c:if test="${count > 0}">
					<ul class="list-ul">
						<c:forEach var="cmt" items="${list}" varStatus="status">
							<li class="list-list">
								<div class="box-parent" onclick="location.href='detail.do?s_num=${cmt.s_num}'">
									<input type="hidden" value="${cmt.mem_num}">
									
									<div class="list-image01">
										<c:if test="${cmt.s_fileName == null}">
											<i class="fa-solid fa-image imageIcon"></i>
										</c:if>
										<c:if test="${cmt.s_fileName != null}">
											<img id="imgfile" src="${pageContext.request.contextPath}
												/images/imageUpload/upload${cmt.s_fileLoca}/${cmt.s_fileName}" 
												onerror="this.src='${pageContext.request.contextPath}/images/egovframework/common/loading.gif'">
										</c:if>
									</div>
									<div class="list-span01">
										<div class="box-section1">
											<div class="box-title">
												<span class="font-set1">[${cmt.mem_nick}] ${cmt.s_title}</span>
											</div>
											<div class="box-date">
												<fmt:formatDate pattern="yy.MM.dd hh:mm" value="${cmt.reg_date2}"/>
											</div>
										</div>
											<i class="fa-solid fa-reply fa-rotate-180 replyIcon"></i>
											<c:choose>
											<c:when test="${fn:length(cmt.cmt_content) gt 64}">
												<span class="font-set2">${fn:substring(cmt.cmt_content,0,61)} …</span>
											</c:when>
											<c:otherwise>
												<span class="font-set2">${cmt.cmt_content}</span>
											</c:otherwise>
											</c:choose>
									</div>
								</div>
								<c:if test="${not status.last}">
									<hr class="line"/>
								</c:if>
							</li>
						</c:forEach>
					</ul>
					<div class="page">${page}</div>
				</c:if>
			</div>
		</div>
	</div>
	</div>
</div>


<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>