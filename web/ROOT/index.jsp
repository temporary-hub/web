 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/fadein.css">
<title>이미지 분석 project</title>

</head>
<body>

<div id="fadein" class="out" >
  <div class="in">
    <img src="indexImage.jpg" width=625 height=500 >
  </div>  
</div>

<div id="fadein" class="out" >
  <div class="in">
     <button type="button" class="btn btn-primary" onclick="location.href='/main.jsp' ">시작하기</button>
  </div>
</div>



 <!-- 애니매이션 담당 JQUERY -->
 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
 <!-- 부트스트랩 JS  -->
 <script src="js/bootstrap.js"></script>

</body>
</html>



