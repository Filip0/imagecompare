$(window).on('resize load', function() {
    $('body').css({"padding-top": $(".navbar").height()+5 + "px"});
});