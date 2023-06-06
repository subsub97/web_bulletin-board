<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%-- <%@ page import="bbs.*" %> --%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name ="bbs" property ="bbsTitle"/>
<jsp:setProperty name ="bbs" property ="bbsContent"/>

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
		}else{
			
 			/* 오류 해결을 위한 프린트내역  */
			/* System.out.println(bbs.getBbsTitle());
			System.out.println(bbs.getBbsContent());  */
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null){
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('모두 입력을  해주세요!')");
						script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄 
						script.println("</script>");
						
					}else{
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID,bbs.getBbsContent());
						System.out.println(); 
						if (result == -1){
							
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패하였습니다.')");
							script.println("history.back()"); // 이전페이지로 사용자를 돌려보냄 
							script.println("</script>");
						}
						
						else{
/* 					        AlarmSubject alarmSubject = new AlarmSubjectImpl();

					        // MySQL 데이터베이스 연결
					        try {
					            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bbs", "root", "1234");
					            Statement statement = connection.createStatement();

					            // 알람 설정 변경 시 옵저버들에게 알림
					            String query = "SELECT * FROM user WHERE alramCondition = 1";
					            ResultSet resultSet = statement.executeQuery(query);
					            while (resultSet.next()) {
					                String username = resultSet.getString("username");
					                AlarmObserver observer = new bbs.AlarmObserverImpl(username);
					                alarmSubject.registerObserver(observer);
					            }

					            alarmSubject.notifyObservers("New alarm has been set!");

					            resultSet.close();
					            statement.close();
					            connection.close();
					        } catch (SQLException e) {
					            e.printStackTrace();
					        }
							
							 */
							 
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href='bbs.jsp';");
							script.println("</script>");
						}
						
					}
		}



	%>


</body>
</html> 