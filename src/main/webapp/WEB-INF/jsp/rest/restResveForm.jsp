<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />
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

	    
<style>
div.mypage-div02 {
	flex: 0.8;
	margin: 0;
}

/* 진행 상황 */
div.progress {
	text-align: center;
	font-size: 14px;
}

.step {
    padding: 10px;
    margin: 10px;
    border-radius: 5px;
    display: inline-block;
}

.completed, .current {
    color: #ffc06c;
}

.current {
	font-weight: bold;
}
/* 진행 상황 끝 */

/* 예약가능여부 */
div.resve_yn {
    width: 430px;
    display: flex;
    justify-content: flex-end;
    margin: 10 auto;
}

span.resve_y {
    color: #c3c3c3;
    margin-right: 10px;
}

span.resve_n {
    color: #6e6e6e;
}
/* 예약가능여부 끝 */

/* table */
table.calender {
	display: flex;
    justify-content: center;
}

tbody {
    border-collapse: collapse;
}

th, td {
  border: 1px solid #d3d3d3;
}

th {
	background-color: #e2e2e2;
	color: #585858;
}

th.date {
	width: 250px;
}

th.time {
	width : 180px;
}

div#datepicker {
	text-align: -webkit-center;
    margin: 15px 0;
}

#timePicker div.selected {
    background-color: #ffc06c;
    color: white;
}

#timePicker div.selected i {
    color: white;
}

div.timeSlots {
    width: 70%;
    background-color: #e7e7e7;
    padding: 10px;
    margin: 10 auto;
    border-radius: 5px;
    cursor: pointer;
}

i.timeIcon {
	color: gray;
    margin: 0 10px;
}

span.time {
	margin-left: 10px;
    font-size: 12px;
    font-weight: bold;
}
/* table 끝 */

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 예약하기</title>
</head>

<body>

<div class="page-main">
	<div id="wrap">
		
		<!-- 전체글 보기 폼 시작 -->
		<div class="mypage-div02">
			<!-- 상단 타이틀 -->
			<div class="mypage-section1">
				<span class="mypage-title">${rest.r_name} 예약하기</span>
			</div>
			<!-- 상단 타이틀 끝 -->
			<!-- 리스트 -->
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

					</ul>
				</c:if>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

    var r_open = "${rest.r_open}";
    var r_close = "${rest.r_close}";
    var r_resveTime = ${rest.r_resveTime};
    var r_resveDay = ${rest.r_resveDay};

    $(document).ready(function () {
        $("#datepicker").datepicker({
            dateFormat : 'yymmdd',
            showMonthAfterYear : true,
            changeMonth : true,
            changeYear : true,
            numberOfMonths : 1,
            dayNamesMin : ['일','월','화','수','목','금','토'],
            monthNamesShort : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            minDate : 0, //오늘날짜부터 설정
            maxDate : r_resveDay, // r_resveDay일 후까지 설정
            onSelect: function(dateText) {
                generateTimeSlots();
            },
            beforeShow : function(input){
                var i_offset = $(input).offset();
                setTimeout(function () {
                    $("#ui-datepicker-div").css({'top':i_offset.top - 215 , 'bottom' :'' , left : i_offset.left})
                })
            }
        });

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
        // 'div' 요소를 클릭할 때마다 실행되는 이벤트 핸들러 설정
        $('#timePicker').on('click', 'div', function(){
            // 이전에 선택한 시간 슬롯에서 'selected' 클래스 제거
            $('#timePicker div.selected').removeClass('selected');
            
            // 클릭한 시간 슬롯에 'selected' 클래스 추가
            $(this).addClass('selected');
            
            // 선택한 시간 슬롯 출력
            console.log("선택한 시간 슬롯: " + $(this).text());
        });
    });

</script>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>