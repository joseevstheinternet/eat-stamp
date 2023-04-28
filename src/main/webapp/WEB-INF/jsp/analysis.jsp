<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/layout.css'/>" />

<!DOCTYPE html>

<style>
/* span.keyword{
	border: 1px solid #000000;
	color: white;
} */
/* table {
  width: 100%;
} */
th, td {
	padding: 5px 10px;
    font-size: 16px;
    border-radius: 20px;
    color: white;
}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>형태소 분석</title>
</head>
<body>
<%@ include file="/WEB-INF/jsp/egovframework/common/header.jsp" %>

<form action="analysis.do" method="get">
	<table>
		<tr>
			<c:forEach var="rMap" items="${rMap}" >
				<td>${rMap.key}</td>
			</c:forEach>
		</tr>
	</table>
</form>

<script type="text/javascript">
let randomBrightColor = () => {
	  let color_r = Math.floor(Math.random() * 127 + 128).toString(16);
	  let color_g = Math.floor(Math.random() * 127 + 128).toString(16);
	  let color_b = Math.floor(Math.random() * 127 + 128).toString(16);
	  console.log(color_r + color_g + color_b);
	  
	  var mixColor = color_r + color_g + color_b;
	  
	  return mixColor;
	}

for(td of document.getElementsByTagName('td')){
	  td.style.backgroundColor = randomBrightColor();
	}
</script>

<%@ include file="/WEB-INF/jsp/egovframework/common/footer.jsp" %>
</body>
</html>