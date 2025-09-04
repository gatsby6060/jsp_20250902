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
	게시글 상세보기 페이지 
	<%@ include file = "../db/db.jsp" %> <!-- 인클루드하는애 -->

	<!--제목 작성자 작성일 내용  --> <!-- 스트립틀릿 -->
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
		<form name="board" action = "Board-Remove.jsp">
			<input name="boardNo" value="<%=rs.getString("BOARDNO")%>" hidden>
			<table>
				<tr>
					<th>제목</th>
					<td> <%= rs.getString("TITLE")%> </td> <!-- td안에가 표현식 -->
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
			<div>
				<!-- <input type = "submit" value="삭제">--> <!-- 이러면 바로 묻지도 않고 삭제 실행함 -->
				<input type="button" value="삭제" onclick="fnRemove()">
				<input type="button" value="수정" onclick="fnEdit()">
			</div>
		</form>
			
	<%
	
	} else{
		out.println("게시글조회 실패");
	}
	%>		
			

	


	
</div>	
</body>
</html>
<script>
	function fnEdit(){
		let board = document.board;
		console.log(board.action);
	}

	function fnRemove(){
		let board = document.board;
		if(!confirm("정말삭제하시겠습니까?")){
			return; //취소 누르면 실행
		}
		board.submit();
	}
</script>