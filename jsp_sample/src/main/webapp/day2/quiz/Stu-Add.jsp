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
		/* text-align: center; */
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
	.input-txt{
		width:95%;
		height: 25px;
	}
</style>
</head>
<body>

<div id = "container">
		<form name="form" action = "Stu-Add-Result.jsp">
						
			<table>
				<tr>
					<th>학번</th>
					<td><input type="text" name="stuId" class="input-txt"></td> <!-- td안에가 표현식 -->
				</tr>
				<tr>	
					<th>이름</th>
					<td><input type="text" name="stuNm" class="input-txt"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><input type="text" name="stuDe" class="input-txt"></td>
				</tr>
			</table>
			<div>
				<!-- <input type = "submit" value="삭제">--> <!-- 이러면 바로 묻지도 않고 삭제 실행함 -->
				<input type="button" value="추가" onclick="fnStuAdd()">
			</div>
		</form>

</div>


</body>
</html>
<script>
	function fnStuAdd(){
		let form = document.form;
		form.submit();
	}
	
</script>