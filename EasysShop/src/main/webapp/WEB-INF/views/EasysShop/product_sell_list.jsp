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
	reloadSellList();
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
		html += `		<col width="15%">`
		html += `		<col width="35%">`
		html += `	</colgroup>`
		html += `	<tbody>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">판매일자<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left ">`
		html += `				<input type="date" class="input_size ml10" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">고객명</td>`
		html += `			<td class="text_align_left ">`
		html += `				<input class="input_size pxsize100 ml10" type="text">` 
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" value="검색" />`
		html += `			</td>`
		html += `			<td class="field_name">담당자<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left ">`
		html += `			<select	class="input_size pxsize100 ml10">`
		html += `				<option selected="selected">담당자</option>`
		html += `				<option>기타경비</option>`
		html += `				<option>기타매출</option>`
		html += `				<option>기타잡비</option>`
		html += `				<option>시술매출</option>`
		html += `				<option>상품매출</option>`
		html += `				<option>상품매입</option>`
		html += `				<option>식비</option>`
		html += `				<option>급료</option>`
		html += `				<option>임차료</option>`
		html += `				<option>자산매입</option>`
		html += `				<option>자산매각</option>`
		html += `			</select>` 
		html += `			<input type="button" class="btn_normal btn_size_normal ml10" value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">상품명<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left ">`
		html += `				<input class="input_size pxsize400 ml10" type="text">`
		html += `				<input type="button" class="btn_normal btn_size_normal ml10" value="검색" />`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name ">수량<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left "><input`
		html += `				class="input_size size80 ml10 text_align_right" type="text">개</td>`
		html += `			<td class="field_name">단가</td>`
		html += `			<td class="text_align_left "><input`
		html += `				class="input_size pxsize195 ml10 text_align_right" type="text"></td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">요금분류<span class="important_text">*</span></td>`
		html += `			<td colspan="3" class="text_align_left "><select`
		html += `				class="input_size pxsize150 ml10">`
		html += `					<option selected="selected">분류를 선택해주세요</option>`
		html += `					<option>신용카드</option>`
		html += `					<option>영수증</option>`
		html += `					<option>현금연수증</option>`
		html += `					<option>세금계산서</option>`
		html += `					<option>기타</option>`
		html += `			</select></td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">금액<span class="important_text">*</span></td>`
		html += `			<td class="text_align_left "><input`
		html += `				class="input_size size80 ml10 text_align_right" type="text"></td>`
		html += `			<td colspan="2">`
		html += `				<div class="size100 text_align_left text_indent50">`
		html += `					공급가<input type="text"`
		html += `						class="input_small_size ml10 text_align_right pxsize200" />`
		html += `				</div>`
		html += `				<div class="size100 text_align_left text_indent50">`
		html += `					부가세<input type="text" class="input_small_size ml10 text_align_right pxsize200" />`
		html += `				</div>`
		html += `			</td>`
		html += `		</tr>`
		html += `		<tr class="height50">`
		html += `			<td class="field_name">메모</td>`
		html += `			<td colspan="3"><textarea class="size80 textarea_normal"></textarea></td>`
		html += `		</tr>`
		html += `	</tbody>`
		html += `</table>`
		
		makeTwoBtnPopup(1, "판매 등록", html,  true, 600, 510, null, "등록", function() {
			makeAlert(2, "하이", "내용임", null);
		},"취소", function() {
			closePopup(1);
		});
	})
	
});
function reloadSellList(){
	$.ajax({
		type : "post",
		url : "sellListAjax",
		success : function(result) {
			drawSellList(result.list);
		},
		error : function(request, status, error) {
			console.log("text : " + request.responseText);
			console.log("error : " + error);
		}
	});
}
function drawSellList(list){
	var html = "";
	if(list.length == 0){
		html += `<tr style="height: 100px;">`
		html += `	<td>조회된 데이터가 없습니다.</td>`
		html += `</tr>`
	} else {
		for(var i in list){
			html += `<tr class="list_contents">`
			html += `	<td style="cursor : default;" class="w60">`
			html += `		<div class="squaredOne">`
			html += `			<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />`
			html += `			<label for="table_procedure_squaredOne1"></label>`
			html += `		</div>`
			html += `	</td>`
			html += `	<td class="w60"><input type="button" value="수정"/></td>`
			html += `	<td class="w60">` + list[i].SAL_NO + `</td>`
			html += `	<td>` + list[i].SAL_DATE + `</td>`
			html += `	<td>` + list[i].EMP_NM + `</td>`
			html += `	<td>` + list[i].CT_NM + `</td>`
			html += `	<td>` + list[i].IT_NM + `</td>`
			html += `	<td>` + list[i].SAL_MONEY_TYPE + `</td>`
			html += `	<td>` + list[i].SAL_AMT + `</td>`
			html += `	<td>` + list[i].PT_SAVE + `</td>`
			html += `	<td>` + list[i].PT_DD + `</td>`
			html += `	<td>` + ((typeof list[i].SAL_MEMO == "undefined") ? "" : list[i].SAL_MEMO) + `</td>`
			html += `</tr>`
		}
	}
	$("#productList").html(html);
	
}
</script>
</head>
<body>
	<c:import url="/pop"></c:import>
	<c:import url="/topLeft">
		<c:param name="menuNo">5</c:param>
	</c:import>
	<div class="title_area">판매 관리</div>
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
						<input class="input_size pxsize150" name="endDate" type="date" id="endDate"value="">
					</div>
					<div class="top_title_area size35">
						<input class="input_size pxsize200" type="text" placeholder="예약자/연락처/담당자/예약내용">
						<input type="button" class="btn_normal btn_size_normal" value="검색"/>
					</div>
					<div class="top_btn_area size25">
						<input type="button" class="btn_normal btn_size_normal" id="btn_reg" value="등록"/>
<!-- 						<input type="button" class="btn_normal btn_size_normal" id="btn_update" value="수정"/> -->
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
						<tr class="table_list_header" style="height: 30px; !important"  >
							<td rowspan="2" class="w60">
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
									<label for="pop_PC_checkall"></label>
								</div>
							</td>
<!-- 							<td rowspan="2">수정</td> -->
							<td rowspan="2" class="w60">수정</td>
							<td rowspan="2" class="w60">NO</td>
							<td colspan="2">판매정보</td>
							<td colspan="2">고객정보</td>
							<td colspan="4">요금정보</td>
							<td rowspan="2">메모</td>
						</tr>
						<tr class="table_list_header" style="height: 30px; !important"  >
							<td>판매일</td>
							<td>담당자</td>
							<td>고객명</td>
							<td>상품명</td>
							<td>요금구분</td>
							<td>요금</td>
							<td>적립포인트</td>
							<td>사용포인트</td>
						</tr>
						</thead>
				<!-- 테이블 상단 부분 끝-->
				<!-- 테이블 내용 부분 시작 -->
						<tbody id="productList" class="tbody_scroll">
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