<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Join.jsp -->
	<!-- 아이디는 최소 6글자 -->
	<!-- 비밀번호는 특수문자 필수(정규식) -->
	<!-- 비밀번호와 비밀번호 확인은 같아야 함 -->
	<!-- 비밀번호는 8글자 이상 -->
	<!-- 모든값은 빈값을 허용 x, 단 체크박스는 하나도 체크 안되도 됨 -->
	<div>
		<label>아이디 : <input name="userId"></label>
	</div>
	<div>
		<label>비밀번호 : <input type="password" name="pwd"></label>
	</div>
	<div>
		<label>비밀번호 확인 : <input type="password2" name="pwd2"></label>
	</div>
	<div>
		<label>이름 : <input name="name"></label>
	</div>
	<div>
		<label>핸드폰 :   
					<select name="handphone">
					    <option value="010">010</option>
					    <option value="011">011</option>
					    <option value="012">012</option>
					 </select>
  		</label>
	</div>
	<div>
		<label>성별 : 
				<input type ="radio" name = "sex" checked>남</input> 
				<input type ="radio" name = "sex">여</input> 
		</label>
	</div>
	<div>
		취미 :
			<label><input type = "checkbox">운동</input></label>
			<label><input type = "checkbox">독서</input></label>
			<label><input type = "checkbox">영화감상</input></label>
			<label><input type = "checkbox">코딩</input></label>
			<label><input type = "checkbox">게임</input></label>
	</div>

	<div><input type = "button" value="가입" onclick ="fnCheck()"></div>

	<!-- Join_Result.jsp -->
	<!-- 위에서 받은 결과들을 출력 -->
	<!-- 취미는 2개이상일 경우 모두 출력 -->

</body>
</html>

<script>

	function fnCheck(){
		// form 태그의 name를 이용해서 객체 가져오기
		let login = document.login;
		if(login.userId.value < 6){
			alert("아이디는 최소 6글자");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length == 0){
			alert("비밀번호를 확인해주세요.");
			login.pwd.focus();
			return;
		}
		
		// 위에 조건을 모두 통과했을 때 최종 submit(action 실행)
		login.submit();
		
		
	}
</script>