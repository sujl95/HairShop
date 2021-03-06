<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents Test</title>
<c:import url="/header"></c:import>
<style type="text/css">
.table_list_header > td, .list_contents td {
	padding: 0 !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	
	$("#alertBtn").on("click", function() {
		makeAlert(1, "하이", "내용임", null);
	});
	
	$("#oneBtn").on("click", function() {
		makeOneBtnPopup(1, "버튼하나팝업", "내용들감", true, 400, 200, null, "하이", function() {
			closePopup(1);
		});
	});
	
	$("#twoBtn").on("click", function() {
		makeTwoBtnPopup(1, "버튼둘팝업", "내용들감", true, 600, 400, null, "어라라", function() {
			makeAlert(2, "하이", "내용임", null);
		},"하이", function() {
			closePopup(1);
		});
	});
	
	$("#threeBtn").on("click", function() {
		makeThreeBtnPopup(1, "버튼셋팝업", "내용들감", false, 400, 600, null, "어라라", function() {
			closePopup(1);
		},"하이", function() {
			closePopup(1);
		},"마지막", function() {
			closePopup(1);
		});
	});
	
	$("#btn_reg").on("click",function(){
		var html = "";
		html += `<form action="#" method="post" id="popForm">`
		html += `<table class="pop_table table_list tborder">`
		html += `	<colgroup>`
		html += `		<col width="15%">`
		html += `		<col width="50%">`
		html += `		<col width="15%">`
		html += `		<col width="35%">`
		html += `	</colgroup>`
		html += `	<tbody>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">시술날짜<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left ">`
		html += `				<input type="date" class="input_size ml10" />`
		html += `				<select class="input_size pxsize60 ml10">`
		html += `					<option>시</option>`
		html += `					<option>1시</option>`
		html += `					<option>2시</option>`
		html += `					<option>3시</option>`
		html += `					<option>4시</option>`
		html += `					<option>5시</option>`
		html += `					<option>6시</option>`
		html += `				</select>`
		html += `				<select class="input_size pxsize60 ml10">`
		html += `					<option>분</option>`
		html += `					<option>10분</option>`
		html += `					<option>20분</option>`
		html += `					<option>30분</option>`
		html += `					<option>40분</option>`
		html += `					<option>50분</option>`
		html += `				</select>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">고객명</td>`
		html += `			<td colspan="1" class="text_align_left ">`
		html += `				<input class="input_size pxsize100 ml10" type="text">` 
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchCt" value="검색" />`
		html += `			</td>`
		html += `			<td colspan="2" rowspan="2" class="pxsize120">`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">디자이너<span class="important_text">*</span></td>`
		html += `			<td colspan="1" class="text_align_left ">`
		html += `				<input class="input_size pxsize100 ml10" type="text">`
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchEmp"  value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">시술명<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left">`
		html += `				<select class="input_size pxsize100 ml10" id="mCate" name="mCate">`
		html += `					<option value="-1" selected="selected" >시술분류</option>`
		html += `				</select>`
		html += `				<select class="input_size pxsize100 ml10" id="sCate" name="sCate">`
		html += `					<option value="-1">시술명</option>`
		html += `				</select>`
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchProc"  value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">요금구분<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left" colspan="3">`
		html += `				<select class="input_size pxsize310 ml10">`
		html += `					<option selected="selected">분류를 선택해주세요</option>`
		html += `					<option>현금</option>`
		html += `					<option>신용카드</option>`
		html += `					<option>서비스</option>`
		html += `				</select>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">금액<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left" colspan="3">`
		html += `				<input class="input_size pxsize310 ml10 text_align_right" type="text" id="proc_price">`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">메모</td>`
		html += `			<td colspan="3"><textarea class="size80 textarea_normal"></textarea></td>`
		html += `		</tr>`
		html += `	</tbody>`
		html += `</table>`
		html += `</form>`
		
		makeTwoBtnPopup(1, "시술코드 등록", html, true, 430, 510, function(){
			procCate();
			$("#mCate").change(function(){
				procCate();
			});
			$("#sCate").change(function(){
				$("#proc_price").val($("#sCate option:selected").attr("id"));
			});
			
		}, "등록", function() {
			makeAlert(2, "하이", "내용임", null);
		},"취소", function() {
			closePopup(1);
		});
		
		$("#btn_srchCt").on("click",function(){
			makeAlert(2, "하이", "내용임", null);
		});
		$("#btn_srchEmp").on("click",function(){
			makeAlert(2, "하이", "내용임", null);
		});
		
		$("#btn_srchProc").on("click",function(){
			procSrch();
			
		});
		
	});
});

function reloadList(){
	$.ajax({
		type : "post",
		url : "procListAjax",
		success : function(result) {
			redrawList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function redrawList(list) {
	var html = "";
	if (list.length == 0) {
		html += `<tr class="list_contents">`;
		html += `	<td colspan="13" style="height: 120px;">조회된 데이터가 없습니다.</td>`;
		html += `</tr>`;
	} else {
		for(var i in list){
			html += `<tr class="list_contents">`;
			html += `	<td style="cursor : default;" class="w60">`;
			html += `		<div class="squaredOne">`;
			html += `			<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />`;
			html += `			<label for="table_procedure_squaredOne1"></label>`;
			html += `		</div>`;
			html += `	</td>`;
			html += `	<td class="w60"><input type="button" value="수정" id="btn_procModify"/></td>`;
			html += `	<td class="w60">` + list[i].PROC_NO + `</td>`;
			html += `	<td>` + list[i].PROC_DATE + `</td>`;
			html += `	<td class="w70">` + list[i].CT_NM +`</td>`;
			html += `	<td>` + list[i].PCC_NAME +`</td>`;
			html += `	<td>` + list[i].EMP_NM +`</td>`;
			html += `	<td>` + list[i].PROC_MONEY_TYPE +`</td>`;
			html += `	<td>` + list[i].PROC_MONEY +`</td>`;
			html += `	<td>` + list[i].PT_SAVE +`</td>`;
			html += `	<td>` + list[i].PT_DD +`</td>`;
			html += `	<td>100,000</td>`;
			html += `	<td>220일</td>`;
			html += `</tr>`;
		}
	}
	$(".tbody_scroll").html(html);
	
	$("tr").on("click","#btn_procModify",function(){
		var html = "";
		html += `<form action="#" method="post" id="popForm">`
		html += `<table class="pop_table table_list tborder">`
		html += `	<colgroup>`
		html += `		<col width="15%">`
		html += `		<col width="50%">`
		html += `		<col width="15%">`
		html += `		<col width="35%">`
		html += `	</colgroup>`
		html += `	<tbody>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">시술날짜<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left ">`
		html += `				<input type="date" class="input_size ml10" />`
		html += `				<select class="input_size pxsize60 ml10">`
		html += `					<option>시</option>`
		html += `					<option>1시</option>`
		html += `					<option>2시</option>`
		html += `					<option>3시</option>`
		html += `					<option>4시</option>`
		html += `					<option>5시</option>`
		html += `					<option>6시</option>`
		html += `				</select>`
		html += `				<select class="input_size pxsize60 ml10">`
		html += `					<option>분</option>`
		html += `					<option>10분</option>`
		html += `					<option>20분</option>`
		html += `					<option>30분</option>`
		html += `					<option>40분</option>`
		html += `					<option>50분</option>`
		html += `				</select>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">고객명</td>`
		html += `			<td colspan="1" class="text_align_left ">`
		html += `				<input class="input_size pxsize100 ml10" type="text">` 
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchCt" value="검색" />`
		html += `			</td>`
		html += `			<td colspan="2" rowspan="2" class="pxsize120">`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">디자이너<span class="important_text">*</span></td>`
		html += `			<td colspan="1" class="text_align_left ">`
		html += `				<input class="input_size pxsize100 ml10" type="text">`
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchEmp"  value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">시술명<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left">`
		html += `				<select class="input_size pxsize100 ml10" id="mCate" name="mCate">`
		html += `					<option value="-1" selected="selected" >시술분류</option>`
		html += `				</select>`
		html += `				<select class="input_size pxsize100 ml10" id="sCate" name="sCate">`
		html += `					<option value="-1">시술명</option>`
		html += `				</select>`
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchProc"  value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">요금구분<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left" colspan="3">`
		html += `				<select class="input_size pxsize310 ml10">`
		html += `					<option selected="selected">분류를 선택해주세요</option>`
		html += `					<option>현금</option>`
		html += `					<option>신용카드</option>`
		html += `					<option>서비스</option>`
		html += `				</select>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">금액<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left" colspan="3">`
		html += `				<input class="input_size pxsize310 ml10 text_align_right" type="text">`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">메모</td>`
		html += `			<td colspan="3"><textarea class="size80 textarea_normal"></textarea></td>`
		html += `		</tr>`
		html += `	</tbody>`
		html += `</table>`
		html += `</form>`
		
		makeTwoBtnPopup(1, "시술코드 등록", html, true, 430, 510, function(){
			procCate();
			$("#mCate").change(function(){
				procCate();
			});
				
			$("#sCate").change(function(){
				$("#proc_price").val($("#sCate option:selected").attr("id"));
			});
			
			$("#btn_srchProc").on("click",function(){
				procSrch();
			});
		}, "수정", function() {
			makeAlert(2, "하이", "내용임", null);
		},"취소", function() {
			closePopup(1);
		});
	});
}

function reloadClient(){
// 	var params = $("#actionForm").serialize();
// 	$.ajax({
// 		type : "post",
// 		url : "procListAjax",
// 		dataType : "json",
// 		data : params,
// 		success : function(result) {
// 			redrawList(result.list);
// 		},
// 		error : function(request, status, error) {
// 			console.log("text : " + request.responseText);
// 			console.log("error : " + error);
// 		}
// 	});
}

function drawClient(mList, sList){
	 
}

function procCate(){
	var params = $("#popForm").serialize();
	$.ajax({
		type : "post",
		url : "procCateAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			if($("#mCate").val() >= 0){
				drawSCate(result.sList);
			} else {
				drawMCate(result.mList);
			};
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawMCate(mList){
	var html = "";
	
	html += `					<option value="-1">시술분류</option>`
	for(var i in mList){
		html += `					<option value="` + mList[i].PCC_S_CATE + `">` + mList[i].PCC_NAME + `</option>`
	}
	
	$("#mCate").html(html);
	
}

function drawSCate(sList){
	var html = "";
	
	html += `					<option>시술명</option>`
		
	for(var i in sList){
		html += `					<option value="` + sList[i].PCC_S_CATE + `" id="` + sList[i].PCC_PRICE + `">` + sList[i].PCC_NAME + `</option>`
	}
		
	$("#sCate").html(html);
	
}

function procSrch(){
	var html = "";
	html += `<div class="pop_btn_bottom_area">`
	html += `	<input type="button" class="btn_normal btn_size_normal" value="등록"/>`
	html += `	<input type="button" class="btn_normal btn_size_normal" value="삭제"/>`
	html += `</div>`
	html += `<table class="pop_table">`
	html += `	<colgroup>`
	html += `		<col width="20%">`
	html += `		<col width="80%">`
	html += `	</colgroup>`
	html += `	<tbody>`
	html += `		<tr>`
	html += `			<td class="field_name first_field_name">검색어</td>`
	html += `			<td class="field_contents">`
	html += `				<input class="input_size size60" type="text">`
	html += `				<input type="button" class="btn_normal btn_size_normal" value="검색"/>`
	html += `			</td>`
	html += `		</tr>`
	html += `	</tbody>`
	html += `</table>`
	html += `<table class="table_list tborder" id="pop_Procedure_list" >`
	html += `	<colgroup>`
	html += `		<col width="5%">`
	html += `		<col width="15%">`
	html += `		<col width="25%">`
	html += `		<col width="15%">`
	html += `		<col width="20%">`
	html += `		<col width="20%">`
	html += `	</colgroup>`
	html += `	<thead>`
	html += `	<tr class="table_list_header" >`
	html += `		<td rowspan="2">`
	html += `			<div class="squaredOne_h">`
	html += `				<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />`
	html += `				<label for="pop_PC_checkall"  ></label> <!-- squaredOne 같이? -->`
	html += `			</div>`
	html += `		</td>`
	html += `		<td rowspan="2">그룹명</td>`
	html += `		<td colspan="2">기본정보</td>`
	html += `		<td colspan="2">적립정보</td>`
	html += `	</tr>`
	html += `	<tr class="table_list_header" >`
	html += `		<td>시술명</td>`
	html += `		<td>요금</td>`
	html += `		<td>현금적립포인트</td>`
	html += `		<td>카드적립포인트</td>`
	html += `	</tr>`
	html += `	</thead>`
	html += `</table>`
	html += `<div class="pop_code_contents">`
	html += `<div class="pop_Procedure_list">`
	html += `<table class="table_list tborder" id="pop_Procedure_list" >`
	html += `	<colgroup>`
	html += `		<col width="6%">`
	html += `		<col width="17%">`
	html += `		<col width="25%">`
	html += `		<col width="15%">`
	html += `		<col width="20%">`
	html += `		<col width="20%">`
	html += `	</colgroup>`
	html += `	<tbody id="procCode">`
	html += `	</tbody>`
	html += `</table>`
	html += `</div>`
	html += `</div>`
// 		html += `		<tr rowspan="2">수정</td>`<input type="button" value="수정" id="btn_procCodeModify"/>`
	makeNoBtnPopup(2, "시술 코드 목록", html, true, 600, 600, null);
	
	reloadProcCode();
}

function reloadProcCode(){
	$.ajax({
		type : "post",
		url : "procCodeListAjax",
		success : function(result) {
			drawCode(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}

function drawCode(list){
	
	var html = "";
	if(list.length == 0){
		
	} else {
		for(var i in list){
			if(i == 0){
				html += `		<tr class="list_contents">`
				html += `			<td style="cursor: default;">`
				html += `				<div class="squaredOne">`
				html += `					<input type="checkbox" value="None" style="display: none;"`
				html += `						id="pop_PC_squaredOne1" name="pop_PC_check" /> <label`
				html += `						for="pop_PC_squaredOne1"></label>`
				html += `				</div>`
				html += `			</td>`
				html += `			<td rowspan="` + list[i].CNT + `">` + list[i].PCC_L_NM + `</td>`
				html += `			<td>` + list[i].PCC_S_NM + `</td>`
				html += `			<td>` + list[i].PCC_PRICE + `</td>`
				html += `			<td>` + list[i].PCC_CASH_PT + `</td>`
				html += `			<td>` + list[i].PCC_CARD_PT + `</td>`
				html += `		</tr>`	
			} else if(list[i].PCC_L_CATE != list[i-1].PCC_L_CATE){
				html += `		<tr class="list_contents">`
				html += `			<td style="cursor: default;">`
				html += `				<div class="squaredOne">`
				html += `					<input type="checkbox" value="None" style="display: none;"`
				html += `						id="pop_PC_squaredOne1" name="pop_PC_check" /> <label`
				html += `						for="pop_PC_squaredOne1"></label>`
				html += `				</div>`
				html += `			</td>`
				html += `			<td rowspan="` + list[i].CNT + `">` + list[i].PCC_L_NM + `</td>`
				html += `			<td>` + list[i].PCC_S_NM + `</td>`
				html += `			<td>` + list[i].PCC_PRICE + `</td>`
				html += `			<td>` + list[i].PCC_CASH_PT + `</td>`
				html += `			<td>` + list[i].PCC_CARD_PT + `</td>`
				html += `		</tr>`
			} else {
				html += `		<tr class="list_contents">`
				html += `			<td style="cursor: default;">`
				html += `				<div class="squaredOne">`
				html += `					<input type="checkbox" value="None" style="display: none;"`
				html += `						id="pop_PC_squaredOne1" name="pop_PC_check" /> <label`
				html += `						for="pop_PC_squaredOne1"></label>`
				html += `				</div>`
				html += `			</td>`
				html += `			<td>` + list[i].PCC_S_NM + `</td>`
				html += `			<td>` + list[i].PCC_PRICE + `</td>`
				html += `			<td>` + list[i].PCC_CASH_PT + `</td>`
				html += `			<td>` + list[i].PCC_CARD_PT + `</td>`
				html += `		</tr>`
			}
		}
	}
	$("#procCode").html(html);
	
	$(".pop_code_contents").slimScroll({
		width : "100%",
		height: "350px"
	});
}
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">4</c:param>
	</c:import>
	<!-- 시술 코드 목록 팝업 - 등록,수정팝업 -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Procedure_Code_add pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						시술 코드
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<div class="pop_schedule_contents">
					<table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tbody>
							
							<tr>
								<td class="field_name first_field_name">분류</td>
								<td class="field_contents colorred" colspan="3">
									<select class="input_size pxsize150 backcolorred"> 
										<option selected="selected">분류를 선택해주세요</option>
										<option>드라이</option>
										<option>컷</option>
										<option>펌</option>
										<option>염색</option>
										<option>크리닉</option>
										<option>기타</option>
									</select>
									해당 분류가 없으면 직접 입력해 주세요
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">시술명</td>
								<td class="field_contents">
									<input class="input_normal  backcolorred" type="text">
								</td>
								<td class="field_name first_field_name">현금적립포인트</td>
								<td>
									<input class="input_normal txtalignright" type="text">
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">요금</td>
								<td class="field_contents">
									<input class="input_normal txtalignright" type="text">
								</td>
								<td class="field_name first_field_name">카드적립포인트</td>
								<td>
									<input class="input_normal txtalignright" type="text">
								</td>
							</tr>
						</tbody>
					</table>
				<div class="pop_btn_bottom_area">
					<input type="button" class="btn_normal btn_size_normal" value="확인"/>
					<input type="button" class="btn_normal btn_size_normal" value="취소"/>
				</div>
			</div>
		</div>
	</div>
<!-- 시술 등급 목록 팝업  -->
	<div class="title_area">시술 관리</div>
	<div class="content_area">
		<div class="list_wrap">
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: bottom;">
						<input type="button" class="btn_date pxsize50" id="today" value="오늘"/>
						<input type="button" class="btn_date pxsize50" id="3days" value="3일"/>
						<input type="button" class="btn_date pxsize50" id="7days" value="7일"/>
						<input type="button" class="btn_date pxsize50" id="15days" value="15일"/>
						<input type="button" class="btn_date pxsize50" id="month" value="한달"/>
						<input type="button" class="btn_date pxsize50" id="total" value="전체"/>
					</div>
					<div class="top_btn_area size60">
					</div>
				</div>
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: top;">
						<select class="input_size pxsize100">
							<option selected="selected">전체</option>
							<option>예약자</option>
							<option>연락처</option>
							<option>담당자</option>
							<option>예약내용</option>
						</select>
						<input class="input_size pxsize150" name="datemove" id="startDate" type="date" value="">
						~
						<input class="input_size pxsize150" type="date" id="endDate"value="">
					</div>
					<div class="top_title_area size35">
						<input class="input_size pxsize200" type="text" placeholder="예약자/연락처/담당자/예약내용">
						<input type="button" class="btn_normal btn_size_normal" value="검색"/>
					</div>
					<div class="top_btn_area size25">
						<input type="button" class="btn_normal btn_size_normal" id="btn_reg" value="등록"/>
						<input type="button" class="btn_normal btn_size_normal" id="btn_del" value="삭제"/>
					</div>
				</div>
				<div class="table_top_area">
					<div class="top_title_area size25">
						<div>
							<select class="input_size pxsize100">
								<option selected="selected">10단위</option>
								<option>20단위</option>
								<option>50단위</option>
								<option>100단위</option>
							</select>
							<span id="list_cnt_all">#</span>
							개 항목중
							<span id="list_cnt_select">#</span>
							개 선택
						</div>
					</div>
					<div class="top_btn_area size75">
					</div>
				</div>
				<div class="table_area">
					<table class="table_list tborder" id="pop_Procedure_list" style="height: 100%;">
						<colgroup span="13">
						</colgroup>
						<thead class="thead_scroll">
						<tr class="table_list_header" style="height: 30px !important; padding:0;"  >
							<td rowspan="2" class="w60">
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
									<label for="pop_PC_checkall"></label>
								</div>
							</td>
							<td rowspan="2" class="w60">수정</td>
							<td rowspan="2" class="w60">NO</td>
							<td rowspan="2">시술날짜</td>
							<td rowspan="2" class="w70">고객명</td>
							<td colspan="2">시술정보</td>
							<td colspan="4">요금정보</td>
							<td rowspan="2">총합계금</td>
							<td rowspan="2">경과일</td>
						</tr>
						<tr class="table_list_header" style="height: 30px !important; padding: 0;"  >
							<td>시술명</td>
							<td>디자이너</td>
							<td>구분</td>
							<td>요금</td>
							<td>적립포인트</td>
							<td>사용포인트</td>
						</tr>
						</thead>
				<!-- 테이블 상단 부분 끝-->
				<!-- 테이블 내용 부분 시작 -->
						<tbody class="tbody_scroll sscroll">
						</tbody>
					</table>
				</div>
				<div class="list_paging_area">
					<div class="btn_paging"><<</div>
					<div class="btn_paging"><</div>
					<div class="btn_paging">1</div>
					<div class="btn_paging">2</div>
					<div class="btn_paging">3</div>
					<div class="btn_paging">4</div>
					<div class="btn_paging">5</div>
					<div class="btn_paging">></div>
					<div class="btn_paging">>></div>
				</div>
			</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>