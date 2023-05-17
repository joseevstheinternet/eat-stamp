<%--
시스템명 : 가게 사장 회원가입 화면
파일명: ownerMyPageView.jsp
작성자: 최은지
작성일자: 2023.05.15
처리내용: 가게 사장 전용 마이 페이지이다.
History: 최은지, 2023.05.15 최초 작성
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 								prefix="c" %>
<%-- 헤더 삽입 --%>
<%@ include file="/WEB-INF/jsp/common/ownerHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Owner My Page</title>
</head>

<%-- css 링크 연결 --%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<link type="text/css" rel="stylesheet" href="<c:url value='/css/ownerCSS/ownerSignUp.css'/>" />

<%-- fontawsome 아이콘 사용 CDN --%>
<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
		integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
		crossorigin="anonymous" 
		referrerpolicy="no-referrer" />

<%-- jquery 사용 CDN --%>
<script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<%-- 도로명 주소 api 사용 CDN--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>

	<div class ="div_page">
		
		<div class ="div_allWrap">
		
		<form action="/insertOwnerSignUpInfo.do" method="post" class ="frm_ownerSignUp" onsubmit="return checks();">
				<div class = "div_txtWrap">
					<span class ="txt_textLogo"><i class="fa-solid fa-utensils adminIcon"></i>사장님 회원가입</span>
				</div> <!--div_txtWrap end  -->
				
				<div class = "div_wrapEmailBox">
					<span class = "txt_email">이메일</span>
					<div class = "div_inputEmailBox">
						<input class ="txt_emailInput" type="text" name ="mem_email" placeholder="로그인 및 비밀번호 찾기에 사용될 이메일을 입력해주세요." required="required">
						<button type ="button" class = "btn_checkDuplEmail">중복확인</button>
					</div>
				</div>
				
				<div class = "div_wrapPwdOneBox">
					<span class = "txt_pwdOne">비밀번호</span>
					<input class="pwd_inputOne"  name = "mem_pw" type="password" placeholder="숫자, 영문, 특수문자 조합 최소 8자 최대 15자">
					 <i class="fa fa-eye fa-lg"></i>
				</div>
				
				<div class = "div_wrapPwdTwoBox">
					<span class = "txt_pwdTwo">비밀번호 확인</span>
					<input class="pwd_inputTwo" name = "mem_pwCheck" type="password" placeholder="비밀번호를 다시 입력해주세요.">
					 <i class="fa fa-eye fa-lg"></i>
				</div>
				
				<div class = "div_wrapSearchRestName">
						<span class = "txt_restName">상호명 검색</span>
					<div class = "div_searchRestName">
						<input class ="txt_restNameInput"  name ="mem_nick" id ="txt_restNameInput" type="text" placeholder="우측 버튼을 클릭해 상호명을 검색해주세요." readonly>
						<input class ="hdn_restNumInput"  name ="r_num" id ="hdn_restNumInput" type="hidden" readonly>
						<button class = "btn_searchRestName" type="button"> 검색 </button>
					</div>
				</div>
				
				<div class = "div_wrapInsertRestName">
					<span class = "txt_restName"><i class="fa-solid fa-arrow-right" ></i> 검색된 상호명이 없나요? (1/2)</span>
					<input class ="txt_restNameInputInsert"  name ="mem_newNick"  type="text" placeholder="직접 상호명을 입력해주세요.">
				</div>
			
				<div class = "div_wrapAdd">
					<span class = "txt_restName"><i class="fa-solid fa-arrow-right" ></i> 검색된 상호명이 없나요? (2/2)</span>
					<input class ="hdn_postCord" type="hidden" id="sample6_postcode" placeholder="우편번호">
					<input class ="hdn_extra" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
						
					<div class = "div_wrapSemiAdd">
						<input class ="txt_addMainInput"  name="r_add" id="sample6_address" type="text"  placeholder="등록할 주소는 우측의 검색 버튼을 클릭해 등록해주세요." readonly="readonly">
						<button class ="btn_addSearch"  type="button"  onclick="sample6_execDaumPostcode()">검색</button>			
					</div>
						<input class ="txt_addSemiInput" type="text"  name="r_semi_add" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
				</div>
				
				<button class = "sbm_ownerSignUp" type="submit"> Sign Up</button>
		</form>
		
		</div><!-- div_allWrap end  -->
	 	
	 </div><!-- div_page end  -->
	

<%-- 푸터 삽입 --%>
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>

<script type="text/javascript">

var checkEmail = false; //이메일 중복 체크용 기본 설정

//버튼 클릭 시 이메일 중복 체크 이벤트
$( document ).on( "click", ".btn_checkDuplEmail", function () {
    $.ajax({
        			type : "post",
    				url : "/emailDupl.do",
			        data:{
				        	mem_email : $('.txt_emailInput').val()
				        	},
					dataType: "text",
		            success : function(data) {		            
						                if (data == 1) { 
						                   		alert("중복된 이메일입니다.");
						                   		checkEmail = false; 
						                } else { 
						                   		 alert("사용 가능한 이메일입니다.");
						                   		 checkEmail = true;
						               	 } //else end
				          	  }, //success end
				      error : function(data){
				    	  			console.log(data);
				      }//error end
	    }) //ajax end	
	    
	    //return checkEmail;
	    
}); //onclick end


//클릭시 비밀번호 입력값 노출 이벤트
$( document ).on( "click", ".div_wrapPwdOneBox i", function () {
    $( 'input' ).toggleClass( 'active' );
    
    if ( $( 'input' ).hasClass( 'active' ) ) {
        $( this ).attr( 'class',"fa fa-eye-slash fa-lg" )
        .prev( 'input' ).attr( 'type', "text" );
    } else {
        $( this ).attr( 'class', "fa fa-eye fa-lg" )
        .prev( 'input' ).attr( 'type', 'password' );
    }
});


//클릭시 비밀번호 확인 입력값 노출 이벤트
$( document ).on( "click", ".div_wrapPwdTwoBox i", function () {
    $( 'input' ).toggleClass( 'active' );
    
    if( $( 'input' ).hasClass( 'active' )){
        $( this ).attr( 'class',"fa fa-eye-slash fa-lg" )
        .prev( 'input' ).attr( 'type', "text" );
    }else{
        $(this).attr( 'class', "fa fa-eye fa-lg" )
        .prev( 'input' ).attr( 'type', 'password' );
    }
});


//검색버튼 클릭 시 레스토랑 리스트 출력 이벤트
$( document ).on( "click", ".btn_searchRestName", function () {
	url = "/goRestSearchPopUp.do";
	window.open(url,"selectRestList",'width=500,height=400, scrollbars=no, resizable=no');
});


//유효성 검사
//return true : 검사 조건 충족
//return false : 검사 조건 미충족, form action실행 불가
function checks() {
	
	//이메일 정규식
     var getMail = RegExp( /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
   
	//비밀번호 정규식
   	//최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나 ex)Test12345678!
     var getCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
     
	//이메일 공백 확인
	 if ($(".txt_emailInput").val() == "") {
		   alert ( "이메일을 입력해주세요" );
		   $( ".txt_emailInput" ).focus();
		   return false;
	 }
	      
	 //이메일 유효성 검사
	 if ( !getMail.test( $( ".txt_emailInput" ).val() ) ){
		   alert ( "이메일형식에 맞춰 입력해주세요" );
		   $( ".txt_emailInput" ).focus();
		   return false;
	 }
	 
	 //이메일 중복 여부 검사
	 if ( false == checkEmail ) {
		 alert ( "이메일 중복 여부를 확인해주세요." );
		 $( ".txt_emailInput" ).focus();
		  return false;
	 }
	 
	//비밀번호 공백 확인
	 if ( $( ".pwd_inputOne" ).val() == "" ) {
	  		alert ( "비밀번호를 입력해주세요." );
	   		$( ".pwd_inputOne" ).focus();
	  	 	return false;
	 }
	     
	 //비밀번호 유효성검사
	 if ( !getCheck.test ( $(".pwd_inputOne").val() ) ) {
		   alert( "비밀번호를 형식에 맞게 입력해주세요." );
		   $(".pwd_inputOne").focus();
		   return false;
	 }
	      
	 //비밀번호 확인란 공백 확인
	 if ( $(".pwd_inputTwo").val() == "" ) {
		   alert ( "비밀번호 확인란을 입력해주세요" );
		   $(".pwd_inputTwo").focus();
	   	   return false;
	 }
	      
	 //비밀번호 매치 확인
	 if ( $(".pwd_inputOne").val() != $(".pwd_inputTwo").val() ){
	     alert("비밀번호가 상이합니다");
	     $(".pwd_inputTwo").focus();
	     return false;
	 } 
	 
	 //상호명 중복입력 확인
	   if ( $(".txt_restNameInput").val() != ""  &&  $( ".txt_restNameInputInsert").val() != "" ) {
		    alert ( "기존 등록 가게와 신규 등록 가게 중 하나만 선택할 수 있습니다." );
		    $( ".txt_restNameInput" ).focus();
		    return false;
		 }
	 
	//상호명 미입력 확인
	   if ( $(".txt_restNameInput").val() == "" &&  $( ".txt_restNameInputInsert").val() == "" ) {
		    alert ( "상호명을 입력해주세요." );
		    $( ".txt_restNameInput" ).focus();
		    return false;
		 }
	 
} //return check() end


//주소 api 사용 함수
function sample6_execDaumPostcode() {
   new daum.Postcode({
       oncomplete: function(data) {

           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var addr = ''; // 주소 변수
           var extraAddr = ''; // 참고항목 변수

           //사용자가 선택한 주소 타입에 따라 해당 주소 값
           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr = data.roadAddress;
           } else { // 사용자가 지번 주소를 선택했을 경우(J)
               addr = data.jibunAddress;
           }

           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합
           if(data.userSelectedType === 'R'){
               // 법정동명이 있을 경우 추가(법정리는 제외)
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가
               if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 표시할 참고항목이 있을 경우 괄호까지 추가한 최종 문자열
               if(extraAddr !== ''){
                   extraAddr = ' (' + extraAddr + ')';
               }
               document.getElementById("sample6_extraAddress").value = extraAddr;
           
           } else {
               document.getElementById("sample6_extraAddress").value = '';
           }

           document.getElementById('sample6_postcode').value = data.zonecode;
           document.getElementById("sample6_address").value = addr;
           document.getElementById("sample6_detailAddress").focus();
       }
   }).open();
} //주소 api사용 함수 end
	

	

</script>
</html>