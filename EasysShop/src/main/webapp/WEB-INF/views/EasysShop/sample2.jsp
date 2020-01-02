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
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/Main.css" />
<!-- 버튼 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/btn.css" />
<!-- 레이아웃 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/layout.css" />
<!-- input CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/input.css" />
<!-- 팝업 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/pop.css" />
<!-- jQuery js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/jquery.slimscroll.js"></script>
<!-- 메인 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/Main.js"></script>
<!-- 버튼 js 파일 -->
<script type="text/javascript" src="resources/script/jquery/btn.js"></script>
<script type="text/javascript">
	//버튼에 한글자씩 추가되면 길이가 10씩 늘어납니다.
	$(document).ready(function() {
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
		 
		  
	});
</script>
</head>
<body>
	<!-- 시술 등급 목록 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Procedure_Code pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						시술 코드 관리
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
					<div class="pop_btn_bottom_area">
						<input type="button" class="btn_normal btn_size_normal" value="등록"/>
						<input type="button" class="btn_normal btn_size_normal" value="수정"/>
						<input type="button" class="btn_normal btn_size_normal" value="삭제"/>
						<input type="button" class="btn_normal btn_size_normal pxsize200" value="적립 포인트 일괄 변경"/>
					</div>
					<table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<td class="field_name first_field_name">검색어</td>
								<td class="field_contents">
									<input class="input_size size60" type="text">
									<input type="button" class="btn_normal btn_size_normal" value="검색"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table_list tborder" id="pop_Procedure_list" >
						<colgroup>
							<col width="3%">
							<col width="17%">
							<col width="25%">
							<col width="15%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<thead>
						<tr class="table_list_header" >
							<td rowspan="2">
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_PC_checkall"  />
									<label for="pop_PC_checkall"  ></label> <!-- squaredOne 같이? -->
								</div>
							</td>
							<td rowspan="2">그룹명</td>
							<td colspan="2">기본정보</td>
							<td colspan="2">적립정보</td>
						</tr>
						
						<tr class="table_list_header" >
							<td>시술명</td>
							<td>요금</td>
							<td>현금적립금</td>
							<td>카드적립금</td>
						</tr>
						</thead>
					</table>
				<div class="pop_schedule_contents">
					<div class="pop_Procedure_list">
					<table class="table_list tborder" id="pop_Procedure_list" >
						<colgroup>
							<col width="3%">
							<col width="17%">
							<col width="25%">
							<col width="15%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<tbody>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne1" name="pop_PC_check" />
										<label for="pop_PC_squaredOne1"></label>
									</div>
								</td>
								<td rowspan="3">기타</td>
								<td>기타</td>
								<td>10,000</td>
								<td>0</td>
								<td>0</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne2" name="pop_PC_check" />
										<label for="pop_PC_squaredOne2"></label>
									</div>
								</td>
								<td>붙임머리</td>
								<td>75,000</td>
								<td>7,500</td>
								<td>3,750</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne3" name="pop_PC_check" />
										<label for="pop_PC_squaredOne3"></label>
									</div>
								</td>
								<td>올림머리</td>
								<td>30,000</td>
								<td>3,000</td>
								<td>1,500</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne4" name="pop_PC_check" />
										<label for="pop_PC_squaredOne4"></label>
									</div>
								</td>
								<td rowspan="3">드라이</td>
								<td>드라이</td>
								<td>15,000</td>
								<td>0</td>
								<td>0</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne5" name="pop_PC_check" />
										<label for="pop_PC_squaredOne5"></label>
									</div>
								</td>
								<td>매직드라이</td>
								<td>15,000</td>
								<td>1,500</td>
								<td>750</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne6" name="pop_PC_check" />
										<label for="pop_PC_squaredOne6"></label>
									</div>
								</td>
								<td>웨이브드라이</td>
								<td>10,000</td>
								<td>1,000</td>
								<td>500</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne4" name="pop_PC_check" />
										<label for="pop_PC_squaredOne4"></label>
									</div>
								</td>
								<td rowspan="3">드라이</td>
								<td>드라이</td>
								<td>15,000</td>
								<td>0</td>
								<td>0</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne5" name="pop_PC_check" />
										<label for="pop_PC_squaredOne5"></label>
									</div>
								</td>
								<td>매직드라이</td>
								<td>15,000</td>
								<td>1,500</td>
								<td>750</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne6" name="pop_PC_check" />
										<label for="pop_PC_squaredOne6"></label>
									</div>
								</td>
								<td>웨이브드라이</td>
								<td>10,000</td>
								<td>1,000</td>
								<td>500</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne4" name="pop_PC_check" />
										<label for="pop_PC_squaredOne4"></label>
									</div>
								</td>
								<td rowspan="3">드라이</td>
								<td>드라이</td>
								<td>15,000</td>
								<td>0</td>
								<td>0</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne5" name="pop_PC_check" />
										<label for="pop_PC_squaredOne5"></label>
									</div>
								</td>
								<td>매직드라이</td>
								<td>15,000</td>
								<td>1,500</td>
								<td>750</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne6" name="pop_PC_check" />
										<label for="pop_PC_squaredOne6"></label>
									</div>
								</td>
								<td>웨이브드라이</td>
								<td>10,000</td>
								<td>1,000</td>
								<td>500</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne4" name="pop_PC_check" />
										<label for="pop_PC_squaredOne4"></label>
									</div>
								</td>
								<td rowspan="3">드라이</td>
								<td>드라이</td>
								<td>15,000</td>
								<td>0</td>
								<td>0</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne5" name="pop_PC_check" />
										<label for="pop_PC_squaredOne5"></label>
									</div>
								</td>
								<td>매직드라이</td>
								<td>15,000</td>
								<td>1,500</td>
								<td>750</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_PC_squaredOne6" name="pop_PC_check" />
										<label for="pop_PC_squaredOne6"></label>
									</div>
								</td>
								<td>웨이브드라이</td>
								<td>10,000</td>
								<td>1,000</td>
								<td>500</td>
						</tr>
						</tbody>
					</table>
					</div>
				</div>
			</div>
	</div>
	<!-- 시술 코드 목록 팝업 - 등록,수정팝업 -->
	<div class="pop_wrap ">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Procedure_Code_add pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						시술 코드
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<div class="pop_schedule_contents">
					<table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tbody>
							
							<tr>
								<td class="field_name first_field_name">분류</td>
								<td class="field_contents colorred" colspan="3">
									<select class="input_size pxsize150 backcolorred"> 
										<option selected="selected">분류를 선택해주세요</option>
										<option>드라이</option>
										<option>컷</option>
										<option>펌</option>
										<option>염색</option>
										<option>크리닉</option>
										<option>기타</option>
									</select>
									해당 분류가 없으면 직접 입력해 주세요
								</td>
							</tr>
								<tr>
								<td class="field_name first_field_name">시술명</td>
								<td class="field_contents">
									<input class="input_normal  backcolorred" type="text">
								</td>
								<td class="field_name first_field_name">현금적립포인트</td>
								<td>
									<input class="input_normal txtalignright" type="text">
								</td>
							</tr>
							</tr>
								<tr>
								<td class="field_name first_field_name">요금</td>
								<td class="field_contents">
									<input class="input_normal txtalignright" type="text">
								</td>
								<td class="field_name first_field_name">카드적립포인트</td>
								<td>
									<input class="input_normal txtalignright" type="text">
								</td>
							</tr>
						</tbody>
					</table>
				<div class="pop_btn_bottom_area">
					<input type="button" class="btn_normal btn_size_normal" value="확인"/>
					<input type="button" class="btn_normal btn_size_normal" value="취소"/>
				</div>
			</div>
		</div>
	</div>
	<!-- 고객 등급 목록 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Customer_Grade pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						고객 등급 코드
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<div class="pop_schedule_contents">
					<table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							
							<tr>
								<td class="field_name first_field_name">검색어</td>
								<td class="field_contents">
									<input class="input_size size60" type="text">
									<input type="button" class="btn_normal btn_size_normal" value="검색"/>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table_list">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr class="table_list_header">
							<td>
								<div class="squaredOne_h">
									<input type="checkbox" value="None" style="display : none;" id="pop_CG_checkall"  />
									<label for="pop_CG_checkall"  ></label> <!-- squaredOne 같이? -->
								</div>
							</td>
							<td>등급명</td>
							<td>레벨</td>
							<td>수정</td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne1" name="pop_CG_check" />
										<label for="pop_CG_squaredOne1"></label>
									</div>
								</td>
								<td>Bronze</td>
								<td>1</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne2" name="pop_CG_check" />
										<label for="pop_CG_squaredOne2"></label>
									</div>
								</td>
								<td>Silver</td>
								<td>2</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne3" name="pop_CG_check" />
										<label for="pop_CG_squaredOne3"></label>
									</div>
								</td>
								<td>Gold</td>
								<td>3</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne4" name="pop_CG_check" />
										<label for="pop_CG_squaredOne4"></label>
									</div>
								</td>
								<td>Platinum</td>
								<td>4</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne5" name="pop_CG_check" />
										<label for="pop_CG_squaredOne5"></label>
									</div>
								</td>
								<td>Diamond</td>
								<td>5</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne6" name="pop_CG_check" />
										<label for="pop_CG_squaredOne6"></label>
									</div>
								</td>
								<td>Master</td>
								<td>6</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
						<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="pop_CG_squaredOne7" name="pop_CG_check" />
										<label for="pop_CG_squaredOne7"></label>
									</div>
								</td>
								<td>Challenger</td>
								<td>7</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
						</tr>
					</table>
					<div class="pop_btn_bottom_area">
						<input type="button" class="btn_normal btn_size_normal" value="코드등록"/>
						<input type="button" class="btn_normal btn_size_normal" value="삭제"/>
						<input type="button" class="btn_normal btn_size_normal" value="취소"/>
					</div>
				</div>
			</div>
	</div>
	<!-- 고객 등급 목록 팝업 - 등록,수정팝업 -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Customer_Grade_add pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						고객 등급 등록
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<div class="pop_schedule_contents">
					<table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							
							<tr>
								<td class="field_name first_field_name">검색어</td>
								<td class="field_contents">
									<input class="input_normal " placeholder="등급명을 입력하신뒤 등록을 클릭하세요" type="text">
								</td>
							</tr>
						</tbody>
					</table>
				<div class="pop_btn_bottom_area">
					<input type="button" class="btn_normal btn_size_normal" value="등록"/>
					<input type="button" class="btn_normal btn_size_normal" value="취소"/>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 일정예약 등록 팝업 -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_schedule pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						일정 예약 등록
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<div class="pop_schedule_contents">
					<table class="pop_table" >
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<td class="field_name first_field_name">일정구분</td>
								<td class="field_contents">
									<select class="input_size pxsize100"> 
										<option selected="selected">일별일정</option>
										<option>월별일정</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">일시</td>
								<td class="field_contents">
									<input class="input_size pxsize130" name="" id="popstartDate" type="date" value="">
									<select class="input_size pxsize100"> 
										<option selected="selected">오전 12시</option>
										<option>오전 01시</option>
										<option>오전 02시</option>
										<option>오전 03시</option>
										<option>오전 04시</option>
										<option>오전 05시</option>
										<option>오전 06시</option>
										<option>오전 07시</option>
										<option>오전 08시</option>
										<option>오전 09시</option>
										<option>오전 10시</option>
										<option>오전 11시</option>
										<option>오후 12시</option>
										<option>오후 01시</option>
										<option>오후 02시</option>
										<option>오후 03시</option>
										<option>오후 04시</option>
										<option>오후 05시</option>
										<option>오후 06시</option>
										<option>오후 07시</option>
										<option>오후 08시</option>
										<option>오후 09시</option>
										<option>오후 10시</option>
										<option>오후 11시</option>
									</select>
									<select class="input_size pxsize100"> 
										<option selected="selected">00분</option>
										<option>10분</option>
										<option>20분</option>
										<option>30분</option>
										<option>40분</option>
										<option>50분</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">담당자</td>
								<td class="field_contents">
									<input class="input_size size70" type="text">
									<input type="button" class="btn_normal btn_size_normal" value="검색"/>
								</td>
							</tr>
							<tr>
								<td class="field_name first_field_name">일정내용</td>
								<td class="field_contents">
									<input class="input_normal" type="text">
								</td>
							</tr>
						</tbody>
					</table>
					<div class="pop_btn_bottom_area">
												<input type="button" class="btn_normal btn_size_normal" value="등록"/>
							<input type="button" class="btn_normal btn_size_normal" value="취소"/>
					</div>
				</div>
			</div>
	</div>
	
	<!-- 장부 등록 팝업  -->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
			<div class="pop pop_size_Procedure_Code pop_white">
				<div class="pop_title_area">
					<div class="pop_title_text">
						<img src="resources/images/Eimages/EasysShopLogo.PNG" class="pop_icon"> 
						장부 등록
					</div>
					<div class="pop_close">
						<img src="resources/images/Eimages/button/icon_del_white.png" class="BtnPopClose"/>
					</div>
				</div>
				<table class="pop_table">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<td>거래일자</td>
							<td></td>
							<td>계정</td>
							<td></td>
						</tr>
						<tr>
							<td>거래처</td>
							<td colspan="3">
								<input class="input_size size80" type="text">
								<input type="button" class="btn_normal btn_size_normal" value="검색"/>
							</td>
						</tr>
						<tr>
							<td>거래내용</td>
							<td colspan="3">
								<input class="input_size size100" type="text">
							</td>
						</tr>
						<tr>
							<td>수량</td>
							<td><input class="input_size size80" type="text">개</td>
							<td>단가</td>
							<td><input class="input_size size80" type="text"></td>
						</tr>
						<tr>
							<td>금액</td>
							<td><input class="input_size size80" type="text"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td colspan="3"></td>
						</tr>
						<tr>
							<td>메모</td>
							<td colspan="3"><input class="input_size size80" type="text"></td>
						</tr>
					</tbody>
				</table>
					<%-- <table class="pop_table">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tbody>
							<tr>
								<td class="field_name first_field_name">검색어</td>
								<td class="field_contents">
									<input class="input_size size60" type="text">
									<input type="button" class="btn_normal btn_size_normal" value="검색"/>
								</td>
							</tr>
						</tbody>
					</table> --%>
				<div class="pop_btn_bottom_area">
						<input type="button" class="btn_normal btn_size_normal" value="등록"/>
						<input type="button" class="btn_normal btn_size_normal" value="취소"/>
					</div>
			</div>
	</div>
	<div class="left_wrap">
		<div class="logo_wrap">
			<div>
				<img src="resources/images/Eimages/EasysShopLogo.PNG"> EASYS SHOP
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
				<div class="second_menu_wrap"> -->
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
					<div>예약&일정</div>
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
					<div>Home > 예약&일정 > 월간 예약 목록 </div>
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
			<div class="title_area">월간 예약 목록</div>
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
							<input type="button" class="btn_normal btn_size_normal" value="등록"/>
							<input type="button" class="btn_normal btn_size_normal" value="수정"/>
							<input type="button" class="btn_normal btn_size_normal" value="삭제"/>
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
								<span id=list_cnt_all">#</span>
								개 항목중
								<span id=list_cnt_select">#</span>
								개 선택
							</div>
						</div>
						<div class="top_btn_area size75">
						</div>
					</div>
					<table class="table_list">
						<colgroup>
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<tbody>
							<tr class="table_list_header">
								<td>
									<div class="squaredOne_h">
										<input type="checkbox" value="None" style="display : none;" id="checkall"  />
										<label for="checkall"  ></label> <!-- squaredOne 같이? -->
									</div>
								</td>
								<td>수정</td>
								<td>삭제</td>
								<td>NO</td>
								<td>예약일</td>
								<td>예약시간</td>
								<td>예약자</td>
								<td>연락처</td>
								<td>담당자</td>
								<td>예약내용</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne1" name="check" />
										<label for="squaredOne1"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>1</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne2" name="check"/>
										<label for="squaredOne2"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>2</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne3"  name="check"/>
										<label for="squaredOne3"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>3</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne4" name="check"/>
										<label for="squaredOne4"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>4</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne5" name="check"  />
										<label for="squaredOne5"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>5</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne6" name="check"  />
										<label for="squaredOne6"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>6</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne7" name="check"  />
										<label for="squaredOne7"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>7</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne8" name="check"  />
										<label for="squaredOne8"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>8</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne9" name="check"  />
										<label for="squaredOne9"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>9</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne10" name="check"  />
										<label for="squaredOne10"></label>
									</div>
								</td>
								<td style="cursor : default;"><input type="button" value="수정"/></td>
								<td style="cursor : default;"><input type="button" value="삭제"/></td>
								<td>10</td>
								<td>2019-12-02</td>
								<td>오후 5:40</td>
								<td>홍길동</td>
								<td>01012341234</td>
								<td>홍길순</td>
								<td>볼륨매직펌</td>
							</tr>
						</tbody>
					</table>
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
           			 <div class="blank_space">
           			 </div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>