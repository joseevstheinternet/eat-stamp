<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />	
<link type="text/css" rel="stylesheet" href="<c:url value='/css/stampListAdmin.css'/>" />
<!-- 아이콘 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
	    referrerpolicy="no-referrer" />	

<style>
div.mypage-wrap{
	display: grid;
    justify-items: center;
    margin-top: 10px;
}

/* section 1 (아이콘, 닉네임, 성별, 나이)*/
div.section1{
    display: flex;
    align-items: center;
    width: 600;
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 관리자 페이지</title>
 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		
</head>

<body>

<div class="page-main">
	<c:choose>
		<c:when test="${!empty admin}">
			<div id="wrap">
				<!-- 좌측 메뉴바 -->
				<div class="mypage-menu">
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/mypageAdmin.do">관리자 정보</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/memberListAdmin.do" style="color: #9d9d9d;">회원 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/adminOwnerList.do" style="color: #9d9d9d;">사장님 정보 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/restListAdmin.do" style="color: #9d9d9d;">식당 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/stampListAdmin.do" style="color: #9d9d9d;">게시글 관리</a></p>
					<p class="menu-list"><a class="menu-list" 
						href="${pageContext.request.contextPath}/reportListAdmin.do"  style="color: #9d9d9d;">신고 내역 관리</a></p>
				</div>
				<!-- 좌측 메뉴바 종료 -->
				
				<!-- 회원 정보 폼 시작 -->
				<div class="mypage-div02">
					<!-- 회원 정보 -->
					<div class="mypage-wrap">
						<div class="section1">
							<div class="section1-1">
								<c:choose>
								  <c:when test="${admin.mem_profileCode == 'i1'}">
								    <i class="fa-solid fa-burger pIcon"></i>
								  </c:when>
								  <c:when test="${admin.mem_profileCode == 'i2'}">
								    <i class="fa-solid fa-ice-cream pIcon"></i>
								  </c:when>
								  <c:when test="${admin.mem_profileCode == 'i3'}">
								    <i class="fa-solid fa-pizza-slice pIcon"></i>
								  </c:when>
								  <c:when test="${admin.mem_profileCode == 'i4'}">
								    <i class="fa-solid fa-drumstick-bite pIcon"></i>
								  </c:when>
								  <c:when test="${admin.mem_profileCode == 'i5'}">
								    <i class="fa-solid fa-bowl-rice pIcon"></i>
								  </c:when>
								</c:choose>
							</div>
							<div class="section1-2">
								<span class="mypage-title">${admin.mem_nick}</span>
							</div>
							<div class="section1-3">
								<i class="fa-solid fa-user-shield adminIcon"></i>
							</div>
						</div>
						<div class="section2">
							<span class="email">${admin.mem_email}</span>
						</div>
						<div class="section3">
							<h2 class="pw">관리자 비밀번호 변경</h2>
						</div>
						<div class="section4">
							<form action="/mypageAdmin_pw.do" method="post" onsubmit="return checks();">
							<input type ="hidden" id="mem_num"  name="mem_num" value ="${admin.mem_num}">
							<input type ="hidden" id="mem_email"  name="mem_email" value ="${admin.mem_email}">
							
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
				<span class="no-admin">관리자 ID로 로그인하세요.</span>
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


<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>