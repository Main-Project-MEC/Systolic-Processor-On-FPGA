function loadKeyword(){
	$('#keyword_menu').slideUp();
	if(!(jQuery.browser.msie && parseInt(jQuery.browser.version)==6)){
		$('#keyword_shadow').css('background', 'transparent url(/img/browse_shadow_transparent.png) repeat-x 0 0');
	}
	
	$('#keyword_container').hover(function(){
		$('#keyword_menu').stop();
		$('#keyword_menu').slideDown("normal", function(){
			$('#keyword_menu').css('height', 'auto');
		});
	}, function(){
		$('#keyword_menu').stop();
		$('#keyword_menu').slideUp("normal", function(){
			$('#keyword_menu').css('height', 'auto');
		});
	});
}