<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


<body>

<c:set var="list" value="${Test }" />

	<table>
		<tr>
			<th>테스트 컬럼 1</th>
			<th>테스트 컬럼 2</th>
		</tr>
		
		<c:forEach items="${list }" var="dto">
			
			<tr>
				<td>${dto.getR_num() }</td>	
				<td>${dto.getR_add() }</td>	
			</tr>

		</c:forEach>
	
	</table>


</body>
</html>