const toDoForm = document.querySelector	(".js-toDoForm");
const toDoInput = toDoForm.querySelector("input");
const toDoList = document.querySelector(".js-toDoList");

const TODOS_LS = "toDos";

let toDos = []; 

function deleteToDo(event){
	const btn = event.target;
	const li = btn.parentNode;
	toDoList.removeChild(li);   //2지음
	//console.log(event.target.parentElement);
	const cleanToDos = toDos.filter(function(toDo){
		console.log(toDo.id, li.id);
		return toDo.id !==	 parseInt(li.id);
	});
	toDos = cleanToDos;
	saveToDos();	
}

function saveToDos(){
	localStorage.setItem(TODOS_LS,JSON.stringify(toDos));
}

function paintToDo(text){
	const li = document.createElement("li");
	const delBtn = document.createElement("button");
	const span = document.createElement("span");
	const newId = toDos.length + 1;
	delBtn.innerText = "X";
	delBtn.addEventListener("click",deleteToDo);
	span.innerText = text;
	li.appendChild(span);
	li.appendChild(delBtn);
	li.id = newId
	toDoList.appendChild(li);
	const toDoObj = { 
			text: text,
			id : newId
	};
	toDos.push(toDoObj);
	saveToDos();
}

function handleSubmit(event){
	event.preventDefault();
	const currentValue = toDoInput.value;
	paintToDo(currentValue);
	toDoInput.value = "";
}

function loadToDos(){
	const loadedToDos = localStorage.getItem(TODOS_LS);
	if(loadedToDos !== null){
		const pardedToDos = JSON.parse(loadedToDos);
		pardedToDos.forEach(function(toDo){
			paintToDo(toDo.text);
		});
	}
}

const line1      = toDoForm.querySelector(".line-1");
const line2      = toDoForm.querySelector(".line-2");

function searchBox(){
	toDoInput.onclick = function(){
		toDoInput.setAttribute("placeholder","Write a to do");
		toDoInput.classList.add("active");
		line1.style.transform = "rotate(45deg)";
		line1.style.top = "0px";
		line1.style.left = "0px";
		line2.style.height = "40px";
		line2.style.opacity = "1";
	}
	line1.onclick = function(){
		toDoInput.removeAttribute("placeholder","Write a to do");
		toDoInput.classList.remove("active");
		line1.style.transform = "rotate(-45deg)";
		line1.style.top = "-20px";
		line1.style.left = "45px";
		line2.style.height = "0px";
		line2.style.opacity = "0";
	}
	line2.onclick = function(){
		toDoInput.removeAttribute("placeholder","Write a to do");
		toDoInput.classList.remove("active");
		line1.style.transform = "rotate(-45deg)";
		line1.style.top = "-20px";
		line1.style.left = "45px";
		line2.style.height = "0px";
		line2.style.opacity = "0";
	}
}


function init(){
	searchBox();
	loadToDos();
	toDoForm.addEventListener("submit",handleSubmit)
}



init();