<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- userId, pwd를 전달받아서 -->
	<!-- TBL_USER 테이블의 아이디와 비밀번호를 비교해서 -->
	<!-- 값이 있으면 '로그인 성공' 없으면 '로그인 실패' 출력 -->
	
	
	<!-- 표현식 == 일반 HTML태그라고 하면 될듯... -->
<%-- 	<div>
		아이디 는
		<%=request.getParameter("userId")%></div>
	<div>
		패스워드 는
		<%=request.getParameter("pwd")%></div> --%>




	<%@ include file="../db/db.jsp"%>
	<!-- 스크립틀릿 -->
	<!-- 자바의 실행문을 그대로 표현(자바 문법들 사용가능) -->
	<!-- 변수 선언은 가능하나, 지역변수로 선언 됨 -->
	<!-- 메소드는 선언불가(호출은 가능)  -->
	<%
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");

	ResultSet rs = null;
	String query = "SELECT * FROM TBL_USER";
	rs = stmt.executeQuery(query);
	/* 		rs.next(); //커서 아래에 데이터가 있으면 true를 리턴 (커서 이동후 데이터가 잇으면 true)
			String stuName = rs.getString("STU_NAME");
			out.println(stuName + " ");	
			rs.next(); //커서 아래에 데이터가 있으면 true를 리턴 (커서 이동후 데이터가 잇으면 true)
			stuName = rs.getString("STU_NAME");
			out.println(stuName + " ");
	*/

	while (rs.next()) {
		String dbuserId = rs.getString("USERID");
		String dbpassword = rs.getString("PASSWORD");

		if (dbuserId.equals(userId) && dbpassword.equals(pwd)) {
			out.println("<div style='color:blue;'> 로그인 성공 </div>");
			return;
		}
	}
	out.println("<div style='color:red;'> 로그인 실패 </div>");
	%>




</body>
</html>