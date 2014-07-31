/* Your scripts go here */
(function ($) {	
	//$('.homepage_promo').alfablur({"gradiend_with" : 0,"blur_width": 30,"blur_radius": 100});
	$('footer h4, .mobile_menu h4').click(function(){
		$(this).parent().toggleClass('active');
	})
	$('header nav, .mobile_menu .close').click(function(){
		if ($(window).width() < 920) {
			$('body').toggleClass('show_menu');

			return false;
		}
	});
	/*$('.dropdown').click(function(){
		$(this).toggleClass('open');
		return false;
	});
	$('.dropdown').hover(
		function(){},
		function(){
			$(this).removeClass('open');	
		}
	);*/

	/*if ($(window).width() > 1024) {*/
		var promo = $('.homepage_promo');
		promo.css('background-image','url('+promo.find('.homepage_image').attr('data-wide')+')');
	/*}*/

	$(".dial").knob({'readOnly': true, 'fgColor':"#cc0000", 'bgColor':'#9eb7cf'});

}(jQuery));