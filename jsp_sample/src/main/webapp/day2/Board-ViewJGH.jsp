<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-View.jsp</title>
<style>

	#container{
		width: 700px;
		margin : 20px auto;
	}
	
	table, tr, td, th {
		border : 1px solid black;
		text-align: center;
		border-collapse : collapse;
		padding : 5px 10px;
	}
	
</style>
</head>
<body>
	게시글 상세보기 페이지 <br>
	<%@ include file = "../db/db.jsp" %>
	<div id = "container">
		<table>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>내용</th>
			</tr>
	<!--제목 작성자 작성일 내용  -->
	<%
	String boardNo = request.getParameter("boardNo");

	ResultSet rs = null;
	String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME FROM TBL_BOARD B "
					+ "WHERE BOARDNO = '" + boardNo +"' ";
	System.out.println(query);
	rs = stmt.executeQuery(query);
	
	if(rs.next()){
		/*out.println("뭐있음");*/
	%>	
		<tr>		
		    <td> <%= rs.getString("TITLE")%> </td>
			<td> <%= rs.getString("USERID")%> </td>
			<td> <%= rs.getString("CTIME") %> </td>
			<td> <%= rs.getString("CONTENTS") %> </td>
		</tr>
	<%	
	}
	%>
	


	
	
</body>
</html>