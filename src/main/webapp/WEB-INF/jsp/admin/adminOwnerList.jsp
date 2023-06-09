<%--
시스템명 : 관리자 - 사장님 관리 화면
파일명: adminOwnerList.jsp
작성자: 이예지
작성일자: 2023.05.15
처리내용: 관리자 전용 사장님 관리 페이지이다.
History: 이예지, 2023.05.15 최초 작성
 --%>

<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	
	    
<style>

ul.list-ul{
	margin: 15px 0;
}

div.stamp-table-name{
	display: flex;
    justify-content: space-between;
}

span.table-image{
	width: 50px;
    text-align: center;
}

span.table-title{
    width: 250px;
    text-align: center;
}

span.table-rname{
    width: 150px;
    text-align: center;
}

span.table-auth{
    width: 80px;
    text-align: center;
}

span.table-suspend{
    width: 120px;
    text-align: center;
}

span.table{
	color: lightgray;
}

div.list-span01{
	margin-left: 0px;
	cursor: pointer;
}

div.box-section1{
	justify-content: space-between;
}

div.box-no{
	width: 50px;
    text-align: center;
}

div.box-title{
	width: 250px;
    text-align: center;
}

div.box-rname{
	width: 150px;
	text-align: center;
}

div.box-mem3{
	width: 80px;
    text-align: center;
}

div.box-mem4{
	width: 120px;
	text-align: center;
}

button.update-btn{
    background-color: #ffc06c;
    color: white;
    padding: 3px 8px;
    border-radius: 15px;
}

div.list-image01{
    width: 60px;
    text-align: center;
}

/*검색창*/

div.mypage-section1-search{
    display: flex;
    justify-content: flex-end;
}

span.searchIcon{
    position: absolute;
    font-size: 14px;
    color: #ffc06c;
    margin-top: 9px;
    margin-left: 10px;
}

input[type=text] {
    width: 200px;
    height: 30px;
    font-size: 12px;
    border-radius: 15px;
    outline: none;
    padding-left: 27px;
    background-color: white;
    border: 1px solid #ffc06c;
    color: #ffc06c;
}

input::placeholder{
	color: #ffc06c;
}

select{
    height: 30px;
    padding: 0 0 0 5px;
    width: 63px;
    border: 1px solid #ffc06c;
    border-radius: 20px;
    color: #ffc06c;
}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 관리자 - 사장님 정보 관리</title>
 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		
<script>
 // 회원 상태 업데이트
 function updateOwnerStatus(event, mem_num, mem_admin_auth) {
	 event.stopPropagation();
 	//확인 창을 띄우고 사용자의 선택에 따라 실행
 	if (confirm("사장님 상태를 변경하시겠습니까?")) {
 		//Ajax POST 요청
         $.ajax({
         	url: "/updateOwnerStatus.do",
         	type: "POST",
         	data: {
         		mem_num: mem_num,
         		mem_admin_auth: mem_admin_auth
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
		<c:when test="${!empty admin}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
				<div class="mypage-menu">
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/mypageAdmin.do" style="color: #9d9d9d;">관리자 정보</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/memberListAdmin.do" style="color: #9d9d9d;">회원 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/adminOwnerList.do">사장님 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/restListAdmin.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stampListAdmin.do" style="color: #9d9d9d;">게시글 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/reportListAdmin.do"  style="color: #9d9d9d;">신고 내역 관리</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">사장님 정보 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 검색창 -->
					<div class="mypage-section1-search">
					    <form action="adminOwnerList.do" method="get">
					        <select name="searchType">
					            <option value="email">이메일</option>
					            <option value="nick">상호명</option>
					        </select>
					        <span class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></span>
					        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
					    </form>
					</div>
					<!-- 검색창 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<c:if test="${count == 0}">
							<div class="no-list"><span class="no-list">검색 결과가 존재하지 않습니다.</span></div>
						</c:if>
						<c:if test="${count > 0}">
							<ul class="list-ul">
								<div class="stamp-table-name">
									<span class="table-image table">no.</span>
									<span class="table-title table">이메일</span>
									<span class="table-rname table">상호명</span>
									<span class="table-auth table">상태</span>
									<span class="table-suspend table">상태변경</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="owner" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="list-span01" onclick="location.href='/restAdminDetail.do?r_num=${owner.r_num}'">
											<div class="box-section1">
												<div class="box-no">
													<span class="font-set2" style="color:#b5b5b5;">${owner.mem_num}</span>
												</div>
												<div class="box-title">
													<span class="font-set2">${owner.mem_email}</span>
												</div>
												<div class="box-rname">
													<span class="font-set2">${owner.mem_nick}</span>
												</div>
												<div class="box-mem3">
													<span class="font-set2">
														<c:choose>
														    <c:when test="${owner.mem_admin_auth == '3'}">미승인</c:when>
														    <c:when test="${owner.mem_admin_auth == '4'}">승인</c:when>
														    <c:when test="${owner.mem_admin_auth == '5'}">정지</c:when>
														</c:choose>
													</span>
												</div>
												<div class="box-mem4">
													<c:choose>
													    <c:when test="${owner.mem_admin_auth == 3}">
													        <button class="update-btn" onclick="updateOwnerStatus(event, ${owner.mem_num}, 4)">승인</button>
													        <button class="update-btn" onclick="updateOwnerStatus(event, ${owner.mem_num}, 5)" style="background-color:#b5b5b5">거절</button>
													    </c:when>
													    <c:when test="${owner.mem_admin_auth == 4}">
													        <button class="update-btn" onclick="updateOwnerStatus(event, ${owner.mem_num}, 5)" style="background-color:#b5b5b5">정지</button>
													    </c:when>
													    <c:when test="${owner.mem_admin_auth == 5}">
													        <button class="update-btn" onclick="updateOwnerStatus(event, ${owner.mem_num}, 4)">일반</button>
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
				<span class="no-admin">관리자 ID로 로그인하세요.</span>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>