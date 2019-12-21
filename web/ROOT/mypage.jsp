<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/fadein.css">
<title>이미지 분석 project</title>

</head>
<body>


 <% 
   if(session.getAttribute("userID")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어있지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
   
   %> 
   

 <!-- 네비게이션  -->
 <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed" 
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expaned="false">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="main.jsp">이미지 분석</a>
  </div>



  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   <ul class="nav navbar-nav">
    <li><a href="main.jsp">메인</a></li>
    <li><a href="freeBoard.jsp">자유게시판</a></li>
   </ul>
    <% 
   String account=session.getAttribute("userID")+"님 반갑습니다.";
   %>
   <ul class="nav navbar-nav navbar-right">
    <li><a href="mypage.jsp"><%=account%></a></li>
    <li><a href="logoutAction.jsp">로그아웃</a></li>
   </ul>   
 </div> 
</nav>

<!-- 네비게이션 끝 -->

   <%
        String id = session.getAttribute("userID").toString();
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        UserDAO dao = new UserDAO();
        User user = dao.getUserInfo(id);
    %>
<h2 align="center"> 이미지 분석</h2> 
<h4 align="center"> 마이 페이지</h4> <br><br>
    
<div style="width: 30%; float:none; border-radius: 10px; border: 1px solid white; padding:20px; 
background-color:#E0ECF8; margin:0 auto">
  <div><h4><%=user.getUserID()%> 님의 정보</h4></div>
  <hr width="100%"/>
  <div>
    <p class="card-text">이름 : <%=user.getUserName()%></p>
      <hr width="100%"/>
    <p class="card-text">이메일 : <%=user.getUserEmail()%></p>
      <hr width="100%"/>
    <p class="card-text">생년월일 :  <%=user.getUserBirthyy()%>년 <%=user.getUserBirthmm()%>월 <%=user.getUserBirthdd()%>일</p>
      <hr width="100%"/>
    <p class="card-text">전화번호 :  <%=user.getUserPhone()%></p>
      <hr width="100%"/>


  </div>
</div> 
<br>
<div class="container" style="width: 30%; float:none; margin:0 auto">
			<div class="row">
				<div class="col" style="width: 50%; float:none; margin:0 auto">
					<button type="button" class="btn btn-primary"style="float: left;"><a style="color: white" href="modify.jsp">회원정보 수정</a></button>
					<button type="button" class="btn btn-primary"style="float: right;"><a style="color: white" href="modifyPW.jsp">비밀번호 변경</a></button>
				</div> <br><br>
				<div class="col" style="width: 50%; float:none; margin:0 auto">
					<button type="button" class="btn btn-success" style="float: left;"><a style="color: white" href="logoutAction.jsp">&nbsp&nbsp&nbsp&nbsp로그아웃&nbsp&nbsp&nbsp&nbsp</a></button>
					<button type="button" class="btn btn-warning" style="float: right;"><a style="color: white" href="delete.jsp">&nbsp&nbsp&nbsp&nbsp회원탈퇴&nbsp&nbsp&nbsp&nbsp</a></button>
				</div>
			</div>
		</div>    

</body>
</html>