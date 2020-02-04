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
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".table_list_header > td, .list_contents > td").css("padding", "0");
	
	
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
});

function reloadList(){
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
function redrawList(list) {
	var html = "";
	if (list.length == 0) {
	} else {
		html += `<tr class="list_contents">`;
		html += `	<td style="cursor : default;">`;
		html += `		<div class="squaredOne">`;
		html += `			<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />`;
		html += `			<label for="table_procedure_squaredOne1"></label>`;
		html += `		</div>`;
		html += `	</td>`;
		html += `	<td><input type="button" value="수정"/></td>`;
		html += `	<td>1</td>`;
		html += `	<td>2019-12-22</td>`;
		html += `	<td>박희재</td>`;
		html += `	<td>매직스트레이트(펌)</td>`;
		html += `	<td>박희재</td>`;
		html += `	<td>현금</td>`;
		html += `	<td>100,000</td>`;
		html += `	<td>1,000</td>`;
		html += `	<td>1,000</td>`;
		html += `	<td>100,000</td>`;
		html += `	<td>220일</td>`;
		html += `</tr>`;
	}
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
						<colgroup>
							<col width="1%"><!-- 체크박스 -->
							<col width="2%"><!-- 수정 -->
							<col width="1%"><!-- NO -->
							<col width="4%"><!-- 시술날짜 -->
							<col width="4%"><!-- 고객명 -->
							<col width="6%"><!-- 시술명 -->
							<col width="4%"><!-- 디자이너 -->
							<col width="3%"><!-- 구분 -->
							<col width="3%"><!-- 요금 -->
							<col width="5%"><!-- 적립포인트 -->
							<col width="5%"><!-- 사용포인트 -->
							<col width="4%"><!-- 총합계금 -->
							<col width="5%"><!-- 경과일 -->
						</colgroup>
						<thead class="thead_scroll">
						<tr class="table_list_header" style="height: 30px !important; padding:0;"  >
							<td rowspan="2">
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
									<label for="pop_PC_checkall"></label>
								</div>
							</td>
							<td rowspan="2">수정</td>
							<td rowspan="2">NO</td>
							<td rowspan="2">시술날짜</td>
							<td rowspan="2">고객명</td>
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
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td><input type="button" value="수정"/></td>
								<td>1</td>
								<td>2019-12-22</td>
								<td>박희재</td>
								<td>매직스트레이트(펌)</td>
								<td>박희재</td>
								<td>현금</td>
								<td>100,000</td>
								<td>1,000</td>
								<td>1,000</td>
								<td>100,000</td>
								<td>220일</td>
							</tr>
							<tr class="list_contents">
								<td colspan="13" style="height: 120px;">조회된 데이터가 없습니다.</td>
							</tr>
							<tr></tr>
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