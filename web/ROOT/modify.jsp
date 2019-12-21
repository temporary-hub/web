 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %> <!-- 자바 클래스 사용 -->
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>이미지 분석 project</title>
    
    <!-- 스타일시트 참조  -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/fadein.css">
  <% 
   if(session.getAttribute("userID")==null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 되어있지 않습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
   
  %> 
   

    <%
        String id = session.getAttribute("userID").toString();
        // 세션에 저장된 아이디를 가져와서
        // 그 아이디 해당하는 회원정보를 가져온다.
        UserDAO dao = new UserDAO();
        User user = dao.getUserInfo(id);
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 
    <script type="text/javascript">
       // 비밀번호 입력여부 체크
        function checkValue() {
            if(!document.userInfo.userPW.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
        }

    </script>
    
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



    <div class="container" style="float: none; margin: 0 auto;">
      <div class="row">
        <div class="page-header">
          <h2 align="center">회원정보 수정</h2>
        </div>
        <div class="col-md-4" style="float: none; margin: 0 auto;">
          <div class="login-box well">
        <form accept-charset="UTF-8" role="form" method="post" action="modifyAction.jsp" name="userInfo" onsubmit="return checkValue()">
            <legend>수정후 확인버튼을 누르세요</legend>
            <div class="form-group">
                <label for="username-email">이름</label> <%=user.getUserName() %> <br>
                <label for="username-email">생년월일</label> <%=user.getUserBirthyy() %>.<%=user.getUserBirthmm() %>.<%=user.getUserBirthdd() %>
            </div>
            <div class="form-group">
                <label for="username-email">이메일</label>
                <input name="userEmail" value='<%=user.getUserEmail()%>' id="username-email" placeholder="<%=user.getUserEmail()%>" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="username-email">전화번호</label>
                <input name="userPhone" value='<%=user.getUserPhone()%>' id="username-email" placeholder="<%=user.getUserPhone()%>" type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="userPW" id="password" placeholder="Password를 입력하세요" type="password" class="form-control" />
            </div>
            
            
            <hr />
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="수정하기" />
            </div>           
            
        </form>
       </div>
     </div>
   </div>
 </div>

        
        
          <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="js/bootstrap.min.js"></script>
        
</body>
</html>

