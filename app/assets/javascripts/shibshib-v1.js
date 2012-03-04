function getY()
{
	if(window.pageYOffset > 103){
		document.getElementById("h3").style.position = "fixed";
		document.getElementById("h3").style.top = "83px";
		document.getElementById("postaPic").style.marginTop = "95px";
	}
	else {
		document.getElementById("h3").style.position = "static";
		document.getElementById("postaPic").style.marginTop = "50px";
	}
		
	setTimeout(function(){getY()}, 50);
	
}
window.onload = function () { 
	getY();
}


$(document).ready(function(){

	$("#back-top").hide();
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 100) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});
		
		$('#back-top a').click(function () {
			$top = 0;
			$('body,html').animate(
			{scrollTop: $top}, {duration: 800, 
				step: function(){
					var mousewheelevt=(/Firefox/i.test(navigator.userAgent))? "DOMMouseScroll" : "mousewheel" //FF doesn't recognize mousewheel as of FF3.x
					if (document.attachEvent) //if IE (and Opera depending on user setting)
						document.attachEvent("on"+mousewheelevt, function(e){$('body,html').stop()})
					else if (document.addEventListener) //WC3 browsers
						document.addEventListener(mousewheelevt, function(e){$('body,html').stop()}, false)
      				 }
				});
			return false;
		});
	});

});


/////////////////////



$(document).ready(function(){

///////////////////////////////////////////////////////////////
	
	$('h1').each(function(index)
	{
	    $(this).wrap("<div class=\"wrapper\" id=\"section"+index+"Wrapper\" title=\""+index+"\"><div id=\"section"+index+"\"></div></div>");
	});
	
	$("body").append("<div id=\"section"+$("h1").size()+"Wrapper\"></div>");
	$("body").before("<div id=\"section0Wrapper\"></div>");
	
	$(window).scroll(function(){
		
		$("h1").each(function(index)
		{
			if(index>0)
			checkElem(index);

		});

	});

	
///////////////////////////////////////////////////////////////
	
function checkElem(id)
{

		var top = $(window).scrollTop();
		var y = 60;
		
		var cur = $('#section'+(id)+'Wrapper').position().top-y;
		var prev = $('#section'+(id-1)+'Wrapper').position().top-y;
		var el = $('#section'+(id));

		if(top < cur && top > prev+100)
			scroll(el);

		else 
			stick(el);

}

///////////////////////////////////////////////////////////////
	
function scroll(element)
{
	element.addClass("float");
}
	
///////////////////////////////////////////////////////////////

function stick(element)
{
	element.removeClass("float");
}

///////////////////////////////////////////////////////////////
 
});
