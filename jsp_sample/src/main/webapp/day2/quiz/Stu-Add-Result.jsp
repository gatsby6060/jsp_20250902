<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../../db/db.jsp"%>
	<%
		String stuId = request.getParameter("stuId");
		String stuNm = request.getParameter("stuNm");
		String stuDe = request.getParameter("stuDe");
		
		ResultSet rs = null;
		String query = "INSERT INTO STUDENT VALUES ( "  
				+ "'" + stuId + "'," 
				+ "'"+ stuNm  + "',"
		        + "'" + stuDe + "'," 
		        + "50, " 
		        + "'A', " 
		        + "'M',"
		        +"170,"
		        +"70"
			    +")";
				out.println("여기!!!인서트쿼리문    ");
				out.println(query);
		
	 			int result = stmt.executeUpdate(query);
				if (result > 0) {
					out.println("학생추가 되었습니다!");
			%>
				<div>
					<a href="Stu-List.jsp"><button>추가 잘됬습니다~ 학생목록으로</button></a>
				</div>
			<%		
				   			} else {
			%>  
				<div>
					<a href="Stu-List.jsp"><button>잘 안됬지만 학생목록으로</button></a>
				</div>
			<%		
			out.println("오류가 발생했습니다.");
			}
		
		
	%>
	
</body>
</html>