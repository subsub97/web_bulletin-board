<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Term Project</title>
</head>
<body>

	<%
		session.invalidate();
	%>
	<script>
		location.href = 'main.jsp';
		alert("로그아웃을 성공적으로 완료하였습니다.");
	</script>


</body>
</html> 