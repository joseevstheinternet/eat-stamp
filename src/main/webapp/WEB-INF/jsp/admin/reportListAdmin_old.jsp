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

.search_text {
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

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 관리자 - 신고내역 관리</title>
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
						href="${pageContext.request.contextPath}/adminOwnerList.do" style="color: #9d9d9d;">사장님 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/restListAdmin.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stampListAdmin.do"  style="color: #9d9d9d;">게시글 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/reportListAdmin.do" >신고 내역 관리</a></p>
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
									<option value="mem_num"
										<c:if test="${field == 'mem_num'}">selected</c:if>>피신고자</option>			
									<option value="mem_num2"
										<c:if test="${field == 'mem_num'}">selected</c:if>>신고자</option>		
							  </select>
					        <button type="submit" class="searchIcon"><i class="fa-solid fa-magnifying-glass"></i></button>
					        <input class='search_text' type="text" name="search_keyword" placeholder="회원의 이메일을 입력하세요.">
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
														<span class="font-set2" >${list.report_why}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${list.mem_nick2}</span>
													</div>
													<div class="box-rname">
														<span class="font-set2">${list.mem_nick}</span>
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
								<span aria-hidden="true">X</span>
							</button>
						</div>
						
						<form method='post' action='/insertReportAdmin.do'>
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
				<span class="no-admin">관리자 ID로 로그인하세요.</span>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>

<script>
//<0510 최은지>
//서버 렌더링 시 meta태그에 토큰 추가
//스프링 시큐리티 설정 시 <csrf disabled = "false" />, CsrfFilter를 활성화시켜 토큰값을 비교
var token = $("meta[name='_csrf']").attr('content');
var header = $("meta[name='_csrf_header']").attr('content');


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
			            beforeSend : function(xhr){
			    							//null값 체크
			    							if(token && header) {
			    						        $(document).ajaxSend(function(event, xhr, options) {
			    						            xhr.setRequestHeader(header, token);
			    						    	  });
			    								}//if end	
					    			  		}, //beforeSend end
			            success  : function(data) {	            	
			            	
			            	  var div = "";
				  	          
				  	          $(data).each(function(){
				  	        	  
				  	        	div += "<div class= 'modal_detail_report'>"; 
				  	        	
				  	        	div += "<div class = wrap_div'>" //전체 div
				  	  
				  	        	div += "<div class = 'num_box'>"
				  	        	div += "<span class ='num_text'> 접수번호</span>"
					  	    	div += "<input type='text' readonly name='report_num' class = 'ajax_text' value='"+this.report_num +"'>";
								div += "<a class='direct_link' href='"+ this.report_link + "'>상세내역 확인</a>";
				  	        	div += "</div>";	//num_box end
				  	        	
				  	        	div += "<div class = 'dis_box'>";
				  	        	div += "<span class = 'dis_text'>구분</span>";
											if ('' == this.s_num){
												div += "<span class='ajax_text'>댓글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}else{
												div += "<span class='ajax_text'>글</span>";
												div += "<span class='ajax_text'> &nbsp; </span>"
											}
                 				div += "</div>";	//dis_div end
				  	        	
                 				div += "<div class = 'mem2_box'>" //신고자
                 				div += "<span class = 'mem2_text'>신고자</span>"
    				  	        div += "<input type='text' readonly name='mem_nick2' class = 'ajax_text' value='"+this.mem_nick2 +"'><br>"; 
				  	        	div += "<input type='text' readonly name='mem2_email'  id='ajax_text_mem2' class = 'ajax_text' value='"+this.mem_email2 +"'>"; 
				  	      		div += "</div>";	//mem2_box end
				  	        	
								div += "<div class = 'mem1_box'>" //피신고자
	                 			div += "<span class = 'mem1_text'> 피신고자</span>";
				  	        	div += "<input type='text' readonly name='mem_nick1' class = 'ajax_text' value='"+this.mem_nick1 +"'><br>"; 
				  	        	div += "<input type='text' readonly name='mem_email1' id='ajax_text_mem1' class = 'ajax_text' value='"+this.mem_email1 +"'>"; 
					  	        
					  	      	div += "</div>";	//mem1_box end
					  	        	
				  	        	div += "<div class = 'why_box'>"
				  	        	div += "<span class = 'why_text' > 신고사유</span><br><br>"
				  	        	div += "<textarea readonly name='report_why' class = 'ajax_area'>"+ this.report_why + "</textarea>"; 
				  	        	div += "</div>"; //why_box end     
				  	        	
				  	        	div += "<div class ='return_box'>"
						  	        		if (undefined == this.report_return){
								  	        	div += "<span class = 'return_text' style ='display:none'> 반려 사유</span><br>"
								  	        	div += "<textarea class = 'return_val' style ='display:none'>"+ this.report_return  +"</textarea>"
											}else{
								  	        	div += "<span class = 'return_text'> 반려 사유</span><br><br>"
								  	        	div += "<textarea class = 'return_val' readonly>"+ this.report_return  +"</textarea>"
											}
				  	        	div += "</div>" //return_box end
				  	        	//버튼을 누르기 전까지는 display none
				  	        	div += "<div class = 'return_insert_box' style ='display:none'>";
				  	        	div += "<span class = 'return_text'> 반려 사유</span><br>";
				  	        	div += "<textarea name='report_return' class='return_insert_val' placeholder='반려사유를 필수적으로 입력해주세요.'></textarea>"
					  	        div += "	<div class='modal-footer' id='two_modal'>";
				  	        	div += "<button class='cancelBtn' type = 'button'>취소</button>";
				  	        	div += "<button class='subminBtn' type = 'submit'>등록</button>";
				  	        	div += "</div>"; //two_modal end
				  	        	div += "</div>"; //return_insert_box end      
				  	        	
				  	        	//승인 상태가 n이나 y라면 푸터가 보이지 않도록 처리
				  	        	if (('n' == this.report_ynCode) || ('y' == this.report_ynCode)){
					  	        	div += "	<div class='modal-footer' id='one_modal' style ='display:none'>";
					  	        	div += "<button class='btn' id='modalY' type='button'>승인</button>";
					  	        	div += "<button class='btn' id='modalN' type='button'>반려</button>";
					  	        	div += "</div>";
				  	        	}else{
					  	        	div += "	<div class='modal-footer' id='one_modal'>";
					  	        	div += "<button class='btn' id='modalY' type='button'>승인</button>";
					  	        	div += "<button class='btn' id='modalN' type='button'>반려</button>";
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
	
	
	//modalN(반려) 클릭 시 창 생성 + 버튼 글자 변경
	 $(document).on("click", "#modalN", function () {
		 $('.return_insert_box').css('display', 'block');	 
		$('#one_modal').css('display','none');
		$("[name=report_return]").attr("required" , true);
	});
	
	//modalN(반려) 클릭 후 취소 버튼 클릭 시
	 $(document).on("click", ".cancelBtn", function () {
		 $(".return_insert_val").val(""); //입력값 초기화
		 $("[name=report_return]").attr("required" , false); //입력 필수 설정 취소
		 $('.return_insert_box').css('display', 'none'); //영역 가리기	 
		$('#one_modal').css('display','block'); //영역 드러내기
	});
	
	//승인 클릭 시 이벤트
	 $(document).on("click", "#modalY", function () {
		 if("취소" != $("#modalY").html()){
				
			    if (!confirm("해당 신고를 승인 처리하시겠습니까?")) {
			       alert("승인 처리가 취소되었습니다.");
			    } else {
					$("#modalY").prop("type", "submit");
			    }
			
		 }else{
			 alert("오류가 발생했습니다. 다시 시도해주세요.");
		 }
	});
	

</script>

</html>