<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
   <!-- 헤더  -->
  <%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<!-- jquery 사용 -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
	<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/tagFind.css'/>" />
	
	<!-- 아이콘 사용 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" 
			integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
			crossorigin="anonymous" 
		    referrerpolicy="no-referrer" />
		
<br> <br> <br>

 <div class="page-main"></div>
 
	<div id="search_wrap"> 

		<div id="search_field">
				
			<form id="searchForm" name="searchForm">
			
				 <!--  페이징 요청하는 자바스크립트 함수명 // 검색 버튼 바뀔 때마다 js단에서 처리해주기 -->
				<input type="hidden" id="function_name" name="function_name" value="getSearchNomalList" />
                <input type="hidden" id="current_page_no" name="current_page_no" value="1" />
                <input type = "hidden"  id ="mem_num" name ="mem_num" value = "${member.mem_num}">
				<input type="text" id="search_text" name="search_keyword">   
				<button type="button" id = "searchBtn"> <i  class="fa-solid fa-magnifying-glass header_search"></i> </button>
				
			</form>
			
			<br>
			 <!-- 추천 해시 출력 영역 -->
 			<div id="tag_result"> </div>
 			
 			
 			<br> <br>
		
		<!-- 태그 검색!!!  -->
			<div id="tag_search_box">
				<c:if test="${! empty list}">
					<c:forEach var="list" items="${list}">
								
						<div class = 'wrap_search'>
	                    	   
		                   <div class= 'tag_wrap'>
		                    <div class='tag_semi_wrap'>
		                    
		                    <div class='img_box'>
		                  		<c:if test="${list.s_FileName == null}">
										<img src="${pageContext.request.contextPath}/images/egovframework/common/logo.png" class="imgfile">
								</c:if>
								<c:if test="${list.s_FileName != null}">
									<img class="imgfile" src="${pageContext.request.contextPath}
												/images/imageUpload/upload${list.s_fileLoca}/${list.s_FileName}">
								</c:if>
		                   	</div>
		                     
		                     <div class = "flex_tag">
		                     
		                   <div class='tag_title_box'>
		                  		 <input type ='hidden' value = '"${list.s_num}'>
		                   		<a class='font-set1' href= '/stamp/detail.do?s_num=${list.s_num}'>${list.s_title}</a>
		                    </div>
		                     
		                    <div class ='tag_date_box'>
		                    <span>${list.reg_date}</span>
		                    </div>
		                    
		                   <div class ='tag_content_box'>
								<a class='font-set1' href= '/stamp/detail.do?s_num=${list.s_num}"'>${list.s_content}</a>
		                    </div>
		                    
		                    </div> <!--  flex_tag -->
		                    
		                    </div> <!--  semi wrap-->
		                    </div> <!-- wrap -->
		                   
		                   
	                   </div>
						<br>
					</c:forEach>
				</c:if>
			</div>
			
			<!-- 태그 검색 페이지네이션  -->
			<div class="page">${page}</div>
 			
						
			<!--  검색 전환용 토글 출력-->			
			<div class="centerer">
			    <div class="switcher">
			      <input type="radio" name="balance" value="yin" id="yin" class="switcher__input switcher__input--yin" >
			      <label for="yin" class="switcher__label" id="popular"> 식당 </label>
			      
			      <input type="radio" name="balance" value="yang" id="yang" class="switcher__input switcher__input--yang" checked="">
			      <label for="yang" class="switcher__label" id="recent"> 내 스탬프 </label>
			      
			      <span class="switcher__toggle"></span>
			    </div>
			</div>
			
			
		</div><!-- search_field end  -->
		
		<br> <br> <br>
		
			<!-- 검색 결과 출력 영역 -->
			<div id="search_result"></div>
			
			<!-- 페이징  출력 영역 -->
			<div id="pagination"></div>
		
	</div> <!-- search_wrap end  -->
	
</body>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>

<script type="text/javascript">


const textElement = document.getElementById('function_name');


//검색 버튼 클릭 시 ajax > 기본 내 글 검색
$(document).on("click", "#searchBtn", function(){
	
	//태그 검색 내용 비우기
	$("#tag_search_box").remove();
	$(".page").remove();
	
	 $('.switcher').css('display', 'inline-block');
	
	textElement.value = "getSearchNomalList";
	
	console.log(textElement.value);

	getSearchNomalList();
	   
}); //onclick end
	
		
		
	//스위치 버튼 클릭 시 ajax > 기본 내 글 검색
	$(document).on("click", "#yang", function(){
	
		textElement.value = "getSearchNomalList";
	
		console.log(textElement.value);
		
		getSearchNomalList();
			   
	}); //onclick end
		
	//스위치 버튼 다시 클릭 시 ajax > 레스토랑 정보 검색
	$(document).on("click", "#yin", function(){
			
			textElement.value = "getSearchRestList";
			
			console.log(textElement.value);
		
			getSearchRestList();
				   
	}); //onclick end
		
	
	//페이지 실행 시 추천 태그 출력
	window.onload =  getRecommendTag();
			
	//페이지 실행 시 추천 태그
		function getRecommendTag(){
		
			console.log("추천태그 실행");
			console.log($('#mem_num').val());
				
					$.ajax({    
				        
			            url : "/get_recommendTag.do",
			            data : {
			            		 mem_num : $('#mem_num').val()
			           			 },
			            dataType : "json",
			            type     : "post",
			            async    : true,
			            success  : function(data) {
			            	
			            	
			            	console.log(data);
			                   			  	            
			  	          var div = "";
			  	          
			  	          $(data).each(function(){
			  	        	  
			  	        	div += "<div class= 'oneTag'>";
			  	        	div += "<a style='font-size: 20px; font-weight: bold;' class ='tag_mix' href= '/tag_semiSearch.do?tag_content=" + this.tag_content + "&mem_num=" + this.mem_num+" '>"+ "#" + this.tag_content +"</a>";    
			  	        	div += "</div>";            
			  	        	
			  	          })//each end
			  	          
			  	        $("#tag_result").html(div);
			            			 
			            },  //success end    
			            
			            error : function(data) {
			            	console.log("태그 추천 오류");
			            
			            }//error end
			            
			         }); //ajax end
		}//태그 추천 호출 함수 end
	
	
		
		//일반 검색 클릭 시 호출 함수
		function getSearchNomalList(currentPageNo){
			
			if(currentPageNo === undefined){
	            currentPageNo = "1";
	        }
			
			$("#current_page_no").val(currentPageNo);
				
					$.ajax({    
				        
			            url : "/search_stampCheck.do",
			            data : $("#searchForm").serialize(),
			            dataType : "JSON",
			            cache    : false,
			            async    : true,
			            type     : "POST",    
			            success  : function(obj) {
			            			getSearchNomalListCallBack(obj);
			            			
			            			console.log(obj);
			            			
			            },  //success end    
			            
			            error : function(status, error, obj) {
			            	console.log("콜백 실행 x");
			            	console.log(status);
			            	console.log(error);
			            	console.log(obj);
			            }//error end
			            
			         }); //ajax end
		}//일반 검색 호출 함수 end
		

		//일반 검색 콜백함수
		function getSearchNomalListCallBack(obj){
	
			var state = obj.state;        
	        if(state == "SUCCESS"){
	        	
	            var data = obj.data;            
	            var list = data.list;
	            var listLen = list.length;        
	            var totalCount = data.totalCount;
	            var pagination = data.pagination;
	                    
	            var div = "";
			
	            if(listLen >  0){
	                
	                for(var a=0; a<listLen; a++){
	                    
	                    var mem_num = list[a].mem_num; 
	                    var s_num = list[a].s_num; 
	                    var s_title = list[a].s_title; 
	                    var s_FileName   = list[a].s_FileName; 
	                    var s_fileLoca   = list[a].s_fileLoca; 
	                    var s_content  = list[a].s_content; 
	                    var reg_date = list[a].reg_date; 
	                    var r_num = list[a].r_num; 
	                    var search_keyword = list[a].search_keyword;
	                    
	                    
	                    div += "<div class = 'wrap_search'>"
	                    	   
	                    div += "<div class= 'result_wrap''>";
	                    div += "<div class='result_semi_wrap'>";   
	                    
	                    div += "<div class='img_box'>";
						div += "<img class = 'stamp_img' src=";
									if (null == s_FileName){
										div +=	"'${pageContext.request.contextPath}/images/egovframework/common/logo.png'>";
			
									}else{
										div +="'${pageContext.request.contextPath}/images/imageUpload/upload"+s_fileLoca+ "/" +s_FileName + "'>";
									}
	                    div += "</div>";	           
	                    
	                    div += "<div class = 'detail_box'>";
       
	                    div += "<div class = semi_detail_box>"
	                    
	                    div +=  "<div class='title_box'>";
	                    div += "<input type ='hidden' value = '" + s_num +"'>";
	                    div += "<a class='font-set1' href= '/stamp/detail.do?s_num="+s_num + "'>"+ s_title +"</a>";
	                    div += "</div>";
	                     
	                    div += "<div class ='date_box'>";
	                    div += "<span>"+ reg_date +"</span>";
	                    div += "</div>";
	                    
	                    div += "</div>"; //semi_detail_box end
	                    
	                    div += "<div class ='content_box'>";
	                    div += "<a href= '/stamp/detail.do?s_num="+s_num + "'>"+ s_content +"</a>";    
	                    div += "</div>";
	                    
	                    div += "</div>"; // detail_box end
	                    
	                    div += "</div>"; //result_semi_wrap end
	                    div += "</div>"; // end
	                    
	                    div += "</div>";
	                    
						div += "<hr>";
	                } 
	                
	            } else {
	                
	                div += "<div>";
	                div += "<span'>검색된 게시글이 존재하지 않습니다.</span>";
	                div += "</div>";
	            }
	            
	            $("#search_result").html(div);
	            //$("#total_count").text(totalCount);
	            $("#pagination").html(pagination);
	        }
	            	
			
		}//일반 검색 호출 콜백 함수 end
		
		
		
//==========================================================================================================
	
		//레스토랑 스위치 검색 클릭 시 호출 함수
		function getSearchRestList(currentPageNo){
			
			if(currentPageNo === undefined){
	            currentPageNo = "1";
	        }
			
			$("#current_page_no").val(currentPageNo);
				
					$.ajax({    
				        
			            url : "/search_restCheck.do",
			            data : $("#searchForm").serialize(),
			            dataType : "JSON",
			            cache    : false,
			            async    : true,
			            type     : "POST",    
			            success  : function(obj) {
			            			getSearchRestListCallBack(obj);
			            },  //success end    
			            
			            error : function(status, error, obj) {
			            	console.log("콜백 실행 x");
			            	console.log(status);
			            	console.log(error);
			            	console.log(obj);
			            }//error end
			            
			         }); //ajax end
		}//레스토랑 검색 호출 함수 end
		

		
		//일반 검색 콜백함수
		function getSearchRestListCallBack(obj){
	
			var state = obj.state;        
	        if(state == "SUCCESS"){
	        	
	            var data = obj.data;            
	            var list = data.list;
	            var listLen = list.length;        
	            var totalCount = data.totalCount;
	            var pagination = data.pagination;
	                    
	            var div = "";
			
	            if(listLen >  0){
	                
	                for(var a=0; a<listLen; a++){
	                    
	                    var r_num = list[a].r_num; 
	                    var r_name = list[a].r_name; 
	                    var r_add = list[a].r_add; 
	                    var r_food   = list[a].r_food; 
	                    var r_tel  = list[a].r_tel; 
	                    var r_fileName = list[a].r_fileName; 
	                    var r_detail = list[a].r_detail; 
	                    var r_menu = list[a].r_menu;
	                    var r_fileName = list[a].r_fileName; 
	                    var r_open = list[a].r_open; 
	                    var r_close = list[a].r_close;
	                    var r_category = list[a].r_category;
	                    
	                    div += "<div class ='rest_box'>";	                    
	                    
	                    div += "<div class = 'wrap_search'>"
	                    	   
	                    div += "<div class= 'result_wrap''>";
	                    div += "<div class='result_semi_wrap'>";
	                    
	                    div += "<div class='img_box'>";
						div += "<img class = 'rest_img' src=";
									if (null == r_fileName){
										div +=	"'${pageContext.request.contextPath}/images/egovframework/common/logo.png'>";
			
									}else{
										div +=	"'${pageContext.request.contextPath}/images/restImage/"+r_fileName + "'>";
									}
	                    div += "</div>";
	                    
	                    div += "<div class = 'detail_box'>";
	                    
	                    div +=  "<div class='title_box'>";
	                    div += "<input type ='hidden' value = '" + r_num +"'>";
	                    div += "<a class='font-set1' href= '/rest_detail.do?r_num="+r_num + "'>"+ r_name +"</a>";
	                    div += "</div>";
	                    
	                    div +=  "<div class='tel_box'>";
	                    div += "<span> <i class='fa-solid fa-phone restIcon'></i>"+ r_tel +"</span>";
	                    div += "</div>";
	                    
	                    div +=  "<div class='add_box'>";
	                    div += "<input type ='hidden' value = '" + r_add +"'>";
	                    div += "<span>"+ r_add +"</span>";
	                    div += "</div>";
	                    
	                    div += "</div>"; //detaii_box end
	                        
	                    div += "</div>"; //result_semi_wrap end
	                    div += "</div>"; // end
	                    
	                    div += "</div>";
	                    
	                    div += "<hr>"
     
	                } 
	                
	            } else {
	                
	                div += "<div>";
	                div += "<span'>검색된 식당 정보가 존재하지 않습니다.</span>";
	                div += "</div>";
	            }
	            
	            $("#search_result").html(div);
	            //$("#total_count").text(totalCount);
	            $("#pagination").html(pagination);
	        }
	            	
		}//식당 검색 호출 콜백 함수 end
		

</script>



</html>