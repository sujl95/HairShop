/**
 * popup.js
 * create date : 2020.01.14
 * create by : YS.Lee
 */

/**
 * makeAlert(depth, title, contents)
 * : 알림창 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * event - 팝업 닫을 시 이벤트(없을경우 null입력)
 */
function makeAlert(depth, title, contents, event) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"pop_wrap pop_on\" id=\"popupWrap" + depth + "\">";
		html += "<div class=\"pop pop_size_small\">";
		html += "<div class=\"pop_title_area\">";
		html += "<div class=\"pop_title_text\">";
		html += "<img src=\"resources/images/common/logo.png\" alt=\"\" class=\"pop_icon\" /> &nbsp;";
		html += title;
		html += "</div>";
		html += "<div class=\"pop_close\">";
		html += "<img src=\"resources/images/button/icon_cancel_white.png\" alt=\"\" width=\"20px\" id=\"BtnPopClose\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"pop_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"pop_btn_area\">";
		html += "<div class=\"btn btn_normal btn_size_normal\" id=\"popupWrap" + depth + "BtnOne\" style=\"margin-right: 10px\">확인</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .pop_size_small").css("z-index", depth * 111);
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		

		$("#popupWrap" + depth + "BtnOne").off("click");
		$("#popupWrap" + depth + "BtnOne").on("click", function(){
			if(event != null) {
				event.call();
			}
			
			closePopup(depth);
		});

		$("#popupWrap" + depth + " .pop_close").off("click");
		$("#popupWrap" + depth + " .pop_close").on("click", function(){
			if(event != null) {
				event.call();
			}
			
			closePopup(depth);
		});
	}
}

/**
 * makeNoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 */
function itemAddPopup(){
	
	html = "";
	
	html +="<table class=\"pop_table table_list tborder\">";
	html +="<colgroup>";
	html +="	<col width=\"15%\">";
		html +="	<col width=\"35%\">";
		html +="	<col width=\"15%\">";
		html +="	<col width=\"35%\">";
		html +="</colgroup>";
	html +="<tbody>";
	html +="	<tr class=\"height50\">";
		html +="		<td class=\"field_name\">상품명</td>";
			html +="		<td class=\"text_align_left \"><input";
			html +="		class=\"input_size pxsize190 ml10\" type=\"text\">";
			html +="	</td>";
			html +="		<td class=\"field_name\">상품단위</td>";
			html +="		<td class=\"text_align_left \"><input";
			html +="			class=\"input_size pxsize190 ml10\" type=\"text\">";
			html +="		</td>";
			html +="	</tr>";
		html +="	<tr class=\"height50\">";
		html +="		<td class=\"field_name\">매입처</td>";
			html +="		<td colspan=\"3\" class=\"text_align_left \"><input";
			html +="		class=\"input_size pxsize390 ml10\" type=\"text\"> <input";
				html +="		type=\"button\" class=\"btn_normal btn_size_normal ml10\" value=\"검색\" />";
					html +="		</td>";
				html +="	</tr>";
		html +="		<tr class=\"height50\">";
			html +="		<td class=\"field_name\">판매단가<span class=\"important_text\">*</span></td>";
			html +="		<td class=\"text_align_left \"><input";
			html +="		class=\"input_size pxsize190 ml10 text_align_right\" type=\"text\"></td>";
				html +="	<td colspan=\"2\">";
			html +="		<div class=\"size100 text_align_left text_indent50\">";
				html +="			공급가<input type=\"text\"";
						html +="				class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="		<div class=\"size100 text_align_left text_indent50\">";
				html +="			부가세<input type=\"text\"";
						html +="				class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="		<div class=\"size100 text_align_left text_indent50\">";
				html +="			판매가<input type=\"text\"";
						html +="			class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="	</td>";
			html +="	</tr>";
		html +="	<tr class=\"height50\">";
		html +="		<td class=\"field_name\">매입단가<span class=\"important_text\">*</span></td>";
			html +="		<td class=\"text_align_left \"><input";
			html +="			class=\"input_size pxsize190 ml10 text_align_right\" type=\"text\"></td>";
				html +="		<td colspan=\"2\">";
			html +="		<div class=\"size100 text_align_left text_indent50\">";
				html +="			공급가<input type=\"text\"";
						html +="				class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="			<div class=\"size100 text_align_left text_indent50\">";
				html +="			부가세<input type=\"text\"";
						html +="				class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="			<div class=\"size100 text_align_left text_indent50\">";
				html +="				판매가<input type=\"text\"";
						html +="				class=\"input_small_size ml10 text_align_right pxsize190\" />";
							html +="		</div>";
					html +="	</td>";
			html +="	</tr>";
		html +="	<tr class=\"height50\">";
		html +="	<td class=\"field_name\">현금적립포인트</td>";
			html +="	<td class=\"text_align_left \"><input";
			html +="		class=\"input_size pxsize190 ml10\" type=\"text\">";
			html +="	</td>";
			html +="	<td class=\"field_name\">카드적립포인트</td>";
			html +="	<td class=\"text_align_left \"><input";
			html +="		class=\"input_size pxsize190 ml10\" type=\"text\">";
			html +="	</td>";
			html +="	</tr>";
		html +="	</tbody>";
html +="	</table>";
	
	makeTwoBtnPopup(1,"입고 등록",html,true,600,400,null,"등록",function(){
		
	},"취소", function() {
		closePopup(1);
	}); 
	
}
function makeNoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"pop_wrap pop_on\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"pop_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"pop pop_size_small\">";
		html += "<div class=\"pop_title_area\">";
		html += "<div class=\"pop_title_text\">";
		html += "<img src=\"resources/images/common/logo.png\" alt=\"\" class=\"pop_icon\" /> &nbsp;";
		html += title;
		html += "</div>";
		html += "<div class=\"pop_close\">";
		html += "<img src=\"resources/images/button/icon_cancel_white.png\" alt=\"\" width=\"20px\" id=\"BtnPopClose\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"pop_contents\">";
		html += contents;
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .pop_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .pop_size_small").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .pop_size_small").css("width", width + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("height", height + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("left", "calc(50% - " + (width / 2) + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		
		
		if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		}
		
		$("#popupWrap" + depth + " .pop_close").off("click");
		$("#popupWrap" + depth + " .pop_close").on("click", function(){
			closePopup(depth);
		});
	}
}


/**
 * makeTwoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent)
 * : 팝업 생성
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 * title - 제목
 * contents - 내용
 * bgFlag - 백그라운드 존재여부(true : 존재, flase : 비존재)
 * contentsEvent - 내용 추가이벤트(없을경우 null입력)
 * btnOneTitle - 버튼1 텍스트
 * btnOneEvent - 버튼1 추가이벤트(없을경우 null입력), 완료 후 팝업닫을 경우 closePopup(depth)호출
 */
function makeTwoBtnPopup(depth, title, contents, bgFlag, width, height, contentsEvent, btnOneTitle, btnOneEvent, btnTwoTitle, btnTwoEvent) {
	if(popupCheck(depth)) {
		//팝업 존재 시
	} else {
		var html = "";
		
		html += "<div class=\"pop_wrap pop_on\" id=\"popupWrap" + depth + "\">";
		
		if(bgFlag) {
			html += "<div class=\"pop_bg\" id=\"popup" + depth + "Bg\"></div>";
		}
		
		html += "<div class=\"pop pop_size_small\">";
		html += "<div class=\"pop_title_area\">";
		html += "<div class=\"pop_title_text\">";
		html += "<img src=\"resources/images/common/logo.png\" alt=\"\" class=\"pop_icon\" /> &nbsp";
		html += title;
		html += "</div>";
		html += "<div class=\"pop_close\">";
		html += "<img src=\"resources/images/button/icon_cancel_white.png\" alt=\"\" width=\"20px\" id=\"BtnPopClose\" />";
		html += "</div>";
		html += "</div>";
		html += "<div class=\"pop_contents\">";
		html += contents;
		html += "</div>";
		html += "<div class=\"pop_btn_area\">";
		html += "<div class=\"btn btn_normal btn_size_normal\" id=\"popupWrap" + depth + "BtnOne\">";
		html += btnOneTitle + "</div>";
		html += "<div class=\"btn btn_normal btn_size_normal\" id=\"popupWrap" + depth + "BtnTwo\" style=\"margin-right: 10px\">";
		html += btnTwoTitle + "</div>";
		html += "</div>";
		html += "</div>";
		html += "</div>";
		
		$("body").prepend(html);
		
		if(contentsEvent != null) {
			contentsEvent.call();
		}
		
		$("#popupWrap" + depth).css("z-index", depth * 100);
		$("#popupWrap" + depth + " > .pop_bg").css("z-index", depth * 110);
		$("#popupWrap" + depth + " > .pop_size_small").css("z-index", depth * 111);
		$("#popupWrap" + depth + " > .pop_size_small").css("width", width + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("height", height + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("left", "calc(50% - " + (width / 2) + "px");
		$("#popupWrap" + depth + " > .pop_size_small").css("top", "calc(50% - " + (height / 2) + "px");
		
		$("#popupWrap" + depth).hide();
		
		$("#popupWrap" + depth).fadeIn("fast");
		
		$("#popupWrap" + depth + "BtnOne").off("click");
		$("#popupWrap" + depth + "BtnOne").on("click", function(){
			if(btnOneEvent != null) {
				btnOneEvent.call();
			}
		});
		
		$("#popupWrap" + depth + "BtnTwo").off("click");
		$("#popupWrap" + depth + "BtnTwo").on("click", function(){
			if(btnTwoEvent != null) {
				btnTwoEvent.call();
			}
		});
		
		if(bgFlag) {
			$("#popup" + depth + "Bg").off("click");
			$("#popup" + depth + "Bg").on("click", function(){
				closePopup(depth);
			});
		}
		
		$("#popupWrap" + depth + " .pop_close").off("click");
		$("#popupWrap" + depth + " .pop_close").on("click", function(){
			closePopup(depth);
		});
	}
}

/**
 * closePopup(depth)
 * : 팝업 닫기
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function closePopup(depth) {
	$("#popupWrap" + depth).fadeOut("fast", function(){
		$("#popupWrap" + depth).remove();
	});
}

/**
 * popupCheck(depth)
 * : 팝업 존재여부
 * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
 */
function popupCheck(depth) {
	if($("#popupWrap" + depth).length > 0) {
		return true;
	} else {
		return false;
	}
}

 /**
  * popupContentsChange(depth, contents, contentsEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * contents - 내용
  * contentsEvent - 내용 추가이벤트(없을경우 null입력)
  */
 function popupContentsChange(depth, contents, contentsEvent) {
 	$("#popupWrap" + depth + " .pop_contents").html(contents);
 	
 	if(contentsEvent != null) {
 		contentsEvent.call();
 	}
 }

 /**
  * popupBtnChange(depth, type, btnText, btnEvent)
  * : 팝업 존재여부
  * depth - 팝업깊이 (1부터 시작하며, z-index가 커짐)
  * type - 버튼타입 (1 - 3번)
  * btnText - 버튼 텍스트
  * btnEvent - 버튼 변경 이벤트(없을경우 null입력)
  */
 function popupBtnChange(depth, type, btnText, btnEvent) {
 	if(type == 1) {
 		$("#popupWrap" + depth + "BtnOne").val(btnText);
 		
 		if(btnEvent != null) {
 			$("#popupWrap" + depth + "BtnOne").off("click");
 			$("#popupWrap" + depth + "BtnOne").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	} else if(type == 2) {
 		$("#popupWrap" + depth + "BtnTwo").val(btnText);
 		
 		if(btnEvent != null) {
 			$("#popupWrap" + depth + "BtnTwo").off("click");
 			$("#popupWrap" + depth + "BtnTwo").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	} else if(type == 3) {
 		$("#popupWrap" + depth + "BtnThree").val(btnText);
 		
 		if(btnEvent != null) {
 			$("#popupWrap" + depth + "BtnThree").off("click");
 			$("#popupWrap" + depth + "BtnThree").on("click", function(){
 				if(btnEvent != null) {
 					btnEvent.call();
 				}
 			});
 		}
 	}
}