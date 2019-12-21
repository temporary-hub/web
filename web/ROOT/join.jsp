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

  <title>이미지 분석 project</title>
  
  <script type="text/javascript">
    
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if(!document.userInfo.userID.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!document.userInfo.userPW.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.userInfo.userPW.value != document.userInfo.PWcheck.value ){
                alert("비밀번호와 비밀번호 확인을 동일하게 입력하세요.");
                return false;
            }
            if(!document.userInfo.userName.value){
                alert("이름을 입력하세요.");
                return false;
            }
            if(!document.userInfo.userEmail.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            if(document.userInfo.userBirthyy.value <1900 || document.userInfo.userBirthyy.value >2020 ){
                alert("정확한 년도를 입력해 주세요");
                return false;
            }
            if(document.userInfo.userBirthmm.value <1 || document.userInfo.userBirthmm.value >12 ){
                alert("정확한 생년월을 입력해 주세요");
                return false;
            }  
            if(document.userInfo.userBirthdd.value <1 || document.userInfo.userBirthdd.value >31 ){
                alert("정확한 생년일을 입력해 주세요");
                return false;
            }
        }
        
        // 취소 버튼 클릭시 로그인 화면으로 이동
        //function goLoginForm() {
        //    location.href="LoginForm.jsp";
        //}
    </script>

</head>

<body>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span	class="icon-bar"></span>
			</button>

			<a class="navbar-brand" href="main.jsp">이미지 분석</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!-- 로긴폼 -->
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-5">
			<!-- 점보트론 -->
			<div class="jumbotron" style="padding-top: 20px;">
				
				<!-- 로그인 정보를 숨기면서 전송post -->
				<form method="post" action="joinAction.jsp" name="userInfo" onsubmit="return checkValue()">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호확인" name="PWcheck" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>

          <div class="form-group" maigin>
						<input type="text" class="form-control" placeholder="이메일"
							name="userEmail" maxlength="50">
					</div>
					
					<div class="form-group" maigin>
						<input type="text" class="form-control" placeholder="전화번호"
							name="userPhone" maxlength="50">
					</div>

					<div class="form-inline" style="text-align: center;">
             <input type="number" min="1900" max="2020"  class="form-control" name="userBirthyy" maxlength="4" placeholder="년(4자)" size="6" >

             <select class="form-control" type="number" min="1" max="12"  name="userBirthmm">
               <option value="">월</option>
               <option value=1 >1</option>
               <option value=2 >2</option>
               <option value=3 >3</option>
               <option value=4 >4</option>
               <option value=5 >5</option>
               <option value=6 >6</option>
               <option value=7 >7</option>
               <option value=8 >8</option>
               <option value=9 >9</option>
               <option value=10 >10</option>
               <option value=11 >11</option>
               <option value=12 >12</option>
             </select>
     
             <input type="number" min="1" max="31" class="form-control" name="userBirthdd" maxlength="2" placeholder="일" size="4" >
          </div>
					
					<div hieght=20>.</div>
					
					<input type="submit" style="margin-top:20;" class="btn btn-primary form-control"	value="가입하기">
				</form>
			</div>
		</div>
	</div>

	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>

</body>
</html>
