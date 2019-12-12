/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
	$("input[name=current]").val(yyyy+"-"+mm+"-"+"01");
});
