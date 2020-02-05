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
// 			$("#Customer_Grade_list").removeClass("pop_off").addClass("pop_on");
// 			$("#btn_Customer_Grade_add").on("click", function() {
// 				$("#Customer_Grade_add").removeClass("pop_off").addClass("pop_on");
// 			});
// 			$("#btn_cus_code_add").on("click",function() {
// 				console.log("1");
// 			});
			var html = "";
			html += `<table class="pop_table">`;
			html += `	<colgroup>            `;
			html += `		<col width="20%"> `;
			html += `		<col width="80%"> `;
			html += `	</colgroup>           `;
			html += `	<tbody>               `;
			html += `		<tr>              `;
			html += `			<td class="field_name first_field_name">검색어</td> `;
			html += `			<td class="field_contents">                         `;
			html += `				<input class="input_size size60" type="text">   `;
			html += `				<input type="button" class="btn_normal btn_size_normal" value="검색"/>`;
			html += `			</td>`;
			html += `		</tr> `;
			html += `	</tbody>  `;
			html += `</table>     `;
				html += `<table class="table_list">                `;
				html += `	<thead class="thead_scroll">           `;
				html += `		<tr class="table_list_header">     `;
				html += `			<td  width="100px" nowrap>      `;
				html += `				<div class="squaredOne_h"> `;
				html += `					<input type="checkbox" value="None" class="list_chbox" style="display : none;" id="pop_chk_all"  />`;
				html += `					<label for="pop_chk_all"  ></label>`; <!-- squaredOne 같이? -->
				html += `				</div>`;
				html += `			</td>`;
				html += `			<td  width="130px" nowrap>등급명</td>             `;
				html += `			<td  width="75px" nowrap>레벨</td>               `;
				html += `			<td  width="75px" nowrap>수정</td>     `;
				html += `		</tr>                                              `;
				html += `	</thead>                                               `;
				html += `	<tbody class="tbody_scroll">                           `;
				html += `	</tbody>                                               `;
				html += `</table>                                                  `;
			makeThreeBtnPopup(1, "고객 등급 코드", html, false, 400, 600, null
			, "코드등록", function() {
				closePopup(1);
			},"삭제", function() {
				closePopup(1);
			},"취소", function() {
				closePopup(1);
			});
		} else if ($(this).attr("menuno") == 16) {
			console.log(1);
		} else if ($(this).attr("menuno") == 17) {
			console.log(1);
		} else if ($(this).attr("menuno") == 18) {
			console.log(1);
		} else if ($(this).attr("menuno") == 19) {
			console.log(1);
		} else if ($(this).attr("menuno") == 20) {
			console.log(1);
		}
	});
	
});

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