<%--
시스템명 : 가게 사장 식당 리뷰 화면
파일명: ownerStampList.jsp
작성자: 이예지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 식당 리뷰 목록 페이지이다.
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

ul.list-ul{
	margin: 15px 0;
}

div.list-span01{
	margin: 0;
}

div.box-section1{
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 5px;
    cursor: pointer;
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
    width: 240px;
    text-align: center;
}

span.table-rname{
    width: 90px;
    text-align: center;
}

span.table-regdate{
    width: 100px;
    text-align: center;
}

span.table-writer{
    width: 85px;
    text-align: center;
}

span.table{
	color: lightgray;
}

div.box-no{
    width: 60px;
    text-align: center;
}

div.box-title{
	width: 240px;
	display: flex;
    justify-content: space-between;
}

div.box-cnt{
	display: flex;
    align-items: center;
    justify-content: space-around;
    width: 60px;
}

i.icon-set{
    color: lightgray;
    margin-top: 2px;
}

div.box-rname{
	width: 90px;
	text-align: center;
}

div.box-date{
	width: 100px;
	text-align: center;
}

div.box-mem4{
    width: 85px;
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
/*     text-align: center; */
}

/* select option{ */
/*     text-align: center; */
/*     border-radius: 0; */
/*     margin-left: -20px; */
/* } */

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 사장님 - 내 식당 리뷰</title>
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
						href="${pageContext.request.contextPath}/updateRestOwnerForm.do" style="color: #9d9d9d;">식당 정보 수정</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/ownerRestSetting.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerResveList.do" style="color: #9d9d9d;">예약 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerStampList.do">식당 리뷰</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">식당 리뷰 (${count} 건)</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 검색창 -->
					<div class="mypage-section1-search">
					    <form action="ownerStampList.do" method="get">
					        <select name="searchType">
					            <option value="title">제목</option>
					            <option value="writer">작성자</option>
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
									<span class="table-image table">사진</span>
									<span class="table-title table">제목</span>
									<span class="table-rname table">평가</span>
									<span class="table-regdate table">작성일시</span>
									<span class="table-writer table">작성자</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="stamp" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="list-span01" onclick="location.href='ownerStampDetail.do?s_num=${stamp.s_num}'">
											<div class="box-section1">
												<div class="box-no">
													<c:if test="${stamp.s_fileName == null}">
														<i class="fa-solid fa-image imageIcon"></i>
													</c:if>
													<c:if test="${stamp.s_fileName != null}">
														<img id="imgfile" src="${pageContext.request.contextPath}
															/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}" 
															onerror="this.src='${pageContext.request.contextPath}/images/egovframework/common/loading.gif'">
													</c:if>
												</div>
												<div class="box-title">
													<span class="font-set2">${stamp.s_title}</span>
													<div class="box-cnt">
														<i class="fa-solid fa-eye icon-set"></i><span class="font-set4">${stamp.s_view_cnt}</span>
														<i class="fa-solid fa-comment-dots icon-set"></i><span class="font-set4">${stamp.comment_count}</span>
													</div>
												</div>
												<div class="box-rname">
													<c:if test="${stamp.s_rate == 0}">
														<span class="font-set2">별로예요</span>
													</c:if>
													<c:if test="${stamp.s_rate == 1}">
														<span class="font-set2">보통이에요</span>
													</c:if>
													<c:if test="${stamp.s_rate == 2}">
														<span class="font-set2">좋아요</span>
													</c:if>
												</div>
												<div class="box-date">
													<fmt:formatDate pattern="yy-MM-dd hh:mm" value="${stamp.reg_date}"/>
												</div>
												<div class="box-mem4">
												    <span class="font-set2">${stamp.mem_nick}</span>
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


<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>