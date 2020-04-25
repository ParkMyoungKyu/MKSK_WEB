const clockContainer = document.querySelector(".js-clock");
const clockTitle = clockContainer.querySelector(".rel-time");
const dateTitle = clockContainer.querySelector(".rel-date");

function getTime(){
	const Today = new Date();
	const minutes = Today.getMinutes();
	const hours = Today.getHours();
	const seconds = Today.getSeconds()
	clockTitle.innerText = `${hours < 10 ? `0${hours}` : hours} : ${minutes < 10 ? `0${minutes}` : minutes} : ${seconds < 10 ? `0${seconds}` : seconds}`;
	

}
function getDate(){
	const Today = new Date();
	const year = Today.getFullYear();
	const month = Today.getMonth()+1;
	const date = Today.getDate();
	const day =Today.getDay();
	var dayText = "";
	
	if(day === 0)  dayText = "일요일";
	if(day === 1)  dayText = "월요일";
	if(day === 2)  dayText = "화요일";
	if(day === 3)  dayText = "수요일";
	if(day === 4)  dayText = "목요일";
	if(day === 5)  dayText = "금요일";
	if(day === 6)  dayText = "토요일";
	
	
	dateTitle.innerText = `${year}년 ${month}월 ${date}일 ${dayText}`;
	
}
function init(){
	getTime();
	getDate();
	setInterval(getTime,1000);
	setInterval(getDate,1000);
}
init();