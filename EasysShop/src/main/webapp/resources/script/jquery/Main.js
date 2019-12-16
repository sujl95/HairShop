/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
	
//	$("input[name=pop_Procedure_list]").slimScroll({
//		height: "100%"
//	});
	
	setDate();
	popsetDays();
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
    $("#pop_CG_checkall").click(function(){
    	//클릭되었으면
    	if($("#pop_CG_checkall").prop("checked")){
    		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
    		$("input[name=pop_CG_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
    		$("input[name=pop_CG_check]").prop("checked",false);
    	}
    });
    
    $("#pop_PC_checkall").click(function(){
    	//클릭되었으면
    	if($("#pop_PC_checkall").prop("checked")){
    		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
    		$("input[name=pop_PC_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
    		$("input[name=pop_PC_check]").prop("checked",false);
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
function popsetDays() {
	let startDateD = new Date();
	startDateD.setDate(startDateD.getDate()+1);
	var endDate1 = startDateD.toLocaleString();
	var endDate1 = endDate1.length == 24 ?endDate1.substring(0,12).split(". ") : endDate1.substring(0,13).split(". ");
	endDate1[1] = endDate1[1] > 9 ? endDate1[1] : '0' + endDate1[1];
	endDate1[2] = endDate1[2] > 9 ? endDate1[2] : '0' + endDate1[2];
	$("#popstartDate").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]);
}

function setDate() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + date.getMonth()+1;
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + date.getMonth()+1;
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("#endDate").val(yyyy+"-"+mm+"-"+dd);
	$("#startDate").val(yyyy+"-"+mm+"-"+"01");
//	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
//	$("input[name=datemove]").val(yyyy+"-"+mm+"-"+"01");
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
