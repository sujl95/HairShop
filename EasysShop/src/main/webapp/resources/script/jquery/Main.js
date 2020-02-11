/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
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
    	inputmoneyFormat(this);
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
    		Salesformat(this,1);
    	} else {
    		Salesformat(this,2);
    	}
    });
    $('#Purchase_Sales_Money').on("keyup",function() {
    	inputmoneyFormat(this);
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
    		Purchaseformat(this,1);
    	} else {
    		Purchaseformat(this,2);
    	}
    });
    $(".pop_wrap").on("click", ".pop>.pop_title_area>.pop_close" , function() {
    	$(this).parents("div.pop_title_area").parents("div.pop").parents("div.pop_wrap")
    	.removeClass("pop_on")
    	.addClass("pop_off");
    });
    
    //라디오 버튼 변경시 이벤트
    $("input[name='IT_VAT_CK']:radio").change(function () {
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
			Purchaseformat(this,1);
			Salesformat(this,1);
    	} else if($("input[name=IT_VAT_CK]:checked").val() == "VAT미포함") {
				Purchaseformat(this,2);
				Salesformat(this,2);
    	}
    });
//    
//    $(".btn_cancel").on("click", function() {
//    	$(this).parents("div.pop_btn_bottom_area").parents("div.pop_schedule_contents")
//    	.parents("div.pop").parents("div.pop_wrap").removeClass("pop_on").addClass("pop_off");
//    });
});


//금액 포맷팅
function numberFormat(inputNumber) {
   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//숫자만
function onlynumberFormat() {
	this.value=this.value.replace(/[^0-9]/g,'');
}
function number_format(num){
	if(!isFinite(num)) return num;
    var num_str = num.toString();
    var result = "";
    for(var i=0; i<num_str.length; i++){
        var tmp = num_str.length - (i+1);
        if(((i%3)==0) && (i!=0))    result = ',' + result;
        result = num_str.charAt(tmp) + result;
    }
    return result;
}
function Salesfunc() {
	 $('#Sales_Sales_Money').on("keyup", function() {
    	inputmoneyFormat(this);
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
    		Salesformat(this,1);
    	} else {
    		Salesformat(this,2);
    	}
    });
}
function Purchasefunc() {
   $('#Purchase_Sales_Money').on("keyup",function() {
    	inputmoneyFormat(this);
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
    		Purchaseformat(this,1);
    	} else {
    		Purchaseformat(this,2);
    	}
    });
}

function itemVATradio() {
	 //라디오 버튼 변경시 이벤트
    $("input[name='IT_VAT_CK']:radio").change(function () {
    	if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
			Purchaseformat(this,1);
			Salesformat(this,1);
    	} else if($("input[name=IT_VAT_CK]:checked").val() == "VAT미포함") {
				Purchaseformat(this,2);
				Salesformat(this,2);
    	}
    });
}
function Salesformat(obj,ck) {
	if(ck == 1) {
		var Sales_Sales_Money = $("#Sales_Sales_Money").val();
		var Sales_Sales_Money1 = $("#Sales_Sales_Money").val();
		Sales_Sales_Money = Sales_Sales_Money.replace(/,/g, "");
		var Sales_Supply_Money = Math.round(Sales_Sales_Money/1.1);
		var Sales_VAT_Money = Math.round(Sales_Sales_Money/11);
		$("#Sales_Supply_Money").val(number_format(Sales_Supply_Money));
		$("#Sales_VAT_Money").val(number_format(Sales_VAT_Money));
		$("#Sales_Total_Money").val(Sales_Sales_Money1);
	} else if (ck == 2){
		var Sales_Sales_Money= $("#Sales_Sales_Money").val();
		var Sales_Sales_Money1= $("#Sales_Sales_Money").val();
		Sales_Sales_Money = Sales_Sales_Money.replace(/,/g, "");
		Sales_Total_Money  = Math.round(Sales_Sales_Money * 1.1);
		Sales_VAT_Money  = Math.round(Sales_Total_Money - Sales_Sales_Money);
		$("#Sales_Supply_Money").val(number_format(Sales_Sales_Money1));
		$("#Sales_Total_Money").val(number_format(Sales_Total_Money));
		$("#Sales_VAT_Money").val(number_format(Sales_VAT_Money));
	}
}
function Purchaseformat(obj,ck) {
	if(ck == 1) {
		var Purchase_Sales_Money=$("#Purchase_Sales_Money").val();
		var Purchase_Sales_Money1=$("#Purchase_Sales_Money").val();
		Purchase_Sales_Money = Purchase_Sales_Money.replace(/,/g, "");
		var Purchase_Supply_Money = Math.round(Purchase_Sales_Money/1.1);
		var Purchase_VAT_Money = Math.round(Purchase_Sales_Money/11);
		$("#Purchase_Supply_Money").val(number_format(Purchase_Supply_Money));
		$("#Purchase_VAT_Money").val(number_format(Purchase_VAT_Money));
		$("#Purchase_Total_Money").val(Purchase_Sales_Money1);
	} else if (ck == 2){
		var Purchase_Sales_Money= $("#Purchase_Sales_Money").val();
		var Purchase_Sales_Money1= $("#Purchase_Sales_Money").val();
		Purchase_Sales_Money = Purchase_Sales_Money.replace(/,/g, "");
		Purchase_Total_Money  = Math.round(Purchase_Sales_Money * 1.1);
		Purchase_VAT_Money  = Math.round(Purchase_Total_Money - Purchase_Sales_Money);
		$("#Purchase_Supply_Money").val(number_format(Purchase_Sales_Money1));
		$("#Purchase_Total_Money").val(number_format(Purchase_Total_Money));
		$("#Purchase_VAT_Money").val(number_format(Purchase_VAT_Money));
	}
}

//금액 포맷팅
function inputmoneyFormat(obj) {
	return obj.value = m_comma(m_uncomma(obj.value));
}

function m_comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
//    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function m_uncomma(str) {
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