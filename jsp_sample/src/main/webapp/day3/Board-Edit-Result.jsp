<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "../db/db.jsp" %>
	<% 
		String boardNo = request.getParameter("boardNo");
		String kind = request.getParameter("kind");
		String title = request.getParameter("title");
		String userId = request.getParameter("userId");
		String contents = request.getParameter("contents");
		
		String query = "";
		
		/* UPDATE TBL_BOARD SET kind='1', title='50', contents='50' WHERE BOARDNO = 50; */
		ResultSet rs = null;
		query = "UPDATE TBL_BOARD SET "
		        + "KIND = '" + kind + "',"
		        + "TITLE = '" + title + "',"
		        + "USERID = '" + userId + "', "
		        + "CONTENTS = '" + contents + "' "
		        + "WHERE BOARDNO = '" +  boardNo + "' " ;
		
		/* out.println(query); */
		int result = stmt.executeUpdate(query);
		if (result > 0) {
			out.println("수정되었습니다!");
	%>		
			<div>
				<a href="Board-List.jsp"><button>목록으로</button></a>
			</div>
	<% 		
		} else {
			out.println("뭔가 오류 같아요. 디비에서 수정된 것이 없습니다.");
		}

	%>
	
</body>
</html>