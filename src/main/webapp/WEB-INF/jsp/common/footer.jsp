<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<style type="text/css">
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
	footer{
		background-color:#ddd9cb;
		height:150px;
		color:white;
		font-family: 'Noto Sans KR', sans-serif;
		/* position: fixed;
	    bottom: 0; */
	    width: 100%;
/* 	    position: relative; */
/* 	    transform: translateY(-100%); */
	}
	
	/* 푸터 정렬 */
	
	div#footer_parent{
		display:flex;
		flex-direction:row;
	}
	
	div#footer_first{
		flex:3;
		margin: 30px 0 0 300px;
	}
	
	div#footer_second{
		flex:1;
	}
	
	div#footer_third{
		flex:3;
		margin: 30px 300px 0 0;
	}
	
	/* 요소 배치 */
	
	img#footer_logo{
		width:80px;
		height:80px;
	}
	
	h3#footer_title{
		font-family: 'Permanent Marker', cursive;
		font-size:16px;
	    font-weight: 100;
	    position: relative;
    	right: 5px;
	}
	
	p#footer_detail{
		text-align:right;
	}
</style>

<body>
	<!-- footer 시작 -->
	<footer>
		<div id="footer_parent" style="display: flex;">
			<div id="footer_first">
				<img src="${pageContext.request.contextPath}/images/common/logo_white.png" id="footer_logo">
				<h3 id="footer_title">EAT STAMP</h3>
			</div>
			<div id="footer_second"></div>
			<div id="footer_third">
				<p id="footer_detail">
					이예지 yejilee@edsk.co.kr
					<br>
					최은지 ejchoi@edsk.co.kr
					<br>
					<br>
					서울특별시 서초구 서초중앙로 149-5 (서초동) 파인빌딩
					<br>
					Copyright © 2023. EATSTAMP All rights recieved.
				</p>
			</div>
		</div>
	</footer>
	<!-- footer 끝 -->
</body>
</html>
