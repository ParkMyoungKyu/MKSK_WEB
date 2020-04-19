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

function resultVal(data){
	var result = document.querySelector(".result");
	var tr = document.createElement("tr");
	var td = document.createElement("td");
	var td2 = document.createElement("td");
	
	if(data.fcstDate === "20200418"){
		td.innerText = JSON.stringify(data.fcstDate);
		td2.innerText = JSON.stringify(data.category);
	}
	
	tr.appendChild(td);
	tr.appendChild(td2);
	
	result.appendChild(tr);
	
}

function resultVal2(data){
	const div = document.querySelector(".resultVal");
	const ul = document.createElement("ul");
	const ui = document.createElement("li");
	const span = document.createElement("span");
	
	let today = new Date();

	let year = today.getFullYear();
	let month = today.getMonth()+1;
	let date = today.getDate();
	let hours = today.getHours(); 
	let minutes = today.getMinutes();  

	if(date<10)	date = 0+""+date;
	if(month<10) month = 0+""+month;
	
	let yyyymmdd = year+""+month+""+date;

	let date1 = data.fcstDate;
	
	const dbae = date1.filter(function(test){
		console.log(test);
	})
	if(yyyymmdd === date1){
		console.log(data.fcstDate.length);
		for(var i=0; i<data.fcstDate.length; i++){
			span.innerText = JSON.stringify(data.fcstDate);
		}
	}
	ui.appendChild(span);
	ul.appendChild(ui);

	div.appendChild(ul);
}
function weatherSearch(){
		$.ajax({
			url : "weatherSearch.do",
			method : "post",
			dataType : "json",
			data : $("#weather").serialize(),
			success : function(jsonStr){
				
				var data = jsonStr.response.body.items.item;
				
				console.log(data);
				data.forEach(function(val){
			//		resultVal(val);
					resultVal2(val);
					});
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
	
	<div class="resultVal" style="background-color: #d5d5ea; display: inline-flex;">	
		<ul>
			<li>
				<span>날짜</span>	
			</li>
			<li>
				<span>온도</span>	
				<span>풍속</span>
				<span>풍향</span>
				<span>구름</span>
			</li>
		</ul>
		<ul>
			<li>
				<span>날짜</span>	
			</li>
			<li>
				<span>온도</span>	
				<span>풍속</span>
				<span>풍향</span>
				<span>구름</span>
			</li>
		</ul>

	</div>
	<table>
		<thead>
			<tr>
				<th>예보날짜</th>
				<th>예보시간</th>
				<th>강수확률</th>
				<th>강수형태</th>
				<th>습도</th>
				<th>날씨</th>
				<th>기온</th>			
			</tr>
		</thead>
		<tbody class="result"></tbody>
	</table>
</body>
<%@ include file="common/footer.jsp" %>
</html>
