<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태 관리 목록</title>
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
	width: 100%;
	border-collapse: collapse; /* 셀 테두리 합치기 */
	border-top: 2px solid #27a7df;
}

.detail_tr {
	border-bottom: 1px solid #CCC;
	font-size: 10pt;
	height: 30px;
}

.detail_table_tr{
	height:30px;
}

.detail_area {
	width: 100%;
	height: 100%;
	padding: 20px;
}

th {
	background-color: #EAEAEA;
}

.input_short {
	width: 50px;
}

.list_contents:hover {
	cursor: text !important;
	text-decoration: none !important;
}

td:hover {
	cursor: text !important;
	text-decoration: none !important;
}

</style>
</head>
<body>
	<div class="pop_wrap">
		<div class="pop_bg"></div>
		<div class="pop pop_size_dlWrite pop_white">
			<div class="pop_title_area">
				<div class="pop_title_text">
					<img src="resources/images/Eimages/EasysShopLogo.PNG"
						class="pop_icon"> 퇴근시간 기록
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
			<!-- 상세보기 위 테이블 -->
			<div class="detail_area">
				<table>
				<colgroup>
					<col width="20%"/>
					<col width="80%"/>
				</colgroup>
					<tr class="detail_tr">
						<th>출근일자</th>
						<td><input type="date" name="popstartDate"/></td>
					</tr>
					<tr class="detail_tr">
						<th>출근시간</th>
						<td>
						<input type="text" class="input_short"/><span class="detail_td_span">시</span>
						<input type="text" class="input_short"/><span>분</span>
						</td>
					</tr>
					<tr class="detail_tr">
						<th>퇴근시간</th>
						<td>
						<input type="text" class="input_short"/><span class="detail_td_span">시</span>
						<input type="text" class="input_short"/><span>분</span>
						</td>
					</tr>
					<tr class="detail_tr">
						<th>총근무시간</th>
						<td>
						<input type="text" class="input_short"/><span class="detail_td_span">시간</span>
						<input type="text" class="input_short"/><span>분</span>
						</td>
					</tr>
					<tr class="detail_tr">
						<th>근무상태</th>
						<td>
							<select>
								<option>출근</option>
								<option>지각</option>
								<option>조퇴</option>
							</select>
						</td>
					</tr>
					<tr class="detail_tr">
						<th>비고</th>
						<td>
							<textarea class="textarea_normal"></textarea>
						</td>
					</tr>
				</table>
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
			<div class="title_area">근태 관리 목록</div>
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
						<div class="top_title_area size30" style="vertical-align: top;">
							<input class="input_size pxsize150" name="startDate" id="startDate" type="date" value="">
							~
							<input class="input_size pxsize150" type="date" id="endDate" name="endDate" value="">
						</div>
						<div class="top_title_area size45">
							<input class="input_size pxsize150" type="text" placeholder="담당자">
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
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="20%">
							<col width="5%">
							<col width="5%">
							<col width="5%">
							<col width="10%">
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
								<td>날짜</td>
								<td>직원명</td>
								<td>출근시간</td>
								<td>퇴근시간</td>
								<td>근무시간</td>
								<td>사유</td>
								<td>지각</td>
								<td>조퇴</td>
								<td>결근</td>
								<td>예상 총 시급</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne1" name="check" />
										<label for="squaredOne1"></label>
									</div>
								</td>
								<td>1</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne2" name="check"/>
										<label for="squaredOne2"></label>
									</div>
								</td>
								<td>2</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne3"  name="check"/>
										<label for="squaredOne3"></label>
									</div>
								</td>
								<td>3</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne4" name="check"/>
										<label for="squaredOne4"></label>
									</div>
								</td>
								<td>4</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne5" name="check"  />
										<label for="squaredOne5"></label>
									</div>
								</td>
								<td>5</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne6" name="check"  />
										<label for="squaredOne6"></label>
									</div>
								</td>
								<td>6</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne7" name="check"  />
										<label for="squaredOne7"></label>
									</div>
								</td>
								<td>7</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne8" name="check"  />
										<label for="squaredOne8"></label>
									</div>
								</td>
								<td>8</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne9" name="check"  />
										<label for="squaredOne9"></label>
									</div>
								</td>
								<td>9</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
							</tr>
							<tr class="list_contents">
								<td style="cursor : default;">
									<div class="squaredOne">
										<input type="checkbox" value="None" style="display : none;" id="squaredOne10" name="check"  />
										<label for="squaredOne10"></label>
									</div>
								</td>
								<td>10</td>
								<td>2020-01-20</td>
								<td>홍길동</td>
								<td>오전 08:00:00</td>
								<td>오후 06:00:00</td>
								<td>10시간 0분 근무</td>
								<td></td>
								<td>x</td>
								<td>x</td>
								<td>x</td>
								<td>10,000</td>
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