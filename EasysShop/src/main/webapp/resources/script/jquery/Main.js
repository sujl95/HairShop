/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
//	$("#popup_wrap").load("text.html");
//	$.ajax({url:"test.html",
//
//		success:function(result) {
//
//		$("#popup_wrap").html(result);
//
//		}});
	$("#popup_wrap").load("test.html");
	
	$(".sscroll").slimScroll({
		width : "100%",
		height: "350px"
	});
	
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	$(".pop_Procedure_list").slimScroll({
		width : "600px",
		height: "100%"
	});
	$(".pop_Account_list").slimScroll({
		height: "400px"
	});
	$(".pop_Customer_list").slimScroll({
		width : "100%",
		height: "300px"
	});
	$(".pop_Employee_list").slimScroll({
		width : "100%",
		height: "220px"
	});
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
    	if($("#pop_PC_checkall").prop("checked")){
    		$("input[name=pop_PC_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		$("input[name=pop_PC_check]").prop("checked",false);
    	}
    });
    
    $("#pop_CP_checkall").click(function(){
    	if($("#pop_CP_checkall").prop("checked")){
    		$("input[name=pop_CP_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		$("input[name=pop_CP_check]").prop("checked",false);
    	}
    });
    
    $("#today").click(function(){
    	var date = new Date();
    	var yyyy = date.getFullYear();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("input[type=date]").val(yyyy+"-"+mm+"-"+dd);
    });
    $("#total").click(function(){
    	$("#startDate").val("2011"+"-"+"01"+"-"+"01");
    	var date = new Date();
    	var yyyy = date.getFullYear();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("#endDate").val(yyyy+"-"+mm+"-"+dd);
    });   
    $("#mtotal").click(function(){
    	$("#startDate").val("2011"+"-"+"01"+"-"+"01");
    	var date    = new Date();
    	var month = date.getMonth() + 1;
    	var yyyy = date.getFullYear();
    	var last   = new Date( yyyy, month ); 
    	     last   = new Date( last - 1 ); 
    	var lastD = last.getDate();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("#endDate").val(yyyy+"-"+mm+"-"+lastD);
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
    //팝업용
    $("#total2").click(function(){
    	$("#startDate2").val("2011"+"-"+"01"+"-"+"01");
    	var date = new Date();
    	var yyyy = date.getFullYear();
    	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
    	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
    	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
    	$("#endDate2").val(yyyy+"-"+mm+"-"+dd);
    });
    $("#month2").click(function(){
    	setDays(30);
    });
    
    $("#15days2").click(function(){
    	setDays(15);
    });
    
    $("#7days2").click(function(){
    	setDays(7);
    });
    
    $("#3days2").click(function(){
    	setDays(3);
    });
    $('#Sales_Sales_Money').on("keyup", function() {
    	inputNumberFormat(this);
    	Salesformat(this);
    });
    $('#Purchase_Sales_Money').on("keyup",function() {
    	inputNumberFormat(this);
    	Purchaseformat(this);
    });
    $(".pop_wrap").on("click", ".pop>.pop_title_area>.pop_close" , function() {
    	$(this).parents("div.pop_title_area").parents("div.pop").parents("div.pop_wrap")
    	.removeClass("pop_on")
    	.addClass("pop_off");
    });
});
function numberFormat(inputNumber) {
	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

function Salesformat(obj) {
	
	if(("#Sales_Sales_Money") != null ) {
		var Sales_Sales_Money = document.getElementById("Sales_Sales_Money").value;
		var Sales_Supply_Money = document.getElementById("Sales_Supply_Money").value;
		var Sales_VAT_Money = document.getElementById("Sales_VAT_Money").value;
		var Sales_Total_Money = document.getElementById("Sales_Total_Money").value;
		Sales_Sales_Money = Sales_Sales_Money.replace(/,/gi, "") * 1;
		Sales_Supply_Money =  Sales_Sales_Money / 1.1;
		Sales_VAT_Money = Math.floor(Sales_Sales_Money) - Math.floor(Sales_Supply_Money);
		$("#Sales_Supply_Money").val(Math.floor(Sales_Supply_Money));
		$("#Sales_VAT_Money").val(Math.floor(Sales_VAT_Money));
		$("#Sales_Total_Money").val(Math.floor(Sales_Sales_Money));
		var Sales_Supply_Money = document.getElementById("Sales_Supply_Money").value;
		var Sales_VAT_Money = document.getElementById("Sales_VAT_Money").value;
		var Sales_Total_Money = document.getElementById("Sales_Total_Money").value;
		Sales_Supply_Money = Sales_Supply_Money*1;
		Sales_VAT_Money = Sales_VAT_Money*1;
		Sales_Total_Money = Sales_Total_Money*1;
    	$("#Sales_Sales_Money").val(Sales_Sales_Money.toLocaleString());
		$("#Sales_Supply_Money").val(Sales_Supply_Money.toLocaleString());
		$("#Sales_VAT_Money").val(Sales_VAT_Money.toLocaleString());
		$("#Sales_Total_Money").val(Sales_Total_Money.toLocaleString());
	}
	
}
function Purchaseformat(obj) {
	
	if(("#Purchase_Sales_Money") != null ) {
		var Purchase_Sales_Money = document.getElementById("Purchase_Sales_Money").value;
		var Purchase_Supply_Money = document.getElementById("Purchase_Supply_Money").value;
		var Purchase_VAT_Money = document.getElementById("Purchase_VAT_Money").value;
		var Purchase_Total_Money = document.getElementById("Purchase_Total_Money").value;
		Purchase_Sales_Money = Purchase_Sales_Money.replace(/,/gi, "") * 1
		Purchase_Supply_Money =  Purchase_Sales_Money / 1.1;
		Purchase_VAT_Money = Math.floor(Purchase_Sales_Money) - Math.floor(Purchase_Supply_Money);
		$("#Purchase_Supply_Money").val(Math.floor(Purchase_Supply_Money));
		$("#Purchase_VAT_Money").val(Math.floor(Purchase_VAT_Money));
		$("#Purchase_Total_Money").val(Math.floor(Purchase_Sales_Money));
		var Purchase_Supply_Money = document.getElementById("Purchase_Supply_Money").value;
		var Purchase_VAT_Money = document.getElementById("Purchase_VAT_Money").value;
		var Purchase_Total_Money = document.getElementById("Purchase_Total_Money").value;
		Purchase_Supply_Money = Purchase_Supply_Money*1;
		Purchase_VAT_Money = Purchase_VAT_Money*1;
		Purchase_Total_Money = Purchase_Total_Money*1;
    	$("#Purchase_Sales_Money").val(Purchase_Sales_Money.toLocaleString());
		$("#Purchase_Supply_Money").val(Purchase_Supply_Money.toLocaleString());
		$("#Purchase_VAT_Money").val(Purchase_VAT_Money.toLocaleString());
		$("#Purchase_Total_Money").val(Purchase_Total_Money.toLocaleString());
	}
	
}


function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
//    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}



function setDays(daysago) {
	var endDatearr = ($("input[name=endDate2]").length > 0) ? $("input[name=endDate2]").val().split("-") : $("input[name=endDate]").val().split("-");
	
	let startDateD = new Date(endDatearr[0], endDatearr[1]-1,endDatearr[2] );
	var oldday = new Date(startDateD-(3600000*24*daysago));
	var endDate1 = oldday.toLocaleString();
	var endDate1 = endDate1.length == 24 ?endDate1.substring(0,11).split(". ") : endDate1.substring(0,12).split(". ");
	var oldday = startDateD.toLocaleString();
	endDate1[1] = endDate1[1] > 9 ? endDate1[1] : '0' + endDate1[1];
	endDate1[2] = endDate1[2] > 9 ? endDate1[2] : '0' + endDate1[2];
	var endDatearr = ($("input[name=startDate2]").length > 0) ? $("input[name=startDate2]").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]) : $("input[name=startDate]").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]);
}
function popsetDays() {
	let startDateD = new Date();
	startDateD.setDate(startDateD.getDate()+1);
	var endDate1 = startDateD.toLocaleString();
	var endDate1 = endDate1.length == 24 ?endDate1.substring(0,12).split(". ") : endDate1.substring(0,13).split(". ");
	endDate1[1] = endDate1[1] > 9 ? endDate1[1] : '0' + endDate1[1];
	endDate1[2] = endDate1[2] > 9 ? endDate1[2] : '0' + endDate1[2];
	$("input[name=popstartDate]").val(endDate1[0]+"-"+endDate1[1]+"-"+endDate1[2]);
}

function setDate() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("input[name=endDate]").val(yyyy+"-"+mm+"-"+dd);
	$("input[name=endDate2]").val(yyyy+"-"+mm+"-"+dd);
	$("input[name=startDate]").val(yyyy+"-"+mm+"-"+"01");
	$("input[name=startDate2]").val(yyyy+"-"+mm+"-"+"01");
}

//전화번호 텍스트 포맷팅
$(".txt_client_ph, .txt_client_ln, .txt_client_fax").on("keyup", function() {
	 inputNumberFormat(this);
});

//전화번호셋팅
function numberFormat(inputNumber) {
	
	   return inputNumber.toString().replace(/\B(?=(\d{3}-\d{3,4}-\d{4})+(?!\d))/g, ",");
	}

function inputNumberFormat(obj) {
 obj.value = comma(uncomma(obj.value));
}

function comma(str) {
 str = String(str);
 return str.replace(/(\d)(?=(?:\d{4})+(?!\d))/g, '$1-');
}

function uncomma(str) {
 str = String(str);
 return str.replace(/[^\d]+/g, '');
}
//전화번호셋팅 end