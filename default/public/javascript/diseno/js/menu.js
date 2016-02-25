function activarmenu(li){
	elemento=document.getElementsByName("menu")
	for(i=0;i<elemento.length;i++){
		elemento[i].className=""
		elemento[i].firstChild.style.color="#ffffff"
	}
	for(i=0;i<elemento.length;i++){
		li.className="active"
		li.firstChild.style.color="#000000"
	}
}

elemento=document.getElementsByName("menu")
for(i=0;i<elemento.length;i++){
	if(elemento[i].className=="active"){
		elemento[i].firstChild.style.color="#000000"
	} else{
		elemento[i].firstChild.style.color="#ffffff"
	}
}