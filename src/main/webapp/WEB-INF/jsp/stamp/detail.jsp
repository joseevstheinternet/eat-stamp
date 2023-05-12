<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampDetail.css'/>" />
<!-- 부트스트랩 사용  -->
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
<style>
body {
	margin:0; 
	padding:0; 
	font-family:'Noto Sans KR', sans-serif; 
	font-size:12px; 
	color:#666; 
	scroll:auto; 
	background:#fffbef;
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 글 상세 페이지</title>
</head>
<body>

<div class="page-main">
	<div class="view-box">
		<div class="box-wrap">
			<div class="section1"> <!-- 제목, 작성일시 -->
				<div class="pIcon">
					<c:choose>
						<c:when test="${member.mem_profileCode == 'i1'}">
							<i class="fa-solid fa-burger pIcon"></i>
						</c:when>
						<c:when test="${member.mem_profileCode == 'i2'}">
							<i class="fa-solid fa-ice-cream pIcon"></i>
						</c:when>
						<c:when test="${member.mem_profileCode == 'i3'}">
							<i class="fa-solid fa-pizza-slice pIcon"></i>
						</c:when>
						<c:when test="${member.mem_profileCode == 'i4'}">
							<i class="fa-solid fa-drumstick-bite pIcon"></i>
						</c:when>
						<c:when test="${member.mem_profileCode == 'i5'}">
							<i class="fa-solid fa-bowl-rice pIcon"></i>
						</c:when>
					</c:choose>
				</div>
				<div class="box-title">
					<div class="box-title2">
						<span class="font-set1">${stamp.s_title}</span>
						<div class="box-icons">
							<i class="fa-solid fa-eye icon-set"></i><span class="font-set2">${stamp.s_view_cnt}</span>
							<i class="fa-solid fa-comment-dots icon-set"></i><span class="font-set2">${cmtCnt}</span>
							<c:if test="${member.mem_num == stamp.mem_num}">
								<c:choose>
									<c:when test="${stamp.s_publicCode == '0'}">
										<i class="fa-solid fa-unlock icon-set"></i>
									</c:when>
									<c:when test="${stamp.s_publicCode == '1'}">
										<i class="fa-solid fa-lock icon-set"></i>
									</c:when>
								</c:choose>
							</c:if>
						</div>
					</div>
					<div class="box-date">
						<span class="font-set2">${stamp.mem_nick}(${stamp.mem_email})</span>
						<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${stamp.reg_date}"/>
					</div>
				</div>
			</div>
			<div class="section1-1">
				<div class="section1-1-1">
					<i class="fa-solid fa-location-dot mapIcon"></i>
				</div>
				<div class="section1-1-2">
					<span class="r_name">${stamp.r_name}</span>
				</div>
				<div class="section1-1-3">
				    <c:choose>
				        <c:when test="${stamp.s_rate == 2}">
				            <span class="s_rate">좋아요!</span>
				        </c:when>
				        <c:when test="${stamp.s_rate == 1}">
				            <span class="s_rate">보통이에요</span>
				        </c:when>
				        <c:otherwise>
				            <span class="s_rate">별로였어요</span>
				        </c:otherwise>
				    </c:choose>
				</div>
			</div>
			<div class="section2"> <!-- 사진, 내용, 태그 -->
				<div class="box-img">
					<c:if test="${!empty stamp.s_fileName}">
						<img class="fileImg" 
							src="${pageContext.request.contextPath}/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}" 
        					onerror="this.src='${pageContext.request.contextPath}/images/common/loading.gif'">
					</c:if>
				</div>
				
				<div class="box-content">
					<span class="font-set2">${stamp.s_content}</span>
				</div>
			<c:if test="${!empty stamp.s_tag}">
				<div class="box-content-tag">
					<span class="font-set3">태그</span>
					<span class="font-set4">${stamp.s_tag}</span>
				</div>
			</c:if>
			</div>
			<div class="section3"> <!-- 수정, 삭제, 목록 -->
				<c:if test="${member.mem_num == stamp.mem_num}">
					<button type="button" onclick="location.href='/stamp/update=${stamp.s_num}.do'" class="box-button delete_btn">수정</button>
					<button type="button" class="box-button delete_btn" id="delete_btn">삭제</button>
				</c:if>
				<c:if test="${member.mem_num != stamp.mem_num}">
					<button type="button" class="box-button delete_btn" id="report_btn">신고</button>
				</c:if>
				<button type="button" onclick="history.back();" class="box-button list_btn">목록</button>

			
			<script type="text/javascript">
				let delete_btn = document.getElementById('delete_btn');
				//이벤트 연결
				delete_btn.onclick=function(){
					let choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.replace('delete.do?s_num=${stamp.s_num}');
					}
				};
			</script> 
			</div>
		</div>
	</div>
	<!-- 댓글창 -->
	<br>
	<div class="view-box">
	
		<form id="com_form">
			<input type="hidden" name="s_num" value="${stamp.s_num}" id="s_num">
			<div id="com_first">
				<textarea class="form-control" rows="2" name="cmt_content" id="cmt_content" placeholder="댓글을 입력하세요" 
					onfocus="this.placeholder=''" onblur="this.placeholder='댓글을 입력하세요'" autocomplete="off" 
					<c:if test="${empty member}">disabled="disabled"</c:if>><c:if test="${empty member}">로그인해야 작성할 수 있습니다.</c:if></textarea>
				<button type="button" class="cmtBtn" id="cmtBtn">등록</button>
			</div>
			
			<c:if test="${!empty member}">
				<div id="com_second">
					<span class="letter-count">0/140</span>
				</div>
			</c:if>
		</form>
		
		<!-- 댓글 목록 출력 -->
		<div class="outputs">
			<div id="output"></div>
			<div id="loading" style="display: none;">
				<img src="${pageContext.request.contextPath}/images/common/loading.gif" width="100" height="100">
			</div>
		</div>
	</div>
</div>

<!-- 모달창 띄우기-->
<div class="modal fade" id="testModal" tabindex="-1" role="dialog" 
													aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="exampleModalLabel">회원 신고하기</h4>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true" class="modal-x">X</span>
				</button>
			</div>
			
				<!-- <form method='post' action='/cancelReportMember.do'> -->
			<!-- 상세내역 출력 div -->
			<div class="modal-body"></div>
		</form>
		
		</div>
	</div>
</div> 
<!-- 모달 end  -->

<script type="text/javascript">

//========글 신고 모달========//
//모달창 띄우기
$('#report_btn').click(function(e){
	e.preventDefault();
	$('#testModal').modal("show");
	
	const s_num = '${stamp.s_num}';
	
	//<0511 최은지 링크저장용 변수 선언>
	var link =  document.location.href;
	
	//ajax 실행
	$.ajax({
		url: "selectStampReportInfo.do",
		data: {
			s_num : s_num
		},
		dataType: "json",
		type: "post",
		async: true,
		success: function(data){
      	  var div = "";
	          
          $(data).each(function(){
        	  
        	div += "<div class= 'modal_detail_report'>"; 
        	
        	div += "<div class = wrap_div'>" //전체 div
  
        	div += "<div class = 'num_box'>"
  	        div += "<span class ='num_text menu_text'> 글 번호</span>"
	  	    div += "<input type='text' readonly name='s_num' class = 'ajax_text' value='"+ this.s_num +"'>"
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
	  	    div += "<input type='text' readonly name='reporter_nick' class = 'ajax_text' value='"+ this.reporter_nick +"'><br>"; 
	  	  div += "<input type='text' readonly name='reporter_email' id='ajax_text_mem2' class = 'ajax_text' value='"+this.reporter_email +"'>"; 
	  	    div += "</div>";	//mem2_box end
  	        	
			div += "<div class = 'mem1_box'>" //피신고자
        		div += "<span class = 'mem1_text menu_text'> 신고 대상</span>";
  	        div += "<input type='text' readonly name='reported_nick' class = 'ajax_text' value='"+ this.reported_nick +"'><br>"; 
   	  	    div += "<input type='text' readonly name='reported_email' id='ajax_text_mem2' class = 'ajax_text' value='"+ this.reported_email +"'>"; 
  	        div += "</div>";	//mem1_box end
  	        
  	        div += "<div class = 'con-box'>" //신고 내용
  	        	div += "<span class = 'mem1_text menu_text'> 신고 내용</span>";
  	        	div += "<input type='text' readonly name='s_title' class = 'ajax_text' value='"+ this.s_title +"'><br>"; 
  	        div += "</div>"
  	        	div += "<textarea readonly name='s_content' class='ajax_text'>" + this.s_content + "</textarea>";
  	        
        	div += "<div class = 'why-box'>" //신고 내용
  	        	div += "<span class = 'mem1_text menu_text'> 신고 사유</span>";
  	        	div += "<textarea name='report_why' id='report_why_2' class='ajax_text2' placeholder='신고 사유를 작성해 주세요.'></textarea>";
  	        div += "</div>"
  	        
  	        div += "<div class = 'btn-box'>" //버튼
	        	div += '<input type="button" data-num="'+ this.s_num +'" data-mem_num="'+ this.mem_num +'" value="등록" class="btn" id="sub-btn-stamp">';
  	        	div += "<button type='button' class='btn' id='can-btn'>취소</button>";
  	        div += "</div>";
     		
        	div += "</div>"; //wrap_div end     
        	
        	div += "</div>"; //modal_detail_report end
	          })//each end
	          
	          
	        $(".modal-body").html(div);
		}, //success end
		
		error : function(data) {
        	console.log("신고하기 오류");
        	alert("신고하기 창을 불러오는 데 실패했습니다. 다시 시도해주세요.");
        
        }//error end
	})
}) //글 신고 모달 end


//글 신고 등록하기
$(document).on('click','#sub-btn-stamp',function(){
	
	const mem_num2 = '${sessionScope.member.mem_num}';
	const s_num = $(this).attr('data-num');
	const mem_num = $(this).data('mem_num');
	const report_why = $('#report_why_2').val();
	
	 //<0511 최은지 링크저장용 변수 선언>
	 var link = window.location.href;
	
	console.log('신고당한 사람: ' + mem_num);
	console.log('신고한 사람: ' + mem_num2);
	console.log('s_num: ' + s_num);
	console.log('report_why: ' + report_why);
	console.log('link: ' + link);
	
	//데이터 전송
	$.ajax({
		url: 'reportStamp.do',
		type: 'post',
		data: {
			"s_num" : s_num,
			"report_why" : report_why,
			"mem_num" : mem_num,
			"link" : link
		},
		success: function(result){
			if(result == 'success'){
				alert('신고를 등록하였습니다.\n신고 처리 전까지 마이페이지-신고 내역에서 신고를 취소할 수 있습니다.');
				$('#testModal').modal("hide");
			}else{
				alert('신고 등록에 실패하였습니다.');
			}
		},
		error: function(){
			alert('신고 등록에 실패하였습니다.2');
		}
	}); //end ajax
	
}) //글 신고 등록 버튼 클릭 이벤트 end

//========댓글 신고 모달========//
//모달창 띄우기
$(document).on('click','.report-btn',function(e){
	e.preventDefault();
	$('#testModal').modal("show");
	
	//댓글 글번호
    let cmt_num = $(this).attr('data-num');

	//ajax 실행
	$.ajax({
		url: "selectCmtReportInfo.do",
		data: {
			cmt_num : cmt_num,
		},
		dataType: "json",
		type: "post",
		async: true,
		success: function(data){
    	  var div = "";
	          
        $(data).each(function(){
      	  
      	div += "<div class= 'modal_detail_report'>"; 
      	
      	div += "<div class = wrap_div'>" //전체 div

      	div += "<div class = 'num_box'>"
	        div += "<span class ='num_text menu_text'> 댓글 번호</span>"
	  	    div += "<input type='text' readonly name='cmt_num' class = 'ajax_text' value='"+ this.cmt_num +"'>"
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
	  	    div += "<input type='text' readonly name='reporter_nick' class = 'ajax_text' value='"+ this.reporter_nick +"'><br>"; 
	  	  div += "<input type='text' readonly name='reporter_email' id='ajax_text_mem2' class = 'ajax_text' value='"+this.reporter_email +"'>"; 
	  	    div += "</div>";	//mem2_box end
	        	
			div += "<div class = 'mem1_box'>" //피신고자
      		div += "<span class = 'mem1_text menu_text'> 신고 대상</span>";
	        div += "<input type='text' readonly name='reported_nick' class = 'ajax_text' value='"+ this.reported_nick +"'><br>"; 
 	  	    div += "<input type='text' readonly name='reported_email' id='ajax_text_mem2' class = 'ajax_text' value='"+ this.reported_email +"'>"; 
	        div += "</div>";	//mem1_box end
	        
	        div += "<div class = 'con-box'>" //신고 내용
	        	div += "<span class = 'mem1_text menu_text'> 신고 내용</span>";
	        	div += "<textarea readonly name='s_content' class='ajax_text1'>" + this.cmt_content + "</textarea>";
	        div += "</div>"
	        
      	div += "<div class = 'why-box'>" //신고 내용
	        	div += "<span class = 'mem1_text menu_text'> 신고 사유</span>";
	        	div += "<textarea name='report_why' id='report_why' class='ajax_text2' placeholder='신고 사유를 작성해 주세요.'></textarea>";
	        div += "</div>"
	        
	        div += "<div class = 'btn-box'>" //버튼
	        	div += '<input type="button" data-num="'+ this.cmt_num +'" data-mem_num="'+ this.mem_num +'" value="등록" class="btn" id="sub-btn-cmt">';
	        	div += "<button type='button' class='btn' id='can-btn'>취소</button>";
	        div += "</div>";
   		
      	div += "</div>"; //wrap_div end     
      	
      	div += "</div>"; //modal_detail_report end
	          })//each end
	          
	          
	        $(".modal-body").html(div);
		}, //success end
		
		error : function(data) {
      	console.log("신고하기 오류");
      	alert("신고하기 창을 불러오는 데 실패했습니다. 다시 시도해주세요.");
      
      }//error end
	})
}) //댓글 신고 모달 end

//댓글 신고 등록하기
$(document).on('click','#sub-btn-cmt',function(){
	
	const mem_num2 = '${sessionScope.member.mem_num}';
	const cmt_num = $(this).attr('data-num');
	const mem_num = $(this).data('mem_num');
	const report_why = $('#report_why').val();
	
	 //<0511 최은지 링크저장용 변수 선언>
	 var link = window.location.href;
	
	console.log('신고당한 사람: ' + mem_num);
	console.log('신고한 사람: ' + mem_num2);
	console.log('cmt_num: ' + cmt_num);
	console.log('report_why: ' + report_why);
	
	//데이터 전송
	$.ajax({
		url: 'reportCmt.do',
		type: 'post',
		data: {
			"cmt_num" : cmt_num,
			"report_why" : report_why,
			"mem_num" : mem_num,
			"link" : link
		},
		success: function(result){
			if(result == 'success'){
				alert('신고를 등록하였습니다.\n신고 처리 전까지 마이페이지-신고 내역에서 신고를 취소할 수 있습니다.');
				$('#testModal').modal("hide");
			}else{
				alert('신고 등록에 실패하였습니다.');
			}
		},
		error: function(){
			alert('신고 등록에 실패하였습니다.2');
		}
	}); //end ajax
	
}) //댓글 신고 등록 버튼 클릭 이벤트 end

//모달창 닫기 이벤트
$(document).on('click','#can-btn',function(){
	$('#testModal').modal("hide");
})//모달창 닫기 이벤트 end

//제목 textarea에 내용 입력시 글자수 체크
$(document).on('keyup','#cmt_content',function(){
	//입력한 글자수 구하기
	let inputLength = $(this).val().length;
	
	if(inputLength<=140){ //60자 이하인 경우
	    //남은 글자수 구하기
	    let remain = inputLength;
	    let text = remain + '/140';
	    //글자수 카운트 업데이트
	    $('#com_second .letter-count').text(text);
	  }else{ //60자를 넘어선 경우
	    $(this).val($(this).val().substring(0,140));
	  }
});

//========댓글 목록========//
$(function(){
	//댓글 목록
	function selectList(){
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			url: 'listCmt.do',
			type: 'post',
			data: {s_num : $('#s_num').val()},
			dataType: 'json',
			cache: false,
			timeout: 30000,
			success: function(data){
				//로딩 이미지 감추기
				$('#loading').hide();
				
				console.log(data);
				
				//댓글 목록 작업
				$(data.cmtList).each(function(index,item){
					let output = '<div class="item">';
					output += '<div class="cmt_title">';
					output += '<div class="cmt_title_1">';
					output += '<h4 class="cmt_writer">';
					output += item.mem_nick + '</h4>';
					output += '<p class="cmt_text">' + item.cmt_ip + '</p>';
					output += '</div>';
					output += '<p class="cmt_text">' + item.reg_date.substring(0,16) + '</p>';
					output += '</div>';
					
					output += '<div class="sub-item">';
					output += '<p>' + (item.cmt_content ? item.cmt_content.replace(/\r\n/g,'<br>') : '') + '</p>';
					
					output += '<div class="sub-item-btn">';
					if(data.mem_num == item.mem_num){
						//로그인한 회원번호와 댓글 작성자 회원번호가 일치
						output += ' <input type="button" data-num="'+ item.cmt_num +'" value="수정" class="modify-btn cmtBtn">';
						output += ' <input type="button" data-num="'+ item.cmt_num +'" value="삭제" class="delete-btn cmtBtn">';
					}else{
						//로그인한 회원번호와 댓글 작성자 회원번호가 불일치
						output += ' <input type="button" data-num="'+ item.cmt_num +'" value="신고" class="report-btn cmtBtn">';
					}
					
					output += '</div>';
					output += '</div>';
					output += '</div>'; 
					output += '<hr size="1" noshade>';
					
					//문서 객체에 추가
					$('#output').append(output);
				});
			},
			error: function(){
				//로딩 이미지 감추기
				$('#loading').hide();
				alert('댓글 불러오기 오류 발생');
			}
		});
	}
	
	//등록하기 버튼 클릭 이벤트
	$('#cmtBtn').click(function(){
		regist();
	});
	
	//등록을 담당하는 함수
	function regist(){
		// 세션에서 현재 로그인 중인 사용자 정보(mem_num)을 얻어옴
		const member = '${sessionScope.member.mem_num}';
		const s_num = '${stamp.s_num}';
		const cmt_content = $('#cmt_content').val();
		
		//데이터 전송
		$.ajax({
			url: 'writeCmt.do',
			type: 'post',
			data: {
				"cmt_content" : cmt_content,
				"s_num" : s_num
			},
			success: function(result){
				if(result == 'success'){
					$('#cmt_content').val(''); //내용 비우기
					$('#com_first .letter-count').text('0/140'); //글자수 체크 초기화
					location.reload();
				}else {
					alert('댓글 등록에 실패하였습니다.');
				}
			},
			error:function(){
				alert('댓글 등록에 실패하였습니다.2');
			}
		}); //end ajax
	} //end regist()

	
	$(document).on('click','.modify-btn',function(){		
		//이전에 이미 수정하는 댓글이 있을 경우 수정 버튼을 클릭하면 숨김 sub-item을 환원시키고 수정폼을 초기화
	    initModifyForm();

	    //댓글 글번호
	    let cmt_num = $(this).attr('data-num');
	    //댓글 내용
	    let cmt_content = $(this).parent().siblings('p').html().replace(/<br>/g,'\r\n');
	    
	    //댓글 수정폼 UI
	    let modifyUI = '<form id="mcom_form" data-num="'+ cmt_num +'">';
	    modifyUI += '<input type="hidden" name="cmt_num" id="mcom_num" value="'+ cmt_num +'">';
	    modifyUI += '<textarea rows="2" name="cmt_content" id="mcom_content" class="form-control2">'+ cmt_content +'</textarea>';
	    modifyUI += '<div id="mcom_first"><span class="letter-count">0/140</span>';
	    modifyUI += '<div id="mcom_second" class="updel-btn">';
	    modifyUI += '<input type="submit" value="수정" id="sub-btn-1" class="com-mod cmtbtn">';
	    modifyUI += ' <input type="button" value="취소" class="com-reset cmtbtn" id="sub-btn-1">';
	    modifyUI += '</div>';
	    modifyUI += '</div>';
	    modifyUI += '</form>';

	    //지금 클릭해서 수정하고자 하는 데이터는 감추기
	    $(this).closest('.sub-item').hide();

	    //수정 폼을 수정하고자 하는 데이터가 있는 div에 노출
	    $(this).closest('.sub-item').after(modifyUI);

		// 페이지 로드 시 초기 글자 수 가져오기
	    $(document).ready(function() {
	      let initialLength = $('#mcom_content').val().length;
	      let initialText = initialLength + '/140';
	      $('#mcom_first .letter-count').text(initialText);
	    }); //초기 글자수 end

	    //내용 textarea에 내용 입력시 글자수 체크
	    $(document).on('keyup','#mcom_content',function(){
	    	//입력한 글자수 구하기
	    	let inputLength = $(this).val().length;
	    	
	    	if(inputLength<=140){ //140자 이하인 경우
	    	    //남은 글자수 구하기
	    	    let remain = inputLength;
	    	    let text = remain + '/140';
	    	    //글자수 카운트 업데이트
	    	    $('#mcom_first .letter-count').text(text);
	    	  }else{ //140자를 넘어선 경우
	    	    $(this).val($(this).val().substring(0,140));
	    	  }
	    }); //글자수 체크 end
	    
	}); //수정 버튼 클릭 이벤트 end

	//수정 폼에서 취소 버튼 클릭시 수정 폼 초기화
	$(document).on('click','.com-reset',function(){
	    initModifyForm();
	});
	//수정 폼 초기화
	function initModifyForm(){
	    $('.sub-item').show();
	    $('#mcom_form').remove();
	}
	
	//댓글 수정
	$(document).on('submit','#mcom_form',function(event){
		
		// 기본 동작을 막기 위해 추가
	    event.preventDefault();
		
		const member = '${sessionScope.member.mem_num}';
		const cmt_num = $(this).data('num');
		const cmt_content = $('#mcom_content').val();
		
		//데이터 전송
		$.ajax({
			url: 'updateCmt.do',
			type: 'post',
			data: {
				"cmt_content" : cmt_content,
				"cmt_num" : cmt_num
			},
			success: function(result){
				if(result == 'success'){
					alert('댓글을 수정하였습니다.');
					location.reload();
				}else {
					alert('댓글 수정에 실패하였습니다.');
				}
			},
			error:function(){
				alert('댓글 수정에 실패하였습니다.2');
			}
		}); //end ajax
		
	}); //댓글 수정 end
	
	//댓글 삭제
	$(document).on('click','.delete-btn',function(){
		//댓글 번호
		const cmt_num = $(this).data('num');
		
		console.log("댓글 삭제 cmt_num: " + cmt_num);
		
		let choice = confirm('댓글을 삭제하시겠습니까?');
		
		if(choice){
			$.ajax({
				url:'deleteCmt.do',
				type:'post',
				data:{
					cmt_num : cmt_num
				},
				cache:false,
				timeout:30000,
				success:function(result){
					if(result == 'success'){
						alert('댓글을 삭제하였습니다.');
						location.reload();
					}else {
						alert('댓글 삭제에 실패하였습니다.');
					}
				},
				error:function(){
					alert('댓글 삭제에 실패하였습니다.2');
				}
			}); //end ajax
		}
	});
	
 	selectList();
});
</script>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>