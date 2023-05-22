<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <c:set var="path" value="${pageContext.request.contextPath }"/>    
    <!-- 헤더  -->
   <%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 관리자 - 가게 상세 페이지</title>

 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		

</head>

<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/restDetailAdmin.css'/>" />
	
   <!--  카카오 map api -->
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c708fc10e6ae62d00a01cdd6dad561ed&libraries=services"></script>
 
 <!-- 아이콘 사용  -->
 	<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- alert custom cdn -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<body>
	
	<div class ="page_main" >
	
			<div class="all_wrap"> 
					
					<!-- 삭제용 r_num -->
					<input type="hidden" class="r_num" value="${list.r_num }">
					
					<div class ="title_box">
						<span> ${list.r_name }의 정보입니다.</span>		
					</div>	
			
				<div class="flex_wrap1">  
					<div class = "img_box">
						<!-- <i class='fa-solid fa-image imageIcon'></i> -->
						<c:if test="${null != list.r_fileName}">
							<img src="${pageContext.request.contextPath}/images/restImage/${list.r_fileName}" class="rest_img"
								onerror="this.src='${pageContext.request.contextPath}/images/common/loading.gif'">	
						</c:if>
						
						<c:if test="${null == list.r_fileName}">
							<img src="${pageContext.request.contextPath}/images/common/logo.png" class="rest_img">
							
						</c:if>
					</div>
					
					
					<div class ="detail_wrap"> 
						<div class ="detail_semi_wrap">
							<div class ="food_box">
								<span> ${list.r_food }</span>		
							</div>
						
							<div class ="block_box">
									<c:if test ="${1 != list.r_block }">
											<span class="unblock_text">공개 상태</span>
									</c:if>
									
									<c:if test ="${1 == list.r_block }">
											<span class="block_text">비공개 상태</span>
									</c:if>	
							</div>
						</div> <!-- detail_semi_wrap  end-->
						
						<div class ="tel_box">
							<span><i class="fa-solid fa-phone restIcon"></i> ${list.r_tel }</span>		
						</div>
						
						<span><i class="fa-solid fa-circle-info"></i> 세부정보 </span>
												
						<div class ="open_box">
							<span>OPEN :  ${list.r_open }</span>		
						</div>
						
						<div class ="close_box">
							<span>CLOSE : ${list.r_close }</span>			
						
						<div class ="detail_box">
							<span> ${list.r_detail }</span>		
						</div>

						</div>
					</div> <!--detail_wrap  end -->
					
				</div>	 <!--flex_wrap1  end -->
					
			<div class ="text_box">
				<span class="menu_span"> <i class="fa-solid fa-bars"></i> 메뉴 </span>	
				
				<div class="add_box">
					<span class="add_span"> <i class="fa-solid fa-location-dot"></i> 주소 </span>
					<input type=text id="rest_add"  value =" ${list.r_add }" /> 
				</div>
			</div>	
			
			
				<div class="flex_wrap2"> 
					<div class ="menu_box">
						<span> ${list.r_menu }</span>	
					</div>
						
						<div class = "map_wrap">
						<!-- 지도 표시 div -->
							<div id="map" style="width:335px;height:370px;"></div>
						</div>
						
				</div> <!-- flex_wrap2  end-->
			</div> <!-- all_wrap end -->
		
				<div class ="button_list">
					<c:if test ="${1 != list.r_block }">		
						<button class="block_btn" onclick="location.href='/restBlock.do?r_num=${list.r_num}'">비공개</button>
						<button class="update_btn" onclick="location.href='/restUpdate.do?r_num=${list.r_num}'">수정</button>
						<button class="delete_btn">삭제</button>
						<button class="list_btn" onclick="javascript:window.history.go(-1);">목록</button>
					</c:if>
					
					<c:if test ="${1 == list.r_block }">		
						<button class="unblock_btn" onclick="location.href='/restUnBlock.do?r_num=${list.r_num}'">공개</button>
						<button class="update_btn" onclick="location.href='/restUpdate.do?r_num=${list.r_num}'">수정</button>
						<button class="delete_btn">삭제</button>
						<button class="list_btn" onclick="javascript:window.history.go(-1);">목록</button>
					</c:if>
				</div>
				

	</div> <!-- 전체 div end-->
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>

<script type="text/javascript">

var r_num = $('.r_num').val();

	//삭제 시 한번 더 확인 후 로직 실행			    
	$(document).on("click", ".delete_btn", function(){
		 
		 Swal.fire({
	            text: '해당 가게의 정보를 삭제 하시겠습니까?',
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#ffd274',
	            cancelButtonColor: '#a5a5a5',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	      
	            	location.href = "restDelete.do?r_num="+r_num;
	            }
	        })
	
		}); //onclick end
</script>

<!--  카카오 맵 api 사용-->
<script type="text/javascript">

//지도 불러오기용 변수 설정
var view_add = $('#rest_add').val();

//지도 생성하기
var mapContainer = document.getElementById('map'), // 지도 표시 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도 중심좌표
        level: 3 // 지도 확대 레벨
   };  

// 지도를 생성  
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색 >>검색값 view_add
geocoder.addressSearch(view_add , function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 지도의 중심을 결과값으로 받은 위치로 이동
        map.setCenter(coords);
	    } else{
	    	
	    	alert("지도표시오류");
	    }
	});    
	
</script>


</html>