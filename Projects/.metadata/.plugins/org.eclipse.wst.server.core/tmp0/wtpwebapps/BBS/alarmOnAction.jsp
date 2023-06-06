<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 


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
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요!')");
			script.println("location.href = 'login.jsp'");  
			script.println("</script>");
		}
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.alarmOn(userID);
		System.out.println(result);
	
		if (result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('알람설정에 실패하였습니다.')");
			script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄 
			script.println("</script>");
		}
		
		else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('알람설정이 완료되었습니다.')");
			script.println("location.href='bbs.jsp';");
			script.println("</script>");
		}
						
		



	%>


</body>
</html> 