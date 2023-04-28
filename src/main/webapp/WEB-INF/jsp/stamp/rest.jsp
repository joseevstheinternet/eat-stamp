<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상호명 검색</title>
</head>

<!-- jquery 사용 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#search-form").submit(function(event) {
			event.preventDefault();
			$.ajax({
				type : "POST",
				url : "rest_ok.do",
				data : $("#search-form").serialize(),
				success : function(result) {
					$("#result-container").html(result);
				}
			});
		});
	});
	
	function setParentText(r_name) {
		  opener.document.getElementById("pInput").value = r_name;
		  window.close();
		}
</script>

<body>

<h1>식당 찾기</h1>
	<form id="search-form">
		<label for="search-input">상호명으로 검색:</label>
		<input type="text" id="search-input" name="r_name">
		<button type="submit">검색</button>
	</form>
<div id="result-container"></div>

</body>

</html>