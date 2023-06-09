<%--
시스템명 : 가게 사장 회원가입 화면
파일명: ownerMyPageView.jsp
작성자: 최은지
작성일자: 2023.05.15
처리내용: 가게 사장 회원가입 중 상호명 검색을 위한 팝업 페이지이다.
History: 최은지, 2023.05.15 최초 작성
		 이예지, 2023.05.19 수정
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 								prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호명 검색</title>
</head>

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

.div_main {
	padding: 10px;
}

.div_wrapSearchResult {
	margin-top: 20px;
}

.div_restResultList {
	margin-bottom: 15px;
}

.div_title {
	width: 230px;
    display: flex;
    justify-content: space-between;
}

.txt_r_add {
	font-size: 14px;
    color: #b7b7b7;
}

</style>

<body>

	<div class = "div_main">
		<div class = "div_wrapSearch">
			<form class = "frm_searchRestName" action="/selectSearchRestName.do" method="post">
				<input class = "txt_searchKeywordInput" name = "search_keyword" placeholder="검색 키워드를 입력해주세요.">
				<button type="submit" class = "sbm_restSearch">검색</button>
			</form>		
		</div>
		<!--  검색결과 출력 div-->
		<div class = "div_wrapSearchResult">
			<c:if test="${0 == count}">
				<h2>검색결과가 존재하지 않습니다.</h2>
			</c:if>
			
			<c:if test="${0 < count}">
				<c:forEach var="list" items="${list}" varStatus="status">
					<div class = "div_restResultList">
						<div class = "div_title">
							<span class="txt_r_name" >${list.r_name}</span>
							<span class="txt_r_num" style="display: none">${list.r_num}</span>
							<button type="button" class = "btn_choiceRest">선택</button>
						</div>
						<span class="txt_r_add" >${list.r_add}</span>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div><!-- div_main end  -->

</body>

<script type="text/javascript">
	  $(document).on("click", ".btn_choiceRest", function() {
	    var selectedText = $(this).siblings(".txt_r_name").text();
	    opener.document.getElementById("txt_restNameInput").value = selectedText;
	    
// 	    var selectedText2 = $(this).siblings(".txt_r_num").text();
// 	    opener.document.getElementById("hdn_restNumInput").value = selectedText2;
	    
	    window.close();
	  });
</script>



</html>