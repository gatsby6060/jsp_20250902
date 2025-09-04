<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board-List.jsp</title>
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
	 	background-color : #eee;
	}
	tr nth-child(odd){
		background-color: yellow;
	}
	#search{
		margin-bottom : 20px;
	}
	a{
		text-decoration : none;
	}
</style>
</head>
<body>
<%@ include file = "../db/db.jsp" %>
	<div id = "container">
	<div id = "search">
		검색어 : <input type = "text" id = "keyword">
				<button onclick="fnSearch()">검색</button>
	</div>
	
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th><a href="javascript:;" onclick="fnList('CNT','DESC')">조회수 ↓⬇</a></th>
				<th>작성일</th>
			</tr>
		
		<%
			ResultSet rs = null;
			String keyword = request.getParameter("keyword");
			String keywordQuery = "";
			if(keyword != null){
				keywordQuery = "WHERE TITLE LIKE '%"+keyword+"%' ";	
			}
			String column = request.getParameter("column");
			String orderKind = request.getParameter("orderKind");
			String orderQuery = "";
			if(column != null){
				orderQuery = "ORDER BY " + column + " " + orderKind;
			}
			
			String query = "SELECT B.*, TO_CHAR(CDATETIME, 'YYYY-MM-DD') CTIME "
						  + "FROM TBL_BOARD B " + keywordQuery + orderQuery;
		
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
		%>
			<tr>
				<td> <%= rs.getString("BOARDNO") %> </td>
				<td> 
					<%-- <a href = "Board-View.jsp?boardNo=<%= rs.getString("BOARDNO") %>"><%= rs.getString("TITLE") %> --%>
					<a href = "javascript:;" onclick="fnBoard(<%= rs.getString("BOARDNO") %>)"> <%= rs.getString("TITLE") %>
				</td>
				<td> <%= rs.getString("USERID") %> </td>
				<td> <%= rs.getString("CNT") %> </td>
				<td> <%= rs.getString("CTIME") %> </td>
			</tr>
		<%
			}
		%>	
		
	</table>
	<div>
		<a href="Board-Add.jsp">
			<input type="button" value="글쓰기">
		</a>
	

</body>
</html>
<script>
	function fnBoard(boardNo){
		location.href = "Board-View.jsp?boardNo="+boardNo;
	}
	
	function fnSearch(){
		let keyword = document.querySelector("#keyword").value;
		location.href = "Board-List.jsp?keyword="+keyword;
	}
	
	function fnList(column, orderKind){
		location.href="?column=" + column + "&orderKind=" + orderKind;
	}
</script>