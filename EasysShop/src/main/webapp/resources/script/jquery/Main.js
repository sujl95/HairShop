/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	setDate();
	//최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    });
    
    $("#today").click(function(){
    	var date = new Date();
    	var yyyy = date.getFullYear();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + date.getMonth()+1;
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
    });
    $("#total").click(function(){
    	$("#startDate").val("2011"+"-"+"01"+"-"+"01");
    	var date = new Date();
    	var yyyy = date.getFullYear();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + date.getMonth()+1;
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("#endDate").val(yyyy+"-"+mm+"-"+dd);
    });
    $("#month").click(function(){
    	setDays(30);
    });

    $("#15days").click(function(){
    	setDays(15);
    });
    
    $("#7days").click(function(){
    	setDays(7);
    });
    
    $("#3days").click(function(){
    	setDays(3);
    });
    
    
});
function setDays(daysago) {
	var endDatearr = $("#endDate").val().split("-");
	let startDateD = new Date(endDatearr[0], endDatearr[1]-1,endDatearr[2] );
	var oldday = new Date(startDateD-(3600000*24*daysago));
	var endDate1 = oldday.toLocaleString();
	var endDate1 = endDate1.length == 24 ?endDate1.substring(0,11).split(". ") : endDate1.substring(0,12).split(". ");
	var oldday = startDateD.toLocaleString();
	endDate1[1] = endDate1[1] > 9 ? endDate1[1] : '0' + endDate1[1];
	endDate1[2] = endDate1[2] > 9 ? endDate1[2] : '0' + endDate1[2];
	$("#startDate").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]);
}

function setDate() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
	$("input[name=datemove]").val(yyyy+"-"+mm+"-"+"01");
}
//function setDays(daysago) {
//	var endDatearr = $("#endDate").val().split("-");
//	let startDateD = new Date(endDatearr[0], endDatearr[1]-1,endDatearr[2] );
//	var oldday = new Date(startDateD-(3600000*24*daysago));
//	console.log(oldday);
//	var endDate1 = oldday.toLocaleString();
//	console.log(endDate1);
//	console.log(endDate1.length);
//	var endDate1 = endDate1.length == 24 ?endDate1.substring(0,11).split(". ") : endDate1.substring(0,12).split(". ");
//	console.log(endDate1[0]);
//	console.log(endDate1[1]);
//	console.log(endDate1[2]);
//	console.log(oldday);
//	var oldday = startDateD.toLocaleString();
//	endDate1[1] = endDate1[1] > 9 ? endDate1[1] : '0' + endDate1[1];
//	endDate1[2] = endDate1[2] > 9 ? endDate1[2] : '0' + endDate1[2];
//	$("#startDate").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]);
//}
