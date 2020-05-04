<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 확인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/weather.css" type="text/css">
<script type="text/javascript">
function weatherVal(val){
	// 오늘 날짜 구하기 위한
	const Today = new Date();
	const Tomorrow01 = new Date(Today.valueOf()+(24*60*60*1000));
	const Tomorrow02 = new Date(Today.valueOf()+(48*60*60*1000));
	const dateArr = [Today,Tomorrow01,Tomorrow02];

	for(var j = 0; j<dateArr.length; j++){
		const year = dateArr[j].getFullYear();
		const month = dateArr[j].getMonth()+1 < 10 ? "0" + (dateArr[j].getMonth()+1) : dateArr[j].getMonth()+1;
		const date = dateArr[j].getDate() < 10 ? "0" + (dateArr[j].getDate()) : dateArr[j].getDate() ;
		const searchDay = year+month+date;
		
		const hours = Today.getHours() < 10 ? "0" + (Today.getHours()) : Today.getHours()
		const minutes = Today.getMinutes() < 10 ? "0" + (Today.getMinutes()) : Today.getMinutes();
	
		const time = ['0000','0300','0600','0900','1200','1500','1800','2100'];
	
		var iVal = "";
		if(02 <= hours && hours < 05)   iVal="2";
	    if(05 <= hours && hours < 08)   iVal="3";
	    if(08 <= hours && hours < 11)  	iVal="4";
	    if(11 <=hours && hours < 14)  	iVal="5";
	    if(14 <=hours && hours < 17)  	iVal="6";
	    if(17 <=hours && hours < 20)  	iVal="7";
	    if(20 <=hours && hours < 23)  	iVal="0";
	    if(23 <=hours && hours < 02 || hours == 00)  iVal="1";
	  
		for(var i = iVal; i<time.length; i++){
			 console.log(searchDay +" " + time[i]);
			if(val.weather[searchDay][time[i]].hasOwnProperty("POP")) var POP = val.weather[searchDay][time[i]].POP;  // 강수확률
			if(val.weather[searchDay][time[i]].hasOwnProperty("PTY")) var PTY = val.weather[searchDay][time[i]].PTY;  // 강수형태
			if(val.weather[searchDay][time[i]].hasOwnProperty("REH")) var REH = val.weather[searchDay][time[i]].REH;  // 습도
			if(val.weather[searchDay][time[i]].hasOwnProperty("SKY")) var SKY = val.weather[searchDay][time[i]].SKY;  // 날씨
			if(val.weather[searchDay][time[i]].hasOwnProperty("T3H")) var T3H = val.weather[searchDay][time[i]].T3H;  // 기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("TMN")) var TMN = val.weather[searchDay][time[i]].TMN;  // 아침최저기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("TMX")) var TMX = val.weather[searchDay][time[i]].TMX;  // 낮최고기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("VEC")) var VEC = val.weather[searchDay][time[i]].VEC;  // 풍향
			if(val.weather[searchDay][time[i]].hasOwnProperty("WSD")) var WSD = val.weather[searchDay][time[i]].WSD;  // 풍속
	
			console.log(POP+" "+PTY+" "+REH+" "+SKY+" "+T3H+" "+TMN+" "+TMX+" "+VEC+" "+WSD);
		}
	}
}

function weatherSearch(){
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				weatherVal(jsonStr);				
			},
			error : function(e){
				alert("날씨정보를 가져오지 못했습니다. Error("+ e +")");
			}
		});
	}
</script>
</head>
<%-- <%@ include file="common/header.jsp" %> --%>
<body>
	<div>날씨 정보 확인</div>
	<form id="weather" name="weather">
		<input type="button" value="날씨 확인" onclick="weatherSearch();">
	</form>	
	
	<div class="resultVal">	
		<ul class="nowWeather">
			<li>
				<span class="toDay">2020. 04. 28. Mon</span>	
			</li>
			<li>
				<p>12:00 AM</p>
			</li>
			<li>
				<span>17°C</span>
				<span>12°C / 18°C</span>	
				<span>구름</span>
				<span>북동풍</span>
				<span>20m/s</span>
			</li>
		</ul>
		<ul class="weatherList" style="display: flex;">
			<li>
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
			<li> 
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
			<li> 
				<div>03시</div>
				<div>맑음</div>
				<div>13</div>
				<div>북동풍 / 20m/s</div>
				<div>0%</div>
				<div>0</div>
				<div>30%</div>
			</li>
		</ul>
	</div>
	
</body>
<%@ include file="common/footer.jsp" %>
</html>
