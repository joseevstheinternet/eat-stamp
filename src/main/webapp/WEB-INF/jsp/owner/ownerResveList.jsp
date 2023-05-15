<%--
시스템명 : 가게 사장 예약 관리 화면
파일명: ownerResveList.jsp
작성자: 이예지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 예약 관리 페이지이다.
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
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	
	    
<style>
div.stamp-table-name{
	display: flex;
    justify-content: space-between;
}

span.table-image{
	width: 150px;
    text-align: center;
}

span.table-title{
    width: 80px;
    text-align: center;
}

span.table-rname{
    width: 110px;
    text-align: center;
}

span.table-regdate{
    width: 50px;
    text-align: center;
}

span.table-writer{
    width: 120px;
    text-align: center;
}

span.table{
	color: lightgray;
}

div.list-span01{
	margin-left: 0px;
}

div.box-section1{
	justify-content: space-between;
}

div.box-no{
	width: 150px;
    text-align: center;
}

div.box-title{
	width: 80px;
    text-align: center;
}

div.box-rname{
	width: 110px;
	text-align: center;
}

div.box-date{
	width: 50px;
    text-align: center;
}

div.box-mem4{
	width: 120px;
	text-align: center;
}

div.box-button{
	margin-top: 5px;
}

button.update-btn{
    background-color: #ffc06c;
    color: white;
    padding: 3px 8px;
    border-radius: 15px;
}

div.mypage-menu-second{
    width: 150px;
    height: 190px;
    background: white;
    border-radius: 25px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    padding: 20 0 20 30px;
}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 사장님 - 예약 관리</title>

<script>
 // 회원 상태 업데이트
 function updateResveStatus(resve_num, resve_sttus) {
 	//확인 창을 띄우고 사용자의 선택에 따라 실행
 	if (confirm("예약 상태를 변경하시겠습니까?")){
 		//Ajax POST 요청
         $.ajax({
         	url: "/owner/updateResveStatus.do",
         	type: "POST",
         	data: {
         		resve_num: resve_num,
         		resve_sttus: resve_sttus
         	},
         	success:function(){
         		//요청이 성공하면 페이지를 새로고침하여 목록 업데이트
         		location.reload();
         	}
         });
 	}
 }
</script>
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
						href="#" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerResveList.do">예약 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerStampList.do" style="color: #9d9d9d;">식당 리뷰</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">예약 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<c:if test="${count == 0}">
							<div class="no-list"><span class="no-list">예약이 존재하지 않습니다.</span></div>
						</c:if>
						<c:if test="${count > 0}">
							<ul class="list-ul">
								<div class="stamp-table-name">
									<span class="table-image table">예약일시</span>
									<span class="table-title table">예약자 성함</span>
									<span class="table-rname table">예약자 연락처</span>
									<span class="table-regdate table">인원</span>
									<span class="table-writer table">상태</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="resve" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="list-span01">
											<div class="box-section1">
												<div class="box-no">
													<fmt:formatDate pattern="yy-MM-dd hh:mm" value="${resve.resve_date}"/>
												</div>
												<div class="box-title">
													<span class="font-set2">${resve.resve_name}</span>
												</div>
												<div class="box-rname">
													<span class="font-set2">${resve.resve_phoneNum}</span>
												</div>
												<div class="box-date">
													<span class="font-set2">${resve.resve_memCnt}</span>
												</div>
												<div class="box-mem4">
												    <c:choose>
												        <c:when test="${resve.resve_sttus == 'w'}">
												        	<span class="font-set2">대기</span>
												        	<div class="box-button">
													            <button class="update-btn" onclick="updateResveStatus(${resve.resve_num}, 'y')">승인</button>
													            <button class="update-btn" onclick="updateResveStatus(${resve.resve_num}, 'n')" style="background-color:#b5b5b5">거절</button>
												        	</div>
												        </c:when>
												        <c:when test="${resve.resve_sttus == 'y'}">
												        	<span class="font-set2">승인</span>	
												        </c:when>
												        <c:when test="${resve.resve_sttus == 'n'}">
												        	<span class="font-set2">거절</span>	
												        </c:when>
												        <c:when test="${resve.resve_sttus == 'c'}">
												        	<span class="font-set2">취소</span>	
												        </c:when>
												    </c:choose>
												</div>
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