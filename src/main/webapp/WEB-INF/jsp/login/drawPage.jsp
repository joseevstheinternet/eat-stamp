<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- 헤더  -->
  <%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/draw.css'/>" />
	
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
	<!-- 아이콘 사용 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" 
		    referrerpolicy="no-referrer" />
<body>


<div class="page-main">

	<div class = "all_wrap" >

		<div class="mypage-menu">
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/mypage.do" style="color: #9d9d9d;">회원 정보</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/stamp/list.do" style="color: #9d9d9d;">내 식사 기록</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/stamp/myCmtList.do" style="color: #9d9d9d;">내가 쓴 댓글</a></p>
			<p class="menu-list"><a class="menu-list" 
				href="${pageContext.request.contextPath}/rest_list.do" style="color: #9d9d9d;">찜한 가게</a></p>
			<p class="menu-list"><a class="menu-list"
				href="${pageContext.request.contextPath}/check_report.do" style="color: #9d9d9d">신고 내역</a></p>
			<p class="menu-list"><a class="menu-list"
				href="${pageContext.request.contextPath}/withdraw.do">회원 탈퇴</a></p>
		</div>
		<!-- 좌측 메뉴바 종료 -->
		
	<div class = "wrap"> 
	
		<div class = "text_box">
			<span>회원 탈퇴</span>
		</div>
		
		<div class = "text_box">
			<input class="email_text" type = "text"  value ="${member.mem_email }">
		</div>
		
		
		<div class = "alert_box">
			<span class = "alert"> 회원탈퇴 시 관련 정보가 모두 삭제되며 복구가 불가능합니다. </span>
			<br>
			<span class = "alert"> 아래의 체크박스를 체크해야 회원 탈퇴가 정상적으로 진행됩니다. </span>
		</div>
		
		<div class ="main_form"> 

			<form id="deleteForm" name="deleteForm" action = "/delete_member.do" method="post" onsubmit ="return CheckTest();">
			
					<div class = "agree_box">
						<input type="checkbox" required="required" name ="checkSelect">
						<span class ="alert_span"> 안내 사항을 모두 확인하였으며, 이에 동의합니다. </span>
					</div>
					
	
					<input type ="hidden" id="mem_num"  name="mem_num" value ="${member.mem_num }">
					
					<input  type ="password"  id="mem_pwCheck"  name="mem_pwCheck" placeholder="비밀번호를 입력해주세요." required="required">
					
					<br>
					<button id="deleteBtn">회원탈퇴</button>
					
			</form>
			
			</div>  <!-- main_form end -->
		
		</div>	 <!-- wrap end -->
	
	</div> <!-- all_wrap end -->
		
	</div> <!-- page-main end -->
</body>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

<script type="text/javascript">

//체크박스 체크 누락 여부 확인
function CheckTest(){
	
	var selectCheck = document.getElementByName("checkSelect");
	
	for (var i =0; i<selectCheck.length; i++){
		
		if(selectCheck[i].checked){
			return true;
		}
	}
	
	alert("체크박스를 확인해주세요");
	return false;	
}



</script>


</html>