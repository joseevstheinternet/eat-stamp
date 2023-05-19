<%--
시스템명 : 가게 사장 식당 관리 화면
파일명: ownerRestSetting.jsp
작성자: 이예지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 식당 관리 페이지이다.
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
<script src="../js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
div.mypage-menu{
	height: 190px;
}

div.mypage-section2{
	margin: 30px 0;
    background-color: white;
    border-radius: 20px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    padding: 40px 50px;
}

div.box-text{
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

span.resve-font1{
    font-size: 16px;
    letter-spacing: -1;
    font-weight: bold;
    flex: 1;
}
span.resve-font2{
	font-size: 15px;
	flex: 3;
}

div.box-explain{
    margin-left: 160px;
    margin-bottom: 20px;
}

span.resve-font-ex{
	font-size: 13px;
    color: #afafaf;
}

div.box-btn{
    display: flex;
    justify-content: flex-end;
}

button.update-btn{
    background-color: #ffc06c;
    color: white;
    padding: 5px 25px;
    border-radius: 20px;
    font-size: 16px;
}

/* 체크박스 */
div.box-check{
    display: flex;
    flex: 3;
    justify-content: flex-start;
}

div.section3-1{
	flex: 1;
}

div.section3-2{
	flex: 4.5;
}

label.check-text{
	font-size: 14px;
	cursor: pointer;
}

input[type="checkbox"]:checked::after {
  display: block;
}
input[type="checkbox"]:checked + label {
  color: #ffc06c;
}
/* 체크박스 끝 */

/* numBox */
div.box-plus{
	flex: 3;
}

input.numBox{
	background-color: transparent;
    border: 0;
    text-align: center;
    font-weight: bold;
    width: 30px;
    font-size: 15px;
    color: #2a2a2a;
}

button.minus{
	color: #ffc06c;
}

button.plus{
	color: #ffc06c;
}

span.margin{
	margin-left: 5px;
}
/* numBox 끝 */

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 사장님 - 식당 관리</title>
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
						href="${pageContext.request.contextPath}/ownerRestSetting.do">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerResveList.do" style="color: #9d9d9d;">예약 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerStampList.do" style="color: #9d9d9d;">식당 리뷰</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 내가 쓴 글 폼 시작 -->
				<div class="mypage-div02">
					<!-- 상단 타이틀 -->
					<div class="mypage-section1">
						<span class="mypage-title">식당 관리</span>
					</div>
					<!-- 상단 타이틀 끝 -->
					<!-- 리스트 -->
					<div class="mypage-section2">
						<div class="box-text box-resveCode">
							<span class="resve-font1">예약 가능 여부 설정</span>
							<!-- 체크박스 -->
							<div class="box-check">
								<div class="section3-1">
									<input type="checkbox" name="r_resveCode" id="r_resveCode_y" value='y' onclick='checkOnlyOne(this)' style="display: none;"/>
									<label for="r_resveCode_y" class="check-text"><i class="fa-solid fa-circle-dot"></i>  예약 가능</label>				
								</div>
								<div class="section3-2">
									<input type="checkbox" name="r_resveCode" id="r_resveCode_n" value='n' onclick='checkOnlyOne(this)' style="display: none;"/>
									<label for="r_resveCode_n" class="check-text"><i class="fa-solid fa-circle-dot"></i>  예약 불가능</label>
								</div>
							</div>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
								 예약 가능 여부를 '불가능'으로 변경하면<br>　 회원으로부터 예약을 받을 수 없습니다.</span>
						</div>
						<div class="box-text box-resveDay">
							<span class="resve-font1">예약 날짜 주기 설정</span>
							<div class="box-plus">
								<button type="button" class="minus minusDay"><i class="fa-solid fa-circle-minus"></i></button>
								<input type=text" name="r_resveDay"  id="r_resveDay" class="numBox numBoxDay" 
										min="1" max="60" value="${rest.r_resveDay}" readonly="readonly"/>
								<button type="button" class="plus plusDay"><i class="fa-solid fa-circle-plus"></i></button>
								<span class="resve-font2 margin"> 일</span>
							</div>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
								 예약 날짜 주기는 기본 14 일로 설정되어 있으며,<br>　 예약 날짜 주기를 설정하면
								<br>　 오늘로부터 설정한 예약 주기만큼 예약을 받을 수 있습니다.</span>
						</div>
						<div class="box-text box-resveTime">
							<span class="resve-font1">예약 시간 주기 설정</span>
							<div class="box-plus">
								<button type="button" class="minus minusTime"><i class="fa-solid fa-circle-minus"></i></button>
								<input type=text" name="r_resveTime"  id="r_resveTime" class="numBox numBoxTime" 
										min="10" max="600" value="${rest.r_resveTime}" readonly="readonly"/>
								<button type="button" class="plus plusTime"><i class="fa-solid fa-circle-plus"></i></button>
								<span class="resve-font2 margin"> 분</span>
							</div>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
								 예약 시간 주기는 기본 120 분으로 설정되어 있으며,<br>　 예약 시간 주기를 설정하면 오픈 시간부터 마감 시간까지
								<br>　 설정한 예약 시간 주기마다 예약을 받을 수 있습니다.</span>
						</div>
						<div class="box-text box-resveMemCnt">
							<span class="resve-font1">최대 수용 인원 설정</span>
							<div class="box-plus">
								<button type="button" class="minus minusMem"><i class="fa-solid fa-circle-minus"></i></button>
								<input type=text" name="r_resveMemCnt"  id="r_resveMemCnt" class="numBox numBoxMem" 
										min="1" max="20" value="${rest.r_resveMemCnt}" readonly="readonly"/>
								<button type="button" class="plus plusMem"><i class="fa-solid fa-circle-plus"></i></button>
								<span class="resve-font2 margin"> 인</span>
							</div>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
							 최대 수용 인원은 기본 6 인으로 설정되어 있으며,<br>　 한 테이블 당 최대 수용 인원입니다.</span>
						</div>
						<div class="box-text box-resveTableCnt">
							<span class="resve-font1">최대 수용 테이블 설정</span>
							<div class="box-plus">
								<button type="button" class="minus minusTable"><i class="fa-solid fa-circle-minus"></i></button>
								<input type=text" name="r_resveTableCnt"  id="r_resveTableCnt" class="numBox numBoxTable" 
										min="1" max="10" value="${rest.r_resveTableCnt}" readonly="readonly"/>
								<button type="button" class="plus plusTable"><i class="fa-solid fa-circle-plus"></i></button>
								<span class="resve-font2 margin"> 테이블</span>
							</div>
						</div>
						<div class="box-explain">
							<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
							 최대 수용 테이블은 기본 1 테이블로 설정되어 있으며,<br>　 한 타임 당 최대 수용 테이블 수입니다.</span>
						</div>
						<div class="box-btn">
							<button class="update-btn">설정</button>
						</div>
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

<script type="text/javascript">
/***********************************************************
 * 시스템명	: 	사장님 가게 설정 변경 JS
 * 파일명		:	ownerRestSetting.js
 * 설명		:	기존 사장님 가게 설정을 불러오고 변경하는 JavaScript
 * 작성자		:	이예지
 * 작성일		:	2023.05.16
 * History	:	이예지, 2023.05.16 최초 작성
 ***********************************************************/

//체크박스
//중복 체크 불가능
function checkOnlyOne(element) {

const checkboxes 
    = document.getElementsByName("r_resveCode");

checkboxes.forEach((cb) => {
  cb.checked = false;
})

element.checked = true;
}

//초기 체크 상태 불러오기
$(document).ready(function () {
	  let r_resveCode = '${rest.r_resveCode}';
	  if (r_resveCode == 'y') {
	    $('#r_resveCode_y').prop('checked', true);
	  } else {
	    $('#r_resveCode_n').prop('checked', true);
	  }
	});
	
//날짜 주기 변경
$(".minusDay").click(function () {
	var num = $(".numBoxDay").val();
	var minusNum = Number(num) - 1;
	var minVal = Number($("#r_resveDay").attr("min")); //min 값을 가져옴
	
	if (minusNum < minVal) { //min 값으로 비교
		$(".numBoxDay").val(num);
	}else{
		$(".numBoxDay").val(minusNum);
	}
});

$(".plusDay").click(function () {
	var num = $(".numBoxDay").val();
	var plusNum = Number(num) + 1;
	var maxVal = Number($("#r_resveDay").attr("max")); //max 값을 가져옴
	
	if (plusNum > maxVal) { //max 값으로 비교
		$(".numBoxDay").val(num);
	}else{
		$(".numBoxDay").val(plusNum);
	}
});

//시간 주기 변경
$(".minusTime").click(function () {
	var num = $(".numBoxTime").val();
	var minusNum = Number(num) - 10;
	var minVal = Number($("#r_resveTime").attr("min")); //min 값을 가져옴
	
	if (minusNum < minVal) { //min 값으로 비교
		$(".numBoxTime").val(num);
	}else{
		$(".numBoxTime").val(minusNum);
	}
});

$(".plusTime").click(function () {
	var num = $(".numBoxTime").val();
	var plusNum = Number(num) + 10;
	var maxVal = Number($("#r_resveTime").attr("max")); //max 값을 가져옴
	
	if (plusNum > maxVal) { //max 값으로 비교
		$(".numBoxTime").val(num);
	}else{
		$(".numBoxTime").val(plusNum);
	}
});

//최대 인원 변경
$(".minusMem").click(function () {
	var num = $(".numBoxMem").val();
	var minusNum = Number(num) - 1;
	var minVal = Number($("#r_resveMemCnt").attr("min")); //min 값을 가져옴
	
	if (minusNum < minVal) { //min 값으로 비교
		$(".numBoxMem").val(num);
	}else{
		$(".numBoxMem").val(minusNum);
	}
});

$(".plusMem").click(function () {
	var num = $(".numBoxMem").val();
	var plusNum = Number(num) + 1;
	var maxVal = Number($("#r_resveMemCnt").attr("max")); //max 값을 가져옴
	
	if (plusNum > maxVal) { //max 값으로 비교
		$(".numBoxMem").val(num);
	}else{
		$(".numBoxMem").val(plusNum);
	}
});

//최대 테이블 변경
$(".minusTable").click(function () {
	var num = $(".numBoxTable").val();
	var minusNum = Number(num) - 1;
	var minVal = Number($("#r_resveTableCnt").attr("min")); //min 값을 가져옴
	
	if (minusNum < minVal) { //min 값으로 비교
		$(".numBoxTable").val(num);
	}else{
		$(".numBoxTable").val(minusNum);
	}
});

$(".plusTable").click(function () {
	var num = $(".numBoxTable").val();
	var plusNum = Number(num) + 1;
	var maxVal = Number($("#r_resveTableCnt").attr("max")); //max 값을 가져옴
	
	if (plusNum > maxVal) { //max 값으로 비교
		$(".numBoxTable").val(num);
	}else{
		$(".numBoxTable").val(plusNum);
	}
});

//설정 버튼 클릭 이벤트
$(function () {
	$('.update-btn').click(function () {
		regist ();
	});
	
	//등록을 담당하는 함수
	function regist(){
		
	    //=====체크박스에서 선택된 값(value) 출력=====//
		//선택된 목록 가져오기
		const query = 'input[name="r_resveCode"]:checked';
		const selectedEls = document.querySelectorAll(query);
		
		//선택된 목록에서 value 찾기
		let r_resveCode = '';
		selectedEls.forEach((el) => {
			r_resveCode += el.value + ' ';
		});
		
		const r_name = '${sessionScope.owner.mem_nick}';
		const r_resveDay = $('#r_resveDay').val();
		const r_resveTime = $('#r_resveTime').val();
		const r_resveMemCnt = $('#r_resveMemCnt').val();
		const r_resveTableCnt = $('#r_resveTableCnt').val();
		
		//데이터 전송
		$.ajax({
			url: 'ownerRestSettingUpdate.do',
			type: 'post',
			data: {
				"r_name" : r_name,
				"r_resveCode" : r_resveCode,
				"r_resveDay" : r_resveDay,
				"r_resveTime" : r_resveTime,
				"r_resveMemCnt" : r_resveMemCnt,
				"r_resveTableCnt" : r_resveTableCnt
			},
			success: function(result) {
				if (result == 'success') {
					alert('식당 설정을 변경하였습니다.');
					location.reload();
				}else {
					alert('식당 설정 변경에 실패하였습니다.');
				}
			},
			error:function () {
				alert('식당 설정 변경에 실패하였습니다.2');
			}
		}); //end ajax
	}
});
</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>