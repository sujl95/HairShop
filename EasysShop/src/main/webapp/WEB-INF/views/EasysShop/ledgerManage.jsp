<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간 예약 목록</title>
<!-- 탭 아이콘 -->
<link rel="shortcut icon" href="resources/images/Eimages/hairshop.ico">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/Hairshop/Main.css" />
<!-- 버튼 CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/Hairshop/btn.css" />
<!-- 레이아웃 CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/Hairshop/layout.css" />
<!-- input CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/Hairshop/input.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css"
	href="resources/css/Hairshop/pop.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript"
	src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript"
	src="resources/script/jquery/jquery.slimscroll.js"></script>
<!-- 메인 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/Main.js"></script>
<!-- 버튼 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/btn.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
		// Button Auto Sizing
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
		
		ledgerLoad();

});
function ledgerLoad(){
	var params = $("#actionForm").serialize();
	
	$.ajax({
		
		type : "post", //데이터 전송방식
		url : "ledgerLoadAjax", //주소
		dataType : "json", //데이터 전송 규격
		data : params, //보낼 데이터
		
		success : function(result){
			 if(result.res == "SUCCESS"){
					$("#actionForm").attr("action","scheDet");
					$("#actionForm").submit();
				}
				else{
					alert("일정 수정에 실패하였습니다.");
				}
		} , 
		error : function(request,status,error) {
			console.log("status : "+request.status);
			console.log("text : "+request.responseText);
			console.log("error : "+error);
		}
		
	});
}
</script>
</head>
<body>
	<!-- 장부 등록 팝업  -->
	<div class="pop_wrap ">
		<div class="pop_bg"></div>
		<div class="pop pop_size_Books pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 장부 등록
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<table class="pop_table table_list tborder">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr class="height50">
						<td class="field_name ">거래일자<span class="important_text">*</span></td>
						<td class="text_align_left "><input type="date"
							class="input_size ml10" /></td>
						<td class="field_name">계정<span class="important_text">*</span></td>
						<td class="text_align_left "><select
							class="input_size pxsize100 ml10">
								<option selected="selected">분류</option>
								<option>기타경비</option>
								<option>기타매출</option>
								<option>기타잡비</option>
								<option>시술매출</option>
								<option>상품매출</option>
								<option>상품매입</option>
								<option>식비</option>
								<option>급료</option>
								<option>임차료</option>
								<option>자산매입</option>
								<option>자산매각</option>
						</select> <input type="button" class="btn_normal btn_size_normal ml10"
							value="검색" /></td>
					</tr>
					<tr class="height50">
						<td class="field_name">거래처</td>
						<td colspan="3" class="text_align_left "><input
							class="input_size pxsize400 ml10" type="text"> <input
							type="button" class="btn_normal btn_size_normal ml10" value="검색" />
						</td>
					</tr>
					<tr class="height50">
						<td class="field_name">거래내용<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><input
							class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">
						<td class="field_name ">수량<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size size80 ml10 text_align_right" type="text">개</td>
						<td class="field_name">단가</td>
						<td class="text_align_left "><input
							class="input_size pxsize195 ml10 text_align_right" type="text"></td>
					</tr>
					<tr class="height50">
						<td class="field_name">금액<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size size80 ml10 text_align_right" type="text"></td>
						<td colspan="2">
							<div class="size100 text_align_left text_indent50">
								공급가<input type="text"
									class="input_small_size ml10 text_align_right pxsize200" />
							</div>
							<div class="size100 text_align_left text_indent50">
								부가세<input type="text"
									class="input_small_size ml10 text_align_right pxsize200" />
							</div>
						</td>
					</tr>
					<tr class="height50">
						<td class="field_name">비고<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><select
							class="input_size pxsize150 ml10">
								<option selected="selected">분류를 선택해주세요</option>
								<option>신용카드</option>
								<option>영수증</option>
								<option>현금연수증</option>
								<option>세금계산서</option>
								<option>기타</option>
						</select></td>
					</tr>
					<tr class="height50">
						<td class="field_name">메모</td>
						<td colspan="3"><textarea class="size80 textarea_normal"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pop_btn_bottom_area">
				<input type="button" class="btn_normal btn_size_normal mr20"
					value="등록" /> <input type="button"
					class="btn_normal btn_size_normal mr20" value="취소" />
			</div>
		</div>
	</div>
	<!-- 장부 수정 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_Books pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 장부 수정
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<table class="pop_table table_list tborder">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr class="height50">
						<td class="field_name ">거래일자<span class="important_text">*</span></td>
						<td class="text_align_left "><input type="date"
							class="input_size ml10" /></td>
						<td class="field_name">계정<span class="important_text">*</span></td>
						<td class="text_align_left "><select
							class="input_size pxsize100 ml10">
								<option selected="selected">분류</option>
								<option>기타경비</option>
								<option>기타매출</option>
								<option>기타잡비</option>
								<option>시술매출</option>
								<option>상품매출</option>
								<option>상품매입</option>
								<option>식비</option>
								<option>급료</option>
								<option>임차료</option>
								<option>자산매입</option>
								<option>자산매각</option>
						</select> <input type="button" class="btn_normal btn_size_normal ml10"
							value="검색" /></td>
					</tr>
					<tr class="height50">
						<td class="field_name">거래처</td>
						<td colspan="3" class="text_align_left "><input
							class="input_size pxsize400 ml10" type="text"> <input
							type="button" class="btn_normal btn_size_normal ml10" value="검색" />
						</td>
					</tr>
					<tr class="height50">
						<td class="field_name">거래내용<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><input
							class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">
						<td class="field_name ">수량<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size size80 ml10 text_align_right" type="text">개</td>
						<td class="field_name">단가</td>
						<td class="text_align_left "><input
							class="input_size pxsize195 ml10 text_align_right" type="text"></td>
					</tr>
					<tr class="height50">
						<td class="field_name">금액<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size size80 ml10 text_align_right" type="text"></td>
						<td colspan="2">
							<div class="size100 text_align_left text_indent50">
								공급가<input type="text"
									class="input_small_size ml10 text_align_right pxsize200" />
							</div>
							<div class="size100 text_align_left text_indent50">
								부가세<input type="text"
									class="input_small_size ml10 text_align_right pxsize200" />
							</div>
						</td>
					</tr>
					<tr class="height50">
						<td class="field_name">비고<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><select
							class="input_size pxsize150 ml10">
								<option selected="selected">분류를 선택해주세요</option>
								<option>신용카드</option>
								<option>영수증</option>
								<option>현금연수증</option>
								<option>세금계산서</option>
								<option>기타</option>
						</select></td>
					</tr>
					<tr class="height50">
						<td class="field_name">메모</td>
						<td colspan="3"><textarea class="size80 textarea_normal"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pop_btn_bottom_area">
				<input type="button" class="btn_normal btn_size_normal mr20"
					value="저장" /> <input type="button"
					class="btn_normal btn_size_normal mr20" value="취소" />
			</div>
		</div>
	</div>
	<!-- 장부 삭제 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_small pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 장부 삭제
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<div class="pop_middle_area">
			선택한 장부를 정말 삭제하시겠습니까?
			</div>
			<div class="pop_btn_bottom_area">
				<input type="button" class="btn_normal btn_size_normal mr20"
					value="삭제" /> <input type="button"
					class="btn_normal btn_size_normal mr20" value="취소" />
			</div>
		</div>
	</div>
	
	
	<!-- 거래처 등록 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_account_register pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 거래처 등록
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<table class="pop_table table_list tborder">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr class="height50">	
						<td class="field_name">거래처 구분<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left ">
							<label>
								<input type="radio" name="accout_div" value="0">매출처
								<input type="radio" name="accout_div" value="1">매입처
								<input type="radio" name="accout_div" value="2">기타거래처
							</label>
						</td>
					</tr>
					<tr class="height50">	
							<td class="field_name">거래처명<span class="important_text">*</span></td>
							<td colspan="3" class="text_align_left "><input
							class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">사업자 번호<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
						<td class="field_name">대표자<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">업태<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
						<td class="field_name">종목<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">주소<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left ">
							<input type="text" class="input_size ml10 mt10" placeholder="우편번호"><div class="btn_normal btn_size_normal mt10">검색</div>
							<input type="text" class="input_size pxsize495 ml10 mt10 dis_block" placeholder="주소">
							<input type="text" class="input_size pxsize495 ml10 mt10 mb10 dis_block" placeholder="상세주소">
						</td>
					</tr>
					<tr class="height50">	
						<td class="field_name">전화1<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
						<td class="field_name">전화2<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">핸드폰<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
						<td class="field_name">FAX<span class="important_text">*</span></td>
						<td class="text_align_left "><input
							class="input_size pxsize190 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						   <td class="field_name">이메일<span class="important_text">*</span></td>
							<td colspan="3" class="text_align_left "><input
							class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">홈페이지<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><input
						class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">담당자<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><input
						class="input_size pxsize495 ml10" type="text"></td>
					</tr>
					<tr class="height50">	
						<td class="field_name">메모<span class="important_text">*</span></td>
						<td colspan="3" class="text_align_left "><textarea
						class="textarea_noresize ml10 pxsize495"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="pop_btn_bottom_area">
				<input type="button" class="btn_normal btn_size_normal mr20"
					value="등록" /> <input type="button"
					class="btn_normal btn_size_normal mr20" value="취소" />
			</div>
		</div>
	</div>
	
	<!-- 거래처 관리 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_account_manage pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 거래처를 선택해주세요.
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<div class="pop_middle_area lh0 ">
				<div class="pop_btn_bottom_area text_align_left">
				<input type="button" class="btn_normal btn_size_normal ml10" value="등록" /> 
				<input type="button" class="btn_normal btn_size_normal ml10" value="취소" />
				<input type="button" class="btn_normal btn_size_normal ml10" value="삭제" />
				</div>
				<div class="pop_search_area_h">
					<div class="search_title_h pxsize80 ver_middle">전체</div>
					<input type="text" class="input_size height40 b_r0"/>
					<input type="button" class="btn_search_normal_h height40 pxsize80" value="검색"/>
 				</div>
 				
 				<div class="widthscroll height612">
 				<table class="table_list tborder mt30 " id="pop_Procedure_list" >
						<colgroup>
							<col width="100">
							<col width="100">
							<col width="600">
							<col width="100">
							<col width="100">
							<col width="100">
							<col width="600">
							<col width="600">
							<col width="600">
							<col width="600">
							<col width="100">
						</colgroup>
						<thead>
						<tr class="table_list_header" style="height: 30px; !important"  >
							<td>
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
									<label for="pop_PC_checkall"></label>
								</div>
							</td>
							<td>수정</td>
							<td>거래처 구분</td>
							<td>거래처명</td>
							<td>대표자</td>
							<td>업태</td>
							<td>종목</td>
							<td>핸드폰</td>
							<td>전화</td>
							<td>이메일</td>
							<td>담당자</td>
						</tr>
						</thead>
						<tbody>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="table_procedure_squaredOne1" name="pop_PC_check" />
										<label for="table_procedure_squaredOne1"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
							<td>매입처</td>
							<td>구디아카데미</td>
							<td>대표자</td>
							<td>업태</td>
							<td>종목</td>
							<td>010-4823-7703</td>
							<td>031-683-9134</td>
							<td>kimhyun153@naver.com</td>
							<td>담당자</td>
							</tr>
						</tbody>
				<!-- 테이블 상단 부분 끝-->
					</table>
					</div>
			</div>
		</div>
	</div>
	
	<!-- 주소 검색 팝업 -->
	<div class="pop_wrap pop_off">
		<div class="pop_wrap_bg"></div>
		<div class="pop pop_size_address">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="images/common/logo.png" alt="" class="pop_icon" /> 우편 번호
					검색
				</div>
				<div class="pop_close">
					<img src="./images/interbal_crm_hyun/cancel_btn.png" alt=""
						width="20px" id="BtnPopClose" />
				</div>
			</div>
			<div class="pop_address_search">
				<input type="text" class="input_address"
					placeholder="예) 판교역로 235, 분당 주공, 삼평동 681" /> <img
					src="./images/interbal_crm_hyun/Icon_search.png" alt=""
					width="30px" class="address_search_icon2" />
			</div>
			<div class="pop_address_contents">
				<span class="address_tip_text">tip</span><br /> <br /> 아래와 같은 조합으로
				검색을 하시면 더욱 정확한 결과가 검색됩니다.<br /> <br /> <br /> 도로명 + 건물 번호<br />
				<span class="address_acc_text">예) 판교역로 235, 제주 첨단로 242</span><br />
				<br /> 지역명(동/리) + 번지<br /> <span class="address_acc_text">예)
					삼평동 681, 제주 영평동 2181</span><br /> <br /> 지역명(동/리) + 건물명(아파트명)<br /> <span
					class="address_acc_text">예) 분당 주공, 연수동 주공3차</span><br /> <br />
				사서함명 + 번호<br /> <span class="address_acc_text">예) 분당우체국사서함
					1~100</span><br /> <br />
			</div>
		</div>
	</div>
	<!-- 주소 검색 결과 팝업 -->
	<div class="pop_wrap pop_off">
		<div class="pop_wrap_bg"></div>
		<div class="pop pop_size_address pop_gray">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="images/common/logo.png" alt="" class="pop_icon" /> 우편 번호
					검색
				</div>
				<div class="pop_close">
					<img src="./images/interbal_crm_hyun/icon_cancel_white.png" alt=""
						width="20px" id="BtnPopClose" />
				</div>
			</div>
			<div class="pop_address_search">
				<input type="text" class="input_address"
					placeholder="예) 판교역로 235, 분당 주공, 삼평동 681" /> <img
					src="./images/interbal_crm_hyun/icon_search_gray.png" alt=""
					width="30px" class="address_search_icon2" /> <img
					src="./images/interbal_crm_hyun/icon_cancel_gray.png" alt=""
					width="20px" class="address_search_cancel2" />
			</div>
			<div class="pop_contents">
				<div class="address_contents_card">
					<div class="address_result_wrap">
						<div class="address_acc_text">
							41069 <span style="color: #cacaca">(701-300)</span>
						</div>
						<div>
							<div class="icon_border">도로명</div>
							대구 동구 첨단로 8길 1
						</div>
						<div>
							<div class="icon_border">지 번</div>
							대구 동구 신서동 1147
						</div>
					</div>
					<div class="address_result_wrap">
						<div class="address_acc_text">
							41069 <span style="color: #cacaca">(701-300)</span>
						</div>
						<div>
							<div class="icon_border">도로명</div>
							대구 동구 첨단로 8길 1
						</div>
						<div>
							<div class="icon_border">지 번</div>
							대구 동구 신서동 1147
						</div>
					</div>
					<div class="address_result_paging">1/1</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="left_wrap">
		<div class="logo_wrap">
			<div>
				<img src="resources/images/Eimages/EasysShopLogo.PNG"> EASYS
				SHOP
			</div>
		</div>
		<div class="menu_wrap">
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">고객</div>
						<div class="menu_gbn" id="menu_customer"></div>
					</div>
				</div>
				<!-- 				<div class="second_menu_wrap"> -->
				<!-- 					<div class="second_menu"> -->
				<!-- 						<div id="menu_customer_add">고객등록</div> -->
				<!-- 					</div> -->
				<!-- 					<div class="second_menu"> -->
				<!-- 						<div id="menu_customer_list">고객관리</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
			<div class="first_menu">
				<div>
					<div class="menu_txt">직원</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>직원등록</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>직원관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>근태관리</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<div class="first_menu">
				<div>
					<div class="menu_txt">시술</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>시술등록</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>시술관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>시술일별현황</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>시술상위고객</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="first_menu">
				<div>
					<div class="menu_txt">판매</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>판매등록</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>판매관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>판매일별현황</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">포인트</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>포인트등록</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>포인트관리</div> -->
			<!-- 				</div> -->
			<!-- 			</div>  -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">장부관리</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<div class="second_menu_wrap">
				-->
				<div class="second_menu">
					<div>등록</div>
				</div>
				<div class="second_menu">
					<div>장부현황</div>
				</div>
				<div class="second_menu">
					<div>일별현황</div>
				</div>
			</div>
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">재고</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 					<div class="second_menu"> -->
			<!-- 						<div>재고등록</div> -->
			<!-- 					</div> -->
			<!-- 					<div class="second_menu"> -->
			<!-- 						<div>재고현황</div> -->
			<!-- 					</div> -->
			<!-- 			</div> -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">입고</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>입고등록</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>입고관리</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">출고</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 					<div class="second_menu"> -->
			<!-- 						<div>출고등록</div> -->
			<!-- 					</div> -->
			<!-- 					<div class="second_menu"> -->
			<!-- 						<div>출고관리</div> -->
			<!-- 					</div> -->
			<!-- 			</div> -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">기초코드관리</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<!-- 			<div class="second_menu_wrap"> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>등급코드관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>시술코드관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>직급코드관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>상품코드관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>계정코드관리</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="second_menu"> -->
			<!-- 					<div>거래처코드관리</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">일정관리</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
				<!-- <div class="second_menu_wrap">
				<div class="second_menu">
					<div>예약 & 일정</div>
				</div>
				<div class="second_menu">
					<div>월간 예약 목록</div>
				</div>
				<div class="second_menu">
					<div>월간 일정 목록</div>
				</div>
				</div> -->
			</div>
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">영업관리</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">영업목표</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="right_wrap">
		<div class="gnb_wrap">
			<div class="gnb_area">
				<div>
					<div>Home > 예약 & 일정 > 월간 예약 목록 </div>
				</div>
			</div>
			<div class="btn_area">
				<div class="p_btn_cal_area">
					<div class="p_btn btn_size_normal">
						<div>
							<div>일정예약</div>
						</div>
					</div>
				</div>
				<div class="p_btn_cal_area">
					<div class="p_btn btn_size_normal">
						<div>
							<div>대기고객</div>
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
					<div class="p_btn">
						<div>
							<div>로그아웃</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="title_area">장부 관리</div>
		<div class="content_area">
			<div class="list_wrap">
			<form action="#" id="actionForm" method="post">
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: bottom;">
						<input type="button" class="btn_date pxsize50" id="today"
							value="오늘" /> <input type="button" class="btn_date pxsize50"
							id="3days" value="3일" /> <input type="button"
							class="btn_date pxsize50" id="7days" value="7일" /> <input
							type="button" class="btn_date pxsize50" id="15days" value="15일" />
						<input type="button" class="btn_date pxsize50" id="month"
							value="한달" /> <input type="button" class="btn_date pxsize50"
							id="total" value="전체" />
					</div>
					<div class="top_btn_area size60"></div>
				</div>
				<div class="table_top_area">
					<div class="top_title_area size40" style="vertical-align: top;">
						<select class="input_size pxsize100">
							<option selected="selected">전체</option>
							<option>계정</option>
							<option>거래처</option>
							<option>거래내용</option>
							<option>비고</option>
						</select> <input class="input_size pxsize150" name="startDate"
							id="startDate" type="date" value=""> ~ <input
							class="input_size pxsize150" type="date" id="endDate" name="endDate" value="">
					</div>

					<div class="top_title_area size35">
						<input class="input_size pxsize200" type="text"
							placeholder="계정/거래처/거래내용/비고"> <input type="button"
							class="btn_normal btn_size_normal" value="검색" />
					</div>
					<div class="top_btn_area size25">
						<input type="button" class="btn_normal btn_size_normal" value="등록" />
						<input type="button" class="btn_normal btn_size_normal" value="수정" />
						<input type="button" class="btn_normal btn_size_normal" value="삭제" />
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
					<div class="top_btn_area size75"></div>
				</div>
				</form>
				<div class="table_area_kh">
				<table class="table_list tborder pxsize1600">
					<tbody>
						<tr class="table_list_header">
							<td rowspan="2">
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display: none;"
										id="checkall" /> <label for="checkall"></label>
									<!-- squaredOne 같이? -->
								</div>
							</td>
							<td rowspan="2">수정</td>
							<td rowspan="2">NO</td>
							<td rowspan="2">거래일</td>
							<td rowspan="2">계정</td>
							<td rowspan="2">거래처</td>
							<td rowspan="2">거래내용</td>							
							<td colspan="3">수입(매출)</td>
							<td colspan="3">비용(원가관련매입포함)</td>
							<td colspan="3">고정자산증감(매매)</td>
							<td rowspan="2">비고</td>
						</tr>
						<tr class="table_list_header">
							<td>합계액</td>
							<td>공급가</td>
							<td>부가세</td>
							<td>합계액</td>
							<td>공급가</td>
							<td>부가세</td>
							<td>합계액</td>
							<td>공급가</td>
							<td>부가세</td>
						</tr>
						<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
							<tr class="list_contents">
							<td style="cursor: default;">
								<div class="squaredOne">
									<input type="checkbox" value="None" style="display: none;"
										id="squaredOne10" name="check" /> <label for="squaredOne10"></label>
								</div>
							</td>
							<td style="cursor: default;"><input type="button" value="수정" /></td>
							<td class="t_o">10</td>
							<td class="t_o">2019-12-02</td>
							<td class="t_o">오후 5:40</td>
							<td class="t_o">홍길동</td>
							<td class="t_o">01012341234</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">합계액</td>
							<td class="t_o">공급가</td>
							<td class="t_o">부가세</td>
							<td class="t_o">홍길동</td>
						</tr>
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
				<div class="blank_space"></div>
			</div>
		</div>
</body>
</html>