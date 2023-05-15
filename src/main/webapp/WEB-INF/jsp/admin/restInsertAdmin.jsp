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
<title>가게 정보 등록 페이지</title>
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
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/restInsertAdmin.css'/>" />
	
 
 	<!-- 아이콘 사용  -->
 	<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- 도로명 주소 api 사용  -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- alert custom cdn -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<body>
	
	<div class ="page_main" >
			
			<div class="all_wrap">
			
			<form action="/insertRestContent.do"  method="post"  enctype="multipart/form-data" onsubmit="return checks()">
			
				<input type="hidden" name= r_fileName class="file_name" > 
			
				<!-- 상호명 및 카테고리 감싸기ss div -->
				<div class = "foodCate_box">
					<div class = "cate_box">
						<div class="cate_text">
							<span class ="cate_span"> 카테고리</span>
						</div>
							<select class="cate_select" name ="r_category">
								<option value="한식">한식</option>
								<option value="일식">일식</option>
								<option value="중국식">중국식</option>
								<option value="경양식">경양식</option>
								<option value="분식">분식</option>
								<option value="외국음식">외국음식</option>
								<option value="뷔페">뷔페</option>
								<option value="호프">호프</option>
								<option value="기타">기타</option>
							</select>
					</div>
					
				</div> <!-- foodcate end -->
			
				<!--  윗단 flex용 감싸기 -->
				<div class ="top_wrap">
				
				<!--이미지 -->
				<div class = "img_box">
						<img src="https://via.placeholder.com/300/a5a5a5/ffffff?Text=이미지를 등록해주세요.com" class="rest_img">

					<br>
					<div class ="btn_div">
						<label for="img_route" class="img_insert_btn"> 이미지 등록</label>
					</div>
						<!-- 파일 숨기기 -->
						<input  type="file"  class ="img_route" id="img_route" name="img_route" accept="image/*" >
				</div>
				
				<!-- flex용 감싸기 -->
				<div class ="top_semi_warp">
				
				<div class = "food_box">
					<div class="food_text">
						<span class ="food_span"><i class="fa-solid fa-list-check"></i> 주된 음식</span>
					</div>
					<input class="food_input" name="r_food" type="text" placeholder="주된 음식을 입력해주세요.">
				</div>
				
				<!--상호명 -->
				<div class = "title_box">
					<div class="title_text">
						<span class ="title_span"><i class="fa-solid fa-signature"></i> 상호명</span>
					</div>
					<input class="title_input" name="r_name" type="text" placeholder="상호명을 입력해주세요.">
				</div>
				
				<!-- 전화번호  >>형식 맞춰서 입력하도록 유효성 검사 -->
				<div class ="tel_box">
					<div class="title_text">
						<span class ="tel_span"><i class="fa-solid fa-phone restIcon"></i> 전화번호</span>	
					</div>
					<input class="tel_input" name="r_tel" type="text" placeholder="가게 전화번호를 입력해주세요.">
				</div>
				
				<!-- 개점 시간  -->
				<div class ="open_box">
					<div class="open_text">
							<span class ="open_span"><i class="fa-solid fa-door-open"></i> OPEN</span>	
					</div>
					<input class="open_input" name="r_open" type="text" placeholder="개점 시간을 형식에 맞춰 입력해주세요. ex)09:00">
				</div>
				
				<!-- 폐점 시간  -->
				<div class ="close_box">
					<div class="close_text">
							<span class ="close_span"><i class="fa-solid fa-door-closed"></i> CLOSE</span>	
					</div>
					<input class="close_input" name="r_close" type="text"  placeholder="폐점 시간을 형식에 맞춰 입력해주세요. ex)21:00">
				</div>
				
				
				<!-- 상세정보 -->
				<div class ="detail_box">
					<div class="detail_text">
						<span class="detail_span"><i class="fa-solid fa-circle-info"></i> 세부정보 </span>
						<span class="detail_semi_span">가게 정보는 내용 하나당 줄바꿈으로 입력해주세요.</span>
					</div>
					<textarea class="detail_input" name="r_detail"  placeholder="가게 상세 정보를 입력해주세요."></textarea>
				</div>
				
			</div> <!-- top_semi_warp end -->
		</div> <!-- top_wrap end -->
		
		
		<!--아랫단 감싸기용  div-->
		<div class ="under_wrap">
				<!-- 주소 -->
				<div class ="add_box">
					<div class="add_text">
						<span class="add_span"> <i class="fa-solid fa-location-dot"></i> 주소 </span>
					</div>
					
					<!-- 주소 영역  -->
					<div class = "add_field"> 			
						<!-- 안보이는 영역  -->
						<input class="hidden_add" type="text" id="sample6_postcode" placeholder="우편번호">
						<input class="hidden_add" type="text" id="sample6_extraAddress" placeholder="참고항목">
						
						<input class="add_input"  name="update_add" id="sample6_address" type="text"  placeholder="등록할 주소는 우측의 검색 버튼을 클릭해 등록해주세요." readonly="readonly">	
						<input type="text"  name="update_add_semi" class="add_input" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
						<button class="add_search_btn"  type="button"  onclick="sample6_execDaumPostcode()">검색</button>		
					</div>
					
				</div>
				
				<!-- 메뉴-->
				<div class ="menu_box">
				
					<div class="menu_text">
						<div class="menu_text">
							<span class="menu_span"><i class="fa-solid fa-bars"></i> 메뉴</span>
							<span class ="menu_semi_span">메뉴 하나당 줄바꿈으로 구분해서 입력해주세요.</span>
						</div>
					</div>
				
					<textarea class="menu_input" name="r_menu" placeholder="가게 메뉴를 입력해주세요."></textarea>
				</div>
		</div>	<!-- under_wrap end -->	
		
			<div class ="btn_list">
				<button type="button" class ="cancel_btn">다시 작성</button>
				<button type="submit" class ="update_btn">등록하기</button>
			</div>
	</form>
			
</div> <!-- all_wrap end-->
			
</div> <!-- page_main end-->
	
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>

<script type="text/javascript">

	//취소버튼 클릭 시 새로고침	    
	$(document).on("click", ".cancel_btn", function(){
		 
		 Swal.fire({
	            text: '입력한 내용을 처음으로 되돌리시겠습니까?',
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#ffd274',
	            cancelButtonColor: '#a5a5a5',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	      
	                location.reload();
	            }
	        })
		 
		}); //onclick end
		
		
	//이미지 미리보기
		const fileDOM = document.querySelector('#img_route');
		const preview = document.querySelector('.rest_img');
		
		fileDOM.addEventListener('change', () => {
		  const imageSrc = URL.createObjectURL(fileDOM.files[0]);
		  preview.src = imageSrc;
		});

		
	//폼 체크용 함수	
	 function checks(){	
		//기본 주소 등록 없이 상세주소만 입력했다면 막기
		     if($("#sample6_address").val() == "" &&  $("#sample6_detailAddress").val() != ""){
			       alert("수정할 주소를 등록해주세요.");
			       $("#sample6_address").focus();
			       return false;
			    }

		//전화번호 형태 정규식
		   var tel_reg = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
			
			if( "" == $(".tel_input").val()){ //미입력 시는 허용
				return true;
			
			}else{ //미입력 상태가 아닐 경우 정규식 체크
				  if(!tel_reg.test($(".tel_input").val())){
				        alert("전화번호를 형식에 맞춰 입력해주세요")
				        $(".tel_input").val("");
				        $(".tel_input").focus();
				        return false;
			      }
			}
			
		//시간 패턴 체크 >OPEN 
		var timeFormat = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
		if( "" == $(".open_input").val()){ //미입력 시는 허용
			return true;
		
		}else{ //미입력 상태가 아닐 경우 정규식 체크
			  if(!timeFormat.test($(".open_input").val())){
			        alert("개점시간을 형식에 맞춰 입력해주세요")
			        $(".open_input").val("");
			        $(".open_input").focus();
			        return false;
		      }
		}
		
		//시간 패턴 체크 > CLOSE
		var timeFormat = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
		if( "" == $(".close_input").val()){ //미입력 시는 허용
			return true;
		
		}else{ //미입력 상태가 아닐 경우 정규식 체크
			  if(!timeFormat.test($(".close_input").val())){
			        alert("폐점시간을 형식에 맞춰 입력해주세요")
			        $(".close_input").val("");
			        $(".close_input").focus();
			        return false;
		      }
		}
		      
		 //파일명 확장자 체크			
		   	var fileValue = $(".img_route").val().split("\\");
			var fileName = fileValue[fileValue.length-1]; // 파일명
			
    		$(".file_name").attr('value', fileName);
		    
			var fileLen = fileName.length; //길이 구하기
		    var lastDot = fileName.lastIndexOf('.'); //dot 찾기
		 
		    // 확장자 명만 추출한 후 소문자로 변경
		    var fileExt = fileName.substring(lastDot, fileLen).toLowerCase();
		    
		 	  console.log("확장자>>>>>>>>>>>>" + fileExt);
		 	  
		 	  if(fileExt == ''){ //공백 > 파일 업로드 x 상태이므로 통과
		 		  return true;
		 	  
		 	  }else{
					if (fileExt != '.jpg' && fileExt != '.png' && fileExt != '.jpeg' && fileExt != '.bmp') {
			            alert('이미지 파일(jpg, png, jpeg, bmp)만 등록이 가능합니다.');
			           return false;
			        }		
		 	  }
 
		}//check end	
	
	
	//주소 api 사용 함수
	 function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    } //주소 api사용 함수 end
		
		
</script>

</html>