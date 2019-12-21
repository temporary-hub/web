<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.BoardDAO"%>
<%@ page import="user.FreeBoard"%>
<%@ page import="java.util.ArrayList"%>


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

<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
</style>

</head>
<body>

<%
			//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
			String userID = null;
			if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			}
			int pageNumber = 1; //기본 페이지 넘버
			//페이지넘버값이 있을때
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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

<!-- 게시판 -->

<h2 align="center">자유게시판</h2>
<br>
<h4 align="center">분석결과를 자유롭게 토론해요</h4>
<hr/>

	<!-- 게시판 -->
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
							BoardDAO bbsDAO = new BoardDAO();
							ArrayList<FreeBoard> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><%=list.get(i).getBoardID()%></td>
							<td><a href="view.jsp?boardID=<%=list.get(i).getBoardID()%>"> <%=list.get(i).getBoardTitle()%></a></td>
							<td><%=list.get(i).getUserID()%></td>
							<td><%=list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시"
							+ list.get(i).getBoardDate().substring(14, 16) + "분"%></td>
						</tr>
	
						<%
							}
						%>
	
					</tbody>
				</table>
				
				
				<!-- 페이지 넘기기 -->
				<%
					if (pageNumber != 1) {
				%>
				<a href="freeBoard.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>
				<%
					}
					if (bbsDAO.nextPage(pageNumber)) {
				%>
				<a href="freeBoard.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
	
	
				<!-- 회원만넘어가도록 -->
				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null
					if (session.getAttribute("userID") != null) {
				%>
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
				<%
					} else {
				%>
				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
					type="button">글쓰기</button>
				<%
					}
				%>
	
			</div>
		</div>
	
	
	
	
		<!-- 애니매이션 담당 JQUERY -->
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<!-- 부트스트랩 JS  -->
		<script src="js/bootstrap.js"></script>
	
	</body>
	</html>
