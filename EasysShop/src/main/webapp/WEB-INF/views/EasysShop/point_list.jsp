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
	reloadPtList();
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
		
		html += `<table class="pop_table table_list tborder">`
		html += `	<colgroup>`
		html += `		<col width="15%">`
		html += `		<col width="35%">`
		html += `	</colgroup>`
		html += `	<tbody>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">고객명<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left">`
		html += `				<input class="input_size pxsize120 ml10" type="text"/>`
		html += `				<input type="button" class="btn_normal btn_size_w60h30 ml10" style="margin-left: 15px;" value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">적립/차감</td>`
		html += `			<td class="text_align_left">`
		html += `				<input type="radio" name="point" checked="checked" value="1" class="ml10"/> 적립`
		html += `				<input type="radio" name="point" value="2" class="ml10"/> 차감`
		html += `				<input type="button" class="btn_normal btn_size_w60h30" id="btn_assign" style="margin-left: 27px; !important" value="양도" />`
		html += `			</td>`	
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">포인트<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left">`
		html += `				<input class="input_size pxsize200 ml10" type="text"/>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">내역<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left">`
		html += `				<input class="input_size pxsize200 ml10" type="text"/>`
		html += `			</td>`
		html += `		</tr>`
		html += `	</tbody>`
		html += `</table>`
		
		makeTwoBtnPopup(1, "포인트 등록/차감", html, true, 300, 300, null, "등록", function() {
			makeAlert(2, "하이", "내용임", null);
		},"취소", function() {
			closePopup(1);
		});
		
		
		$("#btn_assign").on("click",function(){
			html = "";
			html += `<table class="pop_table table_list tborder">`
			html += `	<colgroup>`
			html += `		<col width="15%">`
			html += `		<col width="35%">`
			html += `	</colgroup>`
			html += `	<tbody>`
			html += `		<tr class="height50">`
			html += `			<td class="field_name">고객명<span class="important_text">*</span></td>`
			html += `			<td class="text_align_left">`
			html += `				<input class="input_size pxsize120 ml10" type="text"/>`
			html += `				<input type="button" class="btn_normal btn_size_w60h30 ml10" value="검색" />`
			html += `			</td>`
			html += `		</tr>`
			html += `		<tr class="height50">`
			html += `			<td class="field_name">보유 포인트</td>`
			html += `			<td class="text_align_left">`
			html += `				<input class="input_size pxsize200 ml10" type="text"/>`
			html += `			</td>`
			html += `		</tr>`
			html += `		<tr class="height100 text_align_center">`
			html += `			<div class=""></div>`
			html += `			<div class="ml10"></div>`
			html += `		</tr>`
			html += `		<tr class="height50">`
			html += `			<td class="field_name">고객명<span class="important_text">*</span></td>`
			html += `			<td class="text_align_left">`
			html += `				<input class="input_size pxsize120 ml10" type="text"/>`
			html += `				<input type="button" class="btn_normal btn_size_w60h30 ml10" value="검색" />`
			html += `			</td>`
			html += `		</tr>`
			html += `		<tr class="height50">`
			html += `			<td class="field_name">인수 포인트</td>`
			html += `			<td class="text_align_left">`
			html += `				<input class="input_size pxsize200 ml10" type="text"/>`
			html += `			</td>`
			html += `		</tr>`
			html += `		<tr class="height50">`
			html += `			<td class="field_name">양도 내용</td>`
			html += `			<td class="text_align_left">`
			html += `				<input class="input_size pxsize200 ml10" type="text"/>`
			html += `			</td>`
			html += `		</tr>`
			html += `	</tbody>`
			html += `</table>`
			
			makeTwoBtnPopup(2, "포인트 등록/차감", html, true, 300, 450, null, "양도", function() {
				makeAlert(3, "하이", "내용임", null);
			},"취소", function() {
				closePopup(2);
			});
		});
	})

});
function reloadPtList() {
	$.ajax({
		type : "post",
		url : "pointListAjax",
		success : function(result) {
			drawPtList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function drawPtList(list){
	var html = "";	
	if(list.length == 0){
		html += `<tr style="height: 100px;">`
		html += `	<td>조회된 데이터가 없습니다.</td>`
		html += `</tr>`
	} else {
		for(var i in list){
			html += `<tr class="list_contents" id="` + list[i].PT_NO +`">`
			html += `	<td style="cursor : default;" class="w70">`
			html += `		<div class="squaredOne">`
			html += `			<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />`
			html += `			<label for="table_procedure_squaredOne1"></label>`
			html += `		</div>`
			html += `	</td>`
			html += `	<td class="w70"><input type="button" value="수정"/></td>`
			html += `	<td>` + list[i].PT_NO +`</td>`
			html += `	<td>` + list[i].PT_DATE +`</td>`
			html += `	<td>` + list[i].CT_NM +`</td>`
			html += `	<td>` + list[i].PT_BRD +`</td>`
			html += `	<td>` + list[i].PT_SAVE +`</td>`
			html += `	<td>` + list[i].PT_DD +`</td>`
			html += `</tr>`
		}
	}
	$("#pointList").html(html);
}
</script>
</head>
<body>
	<c:import url="/pop"></c:import>
	<c:import url="/topLeft">
		<c:param name="menuNo">2</c:param>
	</c:import>
	<div class="title_area">포인트 관리</div>
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
					<input class="input_size pxsize150" name="startDate" id="startDate" type="date" value="">
					~
					<input class="input_size pxsize150" name="endDate"  type="date" id="endDate"value="">
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
				<table class="table_list tborder" id="pop_Procedure_list" >
					<thead class="thead_scroll">
					<tr class="table_list_header" style="height: 35px; !important"  >
						<td class="w70">
							<div class="squaredOne_h">
								<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
								<label for="pop_PC_checkall"></label>
							</div>
						</td>
						<td class="w70">수정</td>
						<td>NO</td>
						<td>일시</td>
						<td>고객명</td>
						<td>내역</td>
						<td>적립금액</td>
						<td>사용금액</td>
					</tr>
					</thead>
			<!-- 테이블 상단 부분 끝-->
			<!-- 테이블 내용 부분 시작 -->
					<tbody class="tbody_scroll" id="pointList">
<!-- 						<tr class="list_contents"> -->
<!-- 							<td style="cursor : default;" class="w70"> -->
<!-- 								<div class="squaredOne"> -->
<!-- 									<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" /> -->
<!-- 									<label for="table_procedure_squaredOne1"></label> -->
<!-- 								</div> -->
<!-- 							</td> -->
<!-- 							<td class="w70"><input type="button" value="수정"/></td> -->
<!-- 							<td>1</td> -->
<!-- 							<td>2019-12-22</td> -->
<!-- 							<td>박희재</td> -->
<!-- 							<td>매직스트레이트(펌)</td> -->
<!-- 							<td>박희재</td> -->
<!-- 							<td>1,000</td> -->
<!-- 						</tr> -->
							
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