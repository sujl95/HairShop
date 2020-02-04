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
<style type="text/css">
	table {
	width: 1050px;
	border-collapse: collapse; /* 셀 테두리 합치기 */
	padding: 0px;
	margin: 0px;
	border-spacing: 0px;
	font-size: 10pt;
	border-top: 2px solid #27a7df;
}

td {
	padding: 0px 5px;
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
	font-size: 7pt;
	height: 30px;
	text-align : left;
}
.th_down {
	padding-left : 10px;
}
.detail_table_tr{
	width: 100%;
	height:30px;
}

.ttr{
	font-size : 10pt;
}

.input_normal {
	border: 0px;
}

.input_normal:focus {
	border: 0px;
}
</style>
</head>
<body>
<!-- 공용팝업 -->
<div id="popup_wrap">
<%@include file="test.html" %> 
</div>
	
	<!------------------------------------직원 상세정보 시작----------------------------------->
	<div class="pop_wrap pop_off">
		<div class="pop_bg"></div>
		<div class="pop pop_size_customer_detail pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 직원 상세정보
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<!-- 내용입력 -->
			<div class="pop_detail_top_area">
				<!-- 상단 버튼 -->
				<div class="pop_detail_top1">
				<input type="button" class="btn_normal btn_size_normal" value="수정"/>
				</div>
				<div class="pop_detail_top2">
				</div>
			</div>
			<div class="detail_srch_area">
				<select class="detail_srch_ddl">
					<!-- 검색드랍다운리스트 -->
					<option selected="selected">전체</option>
					<option>직원명</option>
					<option>연락처</option>
				</select> <input type="text" class="txt_srch" placeholder="검색어를 입력해주세요." />
				<div class="detail_btn_nomarl detail_btn_size_normal">검색</div>
			</div>
			<!-- 상세보기 위 테이블 -->
			<div class="detail_table_area" style="height: auto;">
				<table>
					<tr class="detail_tr">
						<th class = "top_th">직원명</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">직급</th>
						<td class="top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<td class="detail_row1" rowspan="7"><div
								class="detail_row_txt1">메모</div></td>
						<td class="detail_row2" rowspan="7">
						<input type="text" class="detail_txt_big" /></td>

					</tr>
					<tr class="detail_tr">
						<th class = "top_th">성별</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">생일</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">주소</th>
						<td class = "top_td" colspan="3"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">휴대폰</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">근무여부</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">입사일</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">월급일</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">은행명</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">계좌번호</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
					<tr class="detail_tr">
						<th class = "top_th">예금주</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
						<th class = "top_th">이메일</th>
						<td class = "top_td"><input type="text" class="input_normal" readonly = "readonly"/></td>
					</tr>
				</table>
			</div>
			<!-- 상세내역 -->
			<table>
			<tr class = "detail_table_tr">
			<td>
			<div class="pop_title_text" style="margin-top: 10px; text-align: left; text-indent: 0px">
			시술 상세내역
			</div>
			<div class="detail_table_top_area1">
					<div class="detail_top_title_area1 size40" style="vertical-align: bottom;">
						<input type="button" class="btn_date pxsize50" id="today"
							value="오늘" /> 
							<input type="button" class="detail_btn_date pxsize50" id="3days" value="3일" /> <input type="button"
							class="detail_btn_date pxsize50" id="7days" value="7일" /> 
							<input type="button" class="detail_btn_date pxsize50" id="15days" value="15일" />
						<input type="button" class="detail_btn_date pxsize50" id="month" value="한달" /> <input type="button" class="btn_date pxsize50" id="total" value="전체" />
					</div>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div class="detail_table_top_area">
					<div class="detail_top_title_area size40" style="line-height: 33px;">
						<select class="detail_input_size pxsize100">
							<option selected="selected">전체</option>
							<option>예약자</option>
							<option>연락처</option>
							<option>담당자</option>
							<option>예약내용</option>
						</select> <input class="detail_input_size pxsize150" name="datemove"
							id="startDate" name="popstartDate" type="date" value=""> ~ <input
							class="detail_input_size pxsize150" type="date" id="endDate" name="popendDate" value="">
					</div>
					<div class="detail_top_title_area size25" style="line-height: 33px;">
						<input class="detail_input_size pxsize200" type="text"
							placeholder="예약자/연락처/담당자/예약내용"> <input type="button"
							class="btn_normal detail_btn_size_normal" value="검색" />
							
					</div>
				</div>
				</td>
				</tr>
			</table>
			<div>
				<div class = "dtta">
					<div class = "detail_botttom_area">
					<table class = "detail_bottom_table">
					<colgroup>
						<col width = "5%"/>
						<col width = "5%"/>
						<col width = "12%"/>
						<col width = "20%"/>
						<col width = "10%"/>
						<col width = "8%"/>
						<col width = "8%"/>
						<col width = "8%"/>
						<col width = "8%"/>
						<col width = "8%"/>
						<col width = "8%"/>
					</colgroup>
						<thead>
							<tr class = "ttr">
								<td>NO</td>
								<td>성명</td>
								<td>시술그룹명</td>
								<td>시술명</td>
								<td>시술날짜</td>
								<td>총건수</td>
								<td>총금액</td>
								<td>총현금</td>
								<td>총카드</td>
								<td>객단가</td>
								<td>비율</td>
							</tr>
						</thead>
						<tbody>
							<tr class = "ttr">
								<td>1</td>
								<td>홍길동</td>
								<td>남</td>
								<td>2020-01-20</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td>5</td>
								<td>5</td>
							</tr>
							<tr class = "ttr">
								<td>1</td>
								<td>홍길동</td>
								<td>남</td>
								<td>2020-01-20</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td>5</td>
								<td>5</td>
							</tr>
							<tr class = "ttr">
								<td>1</td>
								<td>홍길동</td>
								<td>남</td>
								<td>2020-01-20</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td>5</td>
								<td>5</td>
							</tr>
							<tr class = "ttr">
								<td>1</td>
								<td>홍길동</td>
								<td>남</td>
								<td>2020-01-20</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td>5</td>
								<td>5</td>
							</tr>
							<tr class = "ttr">
								<td>1</td>
								<td>홍길동</td>
								<td>남</td>
								<td>2020-01-20</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>100,000</td>
								<td>200,000</td>
								<td>5</td>
								<td>5</td>
							</tr>
						</tbody>
					</table>
					</div>
				</div>
		</div>
	</div>
	</div>
	<!------------------------------------직원 상세정보 끝----------------------------------->
	
	<!------------------------------------직원 등록 시작----------------------------------->
	<div class="pop_wrap">
		<div class="pop_bg"></div>
		<div class="pop pop_size_staff_insert pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 직원 등록
				</div>
				<div class="pop_close">
					<img src="resources/images/Eimages/button/icon_del_white.png"
						class="BtnPopClose" />
				</div>
			</div>
			<!-- 내용입력 -->
			<div class="pop_detail_top_area">
				<!-- 상단 버튼 -->
				<div class="pop_detail_top1">
				<input type="button" class="btn_normal btn_size_normal" value="등록"/>
				<input type="button" class="btn_normal btn_size_normal" value="취소"/>
				</div>
				<div class="pop_detail_top2">
				</div>
			</div>
			<div class="pop_mid_area">
				<table style="width: 100%;">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tbody>
						<tr>
							<td class="table_header_td">직원명</td>
							<td><input type="text" class="input_normal" value=""></td>
							<td class="table_header_td">직급</td>
							<td>
								<input type="text" class="input_normal" style="width: 60%;" value="">
								<div class="btn_normal btn_size_w40h20">검색</div>
							</td>
						</tr>
						<tr>
							<td class="table_header_td">주민번호</td>
							<td><input type="text" class="input_normal" value=""></td>
							<td class="table_header_td">휴대폰</td>
							<td><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">생일</td>
							<td><input type="date" class="input_normal" value=""></td>
							<td class="table_header_td">성별</td>
							<td><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">이메일</td>
							<td colspan="3"><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">주소</td>
							<td colspan="3"><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">입사일</td>
							<td><input type="date" class="input_normal" value=""></td>
							<td class="table_header_td">월급일</td>
							<td><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">메모</td>
							<td colspan="3"><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">은행명</td>
							<td colspan="3"><input type="text" class="input_normal" value=""></td>
						</tr>
						<tr>
							<td class="table_header_td">계좌번호</td>
							<td><input type="text" class="input_normal" value=""></td>
							<td class="table_header_td">예금주</td>
							<td><input type="text" class="input_normal" value=""></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!------------------------------------직원 등록 끝----------------------------------->
	
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
			<div class="first_menu_on">
				<div>
					<div class="menu_txt">직원</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
	 			<div class="second_menu_wrap"> 	
	 				<div class="second_menu"> 	
	 					<div>직원등록</div> 	
	 				</div> 	
	 				<div class="second_menu_on"> 	
	 					<div>직원관리</div>	
	 				</div> 	
	 				<div class="second_menu"> 	
	 					<div>근태관리</div> 	
					</div> 	
				</div>
			
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
			
			<div class="first_menu_on">
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
			<div class="title_area">직원 관리 목록</div>
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
							<input class="input_size pxsize150" name="startDate" id="startDate" type="date" value="">
							~
							<input class="input_size pxsize150" name="endDate" type="date" id="endDate"value="">
						</div>
						<div class="top_title_area size35">
							<input class="input_size pxsize200" type="text" placeholder="예약자/연락처/담당자/예약내용">
							<input type="button" class="btn_normal btn_size_normal" value="검색"/>
						</div>
						<div class="top_btn_area size25">
							<input type="button" class="btn_normal btn_size_normal" value="등록"/>
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
							<col width="5%">
							<col width="15%">
							<col width="15%">
							<col width="30%">
						</colgroup>
						<tbody>
							<tr class="table_list_header">
								<td>
									<div class="squaredOne_h">
										<input type="checkbox" value="None" style="display : none;" id="checkall"  />
										<label for="checkall"  ></label> <!-- squaredOne 같이? -->
									</div>
								</td>
								<td>NO</td>
								<td>직원명</td>
								<td>직급</td>
								<td>연락처</td>
								<td>생일</td>
								<td>성별</td>
								<td>입사일</td>
								<td>월급일</td>
								<td>주소</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne1" name="check" />
										<label for="squaredOne1"></label>
									</div>
								</td>
								<td>1</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne2" name="check"/>
										<label for="squaredOne2"></label>
									</div>
								</td>
								<td>2</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne3"  name="check"/>
										<label for="squaredOne3"></label>
									</div>
								</td>
								<td>3</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne4" name="check"/>
										<label for="squaredOne4"></label>
									</div>
								</td>
								<td>4</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne5" name="check"  />
										<label for="squaredOne5"></label>
									</div>
								</td>
								<td>5</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne6" name="check"  />
										<label for="squaredOne6"></label>
									</div>
								</td>
								<td>6</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne7" name="check"  />
										<label for="squaredOne7"></label>
									</div>
								</td>
								<td>7</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne8" name="check"  />
										<label for="squaredOne8"></label>
									</div>
								</td>
								<td>8</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne9" name="check"  />
										<label for="squaredOne9"></label>
									</div>
								</td>
								<td>9</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne10" name="check"  />
										<label for="squaredOne10"></label>
									</div>
								</td>
								<td>10</td>
								<td>홍길동</td>
								<td>대리</td>
								<td>01012341234</td>
								<td>1995-07-03</td>
								<td>남</td>
								<td>2020-01-07</td>
								<td>2020-02-10</td>
								<td>경기도 고양시 일산서구 고양대로 685 101동 204호</td>
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