<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간 일정 목록</title>
<c:import url="/header"></c:import>
<script type="text/javascript">
$(document).ready(function() {
	lastday();
	getcalList();
	/* 전체클릭 */
	$("#chk_all").click(function(){
    	if($("#chk_all").prop("checked")){
    		$("input[name=cal_check]").prop("checked",true);
    		//클릭이 안되있으면
    	}else{
    		$("input[name=cal_check]").prop("checked",false);
    	}
    });
	// 검색 버튼 클릭 Event
	$("#cal_Search_btn").on("click", function() {
		if(checkEmpty("#startDate")){
			makeAlert(1, "검색 안내", "검색 하실 날짜를 입력해 주세요.", function() {
			});
		} else if(checkEmpty("#endDate")){
			makeAlert(1, "검색 안내", "검색 하실 날짜를 입력해 주세요.", function() {
			});
		} else if ($("#endDate").val() < $("#startDate").val()) {
            	alert("조회 기간은 과거로 설정하세요.");
		} else {
			$("#page").val("1");
			getcalList();
		}
	});
	
	/* 체크개수 카운팅  */
	$(".table_list").on("click", ".list_chbox", function() {
		
		$("#cal_all").html($(".table_list tbody .list_chbox").length);
		$("#cal_cnt").html($(".table_list tbody .list_chbox:checked").length);
	});
	
	
	/* 체크박스 영역 제외하고 나머지tr부분 이벤트 적용 */
	$(".table_list").on("click",".cal_update" ,function(e) {
		
		var params = "&cal_no=" + $(this).attr("name");
		
		$.ajax({
			type : "post", //데이터 전송방식
			url : "getcaldataAjax", //주소
			dataType : "json", //데이터 전송 규격
			data : params, //보낼 데이터
			// {키: 값, 키:값, ...} - > json
			
			success : function(result1){
				make_calendar_pop(2,"수정",result1);
// 				var html = "";
// 				html += `<form action="#" id="calForm" method="post">`;
// 				html += "<table class=\"pop_table\" >                                                                                        ";
// 				html += "	<colgroup>                                                                                                       ";
// 				html += "		<col width=\"20%\">                                                                                          ";
// 				html += "		<col width=\"80%\">                                                                                          ";
// 				html += "	</colgroup>                                                                                                      ";
// 				html += "	<tbody>                                                                                                          ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">일시</td>                                                      ";
// 				html += "			<td class=\"field_contents\">                                                                            ";
// 				html += "				<input name=\"cal_no\" id=\"cal_no\" type=\"hidden\" value=\"${data.RV_NO}\">  ";
// 				html += "				<input class=\"input_size size45\" name=\"startDate\" id=\"calstartDate\" type=\"date\" value=\"${calult.data.RDATE}\">  ";
// 				html += `				<input class="input_size size45" name="caltime" id="caltime" value="${result.data.RTIME}" type="time">`;
// 				html += "			</td>                                                                                                    ";
// 				html += "		</tr>                                                                                                        ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">고객명</td>                                                    ";
// 				html += "			<td class=\"field_contents\">                                                                            ";
// 				html += `				<input type="hidden" name="txt_client_no" id="txt_client_no" value="${data.CT_NO}">                                                    `;
// 				html += "				<input class=\"input_size size70\" id=\"txt_client_name\" name=\"txt_client_name\" type=\"text\" value=\"${data.CT_NM}\" >                                                    ";
// 				html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
// 				html += "			</td>                                                                                                    ";
// 				html += "		</tr>                                                                                                        ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">연락처                                                         ";
// 		        html += "          <td class=\"field_contents\">                                                                             ";
// 		        html += "              <input type=\"text\" class=\"input_normal txt_client_ph\" id=\"txt_client_ph\" name=\"txt_client_ph\" value=\"${data.RV_PH}\" maxlength=\"14\" />                                   ";
// 		        html += "          </td>                                                                                                     ";
// 	            html += "      </tr>                                                                                                         ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">담당자</td>                                                    ";
// 				html += "			<td class=\"field_contents\">                                                                            ";
// 				html += "				<input class=\"input_size size70\" id=\"txt_emp_name\" name=\"txt_emp_name\" type=\"text\" value=\"${data.EMP_NM}\">                                                    ";
// 				html += `				<input type="hidden" name="emp_no" id="emp_no" value="${data.EMP_NO}">                                                    `;
// 				html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
// 				html += "			</td>                                                                                                    ";
// 				html += "		</tr>                                                                                                        ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">색상</td>                                                      ";
// 				html += "			<td class=\"field_contents\">                                                                            ";
// 				html += "				 <select class=\"input_normal inputModal\" name=\"edit-color\" value=\"${data.RV_COLOR}\" id=\"edit-color\">                         ";
// 		        html += "                  <option value=\"#D25565\" style=\"color:#D25565;\">빨간색</option>                                ";
// 		        html += "                  <option value=\"#9775fa\" style=\"color:#9775fa;\">보라색</option>                                ";
// 		        html += "                  <option value=\"#ffa94d\" style=\"color:#ffa94d;\">주황색</option>                                ";
// 		        html += "                  <option value=\"#74c0fc\" style=\"color:#74c0fc;\">파란색</option>                                ";
// 		        html += "                  <option value=\"#f06595\" style=\"color:#f06595;\">핑크색</option>                                ";
// 		        html += "                  <option value=\"#63e6be\" style=\"color:#63e6be;\">연두색</option>                                ";
// 		        html += "                  <option value=\"#a9e34b\" style=\"color:#a9e34b;\">초록색</option>                                ";
// 		        html += "                  <option value=\"#4d638c\" style=\"color:#4d638c;\">남색</option>                                  ";
// 		        html += "                  <option value=\"#495057\" style=\"color:#495057;\">검정색</option>                                ";
// 		        html += "              </select>                                                                                             ";
// 				html += "			</td>                                                                                                    ";
// 				html += "		</tr>                                                                                                        ";
// 				html += "		<tr>                                                                                                         ";
// 				html += "			<td class=\"field_name first_field_name\">일정내용</td>                                                  ";
// 				html += "			<td class=\"field_contents\">                                                                            ";
// 				html += "				<input class=\"input_normal\" name=\"txt_RV_CON\" id=\"txt_RV_CON\" type=\"text\" value=\"${data.RV_CON}\">                                                         ";
// 				html += "			</td>                                                                                                    ";
// 				html += "		</tr>                                                                                                        ";
// 				html += "	</tbody>                                                                                                         ";
// 				html += "</table>";
// 				html += `</form>`;
// 			 	makeTwoBtnPopup(1, "일정 등록", html, true, 500, 450, null, "등록", function() {
			 		
// 			 		if(checkEmpty("#startDate")) {
// 			 			makeAlert(2, "등록 안내", "날짜를 입력해 주세요.", function() {
// 							$("#startDate").focus();
// 						});
// 					} else if(checkEmpty("#caltime")) {
// 						makeAlert(2, "등록 안내", "시간를 입력해 주세요.", function() {
// 							$("#caltime").focus();
// 						});
// 					} else if($.trim($("#txt_client_name").val()) == "") {
// 						makeAlert(2, "등록 안내", "고객을 입력해 주세요.", function() {
// 						});
// 					} else if($.trim($("#txt_client_ph").val()) == "") {
// 						makeAlert(2, "등록 안내", "연락처를 입력해 주세요.", function() {
// 							$("#txt_client_ph").focus();
// 						});
// 					} else if(checkEmpty("#txt_emp_name")) {
// 						makeAlert(2, "등록 안내", "담당자를 입력해 주세요.", function() {
// 						});
// 					} else if(checkEmpty("#txt_RV_CON")) {
// 						makeAlert(2, "등록 안내", "일정 내용을 입력해 주세요.", function() {
// 							$("#txt_RV_CON").focus();
// 						});
// 					}
// 					else { 
// 						var params = $("#calForm").serialize();
					
// 						$.ajax({
// 							type : "post", //데이터 전송방식
// 							url : "calUpdateAjax", //주소
// 							dataType : "json", //데이터 전송 규격
// 							data : params, //보낼 데이터
// 							// {키: 값, 키:값, ...} - > json
							
// 							success : function(result){
// 								if(result.cal == "SUCCESS"){
// 									closePopup(1);
// 									makeAlert(2, "수정 오류", "일정 수정되었습니다.", null);
// 									getcalList();
// 								} else{
// 									makeAlert(2, "수정 오류", "일정 수정에 실패하였습니다.", null);
// 								}
// 							} , 
// 							error : function(request,status,error) {
// 								console.log("status : "+request.status);
// 								console.log("text : "+request.responseText);
// 								console.log("error : "+error);
// 							}
							
// 						});
// 					}
// 				},"취소", function() {
// 					closePopup(1);
// 				}); 
// 			 	//전화번호 텍스트 포맷팅
// 				$(".txt_client_ph").on("keyup", function() {
// 					inputNumberFormat(this);
// 				});
// 				$("#cal_no").val(result.data.RV_NO);
// 				$("#calstartDate").val(result.data.RDATE);
// 				$("#caltime").val(result.data.RTIME);
// 				$("#txt_client_no").val(result.data.CT_NO);
// 				$("#txt_client_name").val(result.data.CT_NM);
// 				$("#txt_client_ph").val(result.data.RV_PH);
// 				$("#emp_no").val(result.data.EMP_NO);
// 				$("#txt_emp_name").val(result.data.EMP_NM);
// 				$("#txt_RV_CON").val(result.data.RV_CON);
// 				$("#edit-color").val(result.data.RV_COLOR);
// 				//설렉트 색깔 바꿔주기
// 			 	$("#edit-color").change(function() {
// 			 		$("#edit-color").css("color",$(this).val());
// 		 		});
			} , 
			error : function(request,status,error) {
				console.log("status : "+request.status);
				console.log("text : "+request.responseText);
				console.log("error : "+error);
			}
			
		});
	});
	
	// 검색 엔터키 입력 Event
	$("#searchTxt").on("keypress", function(event) {
		if(event.keyCode == 13) {
			$("#cal_Search_btn").click();
			return false;
		}
	});
	// Paging 버튼 클릭 이벤트
	$(".list_paging_area").on("click", "div", function() {
		if(!isNaN($(this).attr("name") * 1)) {
			$("#page").val($(this).attr("name"));
			getcalList();
		}
	});	
	/* 일정삭제 */
	$("#calendar_del").on("click", function() {
		
		if($(".table_list tbody .list_chbox:checked").length > 0){
			makeTwoBtnPopup(1, "일정 삭제 경고", "정말 삭제하시겠습니까?", false, 400, 200, null, "확인", function() {
				var params = $("#dataForm").serialize();

				$.ajax({
					type: "post",
					url: "caldelAjax",
					dataType: "json",
					data: params,
					success: function(result) {
						getcalList();
					},
					error : function(request, status, error) {
						console.log("status : " + request.status);
						console.log("text : " + request.responseTest);
						console.log("error : " + error);
					}
				});
				
				makeAlert(1, "삭제 성공", "삭제 성공", null);	
				closePopup(1);
			}, "취소", function() {
				closePopup(1);
			});
					
		} else{
			makeAlert(1, "삭제 오류", "1개이상 체크를 해주세요", null);
		}
	});
	
	/* 일정등록 */
	$("#calendar_add").on("click", function(e) {
		make_calendar_pop(1,"등록");
    });
});
//일정 데이터 리스트 Get
function getcalList() {
	var params = $("#actionForm").serialize();

	$.ajax({
		type: "post",
		url: "getcalendarlistAjax",
		dataType: "json",
		data: params,
		success: function(result) {
			drawListPaging(result.pb);
			drawresList(result.list);
		},
		error : function(request, status, error) {
			console.log("status : " + request.status);
			console.log("text : " + request.responseTest);
			console.log("error : " + error);
		}
	});
}
// 일정 리스트 Draw
function drawresList(list) {
	var html = "";
	if(list.length > 0) {
		for(var i in list) {
			html += `<tr class="list_contents" name="`+list[i].SCD_NO+`">                                                                              `;
			html += `	<td style="cursor : default;" class="chk_td">                                                                             `;
			html += `		<div class="squaredOne">                                                                                              `;
			html += `			<input type="checkbox" class="list_chbox" value="`+list[i].SCD_NO+`" style="display : none;" id="chk_`+list[i].SCD_NO+`" name="cal_check" />   `;
			html += `			<label class="chbox_lbl" for="chk_`+list[i].SCD_NO+`"></label>                                                                         `;
			html += `		</div>                                                                                                                `;
			html += `	</td>                                                                                                                     `;
			html += `	<td style="cursor : default;"><input name="`+list[i].SCD_NO+`"type="button" class="cal_update" value="수정"/></td>                                `;
			html += `	<td>`+list[i].SCD_NO+`</td>                                                                                                  `;
			html += `	<td>`+list[i].SDATE+`</td>                                                                                                  `;
			html += `	<td>`+list[i].STIME+`</td>                                                                                                  `;
			html += `	<td>`+list[i].EMP_NM+`</td>                                                                                                  `;
			html += `	<td>`+list[i].SCD_CON+`</td>                                                                                                  `;
			html += `</tr>                                                                                                                        `;
		}                                                                                                                                         
		
		var cal_allcnt = list.length;
		$("#cal_cnt").html(0);
		$("#cal_all").html(cal_allcnt);
		$("input[type=checkbox]").prop("checked",false);
	}
	else {
		html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
		html += "<td colspan=\"9\">조회된 데이터가 없습니다.</td>";
		html += "</tr>";
		$(".list_paging_area").html("");
	}
	$(".table_list>tbody").html(html);
}
//Paging draw
function drawListPaging(pb) {
	var html = "";
	html += "<div class=\"btn_paging\" name=\"1\">&lt;&lt;</div>";

	html += "<div class=\"btn_paging\"name=\"";
	html += ($("#page").val() == "1")? "1" : ($("#page").val() * 1 - 1);
	html += "\">&lt;</div>";

	for(var i = pb.startPcount; i <= pb.endPcount; i++) {		
		html += "<div class=\"btn_paging";
		html += ($("#page").val() == i)? "_on\">" : "\" name=\"" + i + "\">";
		html += i + "</div>";
	}
	
	html += "<div class=\"btn_paging\"name=\"";
	html += ($("#page").val() == (pb.maxPcount))? pb.maxPcount : ($("#page").val() * 1 + 1);
	html += "\">&gt;</div>";

	html += "<div class=\"btn_paging\" name=\"" + pb.maxPcount + "\">&gt;&gt;</div>";
	
	$(".list_paging_area").html(html);
	
}
//마지막일 계산
function lastday() {
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
}
function caladdpopset() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("#calstartDate").val(yyyy+"-"+mm+"-"+dd);
	
}
function make_calendar_pop(ck, str ,result1) {
	
	var calajax = (ck == 1) ? "calAddAjax"  : "calUpdateAjax"; 
	console.log(calajax);
	var html = "";
  	html += `<form action="#" id="calForm" method="post">`;
  	html += `  <table class="pop_table" >                                                                             `;
	html += `	<colgroup>                                                                                            `;
	html += `		<col width="20%">                                                                                 `;
	html += `		<col width="80%">                                                                                 `;
	html += `	</colgroup>                                                                                           `;
	html += `	<tbody>                                                                                               `;
	html += `		<tr>                                                                                              `;
	html += `			<td class="field_name first_field_name">일정 시작일</td>                                             `;
	html += `			<td class="field_contents">                                                                   `;
	html += `				<input class="input_size pxsize130" name="startDate" id="calstartDate" type="date" value="">`;
	html += `				<select class="input_size pxsize100" name="scheSHtime">                                                     `;
	html += `					<option value="00" selected="selected" >오전 12시</option>                                        `;
	html += `					<option value="01">오전 01시</option>                                                            `;
	html += `					<option value="02">오전 02시</option>                                                            `;
	html += `					<option value="03">오전 03시</option>                                                            `;
	html += `					<option value="04">오전 04시</option>                                                            `;
	html += `					<option value="05">오전 05시</option>                                                            `;
	html += `					<option value="06">오전 06시</option>                                                            `;
	html += `					<option value="07">오전 07시</option>                                                            `;
	html += `					<option value="08">오전 08시</option>                                                            `;
	html += `					<option value="09">오전 09시</option>                                                            `;
	html += `					<option value="10">오전 10시</option>                                                            `;
	html += `					<option value="11">오전 11시</option>                                                            `;
	html += `					<option value="12">오후 12시</option>                                                            `;
	html += `					<option value="13">오후 01시</option>                                                            `;
	html += `					<option value="14">오후 02시</option>                                                            `;
	html += `					<option value="15">오후 03시</option>                                                            `;
	html += `					<option value="16">오후 04시</option>                                                            `;
	html += `					<option value="17">오후 05시</option>                                                            `;
	html += `					<option value="18">오후 06시</option>                                                            `;
	html += `					<option value="19">오후 07시</option>                                                            `;
	html += `					<option value="20">오후 08시</option>                                                            `;
	html += `					<option value="21">오후 09시</option>                                                            `;
	html += `					<option value="22">오후 10시</option>                                                            `;
	html += `					<option value="23">오후 11시</option>                                                            `;
	html += `				</select>                                                                                 `;
	html += `				<select class="input_size pxsize100" name="scheSMtime">                                                     `;
	html += `					<option value="00" selected="selected" >00분</option>                                             `;
	html += `					<option value="10">10분</option>                                                                 `;
	html += `					<option value="20">20분</option>                                                                 `;
	html += `					<option value="30">30분</option>                                                                 `;
	html += `					<option value="40">40분</option>                                                                 `;
	html += `					<option value="50">50분</option>                                                                 `;
	html += `				</select>                                                                                 `;
	html += `			</td>                                                                                         `;
	html += `		</tr>                                                                                             `;
	html += `		<tr>                                                                                              `;
	html += `			<td class="field_name first_field_name">일정 종료일</td>                                             `;
	html += `			<td class="field_contents">                                                                   `;
	html += `				<input class="input_size pxsize130" name="endDate" id="calendDate" type="date" value="">`;
	html += `				<select class="input_size pxsize100 "  name="scheEHtime">                                                     `;
	html += `					<option value="00" selected="selected">오전 12시</option>                                        `;
	html += `					<option value="01">오전 01시</option>                                                            `;
	html += `					<option value="02">오전 02시</option>                                                            `;
	html += `					<option value="03">오전 03시</option>                                                            `;
	html += `					<option value="04">오전 04시</option>                                                            `;
	html += `					<option value="05">오전 05시</option>                                                            `;
	html += `					<option value="06">오전 06시</option>                                                            `;
	html += `					<option value="07">오전 07시</option>                                                            `;
	html += `					<option value="08">오전 08시</option>                                                            `;
	html += `					<option value="09">오전 09시</option>                                                            `;
	html += `					<option value="10">오전 10시</option>                                                            `;
	html += `					<option value="11">오전 11시</option>                                                            `;
	html += `					<option value="12">오후 12시</option>                                                            `;
	html += `					<option value="13">오후 01시</option>                                                            `;
	html += `					<option value="14">오후 02시</option>                                                            `;
	html += `					<option value="15">오후 03시</option>                                                            `;
	html += `					<option value="16">오후 04시</option>                                                            `;
	html += `					<option value="17">오후 05시</option>                                                            `;
	html += `					<option value="18">오후 06시</option>                                                            `;
	html += `					<option value="19">오후 07시</option>                                                            `;
	html += `					<option value="20">오후 08시</option>                                                            `;
	html += `					<option value="21">오후 09시</option>                                                            `;
	html += `					<option value="22">오후 10시</option>                                                            `;
	html += `					<option value="23">오후 11시</option>                                                            `;
	html += `				</select>                                                                                 `;
	html += `				<select class="input_size pxsize100"  id="scheEMtime"name="scheEMtime">                                                     `;
	html += `					<option value="00" selected="selected">00분</option>                                             `;
	html += `					<option value="10">10분</option>                                                                 `;
	html += `					<option value="20">20분</option>                                                                 `;
	html += `					<option value="30">30분</option>                                                                 `;
	html += `					<option value="40">40분</option>                                                                 `;
	html += `					<option value="50">50분</option>                                                                 `;
	html += `				</select>                                                                                 `;
	html += `			</td>                                                                                         `;
	html += `		</tr>                                                                                             `;
	html += `		<tr>                                                                                              `;
	html += `			<td class="field_name first_field_name">담당자</td>                                           `;
	html += `			<td class="field_contents">                                                                   `;
	html += `				<input class="input_size size70" id="txt_emp_name" name="txt_emp_name"  type="text">                                             `;
	html += `				<input id="txt_emp_no" name="txt_emp_no"  type="hidden">                                             `;
	html += `				<input type="button" class="btn_normal btn_size_normal" value="검색"/>                    `;
	html += `			</td>                                                                                         `;
	html += `		</tr>                                                                                             `;
	html += "		<tr>                                                                                                         ";
	html += "			<td class=\"field_name first_field_name\">연락처                                                         ";
    html += "          <td class=\"field_contents\">                                                                             ";
    html += "              <input type=\"text\" class=\"input_normal txt_client_ph\" id=\"txt_emp_ph\" name=\"txt_emp_ph\" maxlength=\"14\" />                                   ";
    html += "          </td>                                                                                                     ";
    html += "      </tr>                                                                                                         ";
	html += `		<tr>                                                                                              `;
	html += `			<td class="field_name first_field_name">색상</td>                                             `;
	html += `			<td class="field_contents">                                                                   `;
	html += `				 <select class="input_normal inputModal" style="color:#D25565;" name="edit-color" style="" id="edit-color">                    `;
    html += `                    <option value="#D25565" style="color:#D25565;">빨간색</option>                       `;
    html += `                    <option value="#9775fa" style="color:#9775fa;">보라색</option>                       `;
    html += `                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>                       `;
    html += `                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>                       `;
    html += `                    <option value="#f06595" style="color:#f06595;">핑크색</option>                       `;
    html += `                    <option value="#63e6be" style="color:#63e6be;">연두색</option>                       `;
    html += `                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>                       `;
    html += `                    <option value="#4d638c" style="color:#4d638c;">남색</option>                         `;
    html += `                    <option value="#495057" style="color:#495057;">검정색</option>                       `;
    html += `                </select>                                                                                `;
	html += `			</td>                                                                                         `;
	html += `		</tr>                                                                                             `;
	html += `		                                                                                                  `;
	html += `		<tr>                                                                                              `;
	html += `			<td class="field_name first_field_name">일정내용</td>                                         `;
	html += `			<td class="field_contents">                                                                   `;
	html += `				<input class="input_normal" id="txt_SCD_CON" name="txt_SCD_CON" type="text">                                                  `;
	html += `			</td>                                                                                         `;
	html += `		</tr>                                                                                             `;
	html += `	</tbody>                                                                                              `;
	html += `</table>                                                                                                 `;
	html += `</form>`;
	
								
 	makeTwoBtnPopup(1, "일정 "+str, html, true, 500, 450, null, str , function() {
 		if(checkEmpty("#startDate")) {
 			makeAlert(2, str+" 안내", "날짜를 입력해 주세요.", function() {
				$("#startDate").focus();
			});
		} else if(checkEmpty("#caltime")) {
			makeAlert(2, str+" 안내", "시간를 입력해 주세요.", function() {
				$("#caltime").focus();
			});
		} else if($.trim($("#txt_client_name").val()) == "") {
			makeAlert(2, str+" 안내", "고객을 입력해 주세요.", function() {
			});
		} else if($.trim($("#txt_client_ph").val()) == "") {
			makeAlert(2, str+" 안내", "연락처를 입력해 주세요.", function() {
				$("#txt_client_ph").focus();
			});
		} else if(checkEmpty("#txt_emp_name")) {
			makeAlert(2, str+" 안내", "담당자를 입력해 주세요.", function() {
			});
		} else if(checkEmpty("#txt_RV_CON")) {
			makeAlert(2, str+" 안내", "일정 내용을 입력해 주세요.", function() {
				$("#txt_RV_CON").focus();
			});
		}
		else { 
			var params = $("#calForm").serialize();
		
			$.ajax({
				type : "post", //데이터 전송방식
				url : calajax , //주소
				dataType : "json", //데이터 전송 규격
				data : params, //보낼 데이터
				// {키: 값, 키:값, ...} - > json
				
				success : function(result){
					if(result.cal == "SUCCESS"){
						closePopup(1);
						makeAlert(2, str+" 오류", "일정 "+str+"되었습니다.", null);
						getcalList();
					} else{
						makeAlert(2, str+" 오류", "일정 "+str+"에 실패하였습니다.", null);
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
		closePopup(1);
	}); 
 	caladdpopset();
 	//전화번호 텍스트 포맷팅
	$(".txt_client_ph").on("keyup", function() {
		inputNumberFormat(this);
	});
 	
 	if(ck == 2) {
 		$("#cal_no").val(result1.data.SCD_NO);
		$("#calstartDate").val(result1.data.SDATE);
		$("#caltime").val(result1.data.STIME);
		$("#txt_emp_ph").val(result1.data.EMP_PH);
		$("#txt_emp_no").val(result1.data.EMP_NO);
		$("#txt_emp_name").val(result1.data.EMP_NM);
		$("#txt_SCD_CON").val(result1.data.SCD_CON);
		$("#edit-color").val(result1.data.SCD_COLOR);
 	}
 	
	//설렉트 색깔 바꿔주기
 	$("#edit-color").change(function() {
 		$("#edit-color").css("color",$(this).val());
	});
// 	$("#caltime").val('12:00');
}
//마지막일 계산
function lastday() {
	var date    = new Date();
	var month = date.getMonth() + 1;
	var yyyy = date.getFullYear();
	var last   = new Date( yyyy, month ); 
	     last   = new Date( last - 1 ); 
	var lastD = last.getDate();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("#calendDate").val(yyyy+"-"+mm+"-"+lastD);
}
function caladdpopset() {
	var date = new Date();
	var yyyy = date.getFullYear();
	var mm = date.getMonth()+1 > 9 ? date.getMonth()+1 : '0' + (date.getMonth()+1);
	var mm1 = date.getMonth()+1 > 9 ? date.getMonth() : '0' + (date.getMonth()+1);
	var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
	$("#calstartDate").val(yyyy+"-"+mm+"-"+dd);
	$("#calendDate").val(yyyy+"-"+mm+"-"+dd);
	
}

function listdel(title,width,height,Form,Ajax,ListLoad ) {
	
	if($(".table_list tbody .list_chbox:checked").length > 0){
		makeTwoBtnPopup(1, title+" 삭제 경고", "정말 삭제하시겠습니까?", false, width, height, null, "확인", function() {
// 			var params = $("#dataForm").serialize();
			var params = $(Form).serialize();

			$.ajax({
				type: "post",
// 				url: "caldelAjax",
				url: Ajax,
				dataType: "json",
				data: params,
				success: function(result) {
					ListLoad();
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
			
			makeAlert(1, "삭제 성공", "삭제 성공", null);	
			closePopup(1);
		}, "취소", function() {
			closePopup(1);
		});
				
	} else{
		makeAlert(1, "삭제 오류", "1개이상 체크를 해주세요", null);
	}
}
</script>
</head>
<body>
	<c:import url="/topLeft">
		<c:param name="menuNo">28</c:param>
	</c:import>
	<div class="title_area">월간 일정 목록</div>
	<div class="content_area">
		<div class="contents_wrap">
			<div class="list_wrap">
					<div class="table_top_area">
						<div class="top_title_area size40" style="vertical-align: bottom;">
							<input type="button" class="btn_date pxsize50" id="today" value="오늘"/>
							<input type="button" class="btn_date pxsize50" id="3days" value="3일"/>
							<input type="button" class="btn_date pxsize50" id="7days" value="7일"/>
							<input type="button" class="btn_date pxsize50" id="15days" value="15일"/>
							<input type="button" class="btn_date pxsize50" id="month" value="한달"/>
							<input type="button" class="btn_date pxsize50" id="mtotal" value="전체"/>
						</div>
						<div class="top_btn_area size60">
						</div>
					</div>
					<form action="#" id="actionForm" method="post">
					<input type="hidden" id="cal_no" name="cal_no" value="" />
						<input type="hidden" name="page" id="page" value="${page}">
						<div class="table_top_area">
							<div class="top_title_area size40" style="vertical-align: top;">
								<select class="input_size pxsize100" name="searchGbn" id="searchGbn">
									<option value="0" selected="selected">전체</option>
									<option value="1">담당자</option>
									<option value="2">일정내용</option>
								</select>
								<input class="input_size pxsize150" name="startDate" id="startDate" type="date" value="">
								~
								<input class="input_size pxsize150" name="endDate" id="endDate" type="date" value="">
							</div>
							<div class="top_title_area size35">
								<input class="input_size pxsize200" type="text" name="searchTxt" id="searchTxt" placeholder="일정자/연락처/담당자/일정내용">
								<input type="button" class="btn_normal btn_size_normal" id="cal_Search_btn" value="검색"/>
							</div>
							<div class="top_btn_area size25">
								<input type="button" class="btn_normal btn_size_normal" id="calendar_add" value="등록"/>
								<input type="button" class="btn_normal btn_size_normal" id="calendar_del" value="삭제"/>
							</div>
						</div>
						<div class="table_top_area">
							<div class="top_title_area size25">
								<div>
									<select class="input_size pxsize100" name="pg_cnt" id="pg_cnt">
										<option value="10" selected="selected">10단위</option>
										<option value="20">20단위</option>
										<option value="50">50단위</option>
										<option value="100">100단위</option>
									</select>
									 <span id="cal_all">#</span>개 항목중 
									<span id="cal_cnt">0</span>개 선택
								</div>
							</div>
							<div class="top_btn_area size75">
							</div>
						</div>
					</form>
					<form action="#" id="dataForm" method="post">
					<table class="table_list">
						<colgroup>
							<col width="5%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr class="table_list_header">
								<td>
									<div class="squaredOne_h">
										<input type="checkbox" value="None" class="list_chbox" style="display : none;" id="chk_all"  />
										<label for="chk_all"  ></label> <!-- squaredOne 같이? -->
									</div>
								</td>
								<td>수정</td>
								<td>NO</td>
								<td>일시</td>
								<td>일정시간</td>
								<td>담당자</td>
								<td>일정내용</td>
							</tr>
						</thead>
					</table>
					<div class="sscroll">
						<table class="table_list">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<tbody>
							</tbody>
						</table>
					</div>
					</form>
					<div class="list_paging_area">
           			 </div>
           			 <div class="blank_space">
           			 </div>
				</div>
		</div>
	</div>
	<c:import url="/bottom"></c:import>
</body>
</html>