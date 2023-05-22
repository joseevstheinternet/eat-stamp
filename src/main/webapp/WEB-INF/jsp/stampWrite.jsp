<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- include libraries(jquery,bootstrap) -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/stamp.css">
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/stamp.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EatStamp - 기록 작성하기</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>
<!-- 내용시작 -->
<div class="qna_write_main">
	<h2 style="font-weight:bold">1:1문의<span style="font-size:11px; font-weight:none">(등록)</span></h2>
	<hr class="qna_write_hr" width="135px" align="left">
	<form:form action="stampwrite.do" modelAttribute="stampVO" id="register_form" enctype="multipart/form-data">
	    <form:errors element="div" cssClass="error-color"/>
	    <div class="photoUpload">
				<ul>
					<li class="photoUpload_li">
						<c:if test="${empty qna.q_photo_name}">
						<img src="${pageContext.request.contextPath}/images/faq/camera_img.png" class="my-photo2">
						</c:if>
						<c:if test="${!empty qna.q_photo_name}">
						<img src="${pageContext.request.contextPath}/image_upload/${qna.q_photo}" width="130" height="160" class="my-photo2">
						</c:if>
					</li>
					<li class="qna_write_btn02">
						<input type="file" id="upload" name="upload">
						<img id="photo_reset" src="${pageContext.request.contextPath}/images/faq/bin.png">
					</li>
				</ul>
		</div>
	    <ul class="q_title_li">
	    	<li>
			<select name="q_category" id="q_category">
				<option value="1"<c:if test="${q_category == 1}">selected</c:if>>회원문의</option>
				<option value="2"<c:if test="${q_category == 2}">selected</c:if>>상품/배송문의</option>
				<option value="3"<c:if test="${q_category == 3}">selected</c:if>>기타</option>
			</select>
			<form:input path="q_title" maxlength='40' placeholder="제목을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '제목을 입력하세요.'" autocomplete="off"/>
			<form:errors path="q_title" cssClass="error-color"/>
			</li>
		    	<li>
					<form:textarea id="qnacontent_length" path="q_content" maxlength='500' placeholder="내용을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder = '내용을 입력하세요.'" autocomplete="off"/>
					<form:errors path="q_content" cssClass="error-color"/>
					<div id="qnacontent_ckeck">(0 / 500자)</div>
					<script>
					 function MyCustomUploadAdapterPlugin(editor) {
						    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
						        return new UploadAdapter(loader);
						    }
						}
					 
					 ClassicEditor
			            .create( document.querySelector( '#q_content' ),{
			            	extraPlugins: [MyCustomUploadAdapterPlugin]
			            })
			            .then( editor => {
							window.editor = editor;
						} )
			            .catch( error => {
			                console.error( error );
			            } );
				    </script>
				</li>
			 </ul>
			<div class="align-left" id="faq_write_btn01">
			<form:button id="btn02">등록</form:button>
			<input type="button" value="취소" id="qna_write_btn03">
			</div>
	</form:form>
</div>
<!-- 내용 끝 -->
<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>