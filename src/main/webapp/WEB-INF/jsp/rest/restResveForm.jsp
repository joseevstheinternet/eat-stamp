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
							<div class="step current">예약 일시 선택</div>
							<i class="fa-solid fa-chevron-right arrowIcon"></i>
							<div class="step">예약 정보 입력</div>
							<i class="fa-solid fa-chevron-right arrowIcon"></i>
							<div class="step">예약 완료</div>
						</div>
						<div class="resve_yn">
							<span class="resve_y"><i class="fa-solid fa-square"></i> 예약가능</span>
							<span class="resve_n"><i class="fa-solid fa-square"></i> 예약불가</span>
						</div>
						<table class="calender">
						    <tr>
						        <th class="date">날짜</th>
						        <th class="time">시간</th>
						    </tr>
						    <tr>
						        <td>
						            <div id="datepicker"></div>
						        </td>
						        <td>
						            <div id="timePicker"></div>
						        </td>
						    </tr>
						</table>
						<div class="div_btn">
							<form id="reservationForm" method="post">
							    <input type="hidden" id="selectedDate" name="selectedDate" value="">
							    <input type="hidden" id="selectedTime" name="selectedTime" value="">
							    <input type="hidden" id="selectedDay" name="selectedDay" value="">
							    <input type="hidden" id="r_num" name="r_num" value="${rest.r_num}">
							    <input type="hidden" id="mem_num" name="mem_num" value="${member.mem_num}">
							    <button type="button" class="box-button btn_resve" id="btn_resve">예약하기</button>
							</form>
							<button type="button" onclick="history.back();" class="box-button btn_cancel">취소</button>
						</div>
					</ul>
				</c:if>
			</div>
			<!-- 예약 폼 끝 -->
		</div>
	</div>
</div>

<script type="text/javascript">

    var r_open = "${rest.r_open}";
    var r_close = "${rest.r_close}";
    var r_resveTime = ${rest.r_resveTime};
    var r_resveDay = ${rest.r_resveDay};
    
    var selectedDate; //선택한 날짜를 저장하기 위한 전역 변수 선언
    var selectedTime; //선택한 시간을 저장하기 위한 전역 변수 선언
    var selectedDay; //선택한 요일을 저장하기 위한 전역 변수 선언

    $(document).ready(function () {
        $("#datepicker").datepicker({
            dateFormat : 'yy-mm-dd',
            showMonthAfterYear : true,
            changeMonth : true,
            changeYear : true,
            numberOfMonths : 1,
            dayNamesMin : ['일','월','화','수','목','금','토'],
            monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            minDate : 1, //오늘 날짜부터 설정
            maxDate : r_resveDay, // r_resveDay 일 후까지 설정
            onSelect: function(dateText) {
            	selectedDate = dateText; //사용자가 선택한 날짜 저장
                generateTimeSlots();
            },
            beforeShow : function(input){
                var i_offset = $(input).offset();
                setTimeout(function () {
                    $("#ui-datepicker-div").css({'top':i_offset.top - 215 , 'bottom' :'' , left : i_offset.left})
                })
            }
        });

        //시간 슬롯 생성 함수
        function generateTimeSlots () {
            var start = moment(r_open, "HH:mm");
            var end = moment(r_close, "HH:mm");

            var timeSlots = "";
            while(start <= end) {
                timeSlots += "<div class='timeSlots'>";
	                timeSlots += "<i class='fa-solid fa-unlock timeIcon'>" + "</i>";
	                timeSlots += "<span class='time'>" + start.format("HH:mm") + "</span>";
	            timeSlots += "</div>";
                start.add(r_resveTime, 'minutes');
            }
            $("#timePicker").html(timeSlots);
        }
    });
    
    $(document).ready(function(){
    	//시간 슬롯 클릭 이벤트 핸들러
        $('#timePicker').on('click', 'div', function(){
            // 이전에 선택한 시간 슬롯에서 'selected' 클래스 제거
            $('#timePicker div.selected').removeClass('selected');
            
            // 클릭한 시간 슬롯에 'selected' 클래스 추가
            $(this).addClass('selected');

            // 선택한 시간 슬롯 출력
            selectedTime = $(this).text().trim();
            
            console.log("날짜: " + selectedDate);
            console.log("시간: " + selectedTime);
        });
    });
    
    $(document).ready(function(){
    	//예약하기 버튼 클릭 이벤트 핸들러
        $('#btn_resve').click(function(){
        	// 선택한 날짜로부터 요일을 계산
            var days = ['일', '월', '화', '수', '목', '금', '토'];
            var date = new Date(selectedDate);
            var day = date.getDay();
            selectedDay = days[day];
        	
            // 선택한 날짜와 시간을 hidden input 필드에 설정
            $('#selectedDate').val(selectedDate);
            $('#selectedTime').val(selectedTime);
            $('#selectedDay').val(selectedDay);
            // form의 action 속성 설정
            var r_num = $('#r_num').val();
            $('#reservationForm').attr('action', '/restResveFormInfo=' + r_num + '.do');
            // form 제출
            $('#reservationForm').submit();
        });
    });


</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>