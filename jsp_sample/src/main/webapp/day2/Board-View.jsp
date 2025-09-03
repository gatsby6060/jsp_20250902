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
	th{
		background-color : #ccc;
		width : 100px;
	}
	td{
		width : 500px;
	}
	.contents {
		height : 300px;
	}
</style>
</head>
<body>
<div id = "container">
	게시글 상세보기 페이지 <br>
	<%@ include file = "../db/db.jsp" %>

	<!--제목 작성자 작성일 내용  -->
	<%
	String boardNo = request.getParameter("boardNo");

	ResultSet rs = null;
	String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME "
	                + "FROM TBL_BOARD B "
					+ "WHERE BOARDNO = '" + boardNo +"' ";
	
	rs = stmt.executeQuery(query);
	
	if(rs.next()){
		/*out.println("뭐있음");*/
	%>	
		
		<table>
			<tr>
				<th>제목</th>
				<td> <%= rs.getString("TITLE")%> </td>
			</tr>
			<tr>	
				<th>작성자</th>
				<td> <%= rs.getString("USERID")%> </td>
			</tr>
			<tr>
				<th>작성일</th>
				<td> <%= rs.getString("CTIME") %> </td>
			</tr>
			<tr>
				<th>내용</th>
				<td class="contents"> <%= rs.getString("CONTENTS") %> </td>
			</tr>
		</table>
			
	<%
	
	}
	%>		
			

	


	
</div>	
</body>
</html>