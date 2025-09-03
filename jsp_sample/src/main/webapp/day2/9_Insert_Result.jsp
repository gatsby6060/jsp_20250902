<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 이건 페이지가 켜질때마다 실행되기에 db에 매번 연결하는것이 정상적인것이다. -->
	<!-- 그럼 매번끝기나?... 오라클이 알아서 하겠찌...?-->
	<%@ include file="../db/db.jsp"%>

	<!-- insert하기전에 stuNo가 db에 있는지 확인하고 -->
	<!-- 없으면 insert, 있으면 '해당 학번은 이미 사용중입니다.' 출력 -->
	<%
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
	
		ResultSet rs = null;
		String selectQuery = "SELECT * FROM STUDENT " + "WHERE STU_NO = '" + stuNo + "' ";
		/* System.out.println(selectQuery); */
		rs = stmt.executeQuery(selectQuery);
	
		if (rs.next()) {
			out.println("같은 stuNo가 있네요~ 해당 학번은 이미 사용중입니다.");
	
		} else {
	
			String query = "INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT) VALUES ( " + "'" + stuNo + "'," + "'" + stuName
			+ "'," + "'" + stuDept + "'" + ") ";
			/* out.println(query); */
	
			int result = stmt.executeUpdate(query);
			if (result > 0) {
				out.println("추가되었습니다.");
			} else {
				out.println("오류가 발생했습니다.");
			}
	
		}
	%>

</body>
</html>