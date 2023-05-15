<%@ page import="com.EatStamp.domain.MemberVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 완료 페이지</title>

 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		

<%
	// 현재 세션 객체 가져오기
	HttpSession session_out = request.getSession(false);
	System.out.println("삭제 전 세션값>>" + session);

	if (session != null) {
	  // 세션 무효화
	  session.invalidate();
		
		if(!request.isRequestedSessionIdValid()){
			System.out.println("세션삭제됨!!!!!!!!!!");
		}else{
			System.out.println("세션삭제안됨!!!!!!!!!!");
		}
	}else{
		System.out.println("세션 없음");
	}
%>

<script>
	 alert("비밀번호 변경이 완료되었습니다. 다시 로그인해 주세요.")
	 location.href = "/ownerLogin.do";		
</script>
 
</head>
<body>

</body>
</html>