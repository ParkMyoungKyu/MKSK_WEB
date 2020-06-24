<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MKSK_WEB | 회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

	function pwChk(){
		var pw = document.signUp.u_pw.value;
		var chkPw = document.signUp.pwChk.value;
		var chkText = document.querySelector(".chkText");
		if(pw===chkPw){
			chkText.innerHTML="";
		}else{
			chkText.innerHTML="※비밀번호가 일치하지 않습니다";
		}
	}

	function mailChange(){
		var email = document.signUp.emailSelect.value;
		var emailMain = document.querySelector(".emailBack");
		console.log(email);
		if(email!==""){
			emailMain.setAttribute("readOnly","readOnly");
			document.querySelector(".emailBack").value = email;
		} else {
			emailMain.removeAttribute("readOnly","readOnly");
			document.querySelector(".emailBack").value = "";
		}		
	}
	
	function submit(){
		
		var singUpForm = document.signUp;

		if(singUpForm.u_id.value === ""){
			alert("아이디를 입력해주세요");
			return;
		}else if(singUpForm.u_pw.value === ""){
			alert("비밀번호를 입력해주세요");
			return;
		}else if(singUpForm.u_name.value === ""){
			alert("이름을 입력해주세요");
			return;
		}else if(singUpForm.u_gender.value === ""){
			alert("성별을 체크해주세요");
			return;
		}else if(singUpForm.btdY.value === "" || singUpForm.btdM.value === "" || singUpForm.btdD.value === ""){
			alert("생년월일을 정확히 입력해주세요");
			return;
		}else if(singUpForm.u_pw.value === ""){
			alert("주소를 입력해주세요");
			return;
		}else if(singUpForm.phoneNum1.value === "" || singUpForm.phoneNum2.value === "" || singUpForm.phoneNum3.value === "" ){
			alert("핸드폰번호를 정확히 입력해주세요");
			return;
		}else if(singUpForm.emailFront.value === "" || singUpForm.emailBack.value === ""){
			alert("이메일을 입력해주세요");
			return;
		}
		
		var u_num =singUpForm.btdY.value+singUpForm.btdM.value+singUpForm.btdD.value; 
		var u_tel_no = singUpForm.phoneNum1.value + singUpForm.phoneNum2.value + singUpForm.phoneNum3.value;
		var u_email = singUpForm.emailFront.value+"@"+singUpForm.emailBack.value;
		
		singUpForm.u_num.value = u_num;
		singUpForm.u_tel_no.value = u_tel_no;
		singUpForm.u_email.value = u_email;
		
		singUpForm.action = "signUpSubmit.do";
		//singUpForm.submit();
	}

	function checkId(){
		
		var singUpForm = document.signUp;
		var userId = singUpForm.u_id.value;
		
		if(singUpForm.u_id.value === ""){
			alert("아이디를 입력 후 확인바랍니다");
			return;
		}
		 
		$.ajax({
			url : "checkId.do",
			type : "post",
			dataType : "text",
			data : {"u_id":singUpForm.u_id.value},
			success : function(data){
				if(data === "1"){
					alert("이미 가입되어있는 아이디입니다");
					singUpForm.u_id.value = "";
				}else if(data === "0"){
					alert("가입 가능한 아이디입니다");
				}
			},
			error : function (e){
				alert(e);
			}
		})
	}
</script>
</head>
<body>
	<form name="signUp" method="post">
		<input type="hidden" name="u_num" value="">
		<input type="hidden" name="u_tel_no" value="">
		<input type="hidden" name="u_email" value="">
		<div>로고 위치</div>
		<label>ID : </label>
		<input type="text" name="u_id"><button type="button" onclick="checkId()">중복확인</button>
		<div>PW : <input type="password" name="u_pw"></div>
		<div onchange="pwChk();">PW 확인 :<input type="password" name="pwChk" ><a class="chkText"></a></div>
		<div>이름 : <input type="text" name="u_name"></div>
		<div>성별 : <input type="radio" value="man" name="u_gender">남자
				   <input type="radio" value="woman" name="u_gender">여자
		 </div>
		<div>생년월일 : 
			<input type="text" name="btdY" class="btdY" placeholder="년" maxlength="4">
			<input type="text" name="btdM" class="btdM" placeholder="월" maxlength="2">
			<select name="btdY">
				<option value="">년</option>
				<% for(int i=1990; i<2020; i++){	%><option value="<%=i%>"><%=i%></option><%} %>
			</select>
			<select name="btdM">
				<option value="">월</option>
				<% for(int i=1; i<12; i++){	%><option value="<%=i%>"><%=i%></option><%} %>
			</select>
			<select name="btdD">
				<option value="">일</option>
				<% for(int i=1; i<32; i++){	%><option value="<%=i%>"><%=i%></option><%} %>
			</select>
			<input type="text" name="btdD" class="btdD" placeholder="일" maxlength="2">
		</div>
		<div>
			주소
			<input type="text" readonly="readonly">
			<input type="text" readonly="readonly">
			<input type="text">
			<button onclick="location.href = 'jusoSearch.do'" >주소검색</button>
		</div>
		<div>
			핸드폰번호 : <select name="phoneNum1">
						<option value="">-- 선택 --</option>
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					  </select> 
					  - <input name="phoneNum2" type="text" maxlength="4">
					  - <input name="phoneNum3" type="text" maxlength="4">
		</div>
		<div>이메일 
			<input class="emailFront" name="emailFront" type="text">@
			<input class="emailBack" name="emailBack" value="" type="text">
			<select class="emailSelect" name="emailSelect" onchange="mailChange()">
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
	</form>
	<input type="button" onclick="submit()" value="가입하기">
</body>
</html>