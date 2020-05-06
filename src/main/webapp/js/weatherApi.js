const Today = new Date();
const year = Today.getFullYear();
const month = Today.getMonth()+1;
const date = Today.getDate();

const serviceKey = "w7%2Fp3SnRp8NhmFmt1jm4Q8x1aKjZsP2k%2BnrLjesD3Ptag7iKvo2pDt8d4spRu%2Bm29XKt3mM1hfmUcKYqbi2F%2Fw%3D%3D";
const numOfRows  = "300";
const pageNo   = "1";
const dataType   = "JSON";
const base_date = weatherDto.getBase_date();
const base_time = weatherDto.getBase_time(); // -- > 위에서 조건절로 설정예정   
const nx   = "59";
const ny   = "125";

function searchApi(){
	fetch(
			`http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst?serviceKey="+serviceKey+"&numOfRows="+numOfRows+"&pageNo="+pageNo+"&dataType="+dataType+"&base_date="+base_date+"&base_time="+base_time+"&nx="+nx+"&ny="+ny`
	).then(function(response){
		return response.json();
	}).then(function(json){
		console.log(json);
	});
}

function init(){
	searchApi();
}

init();