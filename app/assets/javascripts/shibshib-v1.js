$("#back-top").hide();
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 200) {
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

window.onload = function () {
	
	getY();
	
};


function getY()
{
	if(window.pageYOffset > 103){
		document.getElementById("social").style.position = "fixed";
		document.getElementById("social").style.top = "83px";
		document.getElementById("postaPic").style.marginTop = "95px";
	}
	else {
		document.getElementById("social").style.position = "static";
		document.getElementById("postaPic").style.marginTop = "50px";
	}
			
	setTimeout(function(){getY()}, 50);
		
}
$(document).ready(function(){
	

	
	$('div #m').each(function(index){ $(this).wrap("<div id=\"section"+index+"Wrapper\"><div id=\"section"+index+"\"></div></div>");});
	
	$(window).scroll(function(){$("div #m").each(function(index){checkElem(index);});});

///////////////////////////////////////////////////////////////
	
	function checkElem(id)
	{
		var roof = window.pageYOffset + 75;
		var picH = $('#section'+(id)+'Wrapper').siblings().height();
		var panelH = $("#section"+(id)+" > #m").height();
		
	
		var tresh = (picH - panelH) + top - 85;
		
		//swim along ...
		var top = $('#section'+(id)+'Wrapper').position().top;
		var buttom = $('#section'+(id+1)+'Wrapper').position().top - 285;
		
		var nextTop = $('#section'+(id+1)+'Wrapper').position().top;
		var backward = tresh - roof;

		
		var el = $('#section'+(id));


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
	
	}
///////////////////////////////////////////////////////////////
	function stick(element, panelH, picH)
	{
		element.removeClass("swim");
		element.css('margin-top', (picH-panelH)+"px");
	}

});


