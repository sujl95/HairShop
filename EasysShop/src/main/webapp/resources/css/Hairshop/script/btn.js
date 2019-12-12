$(document).ready(function() {
    // Button Auto Sizing
    $('.btn').each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (10 * leng_diff) + "px");  
        }
    });
});