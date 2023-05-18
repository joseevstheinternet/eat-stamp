<%--
시스템명 : 회원 예약 확인내역 화면
파일명: ownerResveList.jsp
작성자: 최은지
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
					<c:if test="${0 == count}">
						<h2>예약 내역이 존재하지 않습니다.</h2>
					</c:if>
					
				<c:if test="${0 < count}">
					<div class ="div_table">
						<table class = "tbl_resveList">
						
							<tr class = "tr_resveDate">
								<th>예약일자</th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<td> ${list.resve_date } </td>
								</c:forEach>
							</tr>
						
							<tr class = "tr_resveTime">
								<th>예약시간</th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<td> ${list.resve_time } </td>
								</c:forEach>
							</tr>
							
							<tr class = "tr_resveMemberName">
								<th>예약자성함</th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<td> ${list.resve_name } </td>
								</c:forEach>
							</tr>
							
							<tr class = "tr_resveRestName">
								<th> 식당 상호명</th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<td> ${list.r_name } </td>
								</c:forEach>
							</tr>
							
							<tr class = "tr_resveCount">
								<th> 인원 </th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<td> ${list.resve_memCnt }명</td>
								</c:forEach>
							</tr>
							
							<tr class = "tr_resveStatus">
								<th> 상태 </th>
								<c:forEach var="list" items="${list}" varStatus="status">
									<c:if test="${'w' == list.resve_sttus}">
										<td>대기</td>
									</c:if>
									<c:if test="${'n' == list.resve_sttus}">
										<td>반려</td>
									</c:if>
									<c:if test="${'y' == list.resve_sttus}">
										<td>승인</td>
									</c:if>
									<c:if test="${'c' == list.resve_sttus}">
										<td>취소</td>
									</c:if>
								</c:forEach>
							</tr>			
											
							 <tr class="tr_resveCancel">
	                            <th>취소</th>
	                            <c:forEach var="list" items="${list}" varStatus="status">
	                                <td>
	                                    <button class="btn_cancelResve">취소</button>
	                                </td>
	                            </c:forEach>
                     	   </tr>
										
						</table>
					</div>	<!-- div_table end -->
					
				</c:if>
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

<script type="text/javascript">

	//현재 시간 가져오기
	var currentTime = new Date();
	
	// 예약일자 및 예약시간의 td 요소들 선택
	var resveDateElements = document.querySelectorAll('.tr_resveDate td');
	var resveTimeElements = document.querySelectorAll('.tr_resveTime td');
	var cancelButtons = document.querySelectorAll('.tr_resveCancel button');
	
	// forEach를 사용하여 각 예약 시간에 대해 처리   ㅇㅇㅇ
	resveTimeElements.forEach(function(element, index) {
	  // 예약일자와 예약시간 가져오기
	  var resveDate = new Date(resveDateElements[index].textContent);
	  var resveTime = new Date(resveTimeElements[index].textContent);
	
	  // 예약일자와 예약시간을 합친 시간 가져오기
	  var resveDateTime = new Date(resveDate.getFullYear(), resveDate.getMonth(), resveDate.getDate(), resveTime.getHours(), resveTime.getMinutes());
	
	  // 예약 시간이 현재 시간보다 이전이고 12시간 이내인 경우에만 취소 버튼을 표시
	  if (resveDateTime < currentTime && Math.abs(currentTime - resveDateTime) < 12 * 60 * 60 * 1000) {
	    cancelButtons[index].style.display = 'block'; // 취소 버튼 보이기
	  } else {
	    cancelButtons[index].style.display = 'none'; // 취소 버튼 숨기기
	  }
	});


</script>

</html>