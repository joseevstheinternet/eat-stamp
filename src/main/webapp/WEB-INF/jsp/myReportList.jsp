<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<style>
div.stamp-table-name{
	display: flex;
	justify-content: space-between;
	font-size: 14px;
}

span.table-image{
	width: 60px;
    text-align: center;
}

span.table-title{
    width: 260px;
    text-align: center;
}

span.table-rname{
    width: 180px;
    text-align: center;
}

span.table-regdate{
    width: 160px;
    text-align: center;
}

span.table-writer{
    width: 85px;
    text-align: center;
}

div.box-title{
	width: 70px;
	margin-left: 15px;
}

div.box-title2{
	width: 180px;
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 70px;
}

div.box-rname{
	width: 70px;
	text-align: center;
	margin-right: 85px;
}

div.box-date{
	margin: 0 13px;
}

div.box-mem{
    width: 70px;
    text-align: center;
    font-size: 14px;
    color: gray;
    margin-right: 95px;
}

div.list-image01{
    width: 60px;
    text-align: center;
}

#report_num_div{
	display: none;
}

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		
 
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	

<!-- 부트스트랩 사용  -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- css 사용  --> 
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/mypageReport.css'/>" />
<body>

<div class="page-main">
	<c:choose>
		<c:when test="${!empty member}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
					<div class="mypage-menu">
						<p class="menu-list"><a class="menu-list" 
							href="${pageContext.request.contextPath}/mypage.do" style="color: #9d9d9d">회원 정보</a></p>
						<p class="menu-list"><a class="menu-list" 
							href="${pageContext.request.contextPath}/stamp/list.do" style="color: #9d9d9d;">내 식사 기록</a></p>
						<p class="menu-list"><a class="menu-list" 
							href="${pageContext.request.contextPath}/rest_list.do" style="color: #9d9d9d;">찜한 가게</a></p>
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
							<ul class="list-ul">
								<div class="stamp-table-name">
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
														<span class="font-set2" >${list.report_why}</span>
													</div>
													<div class="box-mem">
														<span class="font-set2">${list.mem_nick2}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${list.mem_nick1}</span>
													</div>	
													<div class="box-mem">
														<c:if test="${'w' == list.report_ynCode}">
															<span class="font-set4">대기</span>
														</c:if>
														<c:if test="${'n' == list.report_ynCode}">
															<span class="font-set4">반려</span>
														</c:if>
														<c:if test="${'y' == list.report_ynCode}">
															<span class="font-set4">승인</span>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<div class="page">${page}</div>
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
								<span aria-hidden="true">X</span>
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
				  	        	
				  	        	div += "<div class = wrap_div'>" //전체 div
				  	  
				  	        	div += "<div class = 'num_box'>"
				  	        	div += "<span class ='num_text'> 접수번호</span> <span class='line_text'> | </span>"
					  	    	div += "<input type='text' readonly name='report_num' class = 'ajax_text' value='"+this.report_num +"'>"; 
				  	        	div += "</div>";	//num_box end
				  	        	
				  	        	div += "<div class = 'dis_box'>";
				  	        	div += "<span class = 'dis_text'>구분</span> <span class='line_text'> | </span>";
											if ('' == this.s_num){
												div += "<span>댓글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}else{
												div += "<span>글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}
                 				div += "</div>";	//dis_div end
				  	        	
                 				div += "<div class = 'mem2_box'>" //신고자
                 				div += "<span class = 'mem2_text'>신고자</span> <span class='line_text'> | </span>"
				  	        	div += "<input type='text' readonly name='mem2_email' class = 'ajax_text' value='"+this.mem_email2 +"'>"; 
				  	        	div += "<input type='text' readonly name='mem_nick2' class = 'ajax_text' value='"+this.mem_nick2 +"'>"; 
				  	      		div += "</div>";	//mem2_box end
				  	        	
								div += "<div class = 'mem1_box'>" //피신고자
	                 			div += "<span class = 'mem1_text'> 피신고자</span> <span class='line_text'> | </span>"					  	        
				  	        	div += "<input type='text' readonly name='mem_email1' class = 'ajax_text' value='"+this.mem_email1 +"'>"; 
				  	        	div += "<input type='text' readonly name='mem_nick1' class = 'ajax_text' value='"+this.mem_nick1 +"'>"; 
					  	        
					  	      	div += "</div>";	//mem1_box end
					  	        	
				  	        	div += "<div class = 'why_box'>"
				  	        	div += "<span class = 'why_text' > 신고사유</span> <span class='line_text'> | </span>"
				  	        	div += "<textarea readonly name='report_why' class = 'ajax_area'>"+ this.report_why + "</textarea>"; 
				  	        	div += "</div>"; //why_box end     
				  	        	
				  	        	div += "<div class ='return_box'>"
						  	        		if (undefined == this.report_return){
								  	        	div += "<span class = 'return_text' style ='display:none'> 반려 사유</span>"
								  	        	div += "<textarea class = 'return_val' style ='display:none'>"+ this.report_return  +"</textarea>"
											}else{
								  	        	div += "<span class = 'return_text'> 반려 사유</span>"
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
				            
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("상세정보 조회 오류");
			            	alert("상세 정보 조회에 실패했습니다. 다시 시도해주세요.");
			            
			            }//error end
			            
			         }); //ajax end
		
	}); //전체 함수 end
	
	//취소 클릭 시 이벤트
	 $(document).on("click", "#modalN", function () {		
			    if (!confirm("해당 신고 내역을 취소하시겠습니까? 취소 후에는 내역 복구가 불가능하며, 다시 신고 접수를 진행해주셔야 합니다.")) {

			    } else {
					$("#modalN").prop("type", "submit");
			    }
	});
	
</script>
</html>