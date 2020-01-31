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
	$.getJSON("resources/data.json", function(res) {
		$("#calendar").fullCalendar({
			header: {
				left: 'month,agendaWeek,agendaDay',
				center: 'title',
				right:  'prevYear,prev,next,nextYear,list'
			},
			locale: "ko",
			dayClick: function(date, jsEvent, view) {

//				    alert('Clicked on: ' + date.format());

//				    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

//				    alert('Current view: ' + view.name);

			    // change the day's background color just for fun
//				    $(this).css('background-color', 'red');
			     $(".fc-body").unbind('click');
				 $(".fc-body").on('click', 'td', function (jsEvent) {

				      $("#contextMenu")
				        .addClass("contextOpened")
				        .css({
				          display: "block",
				          left: jsEvent.pageX,
				          top: jsEvent.pageY
				        });
				      
				      $("#startDate").val(date.format());
				      $("#startDate1").val(date.format());
				      return false;
				    });
//					var $popup_reservation_Close =$("#popup_reservation_Close");
//					    $popup_reservation_Close.on("click", function(e) {
//				    	  $("#popup_reservation") 
//				    	  .removeClass("pop_on")
//				      	  .addClass("pop_off");
//					    	return false;
//					    });
				
				    $(".pop_wrap").on("click", ".pop>.pop_title_area>.pop_close" , function() {
				    	$(this).parents("div.pop_title_area").parents("div.pop").parents("div.pop_wrap")
				    	.removeClass("pop_on")
				    	.addClass("pop_off");
				    });

//				    var $popup_calander_Close =$("#popup_calander_Close");
//					    $popup_calander_Close.on("click", function(e) {
//				    	   $("#popup_calander")
//					        .removeClass("pop_on")
//					      	.addClass("pop_off");
//					    	return false;
//				    });
				  var $reservation_add =$("#reservation_add");
				  var $calendar_add = $("#calendar_add");
				  $reservation_add.on("click", function(e) {
					  var html = "";
						html += "<table class=\"pop_table\" >                                                                                        ";
						html += "	<colgroup>                                                                                                       ";
						html += "		<col width=\"20%\">                                                                                          ";
						html += "		<col width=\"80%\">                                                                                          ";
						html += "	</colgroup>                                                                                                      ";
						html += "	<tbody>                                                                                                          ";
						html += "		<tr>                                                                                                         ";
						html += "			<td class=\"field_name first_field_name\">일시</td>                                                      ";
						html += "			<td class=\"field_contents\">                                                                            ";
						html += "				<input class=\"input_size pxsize130\" name=\"startDate\" id=\"startDate\" type=\"date\" value=\"\">  ";
						html += "				<select class=\"input_size pxsize100\">                                                              ";
						html += "					<option selected=\"selected\">오전 12시</option>                                                 ";
						html += "					<option>오전 01시</option>                                                                       ";
						html += "					<option>오전 02시</option>                                                                       ";
						html += "					<option>오전 03시</option>                                                                       ";
						html += "					<option>오전 04시</option>                                                                       ";
						html += "					<option>오전 05시</option>                                                                       ";
						html += "					<option>오전 06시</option>                                                                       ";
						html += "					<option>오전 07시</option>                                                                       ";
						html += "					<option>오전 08시</option>                                                                       ";
						html += "					<option>오전 09시</option>                                                                       ";
						html += "					<option>오전 10시</option>                                                                       ";
						html += "					<option>오전 11시</option>                                                                       ";
						html += "					<option>오후 12시</option>                                                                       ";
						html += "					<option>오후 01시</option>                                                                       ";
						html += "					<option>오후 02시</option>                                                                       ";
						html += "					<option>오후 03시</option>                                                                       ";
						html += "					<option>오후 04시</option>                                                                       ";
						html += "					<option>오후 05시</option>                                                                       ";
						html += "					<option>오후 06시</option>                                                                       ";
						html += "					<option>오후 07시</option>                                                                       ";
						html += "					<option>오후 08시</option>                                                                       ";
						html += "					<option>오후 09시</option>                                                                       ";
						html += "					<option>오후 10시</option>                                                                       ";
						html += "					<option>오후 11시</option>                                                                       ";
						html += "				</select>                                                                                            ";
						html += "				<select class=\"input_size pxsize100\">                                                              ";
						html += "					<option selected=\"selected\">00분</option>                                                      ";
						html += "					<option>10분</option>                                                                            ";
						html += "					<option>20분</option>                                                                            ";
						html += "					<option>30분</option>                                                                            ";
						html += "					<option>40분</option>                                                                            ";
						html += "					<option>50분</option>                                                                            ";
						html += "				</select>                                                                                            ";
						html += "			</td>                                                                                                    ";
						html += "		</tr>                                                                                                        ";
						html += "		<tr>                                                                                                         ";
						html += "			<td class=\"field_name first_field_name\">고객명</td>                                                    ";
						html += "			<td class=\"field_contents\">                                                                            ";
						html += "				<input class=\"input_size size70\" type=\"text\">                                                    ";
						html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
						html += "			</td>                                                                                                    ";
						html += "		</tr>                                                                                                        ";
						html += "		<tr>                                                                                                         ";
						html += "			<td class=\"field_name first_field_name\">연락처                                                         ";
				        html += "          <td class=\"field_contents\">                                                                             ";
				        html += "              <input type=\"text\" class=\"input_size size20\" maxlength=\"4\" />                                   ";
				        html += "              <span>- </span>                                                                                       ";
				        html += "              <input type=\"text\" class=\"input_size size30\" maxlength=\"4\"/>                                    ";
				        html += "              <span>- </span>                                                                                       ";
				        html += "              <input type=\"text\" class=\"input_size size30\" maxlength=\"4\"/>                                    ";
				        html += "          </td>                                                                                                     ";
			            html += "      </tr>                                                                                                         ";
						html += "		<tr>                                                                                                         ";
						html += "			<td class=\"field_name first_field_name\">담당자</td>                                                    ";
						html += "			<td class=\"field_contents\">                                                                            ";
						html += "				<input class=\"input_size size70\" type=\"text\">                                                    ";
						html += "				<input type=\"button\" class=\"btn_normal btn_size_normal\" value=\"검색\"/>                         ";
						html += "			</td>                                                                                                    ";
						html += "		</tr>                                                                                                        ";
						html += "		<tr>                                                                                                         ";
						html += "			<td class=\"field_name first_field_name\">색상</td>                                                      ";
						html += "			<td class=\"field_contents\">                                                                            ";
						html += "				 <select class=\"input_normal inputModal\" name=\"color\" id=\"edit-color\">                         ";
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
						html += "				<input class=\"input_normal\" type=\"text\">                                                         ";
						html += "			</td>                                                                                                    ";
						html += "		</tr>                                                                                                        ";
						html += "	</tbody>                                                                                                         ";
						html += "</table>";
					  makeTwoBtnPopup(1, "예약 등록", html, true, 500, 450, null, "등록", function() {
							makeAlert(2, "등록", "취소", null);
						},"취소", function() {
							closePopup(1);
						}); 
// 					  $("#popup_reservation")
// 			      	    .removeClass("pop_off")
// 				      	.addClass("pop_on"); 
					 
				  });
				  $calendar_add.on("click", function(e) {
				      $("#popup_calander")
				        .removeClass("pop_off")
				      	.addClass("pop_on");
				     
				  });
				 var $contextMenu = $("#contextMenu");
				    $contextMenu.on("click", "a", function (e) {
//					      e.preventDefault();

				      //닫기 버튼이 아닐때
				      if ($(this).data().role !== 'close') {
//							  if( $("#popup_calander").hide) {
//								  $("#popup_calander").show();
//							  }
//							  if( $("#popup_reservation").hide) {
//								  $("#popup_reservation").show();
//							  }
				      }
						 
				      $contextMenu.removeClass("contextOpened");
				      $contextMenu.hide();
				    });
				    
				   
			},
			events:res,
			eventClick: function(event) {
				alert(event.title);
			}
		});
	});
	
	
});
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
		<div id="calendar"></div>
		</div>
	</div>
	 <!-- 일자 클릭시 메뉴오픈 -->
	        <div id="contextMenu" class="dropdown clearfix">
	            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
	                style="display:block;position:static;margin-bottom:5px;">
	                <li><a tabindex="1" href="#" id="reservation_add">예약 등록</a></li>
	                <li><a tabindex="2" href="#" id="calendar_add">일정 등록</a></li>
	                <li class="divider"></li>
	                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
	            </ul>
	        </div>
	        <!-- 일정 추가 MODAL -->
	        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
	                                aria-hidden="true">&times;</span></button>
	                        <h4 class="modal-title"></h4>
	                    </div>
	                    <div class="modal-body">
	
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
	                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
	                            </div>
	                        </div>
	
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-title">일정명</label>
	                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
	                                    required="required" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-start">시작</label>
	                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-end">끝</label>
	                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-type">구분</label>
	                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
	                                    <option value="예약 등록">예약 등록</option>
	                                    <option value="일정 등록">일정 등록</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-color">색상</label>
	                                <select class="inputModal" name="color" id="edit-color">
	                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
	                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
	                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
	                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
	                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
	                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
	                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
	                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
	                                    <option value="#495057" style="color:#495057;">검정색</option>
	                                </select>
	                            </div>
	                        </div>
	                        <div class="row">
	                            <div class="col-xs-12">
	                                <label class="col-xs-4" for="edit-desc">설명</label>
	                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
	                                    id="edit-desc"></textarea>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-addEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
	                    </div>
	                    <div class="modal-footer modalBtnContainer-modifyEvent">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
	                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
	                    </div>
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	        </div><!-- /.modal -->
			
	        
	        <div class="panel panel-default">
			
			            <div class="panel-heading">
			                <h3 class="panel-title">필터</h3>
			            </div>
			
			            <div class="panel-body">
			
			                <div class="col-lg-6">
			                    <label for="calendar_view">구분별</label>
			                    <div class="input-group">
			                        <select class="filter" id="type_filter" multiple="multiple">
			                              <option value="예약 등록" selected="selected">예약 등록</option>
	                                      <option value="일정 등록">일정 등록</option>
			                        </select>
			                    </div>
			                </div>
			
			            </div>
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