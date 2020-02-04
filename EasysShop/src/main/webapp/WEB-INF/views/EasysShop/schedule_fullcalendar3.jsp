<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 & 일정</title>
<c:import url="/header"></c:import>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="resources/script/fullcalendar/fullcalendar.css">

<link rel="stylesheet" href='resources/vendor/css/fullcalendar.min.css' />
<link rel="stylesheet" href='resources/vendor/css/bootstrap.min.css'>
<link rel="stylesheet" href='resources/vendor/css/select2.min.css' />
<link rel="stylesheet" href='resources/vendor/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet" href="resources/css/fullcalendar/main.css">


<!-- Moment -->
<script type="text/javascript" src="resources/script/jquery/moment.js"></script>
<!-- fullcalendar -->
<script type="text/javascript" src="resources/script/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript" src="resources/script/fullcalendar/locale-all.js"></script>
<!-- 메인 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/Main.js"></script>
<!-- 버튼 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/btn.js"></script>
<style type="text/css">
body {
	font-size : 0;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	$(".pop_Procedure_list").slimScroll({
		height: "100%"
	});
	
	$(".cancelBtn").on("click", function() {
		$(".pop_wrap>.pop>.pop_title_area>.pop_close").click();
	})
	
	getreservationlist();
	$.getJSON("resources/data.json", function(res) {
// 		console.log(res);
		
	});
	
	
});

function getreservationlist() {
	$.ajax({
		type : "post", //데이터 전송방식
		url : "getreslistAjax", //주소
		dataType :"json", //데이터 전송규격
		//{키 : 값, 키 : 값,...} -> json
		success : function(plan, sche) {
			var plan1 = new Array;
			for(var i in plan.plan) {
				plan1.push(
				{
						id : plan.plan[i].rv_no,
						title : "예약 : "+plan.plan[i].rv_con,
						start : plan.plan[i].rv_date,
						color : plan.plan[i].rv_color,
				});
			}	
			for(var i in plan.sche) {
				plan1.push(
				{
						id : plan.sche[i].scd_no,
						title : "일정 : "+plan.sche[i].scd_con,
						start : plan.sche[i].scd_sdate,
						end : plan.sche[i].scd_edate,
						color : plan.sche[i].scd_color,
				});
			}	
			$("#calendar").fullCalendar({
				
				header: {
					left: 'month,agendaWeek,agendaDay',
					center: 'title',
					right:  'prevYear,prev,next,nextYear,list'
				},
				locale: "ko",
				dayClick: function(date, jsEvent, view) {

//					    alert('Clicked on: ' + date.format());

//					    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

//					    alert('Current view: ' + view.name);

				    // change the day's background color just for fun
//					    $(this).css('background-color', 'red');
				     $(".fc-body").unbind('click');
					 $(".fc-body").on('click', 'td', function (jsEvent) {

					      $("#contextMenu")
					        .addClass("contextOpened")
					        .css({
					          display: "block",
					          left: jsEvent.pageX,
					          top: jsEvent.pageY
					        });
					      
					      
					      $("#startDate1").val(date.format());
					      return false;
					    });
//						var $popup_reservation_Close =$("#popup_reservation_Close");
//						    $popup_reservation_Close.on("click", function(e) {
//					    	  $("#popup_reservation") 
//					    	  .removeClass("pop_on")
//					      	  .addClass("pop_off");
//						    	return false;
//						    });
					
					    $(".pop_wrap").on("click", ".pop>.pop_title_area>.pop_close" , function() {
					    	$(this).parents("div.pop_title_area").parents("div.pop").parents("div.pop_wrap")
					    	.removeClass("pop_on")
					    	.addClass("pop_off");
					    });

//					    var $popup_calander_Close =$("#popup_calander_Close");
//						    $popup_calander_Close.on("click", function(e) {
//					    	   $("#popup_calander")
//						        .removeClass("pop_on")
//						      	.addClass("pop_off");
//						    	return false;
//					    });
// 					  예약 등록
					  $("#reservation_add").on("click", function(e) {
						  var html = "";
						  	html += `<form action="#" id="reserForm" method="post">`;
							html += "<table class=\"pop_table\" >                                                                                        ";
							html += "	<colgroup>                                                                                                       ";
							html += "		<col width=\"20%\">                                                                                          ";
							html += "		<col width=\"80%\">                                                                                          ";
							html += "	</colgroup>                                                                                                      ";
							html += "	<tbody>                                                                                                          ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">일시</td>                                                      ";
							html += "			<td class=\"field_contents\">                                                                            ";
							html += "				<input class=\"input_size size45\" name=\"startDate\" id=\"startDate\" type=\"date\" value=\"\">  ";
							html += `				<input class="input_size size45" name="restime" id="restime" type="time">`;
							html += "			</td>                                                                                                    ";
							html += "		</tr>                                                                                                        ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">고객명</td>                                                    ";
							html += "			<td class=\"field_contents\">                                                                            ";
							html += `				<input type="hidden" name="txt_client_no">                                                    `;
							html += "				<input class=\"input_size size70\" id=\"txt_client_name\" name=\"txt_client_name\" type=\"text\">                                                    ";
							html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
							html += "			</td>                                                                                                    ";
							html += "		</tr>                                                                                                        ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">연락처                                                         ";
					        html += "          <td class=\"field_contents\">                                                                             ";
					        html += "              <input type=\"text\" class=\"input_normal txt_client_ph\" id=\"txt_client_ph\" name=\"txt_client_ph\" maxlength=\"14\" />                                   ";
					        html += "          </td>                                                                                                     ";
				            html += "      </tr>                                                                                                         ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">담당자</td>                                                    ";
							html += "			<td class=\"field_contents\">                                                                            ";
							html += "				<input class=\"input_size size70\" id=\"txt_emp_name\" name=\"txt_emp_name\" type=\"text\">                                                    ";
							html += `				<input type="hidden">                                                    `;
							html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
							html += "			</td>                                                                                                    ";
							html += "		</tr>                                                                                                        ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">색상</td>                                                      ";
							html += "			<td class=\"field_contents\">                                                                            ";
							html += "				 <select class=\"input_normal inputModal\" name=\"edit-color\" style=\"color:#D25565;\" id=\"edit-color\">                         ";
			                html += "                  <option value=\"#D25565\" style=\"color:#D25565;\">빨간색</option>                                ";
			                html += "                  <option value=\"#9775fa\" style=\"color:#9775fa;\">보라색</option>                                ";
			                html += "                  <option value=\"#ffa94d\" style=\"color:#ffa94d;\">주황색</option>                                ";
			                html += "                  <option value=\"#74c0fc\" style=\"color:#74c0fc;\">파란색</option>                                ";
			                html += "                  <option value=\"#f06595\" style=\"color:#f06595;\">핑크색</option>                                ";
			                html += "                  <option value=\"#63e6be\" style=\"color:#63e6be;\">연두색</option>                                ";
			                html += "                  <option value=\"#a9e34b\" style=\"color:#a9e34b;\">초록색</option>                                ";
			                html += "                  <option value=\"#4d638c\" style=\"color:#4d638c;\">남색</option>                                  ";
			                html += "                  <option value=\"#495057\" style=\"color:#495057;\">검정색</option>                                ";
			                html += "              </select>                                                                                             ";
							html += "			</td>                                                                                                    ";
							html += "		</tr>                                                                                                        ";
							html += "		<tr>                                                                                                         ";
							html += "			<td class=\"field_name first_field_name\">예약내용</td>                                                  ";
							html += "			<td class=\"field_contents\">                                                                            ";
							html += "				<input class=\"input_normal\" name=\"txt_RV_CON\" id=\"txt_RV_CON\" type=\"text\">                                                         ";
							html += "			</td>                                                                                                    ";
							html += "		</tr>                                                                                                        ";
							html += "	</tbody>                                                                                                         ";
							html += "</table>";
							html += `</form>`;
							
														
						 	makeTwoBtnPopup(1, "예약 등록", html, true, 500, 450, null, "등록", function() {
						 		if(checkEmpty("#startDate")) {
						 			makeAlert(2, "등록 안내", "날짜를 입력해 주세요.", function() {
										$("#startDate").focus();
									});
								} else if(checkEmpty("#restime")) {
									makeAlert(2, "등록 안내", "시간를 입력해 주세요.", function() {
										$("#restime").focus();
									});
								} else if($.trim($("#txt_client_name").val()) == "") {
									makeAlert(2, "등록 안내", "고객을 입력해 주세요.", function() {
									});
								} else if($.trim($("#txt_client_ph").val()) == "") {
									makeAlert(2, "등록 안내", "연락처를 입력해 주세요.", function() {
										$("#txt_client_ph").focus();
									});
								} else if(checkEmpty("#txt_emp_name")) {
									makeAlert(2, "등록 안내", "담당자를 입력해 주세요.", function() {
									});
								} else if(checkEmpty("#txt_RV_CON")) {
									makeAlert(2, "등록 안내", "예약 내용을 입력해 주세요.", function() {
										$("#txt_RV_CON").focus();
									});
								}
								else { 
									var params = $("#reserForm").serialize();
								
									$.ajax({
										type : "post", //데이터 전송방식
										url : "reserAddAjax", //주소
										dataType : "json", //데이터 전송 규격
										data : params, //보낼 데이터
										// {키: 값, 키:값, ...} - > json
										
										success : function(result){
											if(result.res == "SUCCESS"){
												closePopup(1);
												alert("등록되었습니다");
												$("#reserForm").attr("action","schedule_fullcalendar3");
						 						$("#reserForm").submit();
												
	// 											location.href = "schedule_fullcalendar3";
											} else{
												makeAlert(2, "등록 오류", "예약 등록에 실패하였습니다.", null);
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
						 	$("#startDate").val(date.format());
						 	//전화번호 텍스트 포맷팅
							$(".txt_client_ph").on("keyup", function() {
								inputNumberFormat(this);
							});
							//설렉트 색깔 바꿔주기
						 	$("#edit-color").change(function() {
						 		$("#edit-color").css("color",$(this).val());
					 		});
							$("#restime").val('12:00');
					  });
// 					  일정 등록
					  $("#calendar_add").on("click", function(e) {
						var html ="";
						html += `<form action="#" id="scheForm" method="post">`; 
						html += `  <table class="pop_table" >                                                                             `;
						html += `	<colgroup>                                                                                            `;
						html += `		<col width="20%">                                                                                 `;
						html += `		<col width="80%">                                                                                 `;
						html += `	</colgroup>                                                                                           `;
						html += `	<tbody>                                                                                               `;
						html += `		<tr>                                                                                              `;
						html += `			<td class="field_name first_field_name">일정 시작일</td>                                             `;
						html += `			<td class="field_contents">                                                                   `;
						html += `				<input class="input_size pxsize130" name="startDate" id="startDate" type="date" value="">`;
						html += `				<select class="input_size pxsize100" name="scheSHtime" id="scheSHtime" >                                                     `;
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
						html += `				<select class="input_size pxsize100" name="scheSMtime" id="scheSMtime">                                                     `;
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
						html += `				<input class="input_size pxsize130" name="endDate" id="endDate" type="date" value="">`;
						html += `				<select class="input_size pxsize100 "  name="scheEHtime" id="scheEHtime">                                                     `;
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
						html += `				<select class="input_size pxsize100"  id="scheEMtime" name="scheEMtime">                                                     `;
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
					  makeTwoBtnPopup(1, "일정 등록", html, true, 500, 450, null, "등록", function() {
//					  	날짜비교
				 		var startDate = new Date($("#startDate").val()+' '+$("#scheSHtime").val()+':'+$("#scheSMtime").val());
				 		var endDate = new Date($("#endDate").val()+' '+$("#scheEHtime").val()+':'+$("#scheEMtime").val());
				 		console.log(startDate);
				 		console.log(endDate);
				 		var dcnt = parseFloat(startDate.getTime() - endDate.getTime())/ (1000*60*60);
						  if(checkEmpty("#startDate")) {
					 			makeAlert(2, "등록 안내", "날짜를 입력해 주세요.", function() {
									$("#startDate").focus();
								});
							} else if(dcnt > 0  ) {
								makeAlert(2, "등록 안내", "시작일이 종료일보다 클수없습니다", function() {
								});
							}  
					 		else if(checkEmpty("#txt_emp_name")) {
								makeAlert(2, "등록 안내", "담당자를 입력해 주세요.", function() {
								});
							} else if(checkEmpty("#txt_SCD_CON")) {
								makeAlert(2, "등록 안내", "일정 내용을 입력해 주세요.", function() {
									$("#txt_SCD_CON").focus();
								});
							}
							else { 
								var params = $("#scheForm").serialize();
							
								$.ajax({
									type : "post", //데이터 전송방식
									url : "scheAddAjax", //주소
									dataType : "json", //데이터 전송 규격
									data : params, //보낼 데이터
									// {키: 값, 키:값, ...} - > json
									
									success : function(result){
										if(result.res == "SUCCESS"){
											alert("등록되었습니다");
											closePopup(1);
											$("#scheForm").attr("action","schedule_fullcalendar3");
					 						$("#scheForm").submit();
											
// 											location.href = "schedule_fullcalendar3";
										} else{
											makeAlert(2, "등록 오류", "예약 등록에 실패하였습니다.", null);
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
					 	$("#startDate, #endDate").val(date.format());
					 	//전화번호 텍스트 포맷팅
					 	//설렉트 색깔 바꿔주기
					 	$("#edit-color").change(function() {
					 		$("#edit-color").css("color",$(this).val());
				 		});

					 	

// 						$("#endDate").val('12:00');
					  });
					 var $contextMenu = $("#contextMenu");
					    $contextMenu.on("click", "a", function (e) {
//						      e.preventDefault();

					      //닫기 버튼이 아닐때
					      if ($(this).data().role !== 'close') {
//								  if( $("#popup_calander").hide) {
//									  $("#popup_calander").show();
//								  }
//								  if( $("#popup_reservation").hide) {
//									  $("#popup_reservation").show();
//								  }
					      }
							 
					      $contextMenu.removeClass("contextOpened");
					      $contextMenu.hide();
					    });
					    
					   
				},
				events: plan1
				
				
				, 
				eventClick: function(event) {
					alert(event.id);
				}
			});
		},
		error : function(request , status, error) {
			console.log("status :" + request.status); //상태코드
			console.log("text :" + request.responceText); //request영역 반환텍스트
			console.log("error :" + request.error); //에러메세지
		}
	});
}
</script>
</head>
<body>
	<c:import url="/pop">
	</c:import>
	<c:import url="/topLeft">
		<c:param name="menuNo">27</c:param>
	</c:import>
	<div class="title_area">예약 & 일정</div>
	<div class="content_area">
		<div class="contents_wrap">
		<div id="calendar" style="width : 1400px;"></div>
		</div>
	</div>
	 <!-- 일자 클릭시 메뉴오픈 -->
	        <div id="contextMenu" class="dropdown clearfix">
	            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                style="display:block;position:static;margin-bottom:5px;">
	                <li><a tabindex="1" style="cursor : pointer;" id="reservation_add">예약 등록</a></li>
	                <li><a tabindex="2" style="cursor : pointer;" id="calendar_add">일정 등록</a></li>
	                <li class="divider"></li>
	                <li><a tabindex="-1"  data-role="close">Close</a></li>
	            </ul>
	        </div>
		</div>
<!-- 		<script src='resources/vendor/js/jquery.min.js'></script> -->
	    <script src='resources/vendor/js/bootstrap.min.js'></script>
	    <script src='resources/vendor/js/moment.min.js'></script>
<!-- 	    <script src='resources/vendor/js/fullcalendar.min.js'></script> -->
<!-- 	    <script src='resources/vendor/js/ko.js'></script> -->
	    <script src='resources/vendor/js/select2.min.js'></script>
	    <script src='resources/vendor/js/bootstrap-datetimepicker.min.js'></script>
<!-- 	    <script src="resources/vendosr/js/main.js"></script> -->
	    <script src="resources/vendor/js/addEvent.js"></script>
	    <script src="resources/vendor/js/editEvent.js"></script>
	    <script src="resources/vendor/js/etcSetting.js"></script>
	    
	
	<c:import url="/bottom"></c:import>
</body>
</html>