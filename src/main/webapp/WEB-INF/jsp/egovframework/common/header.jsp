<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<html>

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Permanent+Marker&display=swap')
	;

/* 헤더 정렬 */
header {
	background-color: #fffef8;
	height: 80px;
}

div#header_parent {
	display: flex;
	flex-direction: row;
}

div#header_first {
	flex: 3;
	display : flex;
	justify-content: center;
	align-items : center;
	margin-top: 15px;
}

div#header_second {
	flex: 1;
	display : flex;
	justify-content: center;
	align-items : center;
	margin-top: 15px;
}

div#header_third {
	flex: 3;
	display : flex;
	justify-content: center;
	align-items : center;
	margin-top: 15px;
}

/* 요소 배치 */
img#header_logo {
	width: 50px;
	height: 50px;
	/*margin: 15px 0 0 300px;*/
}

a#header_title {
	color: #ffc06c;
	font-family: 'Permanent Marker', cursive;
	font-size: x-large;
}

i.header_search {
	font-size: large;
    color: #ffc06c;
}

i.header_user {
	font-size: x-large;
	margin-left:30px;
    color: #ffc06c;
	font-weight: bolder;
}

/* 드롭다운 */
.dropdown {
	positive: relative;
	display: inline-block;
}

.dropbtn {
	cursor: pointer;
}

.dropdown-content {
	font-family: 'Noto Sans KR', sans-serif;
	display: none;
	position: absolute;
	z-index: 1; /*다른 요소들보다 앞에 배치*/
	font-weight: 400;
	background-color: #f9f9f9;
	min-width: 100px;
}

.dropdown-content a {
	font-family: 'Noto Sans KR', sans-serif;
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 12px;
	padding: 12px 20px;
}

.dropdown-content a:hover {
	background-color: #ececec
}

.dropdown:hover .dropdown-content {
	display: block;
}

/*0508 최은지 세션 연장 타이머 css*/
.btn_bgtd_timeout{
	font-size: 13px;'
	color: #ffd274;
}

.timer_div{
	background-color: #ffd274;
	border-radius: 20px;
	box-shadow: 3px 3px 30px 1px #ebebeb70;
	text-align: center;
	display: flex;
	justify-content: center;
	flex-direction: column;
	height: 20px;
}

</style>

	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<body>
	<!-- header 시작 -->
	<header>
		<div id="header_parent">
			<div id="header_first">
				<a href="${pageContext.request.contextPath}/main.do"> <img
					src="${pageContext.request.contextPath}/images/egovframework/common/logo.png"
					id="header_logo"></a>
			</div>
			<div id="header_second">
				<a href="${pageContext.request.contextPath}/main.do" id="header_title">EAT STAMP</a>
			</div>
			
				
			<div id="header_third">
				<c:if test="${!empty member}">
				
				<!--  0508 최은지 세션 로그인 연장  -->
				<div class="btn_bgtd_timeout" align="right">
              	<script type="text/javascript" charset="utf-8"></script>
		         	   	<span id="timer"  style='font-size: 15px;'></span>
		            <div class = "timer_div">
		             	<a href="javascript:refreshTimer();"><i class="fa-solid fa-clock"></i>&nbsp;시간 연장</a>
	             	</div>
				</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="${pageContext.request.contextPath}/search.do"><i class="fa-solid fa-magnifying-glass header_search"></i></a>
					<div class="dropdown">
						<i class="fa-regular fa-user header_user"></i>
						<div class="dropdown-content">
							<a href="${pageContext.request.contextPath}/stamp/allList.do">전체글보기</a>
							<a href="${pageContext.request.contextPath}/mypage.do">마이페이지</a>
							<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
						</div>
					</div>
				</c:if>
				<c:if test="${empty member}">
					<a href="${pageContext.request.contextPath}/login.do"><i class="fa-solid fa-right-to-bracket header_search"></i></a>
					<a href="${pageContext.request.contextPath}/join.do"><i class="fa-solid fa-user-plus header_user"></i></a>
				</c:if>
			</div>
		</div>
	</header>
</body>

<!-- 0508 최은지 로그인 시 헤더에 남은 세션 시간 표기 -->
<script type="text/javascript">

//초단위 사용
var iSecond; 
var timerchecker = null;

//윈도우 리로드시마다 실행시키기>>>
window.onload = function() {
    fncClearTime();
    initTimer();
}
 
 //세션(타이머) 유효 시간 설정
function fncClearTime() {
    iSecond = 1800;
}
 
//시간 표기 양식
Lpad = function(str, len) {
    str = str + "";
    while (str.length < len) { //0보다 작을 때까지 문자열 추가 
        str = "0" + str;
    }
    return str;
}
 
 //타이머 체크
initTimer = function() {
    var timer = document.getElementById("timer");
    rHour = parseInt(iSecond / 3600);
    rHour = rHour % 60;
 
    rMinute = parseInt(iSecond / 60);
    rMinute = rMinute % 60;
 
    rSecond = iSecond % 60;
 
    if (iSecond > 0) {
        timer.innerHTML = "&nbsp;" + Lpad(rMinute, 2)
                + "분 " + Lpad(rSecond, 2) + "초 ";
        iSecond--;
        timerchecker = setTimeout("initTimer()", 1000); // 1초 간격 체크
    } else {
    	alert("세션이 만료되어 자동 로그아웃됩니다.");
        logoutUser();
    }
}
 
//타이머 갱신용 요청
function refreshTimer() {
    var xhr = initAjax();
    xhr.open("POST", "/window_reload.do", false);
    xhr.send();
    fncClearTime();
}
 
 //세션 만료 시 로그아웃 진행
function logoutUser() {
	console.log("로그아웃 진행>>>>>");
    clearTimeout(timerchecker);
    var xhr = initAjax();
    xhr.open("GET", "/logout.do", false);
    xhr.send();
    location.reload();
}
 
// 브라우저에 따른 AjaxObject 인스턴스 분기 처리
function initAjax() { 
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}
</script>

</html>