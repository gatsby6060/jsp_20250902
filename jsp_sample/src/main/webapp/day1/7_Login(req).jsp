<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  form 태그의 action을 실행하게 되면 submit -->
	<!--  내부에 있는 input박스의 값들을 파라미터로 보낸다 -->
	<!--  이때, name 속성이 key, 입력받은 값이 value -->
	
	<!-- method 속성(전송방식)은 생략이 가능 defalut는 get -->
	<!-- get 전송방식은 url(주소)에 값을 담아서 보낸다. 보안에 취약 -->
	<!-- 개인정보나 패스워드 사용 하면 안됨 간단한 정보만 주로 사용 -->
	<!-- post방식은 get이랑 반대 데이터를 숨겨서 보냄  -->
	
	<!-- 실습은 주로 get방식으로... -->
	<form action = "8_LoginResult.jsp">
		
		<div>
			<label>아이디 : <input type="text" name ="userId"></label>
		</div>
		
		<div>
			<label>패스워드 : <input type="password" name ="pwd"></label>
		</div>
		
		<div>
			<input type="submit" value = "이동ㅋ"> <!-- form태그의 action에 있는 페이지로 이동 -->
		</div>
	</form>
</body>
</html>