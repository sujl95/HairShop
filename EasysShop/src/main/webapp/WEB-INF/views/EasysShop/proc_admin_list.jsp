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
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" id="btn_srchEmp"  value="검색" />`
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
			html += `	<td class="w60"><input type="button" value="수정"/></td>`;
			html += `	<td class="w60">` + list[i].PROC_NO + `</td>`;
			html += `	<td>` + list[i].PROC_DATE + `</td>`;
			html += `	<td class="w70">` + list[i].CT_NM +`</td>`;
			html += `	<td>` + list[i].CODE_NAME +`</td>`;
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
}

function reloadClient(){
	var params = $("#actionForm").serialize();
	$.ajax({
		type : "post",
		url : "procListAjax",
		dataType : "json",
		data : params,
		success : function(result) {
			redrawList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
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
		html += `					<option value="` + mList[i].CODE_S_CATE + `">` + mList[i].CODE_NAME + `</option>`
	}
	
	$("#mCate").html(html);
	
}

function drawSCate(sList){
	var html = "";
	
	html += `					<option>시술명</option>`
		
	for(var i in sList){
		html += `					<option>` + sList[i].CODE_NAME + `</option>`
	}
		
	$("#sCate").html(html);
	
}

</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">4</c:param>
	</c:import>
	
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
<!-- 							<tr class="list_contents"> -->
<!-- 								<td style="cursor : default;" class="w60"> -->
<!-- 									<div class="squaredOne"> -->
<!-- 										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" /> -->
<!-- 										<label for="table_procedure_squaredOne1"></label> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 								<td class="w60"><input type="button" value="수정"/></td> -->
<!-- 								<td class="w60">1</td> -->
<!-- 								<td>2019-12-22</td> -->
<!-- 								<td class="w70">박희재</td> -->
<!-- 								<td>매직스트레이트(펌)</td> -->
<!-- 								<td>박희재</td> -->
<!-- 								<td>현금</td> -->
<!-- 								<td>100,000</td> -->
<!-- 								<td>1,000</td> -->
<!-- 								<td>1,000</td> -->
<!-- 								<td>100,000</td> -->
<!-- 								<td>220일</td> -->
<!-- 							</tr> -->
<!-- 							<tr class="list_contents"> -->
<!-- 								<td colspan="13" style="height: 120px;">조회된 데이터가 없습니다.</td> -->
<!-- 							</tr> -->
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