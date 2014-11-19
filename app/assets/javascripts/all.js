$(window).on('resize load', function() {
    $('body').css({"padding-top": $(".navbar").height()+5 + "px"});
    $('fav-image-button').hide();
});

$(document).ready(function() {
    $('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
        .closest('li').addClass('active');

	$(".fav-image-div").hover(
	  function() { 
	  	$(this).children('.fav-image-button').show(300);
	  },
	  function() {
	  	$(this).children('.fav-image-button').hide(300);
	  }
	);

	$('.fav-image-button').click( function(){
	  if ( $(this).children('.fav-image-icon').hasClass('glyphicon-star-empty')) {
		$(this).children('.fav-image-icon').removeClass('glyphicon-star-empty');
		$(this).children('.fav-image-icon').addClass('glyphicon-star');
	  } else {
	  	$(this).children('.fav-image-icon').removeClass('glyphicon-star');
		$(this).children('.fav-image-icon').addClass('glyphicon-star-empty');
	  }
	});
});

