<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
   
    
   if(session.getAttribute("userID")==null){
   %> 
   <ul class="nav navbar-nav navbar-right">
    <li><a href="login.jsp">로그인</a></li>
    <li><a href="join.jsp">회원가입</a></li>
   </ul>
   <%
   }else{
   %>
    <ul class="nav navbar-nav navbar-right">
    <li><a href="mypage.jsp"><%=account%></a></li>
    <li><a href="logoutAction.jsp">로그아웃</a></li>
   </ul>
   <%
   }
   %>
   
   
  </div> 
 </nav>
 
<b><font size="5" color="skyblue">메인화면입니다.</font></b>


 <!-- 애니매이션 담당 JQUERY -->
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <!-- 부트스트랩 JS  -->
 <script src="js/bootstrap.js"></script>

</body>
</html>
 