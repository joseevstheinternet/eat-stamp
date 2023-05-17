<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <c:set var="path" value="${pageContext.request.contextPath }"/>    
    <!-- 헤더  -->
  <%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 식당 상세 페이지</title>
</head>

<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/restDetail.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	
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

<body>
	
<div class ="page-main" >
	<div class="view-box">
		<!-- 해당 가게를 찜하지 않았다면 -->
		<c:if test="${null == like_list.r_like_num}">
		
			<div class ="title_box">
				<span> ${list.r_name} 정보입니다.</span>		
			</div>	
						
			<!-- ajax용 r_num, r_rlike_num  -->
			<input type="hidden"  id="r_num"  value="${list.r_num}"/> 
			<input type="hidden"  id="r_like_num" /> 
	
			<div class="flex_wrap1">  
				<div class = "img_box">
					<!-- <i class='fa-solid fa-image imageIcon'></i> -->
					<c:if test="${null != list.r_fileName}">
						<img src="${pageContext.request.contextPath}/images/restImage/${list.r_fileName}" class="rest_img">	
					</c:if>
					
					<c:if test="${null == list.r_fileName}">
						<img src="${pageContext.request.contextPath}/images/egovframework/common/logo.png" class="rest_img">
						
					</c:if>
				</div>
			
				<div class ="detail_wrap"> 
					<div class ="detail_semi_wrap">
						<div class ="food_box">
							<span> ${list.r_food }</span>		
						</div>
						
						<div class ="heart_box">	
							<p id="empty_heart"> <i class="fa-regular fa-heart"></i> </p>
						</div>
					</div> <!-- detail_semi_wrap  end-->
					
					<div class ="tel_box">
						<span><i class="fa-solid fa-phone restIcon"></i> ${list.r_tel}</span>		
					</div>
					
					<span><i class="fa-solid fa-circle-info"></i> 세부정보 </span>
											
					<div class ="open_box">
						<span>OPEN :  ${list.r_open}</span>		
					</div>
					
					<div class ="close_box">
						<span>CLOSE : ${list.r_close}</span>			
					
					<div class ="detail_box">
						<span> ${list.r_detail}</span>		
					</div>
	
					</div>
				</div> <!--detail_wrap  end -->
			</div>	 <!--flex_wrap1  end -->
			
			<div class ="text_box">
				<span class="menu_span"> <i class="fa-solid fa-bars"></i> 메뉴 </span>	
				<span class="add_span"> <i class="fa-solid fa-location-dot"></i> 주소 </span>	
			</div>	
	
			<div class="flex_wrap2"> 
				<div class ="menu_box">
					<span> ${list.r_menu}</span>	
				</div>
					
				<div class ="add_wrap"> 		
					<div class = "add_box">
						<input type=text id="rest_add"  value =" ${list.r_add}" /> 
					</div>
					
					<div class = "map_wrap">
					<!-- 지도 표시 div -->
						<div id="map" style="width:100%;height:350px;"></div>
					</div>
					
				</div> <!-- end -->
			</div> <!-- flex_wrap2  end-->
	
			<div class ="go_list">
				<c:if test="${list.r_resveCode == 'y'}">
					<button class="listBtn" onclick="location.href = '#'">예약하기</button>
				</c:if>
				<button class="listBtn" onclick="javascript:window.history.go(-1);">목록으로</button>
			</div>
			
			 <br><br> <br>
		 </c:if>	
		 
		<!-- 해당 가게를 찜했다면 -->
		<c:if test="${null != like_list.r_like_num}">				 
			<div class ="title_box">
				<span> ${list.r_name} 정보입니다.</span>		
			</div>	
					
			<!-- ajax용 r_num, r_rlike_num  -->
			<input type="hidden" id="r_num" value="${list.r_num}"/> 
			<input type="hidden" id="r_like_num" value="${like_list.r_like_num}" />
		
			<div class="flex_wrap1">  
				<div class = "img_box">
					<c:if test="${null != list.r_fileName}">
						<img src="${pageContext.request.contextPath}/images/restImage/${list.r_fileName}" class="rest_img">	
					</c:if>
					<c:if test="${null == list.r_fileName}">
						<img src="${pageContext.request.contextPath}/images/egovframework/common/logo.png" class="rest_img">
					</c:if>
				</div>
				
				<div class ="detail_wrap"> 
					<div class ="detail_semi_wrap">
						<div class ="food_box">
							<span> ${list.r_food}</span>		
						</div>
						
						<div class ="heart_box">	
							<p id="full_heart"> <i class='fa-solid fa-heart'></i> </p>
						</div>
					</div> <!-- detail_semi_wrap  end-->
					
					<div class ="tel_box">
						<span><i class="fa-solid fa-phone restIcon"></i> ${list.r_tel}</span>		
					</div>
					
					<span><i class="fa-solid fa-circle-info"></i> 세부정보 </span>
											
					<div class ="open_box">
						<span>OPEN :  ${list.r_open}</span>		
					</div>
					
					<div class ="close_box">
						<span>CLOSE : ${list.r_close}</span>			
					
						<div class ="detail_box">
							<span> ${list.r_detail}</span>		
						</div>
					</div>
				</div> <!--detail_wrap  end -->
			</div>	 <!--flex_wrap1  end -->
				
			<div class ="text_box">
				<span class="menu_span"> <i class="fa-solid fa-bars"></i> 메뉴 </span>	
				<span class="add_span"> <i class="fa-solid fa-location-dot"></i> 주소 </span>	
			</div>	
		
			<div class="flex_wrap2"> 
				<div class ="menu_box">
					<span> ${list.r_menu}</span>	
				</div>
					
				<div class ="add_wrap"> 		
					<div class = "add_box">
						<input type=text id="rest_add"  value =" ${list.r_add}" /> 
					</div>
					
					<div class = "map_wrap">
					<!-- 지도 표시 div -->
						<div id="map" style="width:100%;height:350px;"></div>
					</div>
				</div> <!-- end -->
			</div> <!-- flex_wrap2  end-->
		
			<div class ="go_list">
				<c:if test="${list.r_resveCode == 'y'}">
					<button class="listBtn" 
						onclick="location.href='restResveForm=${list.r_num}.do'">예약하기</button>
				</c:if>
				<button class="listBtn" onclick="javascript:window.history.go(-1);">목록으로</button>
			</div>
			
			<br><br> <br>
		 </c:if>		
	</div>
</div> <!-- 전체 div end-->

</body>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

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

        // 인포윈도우로 장소에 대한 설명을 표시
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">식당 정보</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동
        map.setCenter(coords);
	    } else{
	    	
	    	alert("지도표시오류");
	    }
	});    
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////	


	//빈 하트 클릭 시 찜하기용 ajax함수 실행
	$(document).on("click", "#empty_heart", function(){		
		addR_like();
	}); //onclick end
	
	
	//빈 하트 클릭 시 찜하기 취소용 ajax함수 실행
	$(document).on("click", "#full_heart", function(){
		deleteR_like()
	}); //onclick end
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////

//찜하기 클릭 시 실행 ajax
		function addR_like(){
		
			console.log("찜하기 ajax 실행");
			
					$.ajax({    
				        
			            url : "/add_rest_like.do",
			            data : {
			            		 r_num : $('#r_num').val()
			           			 },
			            dataType : "json",
			            type     : "post",
			            async    : true,
			            success  : function(data) {	            	
			            	
				            	if(data == 1){   
				            		//가게 등록에 성공했다면
				            		//아이콘 변경
									document.getElementById("empty_heart").innerHTML = "<i class='fa-solid fa-heart'></i>";
									
									//아이디값 변경
									$("#empty_heart").attr('id', 'full_heart');
				            		
				            		alert("해당 가게가 찜 목록에 추가되었습니다.");
				            		
				            		//찜하기 취소 ajax용으로 r_like_num을 새로 받아와야함 + ajax함수 추가 
				            		plusR_like();
				            		
			              		  } else { 
			                			alert("찜하기에 실패했습니다. 다시 시도해주세요.");
			               		 } //else end 	
			     
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("찜하기 오류");
			            	alert("찜하기에 실패했습니다. 다시 시도해주세요. 222");
			            
			            }//error end
			            
			         }); //ajax end
		}//찜하기 등록 함수 end

///////////////////////////////////////////////////////////////////////////////////////////////////////////


function plusR_like(){
		
			console.log("좋아요번호추가로받아오는 ajax 실행");
			
					$.ajax({    
				        
			            url : "/plus_rest_like.do",
			            data : {
			            		 r_num : $('#r_num').val()
			           			 },
			            dataType : "json",
			            type     : "post",
			            async    : true,
			            success  : function(data) {	            	
			            	
				            	if(null != data){   
				            		
				            		console.log("추가로 받아오기 성공~~~");
				            		console.log(data);
				            		
				            		$("#r_like_num").attr('value', data);
				            		
			              		  } else { 
			                			alert("추가로 못받아옴 ㅠㅠ~.");
			               		 } //else end 	
			     
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("추가로 받아오기 오류");
			            
			            }//error end
			            
			         }); //ajax end
		}//찜하기 등록 함수 end



		
///////////////////////////////////////////////////////////////////////////////////////////////////////////

		//찜하기 취소 클릭 시 실행 ajax
		function deleteR_like(){
		
			console.log("찜하기 삭제!! ajax 실행");
			
					$.ajax({    
				        
			            url : "/delete_rest_like.do",
			            data : {
			            		 r_num : $('#r_num').val(),
			            		 r_like_num : $('#r_like_num').val()
			           			 },
			            dataType : "json",
			            type     : "post",
			            async    : true,
			            success  : function(data) {	            	
			            	
				            	if(data == 1){   
				            		//가게 삭제에 성공했다면
				            		//아이콘 변경
									document.getElementById("full_heart").innerHTML = "<i class='fa-regular fa-heart'></i>";
									
									//아이디값 변경
									$("#full_heart").attr('id', 'empty_heart');
				            		
				            		alert("해당 가게가 찜하기 목록에서 삭제되었습니다..");
				            			
			              		  } else { 
			                			alert("삭제에 실패했습니다. 다시 시도해주세요.");
			               		 } //else end 	
			     
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("찜하기 삭제 오류");
			            	alert("찜하기 삭제 에 실패했습니다. 다시 시도해주세요. 222");
			            
			            }//error end
			            
			         }); //ajax end
		}//찜하기 삭제 함수 end

		


</script>


</html>