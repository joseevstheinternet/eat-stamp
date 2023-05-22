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
	width: 60px;
    text-align: center;
}

span.table-title{
    width: 225px;
    text-align: center;
}

span.table-rname{
    width: 180px;
    text-align: center;
}

span.table-regdate{
    width: 110px;
    text-align: center;
}

span.table-writer{
    width: 85px;
    text-align: center;
}

span.table{
	color: lightgray;
}

div.box-title{
	width: 200px;
}

div.box-rname{
	width: 180px;
	text-align: center;
}

div.box-date{
	margin: 0 13px;
}

div.box-mem{
    width: 85px;
    text-align: center;
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
<title>EatStamp 관리자 - 게시글 관리</title>
 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		
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
						href="${pageContext.request.contextPath}/adminOwnerList.do" style="color: #9d9d9d;">사장님 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/restListAdmin.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stampListAdmin.do">게시글 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/reportListAdmin.do"  style="color: #9d9d9d;">신고 내역 관리</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">게시글 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 검색창 -->
					<div class="mypage-section1-search">
					    <form action="stampListAdmin.do" method="get">
					        <select name="searchType">
					            <option value="title">제목</option>
					            <option value="writer">작성자</option>
					            <option value="rname">상호명</option>
					        </select>
					        <span class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></span>
					        <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
					        <!-- <button type="submit" class="searchBtn">검색</button> -->
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
									<span class="table-image table">사진</span>
									<span class="table-title table">제목</span>
									<span class="table-rname table">상호명</span>
									<span class="table-regdate table">작성일시</span>
									<span class="table-writer table">작성자</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="stamp" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="box-parent" onclick="location.href='stampDetailAdmin.do?s_num=${stamp.s_num}'">
											<input type="hidden" value="${stamp.mem_num}">
											
											<div class="list-image01">
												<c:if test="${stamp.s_fileName == null}">
													<i class="fa-solid fa-image imageIcon"></i>
												</c:if>
												<c:if test="${stamp.s_fileName != null}">
													<img id="imgfile" src="${pageContext.request.contextPath}
														/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}" 
														onerror="this.src='${pageContext.request.contextPath}/images/egovframework/common/loading.gif'">
												</c:if>
											</div>
											<div class="list-span01">
												<div class="box-section1">
													<div class="box-title">
														<span class="font-set2">${stamp.s_title}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${stamp.r_name}</span>
													</div>
													<div class="box-date">
														<span class="font-set3"><fmt:formatDate pattern="yy.MM.dd hh:mm" value="${stamp.reg_date}"/></span>
													</div>
													<div class="box-mem">
														<span class="font-set2">${stamp.mem_nick}</span>
													</div>
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