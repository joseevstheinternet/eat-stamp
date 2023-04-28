<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<!-- css 링크 사용 -->
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
	<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/pwFindNew.css'/>" />
	
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
 
 		<div id = "logo_box">
			<img src="${pageContext.request.contextPath}/images/egovframework/common/logo_full.png" class="main-logo">
		</div>
		
		<br>
		
		<div id ="sentence_box">
			<a id="loginMsg"> 비밀번호 재설정 </a>		
		</div>
		
		<br><br>

	<form action="/reset_pw_final.do" method="post" onsubmit="return checks();">
	
		<label>새로운 비밀번호</label>
		<div class="textbox" id="pw1">
			<input id="mem_pw" name="mem_pw" type="password" required>
			<i class="fa fa-eye fa-lg"></i>
		</div>
		
		<br><br>
		
		<label>새로운 비밀번호 확인</label>
		<div class="textbox" id="pw2">
			<input id="mem_pwCheck" name = "mem_pwCheck"  type="password"  required>
			<i class="fa fa-eye fa-lg"></i>
		</div>
		
		<input type="hidden" name="mem_email" value=${param.mem_email }>
		
		<br><br>
		<button type="submit" id="pw_restet_checkBtn" >비밀번호 변경</button>
	</form>
	
	</div><!-- page-main end -->

</body>

<!--  -->
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
<script type="text/javascript">
	
function checks(){
	
    var getCheck= RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/); //최소 8자, 대문자 하나 이상, 소문자 하나 및 숫자 하나, 특수문자 하나>> Test12345678!

	//비밀번호 공백 확인
	if($("#mem_pw").val() == ""){
	  alert("비밀번호를 입력해주세요.");
	  $("#mem_pw").focus();
	  return false;
	}
	    
	//비밀번호 유효성검사
	if(!getCheck.test($("#mem_pw").val())){
	  alert("비밀번호를 형식에 맞게 입력해주세요.");
	  $("#mem_pw").val("");
	  $("#mem_pw").focus();
	  return false;
	}
	     
	//비밀번호 확인란 공백 확인
	if($("#mem_pwCheck").val() == ""){
	  alert("비밀번호 확인란을 입력해주세요");
	  $("#mem_pwCheck").focus();
	  return false;
	}
	     
	//비밀번호 매치 확인
	if($("#mem_pw").val() != $("#mem_pwCheck").val()){
	    alert("비밀번호가 상이합니다");
	    $("#mem_pw").val("");
	    $("#mem_pwCheck").val("");
	    $("#mem_pw").focus();
	    return false;
	} 
} //checks() end


//클릭시 비밀번호 확인
    $('#pw1 i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });
    
  //클릭시 비밀번호 확인 2
    $('#pw2 i').on('click',function(){
        $('input').toggleClass('active');
        if($('input').hasClass('active')){
            $(this).attr('class',"fa fa-eye-slash fa-lg")
            .prev('input').attr('type',"text");
        }else{
            $(this).attr('class',"fa fa-eye fa-lg")
            .prev('input').attr('type','password');
        }
    });




</script>

</html>