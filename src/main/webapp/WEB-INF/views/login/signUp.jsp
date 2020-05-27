<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MKSK_WEB | 회원가입</title>
<script type="text/javascript">
</script>
</head>
<body>
	<form name="signUp" action="signUpSubmit.do" method="post">
		<div>로고 위치</div>
		<label>ID : </label>
		<input type="text" name="u_id"><button type="button" onclick="checkId">중복확인</button>
		<div>PW : <input type="password" name="u_pw"></div>
		<div>PW 확인 :<input type="password" ></div>
		<div>이름 : <input type="text" name="u_name"></div>
		<div>성별 : <input type="radio" value="man" name="u_gender">남자
				   <input type="radio" value="woman" name="u_gender">여자
		 </div>
		<div>생년월일 : 
			<input type="text" class="btdY" placeholder="년">
			<input type="text" class="btdM" placeholder="월">
			<input type="text" class="btdD" placeholder="일">
		</div>
		<div>
			주소
			<input type="text" readonly="readonly">
			<input type="text" readonly="readonly">
			<input type="text">
			<button onclick="location.href = 'jusoSearch.do'" >주소검색</button>
		</div>
		<div>
			핸드폰번호 : <select>
						<option value="">-- 선택 --</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					  </select> 
					  - <input type="text">
		</div>
		<div>이메일 
			<input type="text">@
			<input type="text">
			<select>
				<option value="">-- 메일주소 선택 --</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="yahoo.co.kr">yahoo.co.kr</option>
				<option value="">직접입력</option>
			</select> 
		</div>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>