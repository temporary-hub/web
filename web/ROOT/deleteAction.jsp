 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
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
        String pw = request.getParameter("userPW");
        

        UserDAO dao = new UserDAO();
        int check = dao.deleteMember(id, pw);
        
        if(check == 1){
            session.invalidate(); // 삭제했다면 세션정보를 삭제한다.
            PrintWriter script = response.getWriter();
  		      script.println("<script>");
			      script.println("alert('성공적으로 탈퇴되었습니다. 감사합니다.')");
       			script.println("location.href = 'main.jsp'");
	      		script.println("</script>");
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
        }else{
    %>
        <script>
            alert("비밀번호가 맞지 않습니다.");
            history.go(-1);
        </script>
    <%
        } 
    %>


</body>
</html>




