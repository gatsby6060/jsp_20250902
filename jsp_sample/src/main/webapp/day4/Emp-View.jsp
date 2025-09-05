<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<%@ include file = "db.jsp" %>
	<%
		String empNo = request.getParameter("empNo");
		// WHERE EMPNO = 7369;
		// 사번, 이름, 상사(MGR)의 이름, 소속부서의 평균 급여, 부서 이름
		String query = "SELECT E.EMPNO, E.ENAME, E2.ENAME AS MGR_NAME, E.SAL, AVG_SAL, D.DNAME "
					 + "FROM EMP E "
					 + "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO "
					 + "INNER JOIN DEPT D ON E.DEPTNO = D.DEPTNO "
					 + "INNER JOIN (SELECT DEPTNO, AVG(SAL) AVG_SAL FROM EMP GROUP BY DEPTNO) T "
					 + "ON E.DEPTNO = T.DEPTNO "
					 + "WHERE E.EMPNO = '" + empNo + "'";
		/* out.println(query); */
		try{
			ResultSet rs = stmt.executeQuery(query);
			// 사번 : 000
			// 이름 : 000 
			if(rs.next()){
		%>
			<div> 사번 : <%= rs.getString("EMPNO")%> </div>
			<div> 이름 : <%= rs.getString("ENAME")%> </div>
			<div> 매니저이름 : <%= rs.getString("MGR_NAME")%> </div>
			<div> 급여 : <%= rs.getString("SAL")%> </div>
			<div> 부서평균급여 : <%= rs.getString("AVG_SAL")%> </div>
			<table>
				<tr>
					<th>사번</th>
					<td> <%= rs.getString("EMPNO")%> </td> <!-- td안에가 표현식 -->
				</tr>
				<tr>	
					<th>이름</th>
					<td> <%= rs.getString("ENAME")%> </td>
				</tr>
			</table>
			<div>
				<input type="button" value="삭제" onclick="fnRemove()">
				<input type="button" value="수정" onclick="fnEdit()">
		    </div>
		<%		
			} else{
				out.println("데이터 조회에 실패했습니다"); // 데이터가 조회할게 없을때...
			}
		}catch(SQLException e){
			out.println("오류가 발생했습니다!"); //쿼리자체를 잘못쓰거나 할때
		}
	%>
</body>
</html>