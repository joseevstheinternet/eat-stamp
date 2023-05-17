<%--
시스템명 : 가게 사장 로그인 화면
파일명: ownerMyPageView.jsp
작성자: 최은지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 마이 페이지이다.
History: 최은지, 2023.05.15 최초 작성
		 이예지, 2023.05.15 수정
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 헤더 삽입 --%>
<%@ include file="/WEB-INF/jsp/common/ownerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner My Page</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />

<%-- fontawsome 아이콘 사용 CDN --%>
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
		referrerpolicy="no-referrer" />

<%-- jquery 사용 CDN --%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<style>
div.mypage-menu{
	height: 190px;
}

div.mypage-wrap{
	display: grid;
    justify-items: center;
    margin-top: 10px;
}

/* section 1 (아이콘, 닉네임, 성별, 나이)*/
div.section1{
    display: flex;
    align-items: center;
    width: 570;
}

div.section1-1{
	margin-right: 30px;
}

i.pIcon{
    font-size: 35px;
    color: #ffc06c;
}

i.adminIcon{
	font-size: 25px;
    color: ffc06c;
}

div.section1-2{
    display: grid;
    flex: 4;
}

span.mypage-con1{
    font-weight: bold;
    font-size: 14px;
    margin: 5px 0;
}

img.mypage-logo{
	width: 50px;
}

div.section 1-3{
    flex: 1;
}
/* section 1 끝 */

/* section 2 (이메일) */
div.section2{
    width: 550px;
    text-align: center;
    background-color: #e6d4ad;
    padding: 20px;
    margin: 30px 0;
    border-radius: 23px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
}
span.email{
    font-size: 20px;
    /* letter-spacing: -0.5; */
    color: white;
    font-weight: bolder;
}
/* section 2 (이메일) 끝 */

/* section 3,4 (비밀번호 변경) */
div.section3{
    width: 590px;
    margin: 40px 0 30px 0;
}

input[type=password] {
	width: 580px;
    height: 32px;
    font-size: 15px;
    border: 0;
    border-radius: 20px;
    outline: none;
    background-color: #f6ecdb;
    margin: 10px 0;
    padding: 25px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    color: white;
}

input::placeholder{
	color: #c6c1b1;
}

div.pwBtn{
    display: flex;
    justify-content: center;
}

button#pw_restet_checkBtn{
    padding: 15px 30px;
    background-color: ffd274;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    color: white;
    font-size: 16px;
    font-weight: bold;
    border-radius: 30px;
}
/* section 3,4 (비밀번호 변경) 끝 */

</style>

<body>
<div class="page-main">
	<c:choose>
		<c:when test="${!empty owner}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
				<div class="mypage-menu">
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/ownerMypage.do">사장님 정보</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="#" style="color: #9d9d9d;">식당 정보 수정</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/ownerRestSetting.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerResveList.do" style="color: #9d9d9d;">예약 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/owner/ownerStampList.do" style="color: #9d9d9d;">식당 리뷰</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 회원 정보 폼 시작 -->
				<div class="mypage-div02">
					<!-- 회원 정보 -->
					<div class="mypage-wrap">
						<div class="section1">
							<div class="section1-2">
								<span class="mypage-title">${owner.mem_nick} 사장님</span>
							</div>
							<div class="section1-3">
								<i class="fa-solid fa-utensils adminIcon"></i>
							</div>
						</div>
						<div class="section2">
							<span class="email">${owner.mem_email}</span>
						</div>
						<div class="section3">
							<h2 class="pw">사장님 비밀번호 변경</h2>
						</div>
						<div class="section4">
							<form action="/ownerPW.do" method="post" onsubmit="return checks();">
							<input type ="hidden" id="mem_num"  name="mem_num" value ="${owner.mem_num}">
							<input type ="hidden" id="mem_email"  name="mem_email" value ="${owner.mem_email}">
							
								<div class="textbox" id="pw1">
									<input id="mem_pwCheck" name="mem_pwCheck" type="password"
										placeholder="현재 비밀번호를 입력해 주세요" required>
								</div>
								
								<div class="textbox" id="pw1">
									<input id="new_mem_pw" name="new_mem_pw" type="password"
										placeholder="새로운 비밀번호를 입력해 주세요" required>
								</div>
								
								<div class="textbox" id="pw2">
									<input id="new_mem_pwCheck" name = "new_mem_pwCheck" type="password"
										placeholder="새로운 비밀번호 확인" required>
								</div>
														
								<br><br>
								<div class="pwBtn">
									<button type="submit" id="pw_restet_checkBtn" >비밀번호 변경하기</button>
								</div>
							</form>
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
	function checks(){
	  var pwCheck = document.getElementById("mem_pwCheck").value;
	  var newPw = document.getElementById("new_mem_pw").value;
	  var newPwCheck = document.getElementById("new_mem_pwCheck").value;
	  
// 		//최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나>> Test12345678!
// 	  var getCheck= RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);

// 		//비밀번호 유효성검사
// 	  if (!getCheck.test(newPw)) {
// 		  alert("비밀번호를 형식에 맞게 입력해주세요.");
// 		  document.getElementById("new_mem_pw").value = "";
// 		  document.getElementById("new_mem_pw").focus();
// 		  return false;
// 		}
		
	  if (pwCheck === "" || newPw === "" || newPwCheck === "") {
	    alert("빈칸을 모두 입력해주세요.");
	    return false;
	  }
	  
		
	  if (newPw !== newPwCheck) {
	    alert("새로운 비밀번호가 일치하지 않습니다.");
	    return false;
	  }
	  
	  // 현재 비밀번호와 일치하지 않을 경우
	  if ("${pwdMatch}" === "false") {
	    alert("현재 비밀번호가 일치하지 않습니다.");
	    return false;
	  }

	  return true;
	} //checks() end
</script>

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>