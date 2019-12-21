 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="userEmail" name="user"/>    
<jsp:setProperty property="userPhone" name="user"/>    
<jsp:setProperty property="userPW" name="user"/>
<jsp:setProperty property="userID" name="user"/>    
<%-- 자바빈 관련 액션태그 사용 --%>

    
<html>
<head>
    <title>회원정보 수정처리</title>
</head>
<body>

    <%
    String id= (String)session.getAttribute("userID"); 
    user.setUserID(id);
    
    
		UserDAO userDAO = new UserDAO(); //인스턴스생성
		int result = userDAO.login(user.getUserID(), user.getUserPW());
		if(result == 1){
  		PrintWriter script = response.getWriter();
      userDAO.updateMember(user);
      script.println("<script>");
			script.println("alert('성공적으로 수정되었습니다')");
			script.println("location.href = 'mypage.jsp'");
			script.println("</script>");
		}
		//로그인 실패
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		//아이디 없음
		else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류입니다.')");
		script.println("history.back()");
		script.println("</script>");
		}
		//DB오류
		else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		}		
	%>
    
  
    
    <br><br>
    <font size="5" color="gray">회원정보가 수정되었습니다.</font>
    <br><br>
    <input type="button" value="메인으로" onclick="javascript:window.location='MainForm.jsp'"/>
    
</body>
</html>


