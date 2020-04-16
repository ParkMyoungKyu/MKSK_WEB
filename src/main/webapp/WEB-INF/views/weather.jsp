<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 확인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function weatherSearch2(){
	location.href="weatherSearch.do";
}

function weatherSearch(){
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				//alert(jsonStr.output.length);
				const val = jsonStr.response.body.items;
				console.log(jsonStr);
				console.log(jsonStr.response.body.items.item);
				/* for(var i=0; i<jsonStr.Value.length; i++){
					//console.log(jsonStr.output[i]);
					var result = document.querySelector("#result");
					//result.innerText += "기온 "+i+" -> " + jsonStr.output[i].T3H;
				//	result.innerText += "풍속 "+i+" -> " + jsonStr.output[i+1].WSD;
					
				} */
			},
			error : function(e){
				alert("error");
				console.log(e);
			}
		});
	}
</script>
</head>
<%@ include file="common/header.jsp" %>
<body>
	<div>날씨 정보 확인</div>
	<form id="weather" name="weather">
		<input type="button" value="날씨 확인" onclick="weatherSearch();">
	</form>	
	<div id="result"></div>
</body>
<%@ include file="common/footer.jsp" %>
</html>
