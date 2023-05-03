<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	

<!-- 부트스트랩 사용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    
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

div.box-title{
	width: 100px;
	margin-left: 15px;
}

div.box-title2{
	width: 200px;
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
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
    margin-left: 40px;
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

button.searchIcon{
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
<title>EatStamp - 신고내역 관리</title>
 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		
</head>

<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/reportListAdmin.css'/>" />

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
						href="${pageContext.request.contextPath}/restListAdmin.do">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stampListAdmin.do"  style="color: #9d9d9d;">게시글 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/reportListAdmin.do"  style="color: #9d9d9d;">신고 내역 관리</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">신고 내역 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 검색창 -->
					<div class="mypage-section1-search">
					
					    <form method="post"  action="/goReportSearchAdmin.do">
					        <select name="field">			    
							    <c:set var = "field" value = "${field }" />
									<option value="r_num"
										<c:if test="${field == 'mem_num'}">selected</c:if>>피신고자</option>			
									<option value="r_name"
										<c:if test="${field == 'mem_num2'}">selected</c:if>>신고자</option>		
							  </select>
					        <button type="submit" class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></button>
					        <input type="text" name="search_keyword" placeholder="검색어를 입력하세요">
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
									<span class="table-image">신고 번호</span>
									<span class="table-image">구분</span>
									<span class="table-title">신고 내용</span>
									<span class="table-rname">신고자</span>
									<span class="table-regdate">피신고자</span>
									<span class="table-regdate">처리 상태</span>
								</div>
								<hr class="line">
								<c:forEach var="list" items="${list}">
									<li class="list-list">
										<div class="box-parent" id="test_div" >
											<%-- <input type="hidden" value="${rest.r_num}"> --%>		
											<div class="box-section1">
												<div class="box-title" id="report_num_div">
													<span class="font-set2">${list.report_num}</span>
												</div>
													<div class="box-title">
													<c:if test="${'' == list.s_num}">
														<span class="font-set2">댓글</span>
													</c:if>
													<c:if test="${'' == list.cmt_num}">
														<span class="font-set2">글</span>
													</c:if>
												</div>
											<div class="list-span01">
												<div class="box-section1">
													<div class="box-title2">
														<span class="font-set2">${list.report_why}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${list.mem_nick2}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${list.mem_nick}</span>
													</div>	
													<div class="box-mem">
														<c:if test="${'w' == list.report_ynCode}">
															<span class="font-set2" >대기</span>
														</c:if>
														<c:if test="${'n' == list.report_ynCode}">
															<span class="font-set2" >반려</span>
														</c:if>
														<c:if test="${'y' == list.report_ynCode}">
															<span class="font-set2" >승인</span>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<div class="page">${page}</div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- 모달창 띄우기-->
			<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">신고 상세 내역</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">X</span>
							</button>
						</div>
						<!-- 상세내역 출력 div -->
						<div class="modal-body"></div>
						<div class="modal-footer">
						<!-- 승인 및 반려 여부 text확인해서 js단에서 추가 처리(html 변경) -->
							<a class="btn" id="modalY" href="#">승인</a>
							<a class="btn" id="modalN" href="#">반려</a>
						</div>
					</div>
				</div>
			</div> <!-- 모달 end  -->

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

<script>
//모달창 띄우기
	$('.box-parent').click(function(e){
		e.preventDefault();
		$('#testModal').modal("show");
		
		// 조회할 report_num 가져오기
		var divNode = this.firstElementChild.firstElementChild;
		var getReportNum = divNode.innerText;
		
		//ajax실행 
		console.log("신고 상세 내역 조회 ajax 실행");
			
					$.ajax({    
				        
			            url : "/getReportDetail.do",
			            data : {
			            		 report_num : getReportNum
			           			 },
			            dataType : "json",
			            type     : "post",
			            async    : true,
			            success  : function(data) {	            	
			            	
			            	  var div = "";
				  	          
				  	          $(data).each(function(){
				  	        	  
				  	        	div += "<div class= 'modal_detail_report'>"; 
				  	        	div += "<span class = 'num_text'>" + this.report_num + "</span>"
				  	        	div += "<span class = 'mem1_email'>" + this.mem_email2 + "</span>"
				  	        	div += "<span class = 'mem1_nick'>" + this.mem_nick2 + "</span>"
				  	        	div += "<span class = 'why_text'>" + this.report_why + "</span>"
				  	        	div += "</div>";            
				  	        	
				  	          })//each end
				  	          
				  	        $(".modal-body").html(div);
				            
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("상세정보 조회 오류");
			            	alert("상세 정보 조회에 실패했습니다. 다시 시도해주세요.222");
			            
			            }//error end
			            
			         }); //ajax end
		
	}); //전체 함수 end

</script>

</html>