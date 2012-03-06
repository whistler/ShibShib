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
	$('div #m').each(function(index)
	{
		
	    $(this).wrap("<div id=\"section"+index+"Wrapper\"><div id=\"section"+index+"\"></div></div>");
		
		//alert($("#section"+index+"Wrapper").parent().height());
		//index = index + 1;
		//alert(index);
		//alert(window.pageYOffset);
		///alert(window.pageYOffset)
	});
	
	//$("#panel").append("<div id=\"section"+$("rightPosts").size()+"Wrapper\"></div>");
	//$("#panel").before("<div id=\"section0Wrapper\"></div>");
	
	$(window).scroll(function(){

		$("div #m").each(function(index)
		{
			
			
			checkElem(index);

		});

	});

///////////////////////////////////////////////////////////////
	
function checkElem(id)
{
		var roof = window.pageYOffset + 75;
		var picH = $('#section'+(id)+'Wrapper').siblings().height();
		var panelH = $("#section"+(id)+" > #m").height();
		
		
		//alert($('#section'+(id)+'Wrapper').siblings().height());
	
		var tresh = (picH - panelH) + top - 85;
		
		//swim along ...
		var top = $('#section'+(id)+'Wrapper').position().top;
		var buttom = $('#section'+(id+1)+'Wrapper').position().top - 285;
		
		var nextTop = $('#section'+(id+1)+'Wrapper').position().top;
		var backward = tresh - roof;
		
		/*else
		{
			var tresh = (postH - panelH) + top - 85;
			var nextUp = $('#section'+(id+1)+'Wrapper').position().top - 290;
			var backward = tresh - roof;
			
			
			/*var cur = $('#section'+(id)+'Wrapper').position().top-y;
			var prev = $('#section'+(id-1)+'Wrapper').position().top-y;
			delta = $("#section"+(id-1)+"Wrapper").parent().height() - $('#section'+(id-1)+'Wrapper').position().top;*/

		
		var el = $('#section'+(id));

		//if (offset < cur && offset > prev-60)
		if ((roof > top && buttom > roof) || (roof > backward && roof < top) && nextTop < roof)
			swim(el);
		else if (roof < nextTop && top > roof)
			original(el);
		else if ((top < roof))
			stick(el, (panelH+65), picH);

}

///////////////////////////////////////////////////////////////
	
function swim(element)
{
	//element.removeClass("nail");
	element.css('margin-top', '0%');
	element.addClass("swim");
	//alert("swiming");
}
///////////////////////////////////////////////////////////////
function original(element)
{
	element.css('margin-top', '0%');
	element.removeClass("swim");
	//alert("original");
    //element.css('margin-top', '40%');

}
///////////////////////////////////////////////////////////////
function stick(element, panelH, picH)
{
	element.removeClass("swim");
    element.css('margin-top', (picH-panelH)+"px");
	//alert("sticking "+(picH-panelH)+"px");
}

});
