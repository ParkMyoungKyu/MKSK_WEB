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
	// 초기화
	document.querySelector(".weatherList").innerText = "";

	// 오늘 날짜 구하기 위한
	const Today = new Date();
	const Tomorrow01 = new Date(Today.valueOf()+(24*60*60*1000));
	const Tomorrow02 = new Date(Today.valueOf()+(48*60*60*1000));
	const dateArr = [Today,Tomorrow01,Tomorrow02];
	
	const weatherList = document.querySelector(".weatherList");
	
	for(var j = 0; j<dateArr.length; j++){
		const year = dateArr[j].getFullYear();
		const month = dateArr[j].getMonth()+1 < 10 ? "0" + (dateArr[j].getMonth()+1) : dateArr[j].getMonth()+1;
		const date = dateArr[j].getDate() < 10 ? "0" + (dateArr[j].getDate()) : dateArr[j].getDate() ;
		const searchDay = year+month+date;
		
		const hours = Today.getHours() < 10 ? "0" + (Today.getHours()) : Today.getHours()
		const minutes = Today.getMinutes() < 10 ? "0" + (Today.getMinutes()) : Today.getMinutes();
	
		const time = ['0000','0300','0600','0900','1200','1500','1800','2100'];

		var iVal = "0";
		
		if(j===0){
			if(02 <= hours && hours < 05)   iVal="2";
		    if(05 <= hours && hours < 08)   iVal="3";
		    if(08 <= hours && hours < 11)  	iVal="4";
		    if(11 <=hours && hours < 14)  	iVal="5";
		    if(14 <=hours && hours < 17)  	iVal="6";
		    if(17 <=hours && hours < 20)  	iVal="7";
		    if(20 <=hours && hours < 23)  	iVal="0";
		    if(23 <=hours && hours < 02 || hours == 00)  iVal="1";
		}
		
		for(var i = iVal; i<time.length; i++){
			const DayDiv = document.createElement("div");
			const TimeDiv = document.createElement("div");
			
			const POPDiv = document.createElement("div");
			const PTYDiv = document.createElement("div");
			const REHDiv = document.createElement("div");
			const SKYDiv = document.createElement("div");
			const T3HDiv = document.createElement("div");
			const TMNDiv = document.createElement("div");
			const TMXDiv = document.createElement("div");
			const VECDiv = document.createElement("div");
			const WSDDiv = document.createElement("div");
			const ALLDiv = document.createElement("div");
			
			const li = document.createElement("li");
			
			if(val.weather[searchDay][time[i]].hasOwnProperty("POP")) var POP = val.weather[searchDay][time[i]].POP;  // 강수확률
			if(val.weather[searchDay][time[i]].hasOwnProperty("PTY")) var PTY = val.weather[searchDay][time[i]].PTY;  // 강수형태
			if(val.weather[searchDay][time[i]].hasOwnProperty("REH")) var REH = val.weather[searchDay][time[i]].REH;  // 습도
			if(val.weather[searchDay][time[i]].hasOwnProperty("SKY")) var SKY = val.weather[searchDay][time[i]].SKY;  // 날씨
			if(val.weather[searchDay][time[i]].hasOwnProperty("T3H")) var T3H = val.weather[searchDay][time[i]].T3H;  // 기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("TMN")) var TMN = val.weather[searchDay][time[i]].TMN;  // 아침최저기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("TMX")) var TMX = val.weather[searchDay][time[i]].TMX;  // 낮최고기온
			if(val.weather[searchDay][time[i]].hasOwnProperty("VEC")) var VEC = val.weather[searchDay][time[i]].VEC;  // 풍향
			if(val.weather[searchDay][time[i]].hasOwnProperty("WSD")) var WSD = val.weather[searchDay][time[i]].WSD;  // 풍속

			//console.log(searchDay +" " + time[i]);
			//console.log(i +" " +POP+" "+PTY+" "+REH+" "+SKY+" "+T3H+" "+TMN+" "+TMX+" "+VEC+" "+WSD);

			DayDiv.innerText = searchDay;	
			TimeDiv.innerText = time[i];
			POPDiv.innerText = POP+"%";
			
			if(PTY == 0) PTYDiv.innerText = "-";
			if(PTY == 1) PTYDiv.innerText = "비";
			if(PTY == 2) PTYDiv.innerText = "비/눈";
			if(PTY == 3) PTYDiv.innerText = "눈";
			if(PTY == 4) PTYDiv.innerText = "소나기";
			
			REHDiv.innerText = REH+"%";
			
			if(SKY == 1) SKYDiv.innerText = "맑음";
			if(SKY == 2) SKYDiv.innerText = "구름조금";
			if(SKY == 3) SKYDiv.innerText = "구름많음";
			if(SKY == 4) SKYDiv.innerText = "흐림";
			
			T3HDiv.innerText = T3H+"°C";
			TMNDiv.innerText = TMN+"°C";
			TMXDiv.innerText = TMX+"°C";
			
			VEC = Math.floor((Number(VEC)+11.25)/22.5);
 			if(VEC == 0)  VECDiv.innerText = "북풍";
	        if(VEC == 1 || VEC == 2 || VEC == 3)  VECDiv.innerText ="북동풍";
	        if(VEC == 4)  VECDiv.innerText = "동풍";
	        if(VEC == 5 || VEC == 6 || VEC == 7)  VECDiv.innerText ="남동풍";
	        if(VEC == 8)  VECDiv.innerText = "남풍";
	        if(VEC == 9 || VEC == 10 || VEC == 11)  VECDiv.innerText = "남서풍";
	        if(VEC == 12) VECDiv.innerText = "서풍";
	        if(VEC == 13 || VEC == 14 || VEC == 15)  VECDiv.innerText = "북서풍";
	        if(VEC == 16) VECDiv.innerText = "북풍"; 
	        
			WSDDiv.innerText = WSD+"m/s";
			
			ALLDiv.appendChild(DayDiv);
			ALLDiv.appendChild(TimeDiv);
			ALLDiv.appendChild(SKYDiv);
			ALLDiv.appendChild(T3HDiv);
			//ALLDiv.appendChild(TMNDiv);
			//ALLDiv.appendChild(TMXDiv);
			ALLDiv.appendChild(VECDiv);
			ALLDiv.appendChild(WSDDiv);
			ALLDiv.appendChild(POPDiv);
			ALLDiv.appendChild(PTYDiv);
			ALLDiv.appendChild(REHDiv);
			
			li.appendChild(ALLDiv);
			
			weatherList.appendChild(li);
		}
	}
	return weatherList;
}

function weatherSearch(){
	const locCode = document.querySelector("#locCode").value;
	const nxy = locCode.split(",");
	const nx = nxy[0];
	const ny = nxy[1];
	
	$.ajax({
		url : "weatherSearch.do?nx="+nx+"&ny="+ny,
		method : "post",
		dataType : "json",
		data : $("#weather").serialize(),
		success : function(jsonStr){
			const finalVal = weatherVal(jsonStr);
			console.log(finalVal);
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
	<form id="weather" name="weather" action="javaScript:weatherSearch()">
		<select id="locCode">
			<option value="60,127">서울(종로구 사직동)</option>
			<option value="98,76">부산(동래구 수민동)</option>
		</select>
		<!-- <input type="button" value="날씨 확인" onclick="weatherSearch();"> -->
		<input type="submit" value="날씨 확인"  >
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
				<span>17°C(현재기온)</span>
				<span>12°C / 18°C (금일최저기온 / 금일최고기온)</span>	
				<span>구름 (날씨)</span>
				<span>북동풍 (풍향)</span>
				<span>20m/s (풍속)</span>
			</li>
		</ul>
		<ul class="weatherList"></ul>
	</div>
	
</body>
<%@ include file="common/footer.jsp" %>
</html>
