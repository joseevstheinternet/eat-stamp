<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/layout.css'/>" />
	
<style>

div.page-main{
	padding: 80px 0;
}

div.view-box{
	background-color: white;
    border-radius: 20px;
    padding: 50px;
    width: 600px;
    margin: 0 auto;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
}

div.box-wrap{
	padding: 0 20px;
}

div.no-admin{
	background-color: white;
    text-align: center;
    padding: 50px;
    width: 500px;
    border-radius: 20px;
    box-shadow: 3px 3px 30px 1px #ebebeb70;
    margin: 20px auto;
    display: flex;
    justify-content: center;
    flex-direction: column;
}

span.no-admin{
	font-size: 16px;
    font-weight: bold;
    color: #d90000;
    margin: 3px 0;
}

/* section1 (프로필, 제목, 작성일시) */
div.section1{
    display: flex;
    align-items: center;
}

i.pIcon{
    font-size: 40px;
    color: #ffc06c;
}

div.box-title{
    margin-left: 20px;
}

span.font-set1{
    font-size: 25px;
    letter-spacing: -1;
    font-weight: bold;
    color: #ffc06c;
}

div.box-date{
    margin-top: 5px;
    color: lightgrey;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 500px;
}

div.section1-1{
    display: flex;
    align-items: center;
    margin: 30px 0;
}

i.mapIcon{
    font-size: 20px;
    color: #ffc06c;
}

div.section1-1-2{
    flex: 1;
    margin: 0 20px;
    font-size: 14px;
    color: #9d9d9d;
    font-weight: bold;
}

div.section1-1-3{
    background-color: ffd274;
    padding: 8px 15px;
    border-radius: 20px;
    font-size: 13px;
    color: white;
    font-weight: bold;
}
/* section1 (프로필, 제목, 작성일시) 끝 */

/* section2 (이미지, 내용) */
div.box-img{
    display: flex;
    justify-content: center;
}

img.fileImg{
    border-radius: 20px;
    max-width: 600px;
}

div.box-content{
    margin: 30px 0;
}

span.font-set2{
    font-size: 16px;
    letter-spacing: -1;
    margin-right: 10px;
}

span.font-set3{
	font-size: 15px;
    font-weight: bold;
}

span.font-set4{
    font-size: 15px;
    color: 5da6ff;
    margin: 0 20px;
}
/* section2 (이미지, 내용) 끝 */

/* section3 (버튼) */
div.section3{
    display: flex;
    justify-content: flex-end;
}

button.box-button{
	padding: 10px 25px;
    border-radius: 20px;
    color: white;
}

button.delete_btn{
	background-color: #b7b7b7;
    margin: 0 10px 0 0;
}

button.list_btn{
	background-color: ffd274;
}
/* section3 (버튼) 끝 */

</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp 관리자 - 글 상세 페이지</title>

 <%
	 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
	 response.setHeader("Cache-Control","no-store");
	 response.setHeader("Pragma","no-cache");
	 response.setDateHeader("Expires",0);
	 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>		

</head>
<body>

<div class="page-main">
	<c:choose>
		<c:when test="${!empty admin}">
			<div class="view-box">
				<div class="box-wrap">
					<div class="section1"> <!-- 제목, 작성일시 -->
						<div class="pIcon">
							<c:choose>
								<c:when test="${stamp.mem_profileCode == 'i1'}">
									<i class="fa-solid fa-burger pIcon"></i>
								</c:when>
								<c:when test="${stamp.mem_profileCode == 'i2'}">
									<i class="fa-solid fa-ice-cream pIcon"></i>
								</c:when>
								<c:when test="${stamp.mem_profileCode == 'i3'}">
									<i class="fa-solid fa-pizza-slice pIcon"></i>
								</c:when>
								<c:when test="${stamp.mem_profileCode == 'i4'}">
									<i class="fa-solid fa-drumstick-bite pIcon"></i>
								</c:when>
								<c:when test="${stamp.mem_profileCode == 'i5'}">
									<i class="fa-solid fa-bowl-rice pIcon"></i>
								</c:when>
							</c:choose>
						</div>
						<div class="box-title">
							<span class="font-set1">${stamp.s_title}</span>
							<div class="box-date">
								<span class="font-set2">${stamp.mem_nick}(${stamp.mem_email})</span>
								<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${stamp.reg_date}"/>
							</div>
						</div>
					</div>
					<div class="section1-1">
						<div class="section1-1-1">
							<i class="fa-solid fa-location-dot mapIcon"></i>
						</div>
						<div class="section1-1-2">
							<span class="r_name">${stamp.r_name}</span>
						</div>
						<div class="section1-1-3">
						    <c:choose>
						        <c:when test="${stamp.s_rate == 2}">
						            <span class="s_rate">좋아요!</span>
						        </c:when>
						        <c:when test="${stamp.s_rate == 1}">
						            <span class="s_rate">보통이에요</span>
						        </c:when>
						        <c:otherwise>
						            <span class="s_rate">별로였어요</span>
						        </c:otherwise>
						    </c:choose>
						</div>
					</div>
					<div class="section2"> <!-- 사진, 내용, 태그 -->
						<div class="box-img">
							<c:if test="${!empty stamp.s_fileName}">
								<img class="fileImg" 
									src="${pageContext.request.contextPath}/images/imageUpload/upload${stamp.s_fileLoca}/${stamp.s_fileName}" 
		        					onerror="this.src='${pageContext.request.contextPath}/images/egovframework/common/loading.gif'">
							</c:if>
						</div>
						
						<div class="box-content">
							<span class="font-set2">${stamp.s_content}</span>
						</div>
					<c:if test="${!empty stamp.s_tag}">
						<div class="box-content-tag">
							<span class="font-set3">태그</span>
							<span class="font-set4">${stamp.s_tag}</span>
						</div>
					</c:if>
					</div>
					<div class="section3"> <!-- 수정, 삭제, 목록 -->
						<button type="button" class="box-button delete_btn" id="delete_btn">삭제</button>
						<button type="button" onclick="location.href='stampListAdmin.do'" class="box-button list_btn">목록</button>
					
					<script type="text/javascript">
						let delete_btn = document.getElementById('delete_btn');
						//이벤트 연결
						delete_btn.onclick=function(){
							let choice = confirm('삭제하시겠습니까?');
							if(choice){
								location.replace('stampDeleteAdmin.do?s_num=${stamp.s_num}');
							}
						};
					</script> 
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="no-admin">
				<span class="no-admin">잘못된 접근입니다.</span>
				<span class="no-admin">관리자 ID로 로그인하세요.</span>
			</div>
		</c:otherwise>
	</c:choose>

</div>


<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>
</body>
</html>