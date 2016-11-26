// Set our timeout variable
var timedRotate;

// Rotates our banner, and goes to top when it reaches the end of the list
function rotate() {
	$current = $('.current a').parents('li');
	$last = $('#article_thumbs li:last a').attr('href');
				
	if ($current.find('a').attr('href') == $last) {
		$('#article_thumbs li:first a').click();
	} else {
		$current.next().find('a').click();
	}
	setTimer();
}
// Function to set our timeout
function setTimer() {
	timedRotate = setTimeout('rotate()',5000);
}
// Set the current selection to current
function selectNav() {
	if($(this).is('current')) {
	// If is already current, don't do anything
		return false;
	} else {
	// Remove current class from other li, and make selected li current
		$(this)
			.parents('ul:first')
				.find('li')
					.removeClass('current')
				.end()
			.end()
			.parents('li:first').addClass('current');
	}
}
function loadSlider() {
	// Make banner transparent
	$('.description').css({opacity: .70});
	
	var $panels = $('#main_image .slide');
	var $container = $('#main_image');
	var $scroll = $('#main_image');
	
	// Set first line item to current so it shows highlighted
	$('#article_thumbs ul li:first').addClass('current');
	
	// Changing nav to show which is currently clicked
	$('#article_thumbs ul li a').click(selectNav);
		
	// Start the loop
	setTimer();
	
	//Kill the timeout if mouseover and start if mouseoff
	$('#slide_holder').hover(
		function() {
			clearTimeout(timedRotate);
		},
		function() {
			setTimer();
		}
	);
	
	
	// Options for the Serial Scroll Plugin	
	var scrollOptions = {
		target: $scroll,
		items: $panels,
		navigation: '#article_thumbs a',
		axis: 'xy',
		duration: 'medium'
	};
	
	// Calling the Serial Scroll Plugin
	$('#slide_holder').serialScroll(scrollOptions);
}	