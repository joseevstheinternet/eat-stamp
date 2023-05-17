<%--
시스템명 : 가게 사장 회원가입 화면
파일명: ownerMyPageView.jsp
작성자: 최은지
작성일자: 2023.05.17
처리내용: 회원 찜 식당 목록을 map형식으로 볼 수 있는 페이지이다.
History: 최은지, 2023.05.17 최초 작성
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 								prefix="c" %>
<%-- 헤더 삽입 --%>
 <%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%--  영역 감추기용 style태그 선언 --%>
<style type="text/css">
	.div_wrap{
		visibility: hidden;
	}
	.div_page{
		width: 50%;
		margin: 0 auto;
		padding: 80px;
		margin-bottom: 40px;
	}
	.div_restLikeTop{
		display: flex;
		justify-content: space-between; 
	}
	
	.txt_restLike{
		font-size: 25px;
	    color: ffc06c;
	    font-weight: bold;
    }
    .btn_goRestLikeList{
	    width: 150px;
	    border-radius: 30px;
	    background-color: #ffd274;
	    color: white;
	    font-size: 20px;
	    margin: 15px 10px 0 0;
	    font-weight: bold;
	    float: right;
	    box-shadow: 3px 3px 30px 1px #ebebeb70;
	    height: 50px;
	  }
</style>

</head>
<%-- CSS링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />	

<%-- fontawsome 아이콘 사용 CDN --%>
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
		referrerpolicy="no-referrer" />

<%-- jquery 사용 CDN --%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<%-- 카카오 MAP API --%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c708fc10e6ae62d00a01cdd6dad561ed&libraries=services"></script>

<body>

	<div class ="div_page">
		<div class = "div_allWrap">
			<div class = "div_restLikeTop">
				<span class = "txt_restLike">찜한 가게</span>
				<button class ="btn_goRestLikeList"  type="button" onclick = "location.href ='/rest_list.do'">리스트로 보기</button>
			</div>
		
			<div class = "div_wrap">
				<c:forEach var="add_list" items="${add_list}" varStatus="status">
					<span class="txt_addList" >${add_list.r_add}</span>
					<span class="txt_addName" >${add_list.r_name}</span>
					<span class="txt_addNum" >${add_list.r_num}</span>
				</c:forEach>
			</div>
			
			<div id="div_map" style="width:100%;height:500px;border-radius: 30px;box-shadow: 3px 3px 30px 1px #ebebeb70;"></div>
			
		</div>
	</div>

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>

<script>
	
	var addressArray = []; //식당 주소 배열
	var rNumArray = []; //식당 고유번호 배열
	var rNameArray = []; //식당 상호명 배열
		
	var addListElements = document.getElementsByClassName( "txt_addList" ); //반복 출력된 list값 저장
	var addNumElements = document.getElementsByClassName( "txt_addNum" ); // r_num 요소 가져오기
	var addNameElements = document.getElementsByClassName( "txt_addName" ); // r_name 요소 가져오기

	// 주소와 r_num을 각각의 배열에 저장
	for ( var i = 0; i < addListElements.length; i++ ) {
	 	 addressArray.push( addListElements[i].textContent ); //식당 주소
	 	 rNumArray.push( addNumElements[i].textContent ); //식당 고유번호
	 	 rNameArray.push( addNameElements[i].textContent ); //식당 상호명
	}

	console.log( addressArray ); // 값 확인
	console.log( rNumArray ); // 값 확인
	console.log( rNameArray ); // 값 확인
	
	var mapContainer = document.getElementById('div_map'); // 지도를 표시할 div
	var mapOption = {
	  center: new kakao.maps.LatLng( 37.498095, 127.027610 ), // 지도의 중심 좌표(강남역 설정)
	  level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map( mapContainer, mapOption ); // 지도 생성
	var geocoder = new kakao.maps.services.Geocoder(); //위도 경도 변환 객체 생성
	var positions = [];
	
	for (var i = 0; i < addressArray.length; i++) {
	  positions.push(addressArray[i]);
	}
	
	for (var i = 0; i < positions.length; i++) {
		  (function(index) {
		    geocoder.addressSearch(positions[index], function(result, status) {
		      if (status === kakao.maps.services.Status.OK) {
		        var latlng = new kakao.maps.LatLng(result[0].y, result[0].x);

		        var marker = new kakao.maps.Marker({
		          map: map,
		          position: latlng
		        });

		        var r_num = rNumArray[index]; // r_num 가져오기
		        var r_name = rNameArray[index]; // r_name 가져오기
		        
		        var infowindow = new kakao.maps.InfoWindow({
			          content: '<div>' + r_name + '</div>'
			        });

		        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		        kakao.maps.event.addListener(marker, 'click', makeClickListener(r_num)); // r_num, r_name 전달
		      }
		    });
		  })(i);
		}

	function makeClickListener(r_num) { //클릭 시 해당 식당 상세 페이지로 이동
		  return function() {
		    location.href = "/rest_detail.do?r_num=" + r_num;
		  };
		}

	
	function makeOverListener( map, marker, infowindow ) { 
	  return function () {
	    infowindow.open( map, marker );
	  };
	}
	
	function makeOutListener(infowindow) {
	  return function () {
	    infowindow.close();
	  };
	}
</script>


</html>