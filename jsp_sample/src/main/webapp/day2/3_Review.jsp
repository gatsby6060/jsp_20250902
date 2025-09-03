<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 -->
	<%
		String name = request.getParameter("userName");
		String age = request.getParameter("age");
		/* 문자를 순자로 */
		/* js -> parseInt() */
		/* java -> Integer.parseInt() */
		out.println("<div>" + name + "님의 나이는 " + age + " 입니다." + "</div>");
	%>
	
	<!-- 표현식  -->
	<%= name + "님의 나이는 " + age + " 입니다." %>
	
</body>
</html>