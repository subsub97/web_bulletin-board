<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "java.io.PrintWriter"  %>
<!DOCTYPE html>   
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.css">

<title>Term Project</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID"); //로그인중인데 세션이 없는경우 받아온다.
	
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Term Project</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
				if(userID == null){
			%>
		 	<!-- 로그인이 안되어있는경우  -->	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<% 	
				} else {
			%>
			<!-- 로그인이 되어있는경우 -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>		
					</ul>
				</li>
			</ul>
			<%
				}
			%>
			
		</div>
	</nav>
	<div class = "container">
		<div class ='jumbotron'>
			<div class = "container">
				<h1>Term Project</h1>
				<p>2023년도 1학기 디자인패턴 202004110 김득호</p>
				<a class = "btn-btn-primary btn-pull" href = "#" role = "button">자세히 알아보기</a>
			</div>
		
		</div>
	</div>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap.js"></script>
	
</body>
</html>
