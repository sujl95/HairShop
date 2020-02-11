<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function() {
	getLeftMenu();
	
	//Logout Button
	$("#logoutBtn").on("click", function() {
		location.href = "logout";
	});
	
	//Logo Event
	$(".logo_wrap").on("click", function() {
		location.href = "contentsTest";
	});
	
	//Left Menu Location Event
	$(".menu_wrap").on("click", ".first_menu, .second_menu", function() {
		if($(this).is("[addr]")) {
			$("#menuNo").val($(this).attr("menuno"));
			
			$("#locationForm").attr("action", $(this).attr("addr"));
			
			$("#locationForm").submit();
		} else if ($(this).attr("menuno") == 15) {
			Gradefun(1);
		} else if ($(this).attr("menuno") == 16) {
				
		} else if ($(this).attr("menuno") == 17) {
			Gradefun(2);
		} else if ($(this).attr("menuno") == 18) {
			Itemfun(1);
		} else if ($(this).attr("menuno") == 19) {
			console.log(1);
		} else if ($(this).attr("menuno") == 20) {
			Compfun();
		}
		
		load_event();
		
		
	});
	
	//거래처 코드 검색
	$("#CP_Search_btn").on("click", function () {
		Compfun();
	});
	
});
//로드시 이벤트적용
function load_event() {
	
	// 조건X 검색 버튼 클릭 Event
	$("#pop_Search_Btn").on("click", function a(str) {
		var str = $(this).attr("name");
 		if (str == "getcustgradelist") getlist(1);
 		if (str == "getempgradelist") getlist(2);
 		if (str == "getcomplist") getlist(3);
 		if (str == "getitemcodelist") getlist(4);
 		if (str == "getitemtypelist") getlist(5);
	});
	
	$("input[name=searchTxt]").on("keypress", function() {
		if(event.keyCode == 13) {
			$("#pop_Search_Btn").click();
			return false;
		}
	});
	
	/* 체크박스 영역 제외하고 나머지tr부분 이벤트 적용 고객등급*/
	$(".pop_list").on("click",".pop_update" ,function(e) {
		var params = "&"+$(this).attr("id")+"=" + $(this).attr("name");
		var ajax = "";
		if ($(this).attr("id") == "cust_g_no") {
			ajax = "getcustgdataAjax";
		} else if($(this).attr("id") == "emp_g_no") {
			ajax = "getempgdataAjax";
		} else if($(this).attr("id") == "comp_no") {
			ajax = "getcompdataAjax";
		} else if($(this).attr("id") == "IT_CODE_NO") {
			ajax = "getitemcodedataAjax";
		} else if($(this).attr("id") == "IT_TYPE_NM") {
			ajax = "getitemtypedataAjax";
		} 
		console.log(params);
		$.ajax({
			type : "post", //데이터 전송방식
			url : ajax, //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// {키: 값, 키:값, ...} - > json
			
			success : function(result1){
				console.log(result1);
				if (ajax == "getcustgdataAjax") {
					make_custgrade_pop(2,"고객 등급 수정",result1);
				} else if (ajax == "getempgdataAjax") {
					make_custgrade_pop(4,"직원 등급수정",result1);
				} else if (ajax == "getcompdataAjax") {
					make_comp_pop(2,"거래처 수정",3,result1);
				} else if (ajax == "getitemcodedataAjax") {
					make_item_pop(2,"상품 코드 수정",3,result1);
				} else if (ajax == "getitemtypedataAjax") {
					make_it_type_pop(3,result1);
				} 
				
				
			} , 
			error : function(request,status,error) {
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
			
		});
	});
//	체크 전체
	$("#pop_chk_all").click(function(){
		var arr = []; 
		arr = $(this).attr("class").split(' ');
		if(typeof arr[1] == "undefined"){
			if($("#pop_chk_all").prop("checked")){
	    		$("input[name=pop_check]").prop("checked",true);
	    	}else{
	    		$("input[name=pop_check]").prop("checked",false);
	    	}
		} else {
			if($("#pop_chk_all").prop("checked")){
	    		$("input[name="+arr[1]+"]").prop("checked",true);
	    	}else{
	    		$("input[name="+arr[1]+"]").prop("checked",false);
	    	}
		}
    	
    });

    
}

//리스트 Get
function getlist(no) {
	var params = $("#popactionForm").serialize();
	var ajax = "";
	if (no == 1) {
		ajax = "getcustgradelistAjax";
	} else if (no == 2) {
		ajax = "getempgradelistAjax";
	} else if (no == 3) {
		ajax = "getcomplistAjax";
	} else if (no == 4) {
		ajax = "getitemcodelistAjax";
	} else if (no == 5) {
		ajax = "getitemtypelistAjax";
	} 
	$.ajax({
		type: "post",
		url: ajax,
		dataType: "json",
		data: params,
		success: function(result) {
			if (ajax == "getcustgradelistAjax") {
				drawgradeList(1,result.list);
			} else if(ajax == "getempgradelistAjax") {
				drawgradeList(2,result.list);
			} else if(ajax == "getcomplistAjax") {
				drawcompList(result.list);
			} else if(ajax == "getitemcodelistAjax") {
				drawitemcodeList(result.list);
			} else if(ajax == "getitemtypelistAjax") {
				drawitemtypeList(result.list);
			}
				
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}



//상품 코드 목록 메서드
function Itemfun (depth) {
	const cdepth = depth;
	var html = "";
	html += `<form id="popactionForm" action="#" method="post">`;
	html += `<table class="pop_table">`;
	html += `	<colgroup>            `;
	html += `		<col width="20%"> `;
	html += `		<col width="80%"> `;
	html += `	</colgroup>           `;
	html += `	<tbody>               `;
	html += `		<tr>              `;
	html += `			<td class="field_name first_field_name">검색어</td> `;
	html += `			<td class="field_contents">                         `;
	html += `				<input class="input_size size60" type="text" id="getcomplist" name="searchTxt">   `;
	html += `				<input type="button" class="btn_normal btn_size_normal" id="pop_Search_Btn" name="getitemcodelist" value="검색"/>`;
	html += `			</td>`;
	html += `		</tr> `;
	html += `	</tbody>  `;
	html += `</table>     `;
	html += `<br>`;
	html += `</form>`;
	html += `<form id="popdataForm" action="#" method="post">`;
	html += `<table class="table_list pop_list widthscroll" id="item_code_list">                `;
	html += `	<thead class="thead_scroll ">           `;
	html += `		<tr class="table_list_header">     `;
	html += `			<td width="80px" nowrap>      `;
	html += `				<div class="squaredOne_h"> `;
	html += `					<input type="checkbox" value="None" class="list_chbox" style="display : none;" id="pop_chk_all"  />`;
	html += `					<label for="pop_chk_all"  ></label>`; 
	html += `				</div>`;
	html += `			</td>`;
	html += `			<td width="95px" nowrap>수정</td>     `;
	html += `			<td width="150px" nowrap>상품명</td>`;
	html += `			<td width="140px" nowrap>상품 분류</td> `;
	html += `			<td width="100px" nowrap>VAT포함</td>`;
	html += `			<td width="110px" nowrap>판매단가</td>    `;
	html += `			<td width="150px" nowrap>판매가(VAT포함)</td>    `;
	html += `			<td width="110px" nowrap>매입단가</td>   `;
	html += `			<td width="150px" nowrap>매입가(VAT포함)</td>      `;
	html += `			<td width="150px" nowrap>적립POINT(현금)</td>   `;
	html += `			<td width="150px" nowrap>적립POINT(카드)</td>  `;
	html += `			<td width="120px" nowrap>매입처</td>`;
	html += `			<td width="100px" nowrap>규격</td>   `;
	html += `			<td width="100px" nowrap>단위</td>     `;
	html += `			<td width="120px" nowrap>등록일</td>     `;
	html += `		</tr>                                              `;
	html += `	</thead>                                               `;
	html += `	<tbody class="tbody_scroll sscroll">                           `;
	html += `	</tbody>                                               `;
	html += `</table>                                                  `;
	html += `</form>`;
	makeThreeBtnPopup(depth = (depth == null) ? 1 : cdepth, "상품 코드 목록", html, false, 900, 700, function() {
		getlist(4);
		$("#popdataForm").slimScroll({
			width : "880px",
			height: "500px",
			axis: 'both'
		});
	}
	, "등록", function() {
		make_item_pop(1, "상품 코드 등록",depth = (depth == null) ? 1 : cdepth+1);
	},"삭제", function() {
		var params = $("#popdataForm").serialize();
		listdel(depth = (depth == null) ? 1 : cdepth+1,"상품 ",400,200,"popactionForm","itemdelAjax","getlist4",params);
	},"취소", function() {
		console.log(depth);
		closePopup(depth = (depth == null) ? 1 : cdepth	);
	});
	
	
}

//상품분류코드 리스트 Draw
function drawitemtypeList(list) {
	var html = "";
	if(list.length > 0) {
		
		for(var i in list) {
			html += `<tr class="list_contents" name="`+list[i].CODE_NAME+`">                                                                              `;
			html += `	<td width="60px" nowrap style="cursor : default;" class="chk_td">                                                                             `;
			html += `		<div class="squaredOne">                                                                                              `;
			html += `			<input type="checkbox" class="list_chbox item_type" value="`+list[i].CODE_NAME+`" style="display : none;" id="chk_`+list[i].CODE_NAME+`" name="item_type_check" />   `;
			html += `			<label class="chbox_lbl" for="chk_`+list[i].CODE_NAME+`"></label>                                                                         `;
			html += `		</div>                                                                                                                `;
			html += `	</td>                                                                                                                     `;
			html += `	<td  width="85px" nowrap style="cursor : default;"><input name="`+list[i].CODE_NAME+`"type="button" class="pop_update" id="IT_TYPE_NM" value="수정"/></td>                                `;
			html += `			<td width="85px" nowrap>`+list[i].CODE_M_CATE+`</td>   `;
			html += `			<td width="85px" nowrap>`+list[i].CODE_S_CATE+`</td>   `;
			html += `			<td width="130px" nowrap>`+list[i].CODE_NAME+`</td>`;
			html += `</tr>                                                                                                                        `
		}            
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"4\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	}
	
	$("#item_code_add_list tbody").html(html);
	
	$(".sscroll").slimScroll({
		width : "100%",
		height: "300px"
	});
}



//상품코드 리스트 Draw
function drawitemcodeList(list) {
	var html = "";
	if(list.length > 0) {
		
		for(var i in list) {
			html += `<tr class="list_contents" name="`+list[i].IT_NO+`">                                                                              `;
			html += `	<td width="80px" nowrap style="cursor : default;" class="chk_td">                                                                             `;
			html += `		<div class="squaredOne">                                                                                              `;
			html += `			<input type="checkbox" class="list_chbox" value="`+list[i].IT_NO+`" style="display : none;" id="chk_`+list[i].IT_NO+`" name="pop_check" />   `;
			html += `			<label class="chbox_lbl" for="chk_`+list[i].IT_NO+`"></label>                                                                         `;
			html += `		</div>                                                                                                                `;
			html += `	</td>                                                                                                                     `;
			html += `	<td  width="95px" nowrap style="cursor : default;"><input name="`+list[i].IT_NO+`"type="button" class="pop_update" id="IT_CODE_NO" value="수정"/></td>                                `;
			html += `			<td width="150px" nowrap>`+list[i].IT_NM+`</td>   `;
			html += `			<td width="140px" nowrap>`+list[i].CODE_NAME+`</td>`;
			html += `			<td width="100px" nowrap>`+list[i].IT_VAT_CK+`</td>`;
			html += `			<td width="110px" nowrap>`+list[i].IT_SAL_U_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>    `;
			html += `			<td width="150px" nowrap>`+list[i].IT_SAL_U_PRICE_VAT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>    `;
			html += `			<td width="110px" nowrap>`+list[i].IT_SAL_W_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>   `;
			html += `			<td width="150px" nowrap>`+list[i].IT_SAL_W_PRICE_VAT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>      `;
			html += `			<td width="150px" nowrap>`+list[i].IT_MONEY_PT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>`
			html += `			<td width="150px" nowrap>`+list[i].IT_CARD_PT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");+`</td>  `;
			html += `			<td width="120px" nowrap>`+list[i].CP_NM+`</td>`;
			html += `			<td width="100px" nowrap>`+list[i].IT_STD+`</td>   `;
			html += `			<td width="100px" nowrap>`+list[i].IT_UNIT+`</td>     `;
			html += `			<td width="120px" nowrap>`+list[i].IT_DATE+`</td>     `;
			html += `</tr>                                                                                                                        `
		}            
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"4\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	}
	
	$("#item_code_list tbody").html(html);
	
	$(".sscroll").slimScroll({
		width : "100%",
		height: "450px"
	});
}
//상품 분류 코드 수정
function make_it_type_pop(depth,result1) {
	const cdepth = depth;
	var html = "";
	html += `<form id="popactionForm" action="#" method="post">`;
	html += `<table class="pop_table">`;
	html += `	<colgroup>            `;
	html += `		<col width="20%"> `;
	html += `		<col width="80%"> `;
	html += `	</colgroup>           `;
	html += `	<tbody>               `;
	html += `			<tr>      `
	html += `				<td class="field_name first_field_name">상품 코드</td>                             `
	html += `				<td class="field_contents" id="it_code_txt">                                                         `
	html += `				<input type="hidden" id="it_NM_type" name="it_NM_type" value="`+result1.data.CODE_NAME+`" >   `;
	html += `				<input class="input_size size30" type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="IT_M_GROUP_NO" name="IT_M_GROUP_NO" value="`+result1.data.CODE_M_CATE+`" placeholder="대분류코드">   `;
	html += `				<input class="input_size size30" type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="it_S_code" name="it_S_code" value="`+result1.data.CODE_S_CATE+`" placeholder="소분류코드">   `;
	html += `				<input class="input_size size30" type="text" value="`+result1.data.CODE_NAME+`" id="it_NM_code" name="it_NM_code" placeholder="코드이름">   `;
	html += `				</td>                                                                                `
	html += `			</tr>     `
	html += `	</tbody>  `;
	html += `</table>     `;
	html += `<br>`;
	html += `</form>`;
	makeTwoBtnPopup(cdepth+1, "상품 분류 코드", html, true, 400, 300, null, 
	  "확인", function() {
		var params = ($("#it_NM_type").val() != $("#it_NM_code").val()) ? $("#popactionForm").serialize() + "&ck_val="+"0" : $("#popactionForm").serialize() + "&ck_val="+"0" + "&nck_val="+"1" ;
		$.ajax({
			type : "post", //데이터 전송방식
			url : "itemtypeupdateAjax" , //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// {키: 값, 키:값, ...} - > json
			
			success : function(result){
				if(result.res == "SUCCESS"){
					closePopup(cdepth+1);
					makeAlert(cdepth+2, "수정 성공", "수정 되었습니다.", null);
					getlist(5);
				} else {
					makeAlert(cdepth+2, "수정 오류", "수정에 실패하였습니다.", null);
				}
			} , 
			error : function(request,status,error) {
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
			
		});
	},"하이", function() {
		closePopup(cdepth+1);
	});
	
	
}

//상품 코드 등록 수정
function make_item_pop(ck, str ,depth,result1) {
	const cdepth = depth;
	var html = "";
	var ajax = "";
	if (ck == 1) {
		ajax = "itemcodeAddAjax";
	} else if (ck == 2) {
		ajax = "itemcodeUpdateAjax";
	}
	html += `	<form id="itemForm" action="#" method="post"> `
	html += `	<table class="pop_table"> `
	html += `		<colgroup>            `
	html += `			<col width="15%"> `
	html += `			<col width="35%"> `
	html += `			<col width="15%"> `
	html += `			<col width="35%"> `
	html += `		</colgroup>           `
	html += `		<tbody>               `
	html += `			<tr>              `                                                             
	html += `				<td class="field_name first_field_name">상품명<span class="acc_txt"> *</span></td>                         `
	html += `				<td class="field_contents" >                                                `
	html += `					<input class="input_normal" id="IT_NM" name="IT_NM" type="text">        `
	html += `					<input id="IT_CODE_NO" name="IT_CODE_NO" type="hidden">        `
	html += `				</td>                                                                       `
	html += `				<td class="field_name first_field_name">매입처<span class="acc_txt"> *</span></td>                         `
	html += `				<td class="field_contents">                                                 `
	html += `					<input class="input_normal size60" readonly="readonly" type="text" id="CP_NM" name="CP_NM"> `
	html += `					<input type="hidden" id="CP_NO" name="CP_NO">                           `
	html += `					<input type="button" class="btn_normal btn_size_normal pxsize60"  id="CP_Search_btn" name="CP_Search_btn" value="검색"/>`
	html += `				</td> `
	html += `			</tr>     `
	html += `			<tr>      `
	html += `				<td class="field_name first_field_name">상품 코드<span class="acc_txt"> *</span></td>                             `
	html += `				<td class="field_contents" colspan="3" >                                                         `
	html += `					<select class="input_normal size30" id="IT_M_GROUP_NO" name="IT_M_GROUP_NO">            `
	html += `						<option value="-1" selected="selected" >상품분류</option>`
	html += `					</select>                                                                        `
	html += `					<select class="input_normal size30" id="IT_S_GROUP_NO" name="IT_S_GROUP_NO">     `
	html += `						<option value="-1" selected="selected" >상품명</option>`
	html += `					</select>                                                                        `
	html += `					<input type="button" class="btn_normal btn_size_normal pxsize50" id="IT_CODE_ADD" name="IT_CODE_ADD" value="등록"/>           `
	html += `				</td>                                                                                `
	html += `			</tr>     `
	html += `			<tr>      `
	html += `				<td class="field_name first_field_name">상품규격</td>                     `
	html += `				<td class="field_contents" >                                              `
	html += `					<input class="input_normal" id="IT_STD" name="IT_STD" type="text">    `
	html += `				</td>                                                                     `
	html += `				<td class="field_name first_field_name">상품단위</td>                     `
	html += `				<td class="field_contents" >                                              `
	html += `					<input class="input_normal" id="IT_UNIT" name="IT_UNIT" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text">`
	html += `				</td>  `
	html += `			</tr>      `
	html += `			<tr>       `
	html += `				<td class="field_name first_field_name">VAT포함여부</td>                                          `
	html += `				<td class="field_contents">                                                                       `
	html += `					<label><input type="radio" value="VAT포함" checked="checked" name="IT_VAT_CK">VAT포함</label> `
	html += `					<label><input type="radio" value="VAT미포함" name="IT_VAT_CK">VAT미포함</label>               `
	html += `				</td>                                                                                             `
	html += `				<td class="colorred"colspan="2">단가에 부가세 포함여부를 선택해주세요</td>                        `
	html += `			</tr>                                                                                                 `
	html += `			<tr>                                                                                                  `
	html += `				<td class="field_name first_field_name" rowspan="2" >판매단가<span class="acc_txt"> *</span></td>                                `
	html += `				<td class="field_contents" rowspan="2" >                                                          `
	html += `					<input class="input_normal txtalignright" onkeyup="Salesfunc()" id="Sales_Sales_Money" name="Sales_Sales_Money" type="text">  `
	html += `				</td>                                                                                                        `
	html += `				<td class="field_name first_field_name backcolorwhite" rowspan="2">                                          `
	html += `				</td>                                                                                                        `
	html += `				<td class="field_name first_field_name backcolorwhite" style="font-weight: 300;" rowspan="2">                `
	html += `					<div class="Sale_Money_area">                                                                            `
	html += `					공급가<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Sales_Supply_Money" name="Sales_Supply_Money" type="text">원  `
	html += `					</div>                                                                                                                                                  `
	html += `					<div class="Sale_Money_area">                                                                                                                           `
	html += `					부가세<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Sales_VAT_Money" name="Sales_VAT_Money" type="text">원        `
	html += `					</div>                                                                                                                                                  `
	html += `					<div class="Sale_Money_area">                                                                                                                           `
	html += `					판매가<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Sales_Total_Money" name="Sales_Total_Money" type="text">원    `
	html += `					</div> `
	html += `				</td>      `
	html += `			</tr>          `
	html += `			<tr>           `
	html += `			</tr>          `
	html += `			<tr>           `                                                                                   
	html += `				<td class="field_name first_field_name" rowspan="2" >매입단가<span class="acc_txt"> *</span></td>                             `
	html += `				<td class="field_contents" rowspan="2" >                                                       `
	html += `					<input class="input_normal txtalignright" onkeyup="Purchasefunc()" id="Purchase_Sales_Money" name="Purchase_Sales_Money" type="text">           `
	html += `				</td>                                                                                          `
	html += `				<td class="field_name first_field_name backcolorwhite" rowspan="2">                            `
	html += `				</td>                                                                                          `
	html += `				<td class="field_name first_field_name backcolorwhite" style="font-weight: 300;" rowspan="2">  `
	html += `					<div class="Sale_Money_area">                                                              `
	html += `					공급가<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Purchase_Supply_Money" name="Purchase_Supply_Money" type="text">원  `
	html += `					</div>                                                                                                                                                        `
	html += `					<div class="Sale_Money_area">                                                                                                                                 `
	html += `					부가세<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Purchase_VAT_Money" name="Purchase_VAT_Money" type="text">원        `
	html += `					</div>                                                                                                                                                        `
	html += `					<div class="Sale_Money_area">                                                                                                                                 `
	html += `					매입가<input class="txtalignright noborder size60 backcolorwhite" disabled="disabled" id="Purchase_Total_Money" name="Purchase_Total_Money" type="text">원    `
	html += `					</div> `
	html += `				</td>      `
	html += `			</tr>          `
	html += `			<tr>           `
	html += `			</tr>          `
	html += `			<tr>           `
	html += `				<td class="field_name first_field_name">현금적립포인트</td>                                       `
	html += `				<td class="field_contents">                                                                       `
	html += `					<input class="input_normal txtalignright" onkeyup="inputmoneyFormat(this)" id="IT_MONEY_PT" name="IT_MONEY_PT" type="text">      `
	html += `				</td>                                                                                             `
	html += `				<td class="field_name first_field_name">카드적립포인트</td>                                       `
	html += `				<td class="field_contents" >                                                                      `
	html += `					<input class="input_normal txtalignright" onkeyup="inputmoneyFormat(this)" id="IT_CARD_PT" name="IT_CARD_PT"  type="text">      `
	html += `				</td>`
	html += `			</tr>    `
	html += `		</tbody>     `
	html += `	</table>         `
	html += `</form>`
		makeTwoBtnPopup(cdepth, str, html, true, 700, 600, function() {
			// 버튼 크기 자동 조절
		    $('.btn').each(function() {
		        if($(this).html().length > 2) {
		            var leng_diff = $(this).html().length - 2;
		            $(this).width($(this).width() + (10 * leng_diff) + "px");  
		        }
		    });
		    getitemcate(result1);
			$("#IT_M_GROUP_NO").change(function() {
				 getitemcate();
			});
			
			/* 거래처 목록 팝업 오픈 */
			$("#CP_Search_btn ,  #CP_NM").on("click", function() {
				Compfun(cdepth+1);
				$(".pop_list>tbody").on("click", "tr", function() {
					var arr = [] ;
					arr = $(this).attr("name").split("_");
					$("#CP_NO").val(arr[0]);
					$("#CP_NM").val(arr[1]);
					closePopup(cdepth+1);
				});
			});
			
			$("#IT_CODE_ADD").on("click", function() {
				var html ="";
				html += `<form id="popactionForm" action="#" method="post">`;
				html += `<table class="pop_table">`;
				html += `	<colgroup>            `;
				html += `		<col width="20%"> `;
				html += `		<col width="80%"> `;
				html += `	</colgroup>           `;
				html += `	<tbody>               `;
				html += `		<tr>              `;
				html += `			<td class="field_name first_field_name">등록 코드</td> `;
				html += `			<td class="field_contents">                         `;
				html += `						<label><input type="radio" value="대분류" checked="checked" name="it_type">대분류</label>`
				html += `						<label><input type="radio" value="소분류"  name="it_type">소분류</label>`
				html += `					<input type="button" class="btn_normal btn_size_normal pxsize50" id="IT_CODE_ADD" name="IT_CODE_ADD" value="등록"/>           `
				html += `			</td>`;
				html += `		</tr> `;
				html += `			<tr>      `
				html += `				<td class="field_name first_field_name">상품 코드</td>                             `
				html += `				<td class="field_contents" colspan="2" id="it_code_txt">                                                         `
				html += `				<input class="input_size size30" type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="it_M_code" name="it_M_code" placeholder="대분류코드">   `;
				html += `				<input class="input_size size30" type="text" id="it_NM_code" name="it_NM_code" placeholder="코드이름">   `;
				html += `				</td>                                                                                `
				html += `			</tr>     `
				html += `	</tbody>  `;
				html += `</table>     `;
				html += `<br>`;
				html += `</form>`;
				html += `<form id="popdataForm" action="#" method="post">`;
				html += `<table class="table_list pop_list" id="item_code_add_list">                `;
				html += `	<thead class="thead_scroll">           `;
				html += `		<tr class="table_list_header">     `;
				html += `			<td  width="60px" nowrap>      `;
				html += `				<div class="squaredOne_h"> `;
				html += `					<input type="checkbox" value="None" class="list_chbox item_type_check" style="display : none;" id="pop_chk_all"  />`;
				html += `					<label for="pop_chk_all"  ></label>`; 
				html += `				</div>`;
				html += `			</td>`;
				html += `			<td  width="85px" nowrap>수정</td>     `;
				html += `			<td  width="85px" nowrap>대분류</td>               `;
				html += `			<td  width="85px" nowrap>소분류</td>               `;
				html += `			<td  width="130px" nowrap>코드명</td>             `;
				html += `		</tr>                                              `;
				html += `	</thead>                                               `;
				html += `	<tbody class="tbody_scroll sscroll" style="height : 300px !important">                           `;
				html += `	</tbody>                                               `;
				html += `</table>                                                  `;
				html += `</form>`;
				
				makeTwoBtnPopup(cdepth+1, "상품 분류 코드 등록", html , true, 460, 600, function() {
					//텍스트 박스 드로우
					$("input[name=it_type]:radio").change(function() {
						if($(this).val() == "대분류") {
							var  html ="";
							html += `				<input class="input_size size30" type="text" id="it_M_code" name="it_M_code" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="대분류코드">   `;
							html += `				<input class="input_size size30" type="text" id="it_NM_code" name="it_NM_code" placeholder="코드이름">   `;
						} else {
							var  html ="";
							html += `					<select class="input_normal size30" id="IT_M_GROUP_NO1" name="IT_M_GROUP_NO">            `
							html += `						<option value="-1" selected="selected" >대분류선택</option>`
							html += `					</select>                                                                        `
			 				html += `				<input class="input_size size30" type="text" id="it_S_code" name="it_S_code" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="소분류코드">   `;
							html += `				<input class="input_size size30" type="text" id="it_NM_code" name="it_NM_code" placeholder="코드이름">   `;
						}
						$("#it_code_txt").html(html);
						getitemcate(null,1);
						
					});
					//등록
					$("#IT_CODE_ADD").on("click",function() {
						
						if($("input[name=it_type]:checked").val() == "대분류") {
							if($.trim($("#it_M_code").val()) == "") {
								makeAlert(cdepth+2, str+" 오류", "대분류 코드를 입력하세요", null);
							} else if($.trim($("#it_NM_code").val()) == "")  {
								makeAlert(cdepth+2, str+" 오류", "코드이름을 입력하세요", null);
							} else {
								var params = $("#popactionForm").serialize() + "&ck_val=" + "1";
							}
									
						} else if ($("input[name=it_type]:checked").val() == "소분류"){
							if ($("#IT_M_GROUP_NO1").val() == "-1"){
								console.log($("#IT_M_GROUP_NO1").val());
								makeAlert(cdepth+2, str+" 오류", "대분류 코드를 입력하세요", null);
							} else if($.trim($("#it_S_code").val()) == "")  {
								makeAlert(cdepth+2, str+" 오류", "소분류 코드를 입력하세요", null);
							} else if($.trim($("#it_NM_code").val()) == "")  {
								makeAlert(cdepth+2, str+" 오류", "코드이름을 입력하세요", null);
							} else{
								var params = $("#popactionForm").serialize() + "&ck_val=" + "0";
							}
						} 
						if (typeof params != "undefined") {
							console.log(params);
							$.ajax({
								type : "post", //데이터 전송방식
								url : "itemtypeckAjax" , //주소
								dataType : "json", //데이터 전송 규격
								data : params, //보낼 데이터
								// {키: 값, 키:값, ...} - > json
								
								success : function(result){
									if(result.res == "SUCCESS"){
										makeAlert(cdepth+2, str+" 성공", str+"되었습니다.", null);
										getlist(5);
									} else if(result.res == "MFailed"){
										makeAlert(cdepth+2, str+" 오류", str+"에 실패하였습니다. 분류 코드 또는 코드이름이 중복입니다", null);
									} else {
										makeAlert(cdepth+2, str+" 오류", str+"에 실패하였습니다.", null);
									}
								} , 
								error : function(request,status,error) {
									console.log("status : "+request.status);
									console.log("text : "+request.responseText);
									console.log("error : "+error);
								}
								
							});
						} 
						 
					});
					getlist(5);
					load_event();
				}, "삭제", function() {
					var params = $("#popdataForm").serialize();
					listdel(cdepth+2,"상품 분류 코드 삭제",400,200,"popactionForm","itemtypedelAjax","getlist5",params);
				},"취소", function() {
					closePopup(cdepth+1);
				});
				
			});
			
			itemVATradio();
			
			if(ck == 2) {
				$("#IT_CODE_NO").val(result1.data.IT_NO);
		 		$("#IT_NM").val(result1.data.IT_NM);
		 		$("#CP_NO").val(result1.data.CP_NO);
		 		$("#CP_NM").val(result1.data.CP_NM);
		 		$("#IT_STD").val(result1.data.IT_STD);
		 		if(typeof result1.data.IT_UNIT != "undefined" ){
		 			$("#IT_UNIT").val(result1.data.IT_UNIT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		 		} 
		 		//라디오 버튼 체크
		 		$("input:radio[name ='IT_VAT_CK']:input[value='"+result1.data.IT_VAT_CK+"']").attr("checked", true);
		 		//공급 , 부가, 판매가 셋팅
		 		if($("input[name=IT_VAT_CK]:checked").val() == "VAT포함") {
		    		Salesformat($("#Sales_Sales_Money").val(result1.data.IT_SAL_U_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")),1);
		    		Purchaseformat($("#Purchase_Sales_Money").val(result1.data.IT_SAL_W_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")),1);
		    	} else {
		    		Salesformat($("#Sales_Sales_Money").val(result1.data.IT_SAL_U_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")),2);
		    		Purchaseformat($("#Purchase_Sales_Money").val(result1.data.IT_SAL_W_PRICE.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")),2);
		    	}
		 		if(typeof result1.data.IT_MONEY_PT != "undefined" ){
		 			$("#IT_MONEY_PT").val(result1.data.IT_MONEY_PT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		 		}
		 		if(typeof result1.data.IT_CARD_PT != "undefined" ){
		 			$("#IT_CARD_PT").val(result1.data.IT_CARD_PT.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		 		}
		 	} 
		}, str , function() {
				if($.trim($("#IT_NM").val()) == ""){
					makeAlert(cdepth+1, str+"오류", "상품명을 입력하세요", null);
					$("#IT_NM").focus();
				} else if($.trim($("#IT_M_GROUP_NO").val()) == "-1"){
					makeAlert(cdepth+1, str+"오류", "상품분류를 입력하세요", null);
				} else if($.trim($("#IT_S_GROUP_NO").val()) == "-1"){
					makeAlert(cdepth+1, str+"오류", "상품명을 입력하세요", null);
				} else if(($.trim($("#Sales_Sales_Money").val()) == "") && ($.trim($("#Purchase_Sales_Money").val()) == "")){
					makeAlert(cdepth+1, str+"오류", "판매단가 또는 매입단가를 입력하세요", null);
					$("#Sales_Sales_Money").focus();
				} else {
					var params = $("#itemForm").serialize() + 
					"&Sales_Sales_Money1="+$("#Sales_Sales_Money").val().replace(/[^0-9]/g, "") +
					"&Purchase_Sales_Money1="+$("#Purchase_Sales_Money").val().replace(/[^0-9]/g, "") +
					"&IT_UNIT1="+$("#IT_UNIT").val().replace(/[^0-9]/g, "") +
					"&IT_MONEY_PT1="+$("#IT_MONEY_PT").val().replace(/[^0-9]/g, "") +
					"&IT_CARD_PT1="+$("#IT_CARD_PT").val().replace(/[^0-9]/g, "") 
					;
	
					$.ajax({
						type : "post", //데이터 전송방식
						url : ajax , //주소
						dataType : "json", //데이터 전송 규격
						data : params, //보낼 데이터
						// {키: 값, 키:값, ...} - > json
						
						success : function(result){
							if(result.res == "SUCCESS"){
								closePopup(cdepth);
								makeAlert(cdepth+1, str+" 성공", str+"되었습니다.", null);
								getlist(4);
							} else{
								makeAlert(cdepth+1, str+" 오류", str+"에 실패하였습니다.", null);
							}
						} , 
						error : function(request,status,error) {
							console.log("status : "+request.status);
							console.log("text : "+request.responseText);
							console.log("error : "+error);
						}
						
					});
				}
				
		},"취소", function() {
			closePopup(cdepth);
		}); 
	 	
}

//상품 분류데이터 가져오기 
function getitemcate (result1,ck) {
	 if(result1 != null ){
	 	var params = $("#itemForm").serialize() + "&NOW_M_CATE=" + result1.data.IT_M_GROUP_NO;
	 } else {
	    var params = $("#itemForm").serialize();
	 }
		$.ajax({
			type : "post", //데이터 전송방식
			url : "getitemcateAjax" , //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// {키: 값, 키:값, ...} - > json
			
			success : function(result){
				
				if(result1 != null ){
					drawitemMcate(result.Mlist,result1);
					drawitemScate(result.Slist,result1);
				} else if (ck == 1) {
					drawitemMcate(result.Mlist,null,ck);
				} else if($("#IT_M_GROUP_NO").val() >= 0){
					drawitemScate(result.Slist);
				} else {
					drawitemMcate(result.Mlist);
				} ;
				
			} , 
			error : function(request,status,error) {
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
			
		});
}
//상품 코드 Draw
function drawitemMcate(Mlist,result1,ck) {
	var html ="";
	html += `<option value="-1">상품분류</option>`
	for(var i in Mlist){
		if (result1 != null) {
			if (Mlist[i].CODE_M_CATE == result1.data.IT_M_GROUP_NO){
				html += `<option value="` + Mlist[i].CODE_M_CATE + `" selected="selected" >` + Mlist[i].CODE_NAME + `</option>`
			} else{
				html += `<option value="` + Mlist[i].CODE_M_CATE + `">` + Mlist[i].CODE_NAME + `</option>`
			}
		} else {
			html += `<option value="` + Mlist[i].CODE_M_CATE + `">` + Mlist[i].CODE_NAME + `</option>`
		}
	}
	if(ck == 1) {
		$("#IT_M_GROUP_NO1").html(html);
	} else if (ck == null){
		$("#IT_M_GROUP_NO").html(html);
	}
}
//상품 코드 Draw
function drawitemScate(Slist,result1) {
	var html ="";
	html += `<option value="-1">상품명</option>`
	for(var i in Slist){
		if (result1 != null) {
			if (Slist[i].CODE_S_CATE == result1.data.IT_S_GROUP_NO){
				console.log("체크");
				html += `<option value="` + Slist[i].CODE_S_CATE + `" selected="selected" >` + Slist[i].CODE_NAME + `</option>`
			} else{
				html += `<option value="` + Slist[i].CODE_S_CATE + `">` + Slist[i].CODE_NAME + `</option>`
			} 
		} else {
			html += `<option value="` + Slist[i].CODE_S_CATE + `">` + Slist[i].CODE_NAME + `</option>`
		}
	}
	
	$("#IT_S_GROUP_NO").html(html);
}


//거래처 메서드
function Compfun (depth) {
	var html = "";
	html += `<form id="popactionForm" action="#" method="post">`;
	html += `<table class="pop_table">`;
	html += `	<colgroup>            `;
	html += `		<col width="20%"> `;
	html += `		<col width="80%"> `;
	html += `	</colgroup>           `;
	html += `	<tbody>               `;
	html += `		<tr>              `;
	html += `			<td class="field_name first_field_name">검색어</td> `;
	html += `			<td class="field_contents">                         `;
	html += `				<select class="input_size pxsize100" name="searchGbn" id="searchGbn">  `;
	html += `					<option value="0" selected="selected">전체</option>                `;
	html += `					<option value="1">거래처 구분</option>                                  `;
	html += `					<option value="2">거래처명</option>                                  `;
	html += `					<option value="3">담당자</option>                                `;
	html += `				</select>                                                              `;
	html += `				<input class="input_size size60" type="text" id="getcomplist" name="searchTxt">   `;
	html += `				<input type="button" class="btn_normal btn_size_normal" id="pop_Search_Btn" name="getcomplist" value="검색"/>`;
	html += `			</td>`;
	html += `		</tr> `;
	html += `	</tbody>  `;
	html += `</table>     `;
	html += `<br>`;
	html += `</form>`;
	html += `<form id="popdataForm" action="#" method="post">`;
	html += `<table class="table_list pop_list widthscroll" id="comp_list">                `;
	html += `	<thead class="thead_scroll ">           `;
	html += `		<tr class="table_list_header">     `;
	html += `			<td width="80px" nowrap>      `;
	html += `				<div class="squaredOne_h"> `;
	html += `					<input type="checkbox" value="None" class="list_chbox comp" style="display : none;" id="pop_chk_all"  />`;
	html += `					<label for="pop_chk_all"  ></label>`; 
	html += `				</div>`;
	html += `			</td>`;
	html += `			<td width="95px" nowrap>수정</td>     `;
	html += `			<td width="120px" nowrap>담당자</td>`;
	html += `			<td width="120px" nowrap>거래처 구분</td>`;
	html += `			<td width="130px" nowrap>거래처명</td>    `;
	html += `			<td width="150px" nowrap>사업자번호</td>    `;
	html += `			<td width="110px" nowrap>대표자명</td>   `;
	html += `			<td width="110px" nowrap>업태</td>      `;
	html += `			<td width="110px" nowrap>종목</td>   `;
	html += `			<td width="300px" nowrap>주소</td>  `;
	html += `			<td width="140px" nowrap>전화1</td>`;
	html += `			<td width="140px" nowrap>전화2</td>   `;
	html += `			<td width="140px" nowrap>핸드폰</td>     `;
	html += `			<td width="140px" nowrap>팩스</td>     `;
	html += `			<td width="140px" nowrap>이메일</td> `;
	html += `			<td width="180px" nowrap>사이트</td>   `;
	html += `			<td width="100px" nowrap>메모</td>   `;
	html += `			<td width="130px" nowrap>등록일</td>   `;
	html += `			<td width="130px" nowrap>거래일</td>   `;
	html += `		</tr>                                              `;
	html += `	</thead>                                               `;
	html += `	<tbody class="tbody_scroll sscroll">                           `;
	html += `	</tbody>                                               `;
	html += `</table>                                                  `;
	html += `</form>`;
	if (depth == null) {
		depth = 1;
	} else {
		
	}
	makeThreeBtnPopup(depth, "거래처 코드 목록", html, false, 900, 700, function() {
		getlist(3);
		$("#popdataForm").slimScroll({
			width : "880px",
			height: "500px",
			axis: 'both'
		});
	}
	, "등록", function() {
		make_comp_pop(1, "거래처 등록",depth+1);
	},"삭제", function() {
		var params = $("#popdataForm").serialize();
		if (depth == null) {
			depth = 2;
		} else {
			depth += 1;
		}
		listdel(depth ,"거래처 ",400,200,"popactionForm","compdelAjax","getlist3",params);
	},"취소", function() {
		if (depth == null) {
			depth = 1;
		}
		closePopup(depth);
	});
	
	
}
//거래처 리스트 Draw
function drawcompList(list) {
	var html = "";
	if(list.length > 0) {
		for(var i in list) {
			html += `<tr class="list_contents" name="`+list[i].CP_NO+`_`+list[i].CP_NM+`">                                                                              `;
			html += `	<td width="80px" nowrap style="cursor : default;" class="chk_td">                                                                             `;
			html += `		<div class="squaredOne">                                                                                              `;
			html += `			<input type="checkbox" class="list_chbox" value="`+list[i].CP_NO+`" style="display : none;" id="chk_`+list[i].CP_NO+`" name="comp" />   `;
			html += `			<label class="chbox_lbl" for="chk_`+list[i].CP_NO+`"></label>                                                                         `;
			html += `		</div>                                                                                                                `;
			html += `	</td>                                                                                                                     `;
			html += `	<td  width="95px" nowrap style="cursor : default;"><input name="`+list[i].CP_NO+`"type="button" class="pop_update" id="comp_no" value="수정"/></td>                                `;
			html += `			<td width="120px" nowrap>`+list[i].EMP_NM+`</td>   `;
			html += `			<td width="120px" nowrap>`+list[i].CP_TYPE+`</td>`;
			html += `			<td width="130px" nowrap>`+list[i].CP_NM+`</td>`;
			html += `			<td width="150px" nowrap>`+list[i].CP_BIZ_NO+`</td>    `;
			html += `			<td width="110px" nowrap>`+list[i].CP_BIZ_NM+`</td>    `;
			html += `			<td width="110px" nowrap>`+list[i].CP_BIZ+`</td>   `;
			html += `			<td width="110px" nowrap>`+list[i].CP_EVENT+`</td>      `;
			html += `			<td width="300px" nowrap>`+list[i].CP_ADD+` `+list[i].CP_ADD_DETAIL+`</td>`
			html += `			<td width="140px" nowrap>`+list[i].CP_PH1+`</td>  `;
			html += `			<td width="140px" nowrap>`+list[i].CP_PH2+`</td>`;
			html += `			<td width="140px" nowrap>`+list[i].CP_PH+`</td>   `;
			html += `			<td width="140px" nowrap>`+list[i].CP_FAX+`</td>     `;
			html += `			<td width="140px" nowrap>`+list[i].CP_EMAIL+`</td>     `;
			html += `			<td width="180px" nowrap>`+list[i].CP_WEBSITE+`</td> `;
			html += `			<td width="100px" nowrap>`+list[i].CP_MEMO+`</td>   `;
			html += `			<td width="130px" nowrap>`+list[i].CP_DATE+`</td>   `;
			html += `			<td width="130px" nowrap>`+list[i].TDATE+`</td>   `
			html += `</tr>                                                                                                                        `
		}            
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"4\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	}
	
	$("#comp_list tbody").html(html);
	
	$(".sscroll").slimScroll({
		width : "100%",
		height: "450px"
	});
}


//거래처 등록, 수정 
function make_comp_pop(ck, str,depth ,result1) {
	var ajax = "";
	if (ck == 1) {
		ajax = "compcodeAddAjax";
	} else if (ck == 2) {
		ajax = "compcodeUpdateAjax";
	} 
	var html ="";
		html += `	<form id="compForm" action="#" method="post"> `
		html += `		<input name="comp_no" id="comp_no" type="hidden">`
		html += `		<table class="pop_table">`
		html += `			<colgroup>`
		html += `				<col width="15%">`
		html += `				<col width="35%">`
		html += `				<col width="15%">`
		html += `				<col width="35%">`
		html += `			</colgroup>`
		html += `			<tbody>`
		html += `				<tr>`
		html += `					<td class="field_name first_field_name">거래처명<span class="acc_txt"> *</span></td>`
		html += `					<td class="field_contents">`
		html += `						<input class="input_normal" id="cp_nm" name="cp_nm"  type="text">`
		html += `					</td>`
		html += `                    <td class="field_name">`
		html += `                    	담당자<span class="acc_txt"> *</span>`
		html += `                    </td>`
		html += `                    <td class="field_contents">`
		html += `                    	<input class="input_size size40" type="text" id="emp_nm" name="emp_nm">`
		html += `                    	<input type="hidden" id="emp_no" name="emp_no">`
		html += `						<input type="button" class="btn_normal btn_size_normal" id="cust_Search_btn" value="검색"/>`
		html += `                    </td>`
		html += `				</tr>`
		html += `				<tr>`
		html += `					<td class="field_name first_field_name">`
		html += `						거래처 구분<span class="acc_txt"> *</span>`
		html += `					</td>`
		html += `					<td class="field_contents" colspan="3" >`
		html += `						<label><input type="radio" value="매출처" checked="checked" name="cp_type">매출처</label>`
		html += `						<label><input type="radio" value="매입처"  name="cp_type">매입처</label>`
		html += `						<label><input type="radio" value="기타거래처" name="cp_type">기타거래처</label>`
		html += `					</td>`
		html += `				</tr>`
		html += `				<tr>`
		html += `					<td class="field_name first_field_name">사업자번호<span class="acc_txt"> *</span></td>`
		html += `					<td class="field_contents">`
		html += `						 <input type="text" class="input_normal" id="cp_biz_no" name="cp_biz_no" maxlength="12" />`
		html += `					</td>`
		html += `					<td class="field_name first_field_name">대표자명<span class="acc_txt"> *</span></td>`
		html += `					<td class="field_contents">`
		html += `						<input class="input_normal" id="cp_biz_nm" name="cp_biz_nm" type="text">`
		html += `					</td>`
		html += `				</tr>`
		html += `				<tr>`
		html += `					<td class="field_name first_field_name">업태<span class="acc_txt"> *</span></td>`
		html += `					<td class="field_contents">`
		html += `						<input class="input_normal" type="text" id="cp_biz" name="cp_biz">`
		html += `					</td>`
		html += `					<td class="field_name first_field_name">종목<span class="acc_txt"> *</span></td>`
		html += `					<td class="field_contents">`
		html += `						<input class="input_normal" type="text" id="cp_event" name="cp_event">`
		html += `					</td>`
		html += `				</tr>`
		html += `				 <tr>`
		html += `                    <td class="field_name first_field_name">주소<span class="acc_txt"> *</span></td>`
		html += `                    <td class="field_contents" colspan="3">`
		html += `                        <div class="address_margin">`
		html += `                            <input type="text" class="input_short input_readonly postcodify_postcode5" id="cp_add_no" name="cp_add_no" readonly="readonly" placeholder="우편번호"/>`
		html += `                            <input type="button" class="btn_normal btn_size_normal " id="searchAddrBtn" value="검색"/>`
		html += `                        </div>`
		html += `                        <div class="address_margin">`
		html += `                            <input type="text" class="input_normal input_readonly postcodify_address" id="cp_add" name="cp_add" readonly="readonly" placeholder="주소"/>`
		html += `                        </div>`
		html += `                        <div>`
		html += `                        	<input type="text" class="input_normal postcodify_details" id="cp_add_detail" name="cp_add_detail" placeholder="상세주소"/>`
	    html += `                    	</div>`
		html += `                    </td>`
	    html += `            	</tr>`
		html += `				 <tr>`
		html += `                    <td class="field_name first_field_name">전화1</td>`
		html += `                    <td class="field_contents">`
		html += `                        <input type="text" class="input_normal txt_client_ph" id="cp_ph1" name="cp_ph1" maxlength="14"/>`
		html += `                    </td>`
		html += `                    <td class="field_name">전화2</td>`
		html += `                    <td class="field_contents">`
		html += `                        <input type="text" class="input_normal txt_client_ph" id="cp_ph2" name="cp_ph2" maxlength="14"/>`
		html += `                    </td>`
		html += `                </tr>`
		html += `				 <tr>`
		html += `                    <td class="field_name first_field_name">핸드폰<span class="acc_txt"> *</span>`
		html += `                    <td class="field_contents">`
		html += `                        <input type="text" class="input_normal txt_client_ph" id="cp_ph" name="cp_ph" maxlength="14"/>`
		html += `                    </td>`
		html += `                    <td class="field_name">FAX</td>`
		html += `                    <td class="field_contents">`
		html += `                        <input type="text" class="input_normal txt_client_ph" id="cp_fax" name="cp_fax" maxlength="14"/>`
		html += `                    </td>`
		html += `                </tr>`
		html += `                <tr>`
		html += `                    <td class="field_name first_field_name">이메일<span class="acc_txt"> *</span></td>`
		html += `                    <td class="field_contents">`
		html += `                       <input type="text" class="input_normal" id="cp_email" name="cp_email"/>`
		html += `                    </td>`
		html += `                    <td class="field_name">홈페이지</td>`
		html += `                    <td class="field_contents">`
		html += `                         <input type="text" class="input_normal" id="cp_website" name="cp_website" />`
		html += `                    </td>`
		html += `                </tr>`
		html += `                <tr>`
		html += `                    <td class="field_name first_field_name">메모</td>`
		html += `                    <td class="field_contents" colspan="3">`
		html += `                        <textarea class="textarea_normal" id="cp_memo" name="cp_memo"></textarea>`
		html += `                    </td>`
		html += `                </tr>`
		html += `			</tbody>`
		html += `		</table>`
		html += `	</form>`
		makeTwoBtnPopup(depth, str, html, true, 700, 700, function() {
			$("#cp_biz_no").on("keyup keypress", function() {
				var num = $(this).val();
				var ph_num = num.replace(/[^0-9]/g, "").replace(/([0-9]{3})([0-9]{2})([0-9]{5})/,"$1-$2-$3").replace("--", "-");
				$(this).val(ph_num);
			}); 
			//텍스트 숫자 포맷팅
			$("#cust_grade_lvl").on("keyup", function() {
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			//전화번호 텍스트 포맷팅
			$(".txt_client_ph").on("keyup", function() {
				inputNumberFormat(this);
			});
			// 주소api
		    $("#searchAddrBtn").postcodifyPopUp();
			
			$("input[name=cp_type]:radio").change(function() {
				var value = $('input:radio[name="cp_type"]:checked').val();
				console.log(value);
				console.log($("input[name=cp_type]:checked").val());
			});
		}, str , function() {
				var params = $("#compForm").serialize();
			
				$.ajax({
					type : "post", //데이터 전송방식
					url : ajax , //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// {키: 값, 키:값, ...} - > json
					
					success : function(result){
						if(result.res == "SUCCESS"){
							closePopup(depth);
							makeAlert(depth+1, str+" 성공", str+"되었습니다.", null);
							getlist(3);
						} else{
							makeAlert(depth+1, str+" 오류", str+"에 실패하였습니다.", null);
						}
					} , 
					error : function(request,status,error) {
						console.log("status : "+request.status);
						console.log("text : "+request.responseText);
						console.log("error : "+error);
					}
					
				});
		},"취소", function() {
			closePopup(depth);
		}); 
	 	
	 	if(ck == 2) {
	 		$("#comp_no").val(result1.data.CP_NO);
	 		$("#emp_nm").val(result1.data.EMP_NM);
	 		$("#emp_no").val(result1.data.EMP_NO);
	 		$('input:radio[name="cp_type"][value="+result1.data.CP_TYPE+"]').attr('checked', true);
	 		$("#cp_nm").val(result1.data.CP_NM);
	 		$("#cp_biz_no").val(result1.data.CP_BIZ_NO);
	 		$("#cp_biz_nm").val(result1.data.CP_BIZ_NM);
	 		$("#cp_biz").val(result1.data.CP_BIZ);
	 		$("#cp_event").val(result1.data.CP_EVENT);
	 		$("#cp_add_no").val(result1.data.CP_ADD_NO);
	 		$("#cp_add").val(result1.data.CP_ADD);
	 		$("#cp_add_detail").val(result1.data.CP_ADD_DETAIL);
	 		$("#cp_ph1").val(result1.data.CP_PH1);
	 		$("#cp_ph2").val(result1.data.CP_PH2);
	 		$("#cp_ph").val(result1.data.CP_PH);
	 		$("#cp_fax").val(result1.data.CP_FAX);
	 		$("#cp_email").val(result1.data.CP_EMAIL);
	 		$("#cp_website").val(result1.data.CP_WEBSITE);
	 		$("#cp_memo").val(result1.data.CP_MEMO);
	 	} 
	 	
}


//고객,직원 등급 메서드
function Gradefun (ck) {
	var html = "";
	html += `<form id="popactionForm" action="#" method="post">`;
	html += `<table class="pop_table">`;
	html += `	<colgroup>            `;
	html += `		<col width="20%"> `;
	html += `		<col width="80%"> `;
	html += `	</colgroup>           `;
	html += `	<tbody>               `;
	html += `		<tr>              `;
	html += `			<td class="field_name first_field_name">검색어</td> `;
	html += `			<td class="field_contents">                         `;
	if (ck == 1) {
		html += `				<input class="input_size size60" type="text" id="getcustgradelist" name="searchTxt">   `;
		html += `				<input type="button" class="btn_normal btn_size_normal" id="pop_Search_Btn" name="getcustgradelist" value="검색"/>`;
	} else if( ck == 2) {
		html += `				<input class="input_size size60" type="text" id="getempgradelist" name="searchTxt">   `;
		html += `				<input type="button" class="btn_normal btn_size_normal" id="pop_Search_Btn" name="getempgradelist" value="검색"/>`;
	}
	html += `			</td>`;
	html += `		</tr> `;
	html += `	</tbody>  `;
	html += `</table>     `;
	html += `<br>`;
	html += `</form>`;
	html += `<form id="popdataForm" action="#" method="post">`;
	html += `<table class="table_list pop_list" id="grade_list">                `;
	html += `	<thead class="thead_scroll">           `;
	html += `		<tr class="table_list_header">     `;
	html += `			<td  width="80px" nowrap>      `;
	html += `				<div class="squaredOne_h"> `;
	html += `					<input type="checkbox" value="None" class="list_chbox grade" style="display : none;" id="pop_chk_all"  />`;
	html += `					<label for="pop_chk_all"  ></label>`; 
	html += `				</div>`;
	html += `			</td>`;
	html += `			<td  width="95px" nowrap>수정</td>     `;
	html += `			<td  width="75px" nowrap>레벨</td>               `;
	html += `			<td  width="130px" nowrap>등급명</td>             `;
	html += `		</tr>                                              `;
	html += `	</thead>                                               `;
	html += `	<tbody class="tbody_scroll sscroll" style="height : 300px !important">                           `;
	html += `	</tbody>                                               `;
	html += `</table>                                                  `;
	html += `</form>`;
	var str = "";
	if (ck == 1) {
		str = "고객 등급";
	} else if( ck == 2) {
		str = "직원 등급"
	}
	makeThreeBtnPopup(1, str, html, false, 400, 600, function() {
		getlist(ck);
	}
	, "등록", function() {
		if (ck == 1) {
			make_custgrade_pop(1,"고객 등급 등록");
		} else if( ck == 2) {
			make_custgrade_pop(3,"직원 등급 등록");
		}
		
	},"삭제", function() {
		var params = $("#popdataForm").serialize();
		if (ck == 1) {
			listdel(2,"고객 등급",400,200,"popactionForm","custgradedelAjax","getlist1",params);
		} else if( ck == 2) {
			listdel(2,"직원 등급",400,200,"popactionForm","empgradedelAjax","getlist2",params);
		}
	},"취소", function() {
		closePopup(1);
	});
}
//고객,직원 등급 리스트 Draw
function drawgradeList(ck,list) {
	var html = "";
	if(list.length > 0) {
		
		for(var i in list) {
			html += `<tr class="list_contents" name="`+list[i].GRADE_NO+`">                                                                              `;
			html += `	<td width="80px" nowrap style="cursor : default;" class="chk_td">                                                                             `;
			html += `		<div class="squaredOne">                                                                                              `;
			html += `			<input type="checkbox" class="list_chbox" value="`+list[i].GRADE_NO+`" style="display : none;" id="chk_`+list[i].GRADE_NO+`" name="grade" />   `;
			html += `			<label class="chbox_lbl" for="chk_`+list[i].GRADE_NO+`"></label>                                                                         `;
			html += `		</div>                                                                                                                `;
			html += `	</td>                                                                                                                     `;
			if(ck == 1) {
				html += `	<td  width="95px" nowrap style="cursor : default;"><input name="`+list[i].GRADE_NO+`"type="button" class="pop_update" id="cust_g_no" value="수정"/></td>                                `;
			} else if (ck == 2) {
				html += `	<td  width="95px" nowrap style="cursor : default;"><input name="`+list[i].GRADE_NO+`"type="button" class="pop_update" id="emp_g_no" value="수정"/></td>                                `;
			}
			html += `	<td  width="75px" nowrap>`+list[i].GRADE_LEVEL+`</td>                                                                                                  `;
			html += `	<td  width="130px" nowrap>`+list[i].GRADE_NM+`</td>                                                                                                  `;
			html += `</tr>                                                                                                                        `;
		}            
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"4\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
	}
	
	$("#grade_list tbody").html(html);
	
	$(".sscroll").slimScroll({
		width : "100%",
		height: "350px"
	});
}
//고객,직원 등급 등록, 수정 
function make_custgrade_pop(ck, str ,result1) {
	var ajax = "";
	if (ck == 1) {
		ajax = "custcodeAddAjax";
	} else if (ck == 2) {
		ajax = "custcodeUpdateAjax";
	} else if ( ck == 3) {
		ajax = "empcodeAddAjax";
	} else if (ck == 4) {
		ajax = "empcodeUpdateAjax";
	}
	var html ="";
		html += `<form action="#" id="ctgForm" method="post">                                      `;
		if (ck == 1 || ck == 2) {
			html += `	<input name="cust_g_no" id="cust_g_no" type="hidden"> `;
		} else if (ck == 3 || ck == 4) {
			html += `	<input name="emp_g_no" id="emp_g_no" type="hidden" > `;
		}
		html += `	<table class="pop_table"> `;
		html += `		<colgroup>            `;
		html += `			<col width="20%"> `;
		html += `			<col width="30%"> `;
		html += `			<col width="20%"> `;
		html += `			<col width="30%"> `;
		html += `		</colgroup>           `;
		html += `		<tbody>               `;
		html += `			<tr>              `;
		html += `				<td class="field_name first_field_name">등급명</td>                                    `;
		html += `				<td class="field_contents">                                                            `;
		if (ck == 1 || ck == 2) {
			html += `<input class="input_normal" id="cust_grade_nm" name="cust_grade_nm" placeholder="등급명" type="text" >                     `;
		} else if (ck == 3 || ck == 4) {
			html += `<input class="input_normal" id="emp_grade_nm" name="emp_grade_nm" placeholder="등급명" type="text" >                     `;
		}
		html += `				</td>                                                                                  `;
		html += `				<td class="field_name">등급 레벨</td>                                                  `;
		html += `				<td class="field_contents">                                                            `;
		if (ck == 1 || ck == 2) {
			html += `<input class="input_normal" id="cust_grade_lvl" name="cust_grade_lvl" placeholder="레벨"  type="text" onkeyup="$(this).val($(this).val().replace(/[^0-9]/g, ''));" >                   `;
		} else if (ck == 3 || ck == 4) {
			html += `<input class="input_normal" id="emp_grade_lvl" name="emp_grade_lvl" placeholder="레벨" type="text"  onkeyup="$(this).val($(this).val().replace(/[^0-9]/g, ''));" >                   `;
		}
		html += `				</td> `;                                                                               
		html += `			</tr>     `;
		html += `		</tbody>      `;
		html += `	</table>          `;
		html += `</form>              `;
		makeTwoBtnPopup(2, str, html, true, 500, 200, function() {
			// 버튼 크기 자동 조절
		    $('.btn').each(function() {
		        if($(this).html().length > 2) {
		            var leng_diff = $(this).html().length - 2;
		            $(this).width($(this).width() + (10 * leng_diff) + "px");  
		        }
		    });
		}, str , function() {
				var params = $("#ctgForm").serialize();
			
				$.ajax({
					type : "post", //데이터 전송방식
					url : ajax , //주소
					dataType : "json", //데이터 전송 규격
					data : params, //보낼 데이터
					// {키: 값, 키:값, ...} - > json
					
					success : function(result){
						if(result.res == "SUCCESS"){
							closePopup(2);
							makeAlert(2, str+" 성공", str+"되었습니다.", null);
							if (ck == 1 || ck == 2) {
								getlist(1);
							} else if (ck == 3 || ck == 4) {
								getlist(2);
							}
						} else{
							makeAlert(2, str+" 오류", str+"에 실패하였습니다.", null);
						}
					} , 
					error : function(request,status,error) {
						console.log("status : "+request.status);
						console.log("text : "+request.responseText);
						console.log("error : "+error);
					}
					
				});
		},"취소", function() {
			closePopup(2);
		}); 
	 	
	 	if(ck == 2) {
	 		$("#cust_g_no").val(result1.data.GRADE_NO);
			$("#cust_grade_nm").val(result1.data.GRADE_NM);
			$("#cust_grade_lvl").val(result1.data.GRADE_LEVEL);
	 	} else if(ck == 4) {
	 		$("#emp_g_no").val(result1.data.GRADE_NO);
			$("#emp_grade_nm").val(result1.data.GRADE_NM);
			$("#emp_grade_lvl").val(result1.data.GRADE_LEVEL);
	 	}
	 	
}
/* 등급 코드  끝*/
function getLeftMenu() {
	var params = $("#locationForm").serialize();
	
	$.ajax({
		type : "post",
		url : "commonLeftMenuAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			drawLeftMenu(result.leftMenu);			
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawLeftMenu(menu) {
	var secDepthCheck = true;
	var html = "";
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].MENU_DEPTH == 1) {
			if(menu[i].CNT > 0) { //하위메뉴 존재 시
				html += "<div class=\"first_menu_wrap\">";
				
				html += "<div class=\"first_menu\" menuno=\"" + menu[i].MENU_NO + "\">";
				html += "<div>";
				html += "<div class=\"menu_txt\">" + menu[i].MENU_NAME + "</div>";
				html += "<div class=\"menu_gbn\"></div>";
				html += "</div>";
				html += "</div>";
				
				html += "<div class=\"second_menu_wrap\">";
				
				for(var j = 0 ; j < menu.length ; j++) {
					if(menu[i].MENU_NO == menu[j].TOP_MENU_NO) {
						if(menu[j].MENU_NO == $("#menuNo").val()) { //현재 메뉴 구분
							html += "<div class=\"second_menu_on\" menuno=\"" + menu[j].MENU_NO + "\" ";
							if(typeof menu[j].MENU_ADDR != "undefined") { 
								html += " addr=\"" + menu[j].MENU_ADDR + "\">";
							} else {
								html += ">";
							}
							
							html += "<div>" + menu[j].MENU_NAME + "</div>";
							html += "</div>";
						} else {
							html += "<div class=\"second_menu\" menuno=\"" + menu[j].MENU_NO + "\" ";
							if(typeof menu[j].MENU_ADDR != "undefined") { 
								html += " addr=\"" + menu[j].MENU_ADDR + "\">";
							} else {
								html += ">";
							}
							html += "<div>" + menu[j].MENU_NAME + "</div>";
							html += "</div>";
						}
					}
				}
				html += "</div>";
				
				html += "</div>";
				
			} else { //하위메뉴 없을 시
				if(menu[i].MENU_NO == $("#menuNo").val()) { //현재 메뉴 구분
					html += "<div class=\"first_menu_on\" menuno=\"" + menu[i].MENU_NO + "\" addr=\"" + menu[i].MENU_ADDR + "\">";
					html += "<div>";
					html += "<div class=\"menu_txt\">" + menu[i].MENU_NAME + "</div>";
					html += "</div>";
					html += "</div>";
					
					secDepthCheck = false;
				} else {
					html += "<div class=\"first_menu\" menuno=\"" + menu[i].MENU_NO + "\" addr=\"" + menu[i].MENU_ADDR + "\">";
					html += "<div>";
					html += "<div class=\"menu_txt\">" + menu[i].MENU_NAME + "</div>";
					html += "</div>";
					html += "</div>";
				}
			}
		}
	} // menu for end
	
	$(".menu_wrap").html(html);

	var flow = [];
	
	for(var i = 0 ; i < menu.length ; i++) {
		if(menu[i].MENU_NO == $("#menuNo").val()) {
			flow = menu[i].MENU_FLOW.split(",");
			
			if(secDepthCheck) {
				$("[menuno='" + menu[i].TOP_MENU_NO + "']").parent().attr("class", "first_menu_wrap_on");
			}
			break;
		}
	}
	
	var gnb = "";
	
	for(var i = 0 ; i < menu.length ; i++) {
		for(var j = 0 ; j < flow.length ; j++) {
			if(menu[i].MENU_NO == flow[j]) {
				gnb += " > " + menu[i].MENU_NAME;
			}
		}
	}
	
	$("#gnb_txt").html(gnb);
}
</script>
<form action="#" id="locationForm" method="post">
		<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
	</form>
	<div class="left_wrap">
		<div class="logo_wrap">
			<div>
				<img src="resources/images/Eimages/EasysShopLogo.PNG"> EASYS SHOP
			</div>
		</div>
		<div class="menu_wrap">
		</div>
	</div>
	<!-- 우측 -->
	<div class="right_wrap">
		<div class="gnb_wrap">
			<div class="gnb_area">
				<div>
					<div>Home<span id="gnb_txt"></span></div>
				</div>
			</div>
			<div class="person_area">
				<div class="p_img"></div>
				<div class="p_info">
					<div>
						<div>
							${sEmpName} ${sEmpPosiName}<br />${sTeamName}
						</div>
					</div>
				</div>
				<div class="p_btn_area">
					<div class="p_btn">
						<div>
							<div>정보수정</div>
						</div>
					</div>
					<div class="p_btn_space"></div>
					<div class="p_btn" id="logoutBtn">
						<div>
							<div>로그아웃</div>
						</div>
					</div>
				</div>
			</div>
		</div>