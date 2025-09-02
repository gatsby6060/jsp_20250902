<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "login" action = "Quiz1_Result.jsp" method = "get">
		
		<div>
			<label>아이디 : <input type="text" name ="userId"></label>
		</div>
		
		<div>
			<label>패스워드 : <input type="password" name ="pwd"></label>
		</div>
		
		<div>
			<!--<input type="submit" value = "로그인">  --> <!--이러면 무조건 페이지가 이동된다 검증할때 이러면 좀 이상함  -->
			<!-- form태그의 action에 있는 페이지로 이동 -->
			<!-- <button onclick ="fnCheck(); return false;" >로그인</button> --><!--  -->
			<input type = "button" value="로그인" onclick ="fnCheck()"> <!-- 이렇게 하면 함수를 실행하고 위 action="Quiz1_Result.jsp"은 실행안함 -->
			<input type = "button" value="회원가입" >
		
		</div>
	</form>
</body>
</html>
<script>
	// 아이디, 비밀번호가 빈값이 아닐 때만 action 실행
	function fnCheck(){
		// form 태그의 name를 이용해서 객체 가져오기
		let login = document.login;
		if(login.userId.value == 0){
			alert("아이디를 입력해주세요");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length == 0){
			alert("비밀번호를 확인해주세요.");
			login.pwd.focus();
			return;
		}
		
		// 위에 조건을 모두 통과했을 때 최종 submit(action 실행)
		login.submit();
		
		
	}
</script>