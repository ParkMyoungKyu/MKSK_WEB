<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 확인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function weatherSearch(){
		if(weather.base_date.value == ""){
			alert("원하시는 날짜를 입력해주세요");
		}
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				const jsonArr = jsonStr.response.body.items.item;
				$.each(jsonArr,function(i, item){
					
				});
			},
			error : function(e){
				alert(e);
			}
		});
	}
</script>
</head>
<%@ include file="common/header.jsp" %>
<body>
	<div>날씨 정보 확인</div>
	<form id="weather" name="weather">
		날짜 : <input type="text" name="base_date" id="base_date" value="20200414">
		<input type="button" value="날씨 확인" onclick="weatherSearch();">
	</form>	
</body>
<%@ include file="common/footer.jsp" %>
</html>
