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
<link type="text/css" rel="stylesheet" href="<c:url value='/css/mypageReport.css'/>" />	
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 신고 내역</title>
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
						href="${pageContext.request.contextPath}/selectMemberResveList.do" style="color: #9d9d9d;"> 예약 내역 </a></p>
					<p class="menu-list"><a class="menu-list"
						href="${pageContext.request.contextPath}/check_report.do">신고 내역</a></p>
					<p class="menu-list"><a class="menu-list"
						href="${pageContext.request.contextPath}/withdraw.do" style="color: #c5c5c5">회원 탈퇴</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">신고 내역</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<c:if test="${count == 0}">
							<div class="no-list"><span class="no-list">신고한 내역이 없습니다.</span></div>
						</c:if>
						<c:if test="${count > 0}">
							<ul class="list-ul">
								<div class="stamp-table-name">
									<span class="table-image table">구분</span>
									<span class="table-title table">신고사유</span>
									<span class="table-rname table">신고자</span>
									<span class="table-regdate table">피신고자</span>
									<span class="table-writer table">처리상태</span>
								</div>
								<hr class="line2"/>
								<c:forEach var="list" items="${list}" varStatus="status">
									<li class="list-list">
										<div class="list-span01 box-parent">
											<div class="box-section1">
												<div id="report_num_div" style="display: none;">
													<span class="font-set2">${list.report_num}</span>
												</div>
												<div class="box-no">
													<c:if test="${'' == list.s_num}">
														<span class="font-set2">댓글</span>
													</c:if>
													<c:if test="${'' == list.cmt_num}">
														<span class="font-set2">글</span>
													</c:if>
												</div>
												<div class="box-title">
													<span class="font-set2" >${list.report_why}</span>
												</div>
												<div class="box-rname">
													<span class="font-set2">${list.mem_nick2}</span>
												</div>
												<div class="box-date">
													<span class="font-set2">${list.mem_nick1}</span>
												</div>
												<div class="box-mem4">
												    <c:if test="${'w' == list.report_ynCode}">
														<span class="font-set2">대기</span>
													</c:if>
													<c:if test="${'n' == list.report_ynCode}">
														<span class="font-set2">반려</span>
													</c:if>
													<c:if test="${'y' == list.report_ynCode}">
														<span class="font-set2">승인</span>
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
							<h4 class="modal-title" id="exampleModalLabel">신고 상세 내역</h4>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true" class="modal-x">X</span>
							</button>
						</div>
						<form method='post' action='/cancelReportMember.do'>
							<!-- 상세내역 출력 div -->
							<div class="modal-body"></div>
						</form>
					</div>
				</div>
			</div> <!-- 모달 end  -->
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
			  	        	  
			  	        	div += "<div class = 'modal_detail_report'>"; 
			  	        	
			  	        	div += "<div class = 'wrap_div'>" //전체 div
			  	  
			  	        	div += "<div class = 'num_box'>"
					  	        div += "<span class ='num_text menu_text'> 접수번호</span>"
						  	    div += "<input type='text' readonly name='report_num' class = 'ajax_text' value='"+this.report_num +"'>"
					  	        div += "</div>";	//num_box end
					  	        	
					  	        div += "<div class = 'dis_box'>";
					  	        div += "<span class = 'dis_text menu_text'>구분</span>";
											if ('' == this.s_num){
												div += "<span class='ajax_text'>댓글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}else{
												div += "<span class='ajax_text'>글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}
	                 			div += "</div>";	//dis_div end
					  	        	
	                 			div += "<div class = 'mem2_box'>" //신고자
	                 			div += "<span class = 'mem2_text menu_text'>신고자</span>"
	    				  	    div += "<input type='text' readonly name='mem_nick2' class = 'ajax_text' value='"+this.mem_nick2 +"'><br>"; 
					  	        div += "<input type='text' readonly name='mem2_email'  id='ajax_text_mem2' class = 'ajax_text ajax_text2' value='"+this.mem_email2 +"'>"; 
					  	      	div += "</div>";	//mem2_box end
					  	        	
								div += "<div class = 'mem1_box'>" //피신고자
		                 		div += "<span class = 'mem1_text menu_text'> 피신고자</span>";
					  	        div += "<input type='text' readonly name='mem_nick1' class = 'ajax_text' value='"+this.mem_nick1 +"'><br>"; 
					  	        div += "<input type='text' readonly name='mem_email1' id='ajax_text_mem1' class = 'ajax_text ajax_text2' value='"+this.mem_email1 +"'>"; 
						  	        
						  	   	div += "</div>";	//mem1_box end

				  	        	
						  		div += "<div class = 'why_box'>"
					  	        	div += "<span class = 'why_text menu_text'> 신고사유</span><br><br>"
					  	        	div += "<textarea readonly name='report_why' class='ajax_area'>"+ this.report_why + "</textarea>"; 
					  	        	div += "</div>"; //why_box end     
					  	        	
					  	        	div += "<div class ='return_box'>"
							  	        		if (undefined == this.report_return){
									  	        	div += "<span class = 'return_text' style ='display:none'> 반려 사유</span><br>"
									  	        	div += "<textarea class = 'return_val' style ='display:none'>"+ this.report_return  +"</textarea>"
												}else{
									  	        	div += "<span class = 'return_text menu_text'> 반려 사유</span><br><br>"
									  	        	div += "<textarea class = 'return_val' readonly>"+ this.report_return  +"</textarea>"
												}
					  	      div += "</div>" //return_box end
			  	        	
			  	        	//승인 상태가 n이나 y라면 푸터가 보이지 않도록 처리
			  	        	if (('n' == this.report_ynCode) || ('y' == this.report_ynCode)){
				  	        	div += "	<div class='modal-footer' id='one_modal' style ='display:none'>";
				  	        	div += "<button class='btn' id='modalY' type='button'>목록</button>";
				  	        	div += "</div>";
			  	        	}else{
				  	        	div += "	<div class='modal-footer' id='one_modal'>";
				  	        	div += "<button class='btn' id='modalN' type='button'>신고취소</button>";
				  	        	div += "</div>";
			  	        	}
		  	        		
			  	        	div += "</div>"; //wrap_div end     
			  	        	
			  	        	div += "</div>"; //modal_detail_report end
			  	          })//each end
			  	          
			  	        $(".modal-body").html(div);
			  	          
			  	     	// textarea 높이 동적 조절
			  	        var textarea = document.querySelector('textarea.return_val');
			  	        if (textarea) {  // textarea가 실제로 존재하는지 확인
			  	            textarea.addEventListener('input', autoResize, false);

			  	            function autoResize() {
			  	                this.style.height = 'auto';
			  	                this.style.height = this.scrollHeight + 'px';
			  	            }
			  	        }
			            
		            },  //success end    
		            
		            error : function(data) {
		            	console.log("상세정보 조회 오류");
		            	alert("상세 정보 조회에 실패했습니다. 다시 시도해주세요.");
		            
		            }//error end
		            
		         }); //ajax end
	
}); //전체 함수 end

//취소 클릭 시 이벤트
 $(document).on("click", "#modalN", function () {		
		    if (!confirm("해당 신고 내역을 취소하시겠습니까?\n취소 후에는 내역 복구가 불가능하며, 다시 신고 접수를 진행해주셔야 합니다.")) {

		    } else {
				$("#modalN").prop("type", "submit");
		    }
});
</script>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>