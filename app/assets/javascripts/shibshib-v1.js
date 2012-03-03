function getY()
{
	if(window.pageYOffset > 103){
		document.getElementById("h3").style.position = "fixed";
		document.getElementById("h3").style.top = "83px";
	}
	else
		document.getElementById("h3").style.position = "static";
		
	setTimeout(function(){getY()}, 50);
	
}
window.onload = function () { 
	getY();
}