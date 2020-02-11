<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간 예약 목록</title>
<c:import url="/header"></c:import>
<script type = "text/javascript">
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	$(document).ready(function() {
		reloadList();
		// Button Auto Sizing
		$(".dta").show();
		$(".dta2").show();
		$(".dta3").hide();
		$(".dta4").hide();
		
		$('button').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		})
		$('.content_btn>div').each(function() {
			if ($(this).html().length > 2) {
				var leng_diff = $(this).html().length - 2;
				$(this).width($(this).width() + (10 * leng_diff) + "px");
			}
		})
		$("#info_Btn").on("click", function(){
			$(".dta").show();
			$(".dta2").show();
			$(".dta3").hide();
			$(".dta4").hide();
		});
		$("#sell_Btn").on("click", function(){
			$(".dta").hide();
			$(".dta2").hide();
			$(".dta3").show();
			$(".dta4").hide();
		});
		$("#point_Btn").on("click", function(){
			$(".dta").hide();
			$(".dta2").hide();
			$(".dta3").hide();
			$(".dta4").show();
		})		
		$("#searchBtn").on("click", function(){
			$("#page").val("1");
			reloadList();
		});
		
		$("#reg_Btn").on("click", function() {
			makeNoBtnPopup(1, "고객등록팝업", "시발", false, 600, 630, null);
		});
		
		$("#searchTxt").on("keypress", function(event) {
			if(event.keyCode == 13) {
				$("#searchBtn").click();
				return false;
			}
		});
		
		$("#del_Btn").on("click", function() {
			if($("#chk_cnt").html() == "0") {
				makeAlert(1, "삭제 오류", "데이터가 선택되지 않았습니다.", null);
			}
			else {
				makeTwoBtnPopup(1, "삭제 경고", "선택된 항목을 삭제 하시겠습니까?", false, 400, 200, null, "확인", function() {
					closePopup(1);
					
					$("input[name='cal_check']").each(function() {
						var del = $(this).attr("id").substring($(this).attr("id").indexOf("_") + 1);
						if($(this).is(":checked")) {
							var params = "&ct_no=" + del;
							
							$.ajax({
								type: "post",
								url: "cusDelAjax",
								dataType: "json",
								data: params,
								success: function(result) {
									console.log(result.res);
									if(result.res == "FAILED") {
										makeAlert(1, "삭제 실패", "삭제에 실패했습니다.", null);
									}
								},
								error : function(request, status, error) {
									console.log("status : " + request.status);
									console.log("text : " + request.responseTest);
									console.log("error : " + error);
								}
							});
						}
					});
					reloadList();
				}, "취소", function() {
					closePopup(1);
				});
			}
		});
		$("#checkall").click(function(){
	    	if($("#checkall").prop("checked")){
	    		$("input[name=cal_check]").prop("checked",true);
	    		//클릭이 안되있으면
	    	}else{
	    		$("input[name=cal_check]").prop("checked",false);
	    	}
	    });
		/* 체크개수 카운팅  */
		$(".table_list").on("click", ".list_chbox", function() {
			
			$("#chk_all").html($(".table_list tbody .list_chbox").length);
			$("#chk_cnt").html($(".table_list tbody .list_chbox:checked").length);
		});
	});
	function reloadList() {
		var params = $("#listForm").serialize();
		$.ajax({
			type : "post",
			url : "customerListAjax",
			dataType : "json",
			data : params,

			success : function(result) {
				redrawList(result.list);
				drawListPaging(result.pb);
			},
			error : function(request, status, error) {
				console.log("text : " + request.responseText);
				console.log("error : " + error);
			}
		});
	}
	function redrawList(list) {
		var html = "";
		if(list.length > 0) {
			for(var i in list) {
				html += "<tr class = \"list_contents\" name=\"" + list[i].CT_NO + "\">";
				html += `	<td width="60px" nowrap style="cursor : default;" class="chk_td">                                                                             `;
				html += `		<div class="squaredOne">                                                                                              `;
				html += `			<input type="checkbox" class="list_chbox" value="`+list[i].CT_NO+`" style="display : none;" id="chk_`+list[i].CT_NO+`" name="cal_check" />   `;
				html += `			<label class="chbox_lbl" for="chk_`+list[i].CT_NO+`"></label>                                                                         `;
				html += `		</div>                                                                                                                `;
				html += `	</td>                                                                                                                     `;
				html += `	<td  width="80px" nowrap>`+list[i].CT_NO+`</td>                                                                                                  `;
				html += `	<td  width="130px" nowrap>`+list[i].CT_NM+`</td>                                                                                                  `;
				html += `	<td  width="130px" nowrap>`+list[i].GRADE_NM+`</td>                                                                                                  `;
				html += `	<td  width="130px" nowrap>`+list[i].EMP_NM+`</td>                                                                                                  `;
				html += `	<td  width="100px" nowrap>`+list[i].POINT+`</td>                                                                                                  `;
				html += `	<td  width="200px" nowrap>`+list[i].CT_PH+`</td>                                                                                                 `;
				html += `	<td  width="100px" nowrap>`+list[i].CT_SEX+`</td>                                                                                                  `;
				html += `	<td  width="165px" nowrap>`+list[i].VDT+`</td>                                                                                                  `;
				html += `	<td  width="165px" nowrap>`+list[i].RDT+`</td>                                                                                                  `;
				html += "</tr>";
			}                              	                                                                                                           
			
			var chk_allcnt = list.length;
			$("#chk_cnt").html(0);
			$("#chk_all").html(chk_allcnt);
			$("input[type=checkbox]").prop("checked",false);
		}
		else {
			html += "<tr class=\"list_contents\" style=\"height: 350px;\">";
			html += "<td  style = \"width:1200px !important;\"colspan=\"10\">조회된 데이터가 없습니다.</td>";
			html += "</tr>";
			$(".list_paging_area").html("");
		}
		$("#tbody1").html(html);
		
		/* 전체 체크박스 선택 후 해제 시 전체체크박스 풀림 */
		$(".list_chbox").on("click", function() {
			var cnt = 0;
			$(".list_chbox").each(function() {
				if(!$(this).is(":checked") && $(this).attr("id") != "checkall") {
					cnt ++;
				}
			});
			
			var stat = (cnt > 0) ? false : true;
			$("#checkall").prop("checked", stat);
			
		});
		$(".list_chbox").on("click", function() {
			var select = $(this).attr("id");
			$("#ct_no").val(select.substring(select.indexOf("_") + 1));
		});
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
</script>
<style type="text/css">
.right_wrap > .slimScrollDiv {
	display: inline-block;
	height: calc(100% - 145px) !important;
	width: calc(100% - 40px) !important;
	min-width: 1040px !important;
	padding: 0px 20px !important;
}
.detail_tr {
	border-bottom: 1px solid #CCC;
	font-size: 10pt;
	height: 30px;
}

.top_td {
	padding: 5px 5px;
	width : 190px;
}

.top_th {
	background-color: #EEEEEE;
	border-right: 1px solid #CCC;
	padding: 0px;
}
.down_tr {
	border-bottom: 1px solid #CCC;
	font-size: 10pt;
	height: 30px;
	text-align : left;
}
.th_down {
	padding-left : 10px;
}
.detail_table_tr{
	height:30px;
}

.ttr{
	font-size : 10pt;
	border : 1px solid #cacaca;
}
.tbl{
	border-left : 1px solid #cacaca;
}
.tbr{
	border-right : 1px solid #cacaca;
}
table > thead {
	font-weight : bold;
}
</style>
</head>
<body>
<form action = "#" id = "actionForm" method = "post">

</form>
	<!-- 고객 등록,수정 팝업 -->
	 <div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_Customer_add2 pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon">고객 등록
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<div class = "pop_contents">
					<div class = "pop_Customer_table">
						<table class="pop_table">
							<colgroup>
								<col width = "10%"/>
								<col width = "40%"/>
								<col width = "10%"/>
								<col width = "40%"/>
							</colgroup>
							<tr>
								<td class="field_name first_field_name">고객명</td>
								<td class="field_contents"><input type = "text" class = "input_normal" /></td>
								<td class="field_name first_field_name">담당자</td>
								<td class="field_contents">
			                    	<input class="input_size size40" type="text">
									<input type="button" class="btn_normal btn_size_normal" value="검색"/>
			                    </td>
							</tr>
							<tr>
								<td class="field_name first_field_name">성별</td>
								<td class="field_contents">
									<select class="input_normal">
										<option selected="selected">여성</option>
										<option>남성</option>
									</select>
								</td>
								<td class="field_name first_field_name">생일</td>
								<td class="field_contents">
									<input class="input_normal" name="" id="startDate1" type="date" value="">
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">전화</td>
								<td class="field_contents"><input type = "text" class = "input_normal" /></td>
								<td  class="field_name first_field_name">휴대폰
								<td class="field_contents">
									<input type = "text" class = "input_normal" />
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">등록일</td>
								<td class="field_contents">
									<input class="input_normal" name="" id="startDate1" type="date" value="">
								</td>
								<td class="field_name first_field_name">방문일</td>
								<td class="field_contents">
									<input class="input_normal" name="" id="startDate1" type="date" value="">
								</td>
							</tr>
							
							<tr>
								<td class="field_name first_field_name">기념일</td>
								<td class="field_contents">
									<input class="input_normal" name="" id="startDate1" type="date" value="">
								</td>
								<td  class="field_name first_field_name">등급</td>
								<td class="field_contents">
									<select class="input_normal">
										<option selected="selected">BRONZE</option>
										<option>SILVER</option>
										<option>GOLD</option>
										<option>PLATINUM</option>
										<option>DIAMOND</option>
										<option>MASTER</option>
										<option>CHALLENGER</option>
									</select>
								</td>
							</tr>
							<tr class="height50">	
								<td class="field_name first_field_name">주소<span class="important_text">*</span></td>
									<td colspan="3" class="text_align_left ">
										<input type="text" class="input_size ml10 mt10" placeholder="우편번호"><div class="btn_normal btn_size_normal mt10">검색</div>
										<input type="text" class="input_size pxsize495 ml10 mt10 dis_block" placeholder="주소">
										<input type="text" class="input_size pxsize495 ml10 mt10 mb10 dis_block" placeholder="상세주소">
									</td>
								</tr>
							<tr>
								<td class="field_name first_field_name">이메일</td>
								<td colspan = "3"><input type = "text" class = "input_normal" /></td>
							</tr>
							<tr>
								<th class="field_name first_field_name">메모</th>
								<td colspan = "3"> <textarea type="text" class="textarea_normal"></textarea></td>
							</tr>
						</table>
						<div class = "customer_btn_area">
							<div class="btn_normal2 btn_size_normal mt10">고객등록</div>
							<div class="btn_normal btn_size_normal mt10">연속등록</div>
							<div class="btn_normal btn_size_big mt10">고객등록 후 시술등록</div>
							<div class="btn_normal btn_size_big mt10">고객등록 후 판매등록</div>
							<div class="btn_normal btn_size_normal mt10">등록취소</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!-- 고객 목록  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Customer_Code pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						고객목록
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<table class="pop_table">
					<tbody>
						<tr>
							<td colspan = "4" class="field_contents size100">
								<input type="button" class="btn_normal btn_size_normal" value="등록"/>
								<input type="button" class="btn_normal btn_size_normal" value="삭제"/>
							</td>
						</tr>
						<tr>
							<td class="field_name first_field_name size15">검색조건</td>
							<td class = "size30">
								<select class="input_size pxsize200">
									<option selected="selected">전체</option>
									<option>고객명</option>
									<option>연락처</option>
								</select>
							</td>
							<td class="field_name first_field_name size15">검색어</td>
							<td class="field_contents size40">
								<input class="input_size pxsize200" type="text">
								<input type="button" class="btn_normal btn_size_normal" value="검색"/>&nbsp; &nbsp; &nbsp; &nbsp;
							</td>
						</tr>
					</tbody>
				</table>
				<div class="pop_customer_list widthscroll">
				<table class="table_list tborder pxsize1650 " id="pop_customer_list" >
					<colgroup>
						<col width="3%">
						<col width="4%">
						<col width="4%">
						<col width="3%">
						<col width="6%">
						<col width="6%">
						<col width="6%">
						<col width="8%">
						<col width="6%">
						<col width="4%">
						<col width="8%">
						<col width="8%">
						<col width="10%">
						<col width="10%">
						<col width="14%">
					</colgroup>
					<thead>
					<tr class="table_list_header padding0a10" >
						<td>
							<div class="squaredOne_h">
								<input type="checkbox" value="None" style="display : none;" id="pop_CT_checkall"  />
								<label for="pop_CT_checkall"  ></label>
							</div>
						</td>
						<td>선택</td>
						<td>수정</td>
						<td>NO</td>
						<td>고객명</td>
						<td>담당자</td>
						<td>포인트</td>
						<td>핸드폰</td>
						<td>전화</td>
						<td>성별</td>
						<td>생년월일</td>
						<td>회원가입일</td>
						<td>이메일</td>
						<td>주소</td>
						<td>메모</td>
					</tr>
					</thead>
				</table>
				
				<table class="table_list tborder pxsize1650" id="pop_customer_list" style="table-layout: fixed" >
					<colgroup>
						<col width="3%">
						<col width="4%">
						<col width="4%">
						<col width="3%">
						<col width="6%">
						<col width="6%">
						<col width="6%">
						<col width="8%">
						<col width="6%">
						<col width="4%">
						<col width="8%">
						<col width="8%">
						<col width="10%">
						<col width="10%">
						<col width="14%">
					</colgroup>
					<tbody>
						<tr class="list_contents padding0a10">
							<td style="cursor : default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display : none;" id="pop_CT_squaredOne1" name="pop_CT_check" />
									<label for="pop_CT_squaredOne1"></label>
								</div>
							</td>
							<td style="cursor : default;"><input type="button" value="선택"/></td>	
							<td style="cursor : default;"><input type="button" value="수정"/></td>	
							<td>1</td>					
							<td>괴물죄</td>					
							<td>괴물죄</td>					
							<td>10000000</td>					
							<td>010-1234-1234</td>					
							<td>02-2020-2020</td>					
							<td >여자</td>					
							<td>1997-06-27</td>					
							<td>2019-01-14</td>					
							<td>asdfasdf@naver.com</td>					
							<td style="max-width: 80px;">서울특별시 어쩌고저쩌고</td>					
							<td></td>		
						</tr>					
						<tr class="list_contents padding0a10">
							<td style="cursor : default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display : none;" id="pop_CT_squaredOne2" name="pop_CT_check" />
									<label for="pop_CT_squaredOne2"></label>
								</div>
							</td>
							<td style="cursor : default;"><input type="button" value="선택"/></td>	
							<td style="cursor : default;"><input type="button" value="수정"/></td>	
							<td>1</td>					
							<td>괴물죄</td>					
							<td>괴물죄</td>					
							<td>10000000</td>					
							<td>010-1234-1234</td>					
							<td>02-2020-2020</td>					
							<td >여자</td>					
							<td>1997-06-27</td>					
							<td>2019-01-14</td>					
							<td>asdfasdf@naver.com</td>					
							<td style="max-width: 80px;">서울특별시 어쩌고저쩌고</td>					
							<td></td>
						</tr>					
					</tbody>
				</table>
			</div>
		</div>
	</div> --%>
	<!-- 상세정보 -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_customer_detail pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 고객 상세정보
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<!-- 내용입력 -->
			<div class="pop_detail_top_area">
				상단 버튼
				<div class="pop_detail_top1">
					<input type="button" class="btn_normal btn_size_normal"
						value="시술등록" /> <input type="button"
						class="btn_normal btn_size_normal" value="판매등록" /> <input
						type="button" class="btn_normal btn_size_normal" value="대기등록" />
				</div>
				<div class="pop_detail_top2">
					<input type="button" class="btn_normal btn_size_normal"
						value="고객등록" /> <input type="button"
						class="btn_normal btn_size_normal" value="고객수정" /> <input
						type="button" class="btn_normal btn_size_normal" value="등록취소" />
				</div>
			</div>
			<div class="detail_srch_area">
				<select class="detail_srch_ddl">
					검색드랍다운리스트
					<option selected="selected">전체</option>
					<option>고객명</option>
					<option>연락처</option>
				</select> <input type="text" class="textarea_srch" placeholder="검색어를 입력해주세요." />
				<div class="detail_srch_btn">검색</div>
			</div>
			<!-- 상세보기 위 테이블 -->
			<div class="detail_table_area">
				<table>
					<tr class="detail_tr">
						<th class = "top_th">고객명</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<th class = "top_th">담당</th>
						<td><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<td class="detail_row1" rowspan="5"><div
								class="detail_row_txt1">메모</div></td>
						<td class="detail_row2" rowspan="5">
						<input type="text" class="detail_txt_big" /></td>

					</tr>
					<tr class="detail_tr">
						<th class = "top_th">성별</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<th class = "top_th">생일</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">전화</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<th class = "top_th">휴대폰</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">기념일</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<th class = "top_th">최근 방문일</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">고객등급</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
						<th class = "top_th">이메일</th>
						<td class = "top_td"><input type="text" class="detail_txt_small" readonly = "readonly"/></td>
					</tr>
				</table>
			</div>
			<!-- 상세내역 -->
			<div class = "down_table_area">
				<table class = "down_table">
				<tr class = "down_tr">
					<td colspan = "10">asdf님의 상세내역(처음방문일인 2019-12-19부터 오늘인 2019-12-19일까지의 내역입니다)</td>
				</tr>
				<tr class = "down_tr">
					<th class = "th_down">총 시술횟수</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">총 구매횟수</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">카드결제</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">현금결제</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">서비스이용</th>
					<td class = "td_down">0회</td>
					
				</tr>
				<tr class = "down_tr">
					<th class = "th_down">총 적립포인트</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">총 사용포인트</th>
					<td class = "td_down">0회</td>
					<th class = "th_down">현재 보유포인트</th>
					<td class = "td_down">0회</td>
					<th class = "th_down"></th>
					<td class = "td_down"></td>
					<th class = "th_down">최근 포인트사용일 : 미정</th>
					<td class = "td_down">0회</td>
				</tr>
				</table>
			</div>
			<table class = "detail_table_srch">
			<tr class = "detail_table_tr">
			<td>
			<div class="detail_table_top_area1">
					<div class="detail_top_title_area1 size40" style="vertical-align: bottom;">
						<input type="button" class="btn_date pxsize50" id="today"
							value="오늘" /> 
							<input type="button" class="btn_date pxsize50" id="3days" value="3일" /> <input type="button"
							class="btn_date pxsize50" id="7days" value="7일" /> 
							<input type="button" class="btn_date pxsize50" id="15days" value="15일" />
						<input type="button" class="btn_date pxsize50" id="month" value="한달" /> <input type="button" class="btn_date pxsize50" id="total" value="전체" />
					</div>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div class="detail_table_top_area">
					<div class="detail_top_title_area size40" style="vertical-align: top;">
						<select class="detail_input_size pxsize100">
							<option selected="selected">전체</option>
							<option>예약자</option>
							<option>연락처</option>
							<option>담당자</option>
							<option>예약내용</option>
						</select> <input class="detail_input_size pxsize150" 
							name = "startDate" id="startDate" type="date" value=""> ~ 
							<input class="detail_input_size pxsize150" type="date" name = "endDate" id="endDate" value="">
					</div>
					<div class="detail_top_title_area size25">
						<input class="detail_input_size pxsize200" type="text"
							placeholder="예약자/연락처/담당자/예약내용"> <input type="button"
							class="btn_normal detail_btn_size_normal" value="검색" />
							
					</div>
				</div>
				</td>
				</tr>
			</table>
			<div>
				<div class = "detail_down_Btn">
					<input type = "button" value = "시술정보" id = "info_Btn"/>
					<input type = "button" value = "판매정보" id = "sell_Btn"/>
					<input type = "button" value = "포인트이용내역" id = "point_Btn"/>
				</div>
				
				<div class = "dta">
				<table class = "detail_down_table widthscroll">
				<colgroup>
					<col width = "40px"/>
					<col width = "150px"/>
					<col width = "100px"/>
					<col width = "90px"/>
					<col width = "90px"/>
					<col width = "90px"/>
					<col width = "90px"/>
					<col width = "100px"/>
					<col width = "150px"/>
				</colgroup>
					<thead>
						<tr class = "ttr table_list_header">
							<td class = "tbr"rowspan = "2">NO</td>
							<td class = "tbr"rowspan = "2">시술날짜</td>
							<td class = "tbr"colspan = "2">시술정보</td>
							<td class = "tbr"colspan = "4">요금정보</td>
							<td rowspan = "2">메모</td>
						</tr>
						<tr class = "ttr table_list_header">
							<td class = "tbr">시술명</td>
							<td class = "tbr">디자이너</td>
							<td class = "tbr">구분</td>
							<td class = "tbr">요금</td>
							<td class = "tbr">적립포인트</td>
							<td>사용포인트</td>
						</tr>
					</thead>
					<tbody>
						<tr class = "ttr">
							<td>1</td>
							<td>2019-12-26</td>
							<td>탈모클리닉</td>
							<td>바킈손</td>
							<td>시술</td>
							<td>10억</td>
							<td>1억</td>
							<td>9억</td>
							<td>킈킈킈킈</td>
						</tr>
						
					</tbody>
				</table>
				</div>
				<div class = "dta2">
				<table class = "detail_log_table widthscroll">
				<colgroup>
					<col width = "100px"/>
					<col width = "50px"/>
					<col width = "50px"/>
					<col width = "95px"/>
				</colgroup>
					<thead>
						<tr class = "ttr">
							<td class = "status1 table_list_header">DETAIL LOG</td>
							<td class = "status2 table_list_header"colspan = "3">시술 총 현황</td>
						</tr>
						<tr class = "ttr table_list_header">
							<td class = "tbr">시술명</td>
							<td class = "tbr">총횟수</td>
							<td class = "tbr">경과일</td>
							<td>최근방문</td>
						</tr>
					</thead>
						<tbody>
							<tr class = "ttr">
								<td>탈모클리닉</td>
								<td>3</td>
								<td>12</td>
								<td>2019-12-26</td>
							</tr>
							
						</tbody>
				</table>
				</div>
				<div class = "dta3">
				<table class = "detail_down_table widthscroll">
				
					<thead>
						<tr class = "ttr table_list_header">
							<td  class = "tbr"rowspan = "2">NO</td>
							<td  class = "tbr"colspan = "2">판매정보</td>
							<td  class = "tbr"colspan = "2">고객정보</td>
							<td  class = "tbr"colspan = "4">요금정보</td>
							<td rowspan = "2">메모</td>
						</tr>
						<tr class = "ttr table_list_header">
							<td class = "tbr">판매일</td>
							<td class = "tbr">담당자</td>
							<td class = "tbr">고객명</td>
							<td class = "tbr">상품명</td>
							<td class = "tbr">요금></td>
							<td class = "tbr">요금</td>
							<td class = "tbr">적립포인트</td>
							<td>사용포인트</td>
						</tr>
					</thead>
					<tbody>
					<colgroup>
						<col width = "30px"/>
						<col width = "120px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "100px"/>
						<col width = "200px"/>
					</colgroup>
						<tr class = "ttr">
							<td>1</td>
							<td>2019-12-26</td>
							<td>바킈손</td>
							<td>괴물죄</td>
							<td>헤어샴푸403</td>
							<td>100000</td>
							<td>100000</td>
							<td>230000</td>
							<td>100000</td>
							<td>취급주의취급주의</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class = "dta4">
				<table class = "detail_down_table widthscroll">
				<colgroup>
					<col width = "50px"/>
					<col width = "200px"/>
					<col width = "100px"/>
					<col width = "150px"/>
					<col width = "100px"/>
					<col width = "100px"/>
				</colgroup>
					<thead>
						<tr class = "ttr table_list_header">
							<td class = "tbr">NO</td>
							<td class = "tbr">일시</td>
							<td class = "tbr">회원명</td>
							<td class = "tbr">내역</td>
							<td class = "tbr">적립금액</td>
							<td>사용금액</td>
						</tr>
					</thead>
						<tbody>
							<tr class = "ttr">
								<td>1</td>
								<td>2019-01-02</td>
								<td>바킈손</td>
								<td>400000 결제</td>
								<td>500000</td>
								<td>500000</td>
							</tr>
						</tbody>
				</table>
				</div>
		</div>
	</div>
	</div>
	<c:import url="/topLeft">
		<c:param name="menuNo">1</c:param>
	</c:import>
	
	
		<div class="title_area">고객 목록</div>
		<!-- 내용작성 -->
		<div class="content_area">
			<div class="contents_wrap">
			<!-- 리스트폼 -->
				<form action = "#" id = "listForm" method = "post">
				<input type = "hidden" name = "ct_no" id = "ct_no"/>
			<div class="list_wrap">
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: bottom;">
						<input type="button" class="btn_date pxsize50" id="today"
							value="오늘" /> 
							<input type="button" class="btn_date pxsize50" id="3days" value="3일" /> <input type="button"
							class="btn_date pxsize50" id="7days" value="7일" /> 
							<input type="button" class="btn_date pxsize50" id="15days" value="15일" />
						<input type="button" class="btn_date pxsize50" id="month" value="한달" /> <input type="button" class="btn_date pxsize50" id="total" value="전체" />
					</div>
					<div class="top_btn_area size60"></div>
				</div>
				<input type = "hidden" id = "page" name = "page" value = "1"/>
				
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: top;">
						<select name = "searchGbn" id = "searchGbn" class="input_size pxsize100">
							<option selected="selected" value = "0">전체</option>
							<option value = "1">고객명</option>
							<option value = "2">등급</option>
							<option value = "3">담당자</option>
							<option value = "4">핸드폰</option>
						</select> <input class="input_size pxsize150" name="startDate"
							id="startDate" type="date" value=""> ~ 
							<input class="input_size pxsize150" type="date" id="endDate" name = "endDate" value="">
					</div>
					<div class="top_title_area size25">
						<input class="input_size pxsize200" name = "searchTxt" id = "searchTxt"type="text"
							placeholder="고객명/연락처/담당자/핸드폰"> 
							<input type="button" class="btn_normal btn_size_normal" id = "searchBtn" name = "searchBtn" value="검색" />
					</div>
					<div class="top_btn_area size35">
						<input type="button" class="btn_normal btn_size_normal"
							value="대기등록" /> 
							<input type="button" id = "reg_Btn" class="btn_normal btn_size_normal" value="등록" /> 
							<input type="button" id = "update_Btn" class="btn_normal btn_size_normal" value="수정" /> 
							<input type="button" id = "del_Btn" class="btn_normal btn_size_normal" value="삭제" />
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
							</select> <span id="chk_all">#</span> 개 항목중 <span id="chk_cnt">0</span>
							개 선택
						</div>
					</div>
					<div class="top_btn_area size75"></div>
				</div>
				<table class="table_list">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="15%">
						<col width="9%">
						<col width="13%">
						<col width="13%">
					</colgroup>
					<thead>
						<tr class="table_list_header">
							<td>
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display: none;"
										id="checkall" /> <label for="checkall"></label>
									<!-- squaredOne 같이? -->
								</div>
							</td>
							<td>NO</td>
							<td>고객명</td>
							<td>등급</td>
							<td>담당자</td>
							<td>포인트</td>
							<td>핸드폰</td>
							<td>성별</td>
							<td>최근방문일</td>
							<td>등록일</td>
						</tr>
					<thead>
					<tbody id = "tbody1">
					</tbody>
				</table>
				<div class="list_paging_area">
					<div class="btn_paging"><</div>
					<div class="btn_paging"><<</div>
					<div class="btn_paging">1</div>
					<div class="btn_paging">></div>
					<div class="btn_paging">>></div>
				</div>
				<div class="blank_space"></div>
			</div>
				</form>
			</div>
		</div>
<!-- 	</div> -->
<c:import url="/bottom"></c:import>
</body>
</html>