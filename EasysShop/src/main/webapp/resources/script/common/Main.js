/**
 * Main.js
 * create date : 2019.09.19
 */
$(document).ready(function() {
	$(".content_area").slimScroll({
		height: "100%"
	});
	
	/* 메뉴 펼침 이벤트 */
	$(".menu_wrap").on("click", ".first_menu_wrap, .first_menu_wrap_on", function() {
		if($(this).attr("class") != "first_menu_wrap_on") {
			$(".first_menu_wrap_on").attr("class", "first_menu_wrap");
			$(this).attr("class", "first_menu_wrap_on");
		} else {
			$(".first_menu_wrap_on").attr("class", "first_menu_wrap");
		}
	});
	
	
});

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

//목록 삭제
function listdel(depth,title,width,height,Form,Ajax,ListLoad,pop ) {
	if($(".table_list tbody .list_chbox:checked").length > 0){
		makeTwoBtnPopup(depth, title+" 삭제 경고", "정말 삭제하시겠습니까?", false, width, height, null, "확인", function() {
			if (pop != null) {
				var params = pop; 
			}else {
				var params = $("#"+Form+"").serialize();
			}
			console.log(Form);
			console.log(params);
			$.ajax({
				type: "post",
				url: Ajax,
				dataType: "json",
				data: params,
				success: function(result) {
					if (ListLoad == "getlist1") {
						getlist(1);
					} else if (ListLoad == "getlist2") {
						getlist(2);
					} else if (ListLoad == "getlist3") {
						getlist(3);
					} else if (ListLoad == "getlist4") {
						getlist(4);
					} else if (ListLoad != null) {
						ListLoad() 
					}
					closePopup(depth);
				},
				error : function(request, status, error) {
					console.log("status : " + request.status);
					console.log("text : " + request.responseTest);
					console.log("error : " + error);
				}
			});
		}, "취소", function() {
			closePopup(depth);
		});
				
	} else{
		makeAlert(depth, "삭제 오류", "1개이상 체크를 해주세요", null);
	}
}