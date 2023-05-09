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
	
<style>

div.page-main{
	padding: 80px 0;
}

div.view-box{
	background-color: white;
    border-radius: 20px;
    padding: 50px;
    width: 600px;
    margin: 0 auto;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
}

div.box-wrap{
	padding: 0 20px;
}

/* section1 (프로필, 제목, 작성일시) */
div.section1{
    display: flex;
    align-items: center;
}

i.pIcon{
    font-size: 40px;
    color: #ffc06c;
}

div.box-title{
    margin-left: 20px;
}

div.box-title2{
    display: flex;
    align-items: center;
    justify-content: space-between;
}

div.box-icons{
	color: lightgrey;
	display: flex;
    align-items: center;
    width: 90px;
    justify-content: space-between;
}

span.font-set1{
    font-size: 25px;
    letter-spacing: -1;
    font-weight: bold;
    color: #ffc06c;
}

div.box-date{
    margin-top: 5px;
    color: lightgrey;
	display: flex;
    align-items: center;
    justify-content: space-between;
    width: 500px;
}

div.section1-1{
    display: flex;
    align-items: center;
    margin: 30px 0;
}

i.mapIcon{
    font-size: 20px;
    color: #ffc06c;
}

i.icon-set{
	font-size: 16px;
	color: lightgray;
}

div.section1-1-2{
    flex: 1;
    margin: 0 20px;
    font-size: 14px;
    color: #9d9d9d;
    font-weight: bold;
}

div.section1-1-3{
    background-color: ffd274;
    padding: 8px 15px;
    border-radius: 20px;
    font-size: 13px;
    color: white;
    font-weight: bold;
}
/* section1 (프로필, 제목, 작성일시) 끝 */

/* section2 (이미지, 내용) */
div.box-img{
    display: flex;
    justify-content: center;
}

img.fileImg{
    border-radius: 20px;
    max-width: 600px;
}

div.box-content{
    margin: 30px 0;
}

span.font-set2{
    font-size: 16px;
    letter-spacing: -1;
}

span.font-set3{
	font-size: 15px;
    font-weight: bold;
}

span.font-set4{
    font-size: 15px;
    color: 5da6ff;
    margin: 0 20px;
}
/* section2 (이미지, 내용) 끝 */

/* section3 (버튼) */
div.section3{
    display: flex;
    justify-content: flex-end;
}

button.box-button{
	padding: 10px 25px;
    border-radius: 20px;
    color: white;
}

button.delete_btn{
	background-color: #b7b7b7;
    margin: 0 10px 0 0;
}

button.list_btn{
	background-color: #ffd274;
}
/* section3 (버튼) 끝 */


/* 댓글 */
div#com_first{
    display: flex;
    align-items: center;
    justify-content: space-between;
}

div#com_second{
    margin-bottom: 20px;
}

span.letter-count{
	margin-left: 5px;
    color: lightgray;
}

textarea.form-control{
	width: 90%;
	resize: none;
	border-radius: 20px;
	padding: 5px 15px;
}

button.cmtBtn{
    background-color: #ffd274;
    color: white;
    padding: 8px 15px;
    border-radius: 20px;
}

div.cmt_title{
	display: flex;
	justify-content: space-between;
}

div.cmt_title_1{
	display: flex;
	align-items: center;
}

h4.cmt_writer{
	margin-right: 5px;
}

p.cmt_text{
    font-size: 10px;
    color: lightgray;
}

div.sub-item{
	display: flex;
    align-items: center;
    justify-content: space-between;
}

hr{
    background: lightgray;
    height: 1px;
    border: 0;
    margin: 10px 0;
}

input.cmtBtn{
    height: 25px;
    width: 40px;
    background-color: #b7b7b7;
    border: 0;
    color: white;
    border-radius: 20px;
}
/*댓글 끝*/

/* 댓글 수정 */
textarea.form-control2{
	width: 100%;
	resize: none;
	border-radius: 20px;
	padding: 5px 15px;
	margin: 5px 0;
}

div#mcom_first{
	display: flex;
    align-items: center;
    justify-content: space-between;
}

input.com-mod{
	background-color: #ffd274;
}

/* 댓글 수정 끝 */
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
				<button type="button" onclick="location.href='list.do'" class="box-button list_btn">목록</button>
			
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


<script type="text/javascript">

//========글자수 카운트========//
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