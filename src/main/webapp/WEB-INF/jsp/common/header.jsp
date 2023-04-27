<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
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
</style>
<body>
	<!-- header 시작 -->
	<header>
		<div id="header_parent">
			<div id="header_first">
				<c:choose>
					<c:when test="${!empty admin}">
						<a href="${pageContext.request.contextPath}/mypageAdmin.do"><img
							src="${pageContext.request.contextPath}/images/common/logo.png"
							id="header_logo"></a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/mainAdmin.do"><img
							src="${pageContext.request.contextPath}/images/common/logo.png"
							id="header_logo"></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="header_second">
				<c:choose>
					<c:when test="${!empty admin}">
						<a href="${pageContext.request.contextPath}/mypageAdmin.do" id="header_title">EAT STAMP ADMIN</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/mainAdmin.do" id="header_title">EAT STAMP ADMIN</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="header_third">
				<c:if test="${!empty admin}">
					<a><i id="logoutBtn" class="fa-solid fa-right-to-bracket header_search"></i></a>
				</c:if>
				<c:if test="${empty admin}">
					<a href="${pageContext.request.contextPath}/mainAdmin.do"><i class="fa-solid fa-right-from-bracket header_search"></i></a>
				</c:if>
			</div>
		</div>
	</header>
</body>

<script type="text/javascript">
				    
	$(document).on("click", "#logoutBtn", function(){
		 if( confirm("정말 로그아웃 하시겠습니까?") ) {
			 location.href = "/mainAdminLogout.do";
			}
		}); //onclick end
				    
</script>

</html>