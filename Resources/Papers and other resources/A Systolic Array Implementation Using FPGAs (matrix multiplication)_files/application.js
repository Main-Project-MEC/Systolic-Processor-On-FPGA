$(document).ready(function(){
	//Create corners for brown boxes
	$(".brown_box").prepend('<div class="brown_box_corner">&nbsp;</div>');
	
	//keyword.js
	loadKeyword();
	
	//slider.js
	loadSlider();
	
	$("#SubscriptionAddForm").validate();
	
	//Increase/Decrease Text Size on Article View
	$('#small').click(function() {
	  $('#main p').css('fontSize', '0.8em');
		return false;
	});
	$('#medium').click(function() {
	  $('#main p').css('fontSize', '1.0em');
		return false;
	});
	$('#large').click(function() {
	  $('#main p').css('fontSize', '1.5em');
		return false;
	});	

	// Clear Search bar text
	$('#search_input').click(function(){
		if($('#search_input').attr("value")=="Search Articles")
			$('#search_input').attr("value", "");
	});
	
	$('#product_index td:odd').css('text-align', 'right');
	$('#product_index th:odd').css('text-align', 'right');
	
	$('#product_index tr').hover(
		function() {
			$(this).css('background', '#D1D0B7');
		},
		function() {
			$(this).css('background', 'transparent');
	});
		
	//lightbox for figures
	$('a.figure').lightBox({fixedNavigation:true});
	$('a.figure_list_figure').lightBox({fixedNavigation:true});
});