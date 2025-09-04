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
		height : 50px;
		color : red;
	}
</style>
</head>
<body>
<div id = "container">
	학생정보 상세보기 페이지 
	<%@ include file = "../../db/db.jsp" %> <!-- 인클루드하는애 -->

	<!--제목 작성자 작성일 내용  --> <!-- 스트립틀릿 -->
	<%
	String StuNo = request.getParameter("StuNo");

	ResultSet rs = null;
	String query = "select s.STU_NO, s.STU_NAME, s.STU_DEPT, AVG(e.enr_GRADE) as STUAVG  "
	                + "from student s "
					+ "LEFT Join enrol e on s.stu_no = e.stu_no "
	                + "where s.stu_no = '" + StuNo + "' "
	                + "group by s.stu_no, s.STU_NAME, s.STU_DEPT ";


	System.out.println(query);
	rs = stmt.executeQuery(query);
	
	if(rs.next()){
		
	%>	
		<form name="stu" action = "Stu-Remove.jsp">
			<input name="stuNo" value="<%=rs.getString("STU_NO")%>" hidden>
			<table>
				<tr>
					<th>학번</th>
					<td> <%= rs.getString("STU_NO")%> </td> <!-- td안에가 표현식 -->
				</tr>
				<tr>	
					<th>이름</th>
					<td> <%= rs.getString("STU_NAME")%> </td>
				</tr>
				<tr>
					<th>학과</th>
					<td> <%= rs.getString("STU_DEPT") %> </td>
				</tr>
				<tr>
					<th>시험 평균점수</th>
					<td class="contents"> <%= rs.getString("STUAVG") %> </td>
				</tr>
			</table>
			<div>
				<!-- <input type = "submit" value="삭제">--> <!-- 이러면 바로 묻지도 않고 삭제 실행함 -->
				<input type="button" value="삭제" onclick="fnRemove()">
			</div>
		</form>
			
	<%
	
	} else{
		out.println("할생 조회 실패");
	}
	%>		
</div>	
</body>
</html>
<script>
	function fnRemove(){
		let stu = document.stu;
		if(!confirm("정말 학생을 삭제하시겠습니까?")){
			return; //취소 누르면 실행
		}
		stu.submit();
	}
</script>