<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>4_DB-Select.jsp</title>
</head>
<body>
	<%@ include file = "../db/db.jsp" %>
	<% 
		ResultSet rs = null;
		String query = "SELECT * FROM STUDENT";
		rs = stmt.executeQuery(query);
/* 		rs.next(); //커서 아래에 데이터가 있으면 true를 리턴 (커서 이동후 데이터가 잇으면 true)
		String stuName = rs.getString("STU_NAME");
		out.println(stuName + " ");
		
		rs.next(); //커서 아래에 데이터가 있으면 true를 리턴 (커서 이동후 데이터가 잇으면 true)
		stuName = rs.getString("STU_NAME");
		out.println(stuName + " ");
		
		rs.next(); //커서 아래에 데이터가 있으면 true를 리턴 (커서 이동후 데이터가 잇으면 true)
		stuName = rs.getString("STU_NAME");
		out.println(stuName + " "); */
		
		while (rs.next()){
			String stuName = rs.getString("STU_NAME");
			out.println(stuName + " ");
		}
	%>
</body>
</html>