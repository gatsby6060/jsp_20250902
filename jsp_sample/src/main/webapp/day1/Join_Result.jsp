<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String id = request.getParameter("userId");
		String hobby[] = request.getParameterValues("hobby");
		//out.println(hobby);
		for(int i = 0; i<hobby.length; i++){// 값이 여러개 일경우 이렇게...
			out.println(hobby[i]);
		}
	%>
	<%-- <div>취미 : <%= request.getParameter("hobby") %></div> --%>
</body>
</html>