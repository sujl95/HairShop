$(document).ready(function() {
    // Button Auto Sizing
    $('.btn').each(function() {
        if($(this).html().length > 2) {
            var leng_diff = $(this).html().length - 2;
            $(this).width($(this).width() + (10 * leng_diff) + "px");  
        }
    });
    
  //버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	// Button Auto Sizing
	$('button').each(function() {
		if ($(this).html().length > 2) {
			var leng_diff = $(this).html().length - 2;
			$(this).width($(this).width() + (10 * leng_diff) + "px");
		}
	})
	$('.content_btn>div').each(function() {
		if ($(this).html().length > 2) {
			var leng_diff = $(this).html().length - 2;
			$(this).width($(this).width() + (10 * leng_diff) + "px");
		}
	})
		  
});