<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자바에서 처럼 외부 클래스는 import해서 사용해야한다 -->
	<!-- 자바랑  import방법 차이가 있다. html에서 써야해서... -->
	<%@ page import = "java.util.Date" %>
	
	<%= (new Date()).toLocaleString() %>
</body>
</html>