$(window).on('resize load', function() {
    $('body').css({"padding-top": $(".navbar").height()+5 + "px"});
});

$(document).ready(function() {
    $('ul.nav.navbar-nav').find('a[href="' + location.pathname + '"]')
        .closest('li').addClass('active');

	$(".fav-image-div").hover(
	  function() { 
	  	$(this).children(".fav-image-button").show();
	  },
	  function() { 
	  	$(this).children(".fav-image-button").hide(); 
	  }
	);
});