<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page"/>

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userName"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Term Project</title>
</head>
<body>

	<%
		String userID = null; //세션생성시 로그인기능과 필요없는 기능 사용방지하기 
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인중 입니다!')");
			script.println("location.href = 'main.jsp'");  
			script.println("</script>");
		}
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
		|| user.getUserEmail() == null || user.getUserGender()== null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모두 입력을 해주세요!')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄 
			script.println("</script>");
			
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄 
				script.println("</script>");
			}
			//회원가입이 완료된 경우 
			else{
				session.setAttribute("userID",user.getUserID());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='main.jsp';");
				script.println("</script>");
			}
			
		}


	%>


</body>
</html> 