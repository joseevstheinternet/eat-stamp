<%--
시스템명 : 회원 예약 확인내역 화면
파일명: ownerResveList.jsp
작성자: 이예지
작성일자: 2023.05.18
처리내용: 회원 예약 내역 확인 페이지이다.
History: 최은지, 2023.05.18 최초 작성
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
<title>Insert title here</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/memberResveListView.css'/>" />

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
					href="${pageContext.request.contextPath}/check_report.do" style="color: #9d9d9d">신고 내역</a></p>
				<p class="menu-list"><a class="menu-list"
					href="${pageContext.request.contextPath}/withdraw.do" style="color: #c5c5c5">회원 탈퇴</a></p>
		</div> <!-- 좌측 메뉴바 종료 -->
	
		<div class = "div_allWrap">
		
		<c:choose>
			<c:when test="${!empty member}">
			
				<span class = "txt_resve">예약 내역</span>
			
				<div class ="div_table">
					<table class = "tbl_resveList">
					
						<tr class = "tr_resveDate">
							<th>예약일시</th>
							<c:forEach var="list" items="${list}" varStatus="status">
								<td> ${list.r_date } </td>
							</c:forEach>
						</tr>
						
						<tr class = "tr_resveMemberName">
							<th>예약자 성함</th>
							<td> 이름1 </td>
							<td> 이름2 </td>
						</tr>
						
						<tr class = "tr_resveRestName">
							<th> 식당 상호명</th>
							<td> 상호명1 </td>
							<td> 상호명2 </td>
						</tr>
						
						<tr class = "tr_resveCount">
							<th> 인원 </th>
							<td> 인원1 </td>
							<td> 인원2 </td>
						</tr>
						
						<tr class = "tr_resveStatus">
							<th> 상태 </th>
							<td>  상태 1 </td>
							<td>  상태 2 </td>
						</tr>			
										
						<tr class = "tr_resveCancel">
							<th> 취소 </th>
							<td>  취소 1 </td>
							<td>  취소 2 </td>
						</tr>						
					</table>
				</div>	<!-- div_table end -->
				
				</c:when>
					<c:otherwise>
					<div class="div_noMember">
							<span class="txt_noMember">잘못된 접근입니다.</span>
							<span class="txt_noMember">회원 ID로 로그인하세요.</span>
						</div>
					</c:otherwise>
			</c:choose>	
		</div>	<!-- div_allWrap end  -->

	</div>	<!-- div_page end -->
	
<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>