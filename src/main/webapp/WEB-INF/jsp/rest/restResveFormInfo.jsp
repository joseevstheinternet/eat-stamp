<%--
시스템명 : 회원 식당 예약 정보 입력 화면
파일명: restResveFormInfo.jsp
작성자: 이예지
작성일자: 2023.05.17
처리내용: 회원 전용 식당 예약 정보 입력 페이지이다.
History: 이예지, 2023.05.17 최초 작성
		 이예지, 2023.05.19 수정
 --%>

<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/restResveForm.css'/>" />
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jQuery UI 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- jQuery UI CSS -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<!-- 시간 연산을 위한 Moment 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 예약하기</title>
</head>

<body>

<div class="page-main">
	<div id="wrap">
		<div class="mypage-div02">
			<!-- 상단 타이틀 -->
			<div class="mypage-section1">
				<span class="mypage-title">${rest.r_name} 예약하기</span>
			</div>
			<!-- 상단 타이틀 끝 -->
			<!-- 예약 폼 시작 -->
			<div class="mypage-section2">
				<c:if test="${rest.r_resveCode == 'n'}">
					<div class="no-list"><span class="no-list">예약이 불가능한 식당입니다.</span></div>
				</c:if>
				<c:if test="${rest.r_resveCode == 'y'}">
					<ul class="list-ul">
						<div class="progress">
							<div class="step completed">예약 일시 선택</div>
							<i class="fa-solid fa-chevron-right arrowIcon completed"></i>
							<div class="step current">예약 정보 입력</div>
							<i class="fa-solid fa-chevron-right arrowIcon"></i>
							<div class="step">예약 완료</div>
						</div>
						<table class="calender">
						    <tr>
						        <th class="th-resveInfo">날짜</th>
						        <td class="td-resveInfo">${selectedDate} ${selectedDay}요일</td>
						    </tr>
						    <tr>
						        <th class="th-resveInfo">시간</th>
						        <td class="td-resveInfo">${selectedTime}</td>
						    </tr>
						    <tr>
						        <th class="th-resveInfo">예약자 성함</th>
						        <td class="td-resveInfo">
						        	<input type="text" class="input-box" id="resve_name" maxlength="10">
						        </td>
						    </tr>
						    <tr>
						        <th class="th-resveInfo">예약자 연락처</th>
						        <td class="td-resveInfo">
						        	<input type="text" class="input-box" id="resve_phoneNum" oninput="hypenTel(this)" maxlength="13">
						        </td>
						    </tr>
						    <tr>
						        <th class="th-resveInfo">예약 인원</th>
						        <td class="td-resveInfo td-memCnt">
						        	<div class="div_memCnt">
							        	<button type="button" class="minus minusMem"><i class="fa-solid fa-circle-minus"></i></button>
										<input type=text" name="r_resveMemCnt"  id="r_resveMemCnt" class="numBox numBoxMem" 
												min="1" max="${rest.r_resveMemCnt}" value="1" readonly="readonly"/>
										<button type="button" class="plus plusMem"><i class="fa-solid fa-circle-plus"></i></button>
										<span class="resve-font2 margin"> 인</span>
						        	</div>
						        	<span class="resve-font-ex"><i class="fa-solid fa-check exIcon"></i>
									 테이블 당 ${rest.r_resveMemCnt} 인까지 수용 가능한 식당입니다.</span>
						        </td>
						    </tr>
						</table>
												
						<div class="div_btn">
							<button type="button" class="box-button btn_resve" id="btn_resve">예약하기</button>
							<button type="button" onclick="history.back();" class="box-button btn_cancel">취소</button>
						</div>
					</ul>
				</c:if>
			</div>
			<!-- 예약 폼 끝 -->
		</div>
	</div>
</div>

<script>
// 연락처 하이픈 자동 삽입
const hypenTel = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}

// 인원 변경
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

//등록하기 버튼 클릭 이벤트
$('#btn_resve').click(function(){
	regist();
});

//등록을 담당하는 함수
function regist(){
	// 세션에서 현재 로그인 중인 사용자 정보(mem_num)을 얻어옴
	const r_num = '${rest.r_num}';
	const resve_date = '${selectedDate}';
	const resve_time = '${selectedTime}';
	const resve_memCnt = $('#r_resveMemCnt').val();
	const resve_name = $('#resve_name').val();
	const resve_phoneNum = $('#resve_phoneNum').val();
	
	// 모든 필드가 채워져 있는지 검사
    if (!resve_date || !resve_time || !resve_name || !resve_phoneNum) {
        alert('모든 예약 정보를 입력해 주세요.');
        return; // 예약 정보가 누락된 경우 함수 종료
    }
	
	//데이터 전송
	$.ajax({
		url: 'insertResve.do',
		type: 'post',
		data: {
			"r_num" : r_num,
			"resve_date" : resve_date,
			"resve_time" : resve_time,
			"resve_memCnt" : resve_memCnt,
			"resve_name" : resve_name,
			"resve_phoneNum" : resve_phoneNum
		},
		success: function(result){
			if(result == 'success'){
				location.href='restResveFormSuccess.do';
			}else {
				alert('예약에 실패하였습니다.');
			}
		},
		error:function(){
			alert('예약에 실패하였습니다.2');
		}
	}); //end ajax
} //end regist()

</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>