<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 목록</title>
<!-- 탭 아이콘 -->
<link rel="shortcut icon" href="resources/images/Eimages/hairshop.ico">
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/Hairshop/css/Main.css" />
<!-- 메인 CSS -->
<link rel="stylesheet" type="text/css" href="./css/Hairshop/css/Main2.css" />
<!-- 레이아웃 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="./css/Hairshop/css/layout.css" />
<!-- 버튼 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="./css/Hairshop/css/btn.css" />
<!-- input 스타일 CSS -->
<link rel="stylesheet" type="text/css" href="./css/Hairshop/css/input.css" />

<!-- jQuery js 파일 -->
<script type="text/javascript" src="./script/jquery/jquery-1.12.4.min.js"></script>
<!-- 슬림 스크롤 js 파일 -->
<script type="text/javascript" src="./script/jquery/jquery.slimscroll.js"></script>
<!-- 메인 js 파일 -->
<script type="text/javascript" src="./script/Main.js"></script>
<!-- 버튼 js 파일 -->
<script type="text/javascript" src="./script/btn.js"></script>

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
	<div class="left_wrap">
		<div class="logo_wrap">
			<div>
				<img src="./images/hairshop.ico"> EASYS SHOP
			</div>
		</div>
		<div class="menu_wrap">
			<div class="first_menu_wrap">
				<div class="first_menu_on">
					<div>
						<div class="menu_txt">고객</div>
						<div class="menu_gbn" id="menu_customer"></div>
					</div>
				</div>
				<div class="second_menu_wrap">
					<div class="second_menu">
						<div id="menu_customer_add">고객등록</div>
					</div>
					<div class="second_menu">
						<div id="menu_customer_list">고객관리</div>
					</div>
				</div>
			</div>
			<div class="first_menu">
				<div>
					<div class="menu_txt">직원</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>직원등록</div>
					</div>
					<div class="second_menu">
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
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>시술등록</div>
					</div>
					<div class="second_menu">
						<div>시술관리</div>
					</div>
					<div class="second_menu">
						<div>시술일별현황</div>
					</div>
					<div class="second_menu">
						<div>시술상위고객</div>
					</div>
				</div>
			<div class="first_menu">
				<div>
					<div class="menu_txt">판매</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>판매등록</div>
					</div>
					<div class="second_menu">
						<div>판매관리</div>
					</div>
					<div class="second_menu">
						<div>판매일별현황</div>
					</div>
				</div>
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">포인트</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
			</div>
			
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>포인트등록</div>
					</div>
					<div class="second_menu">
						<div>포인트관리</div>
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
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>재고등록</div>
					</div>
					<div class="second_menu">
						<div>재고현황</div>
					</div>
				</div>
				<div class="first_menu_wrap">
			
			<div class="first_menu">
				<div>
					<div class="menu_txt">입고</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			</div>
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>입고등록</div>
					</div>
					<div class="second_menu">
						<div>입고관리</div>
					</div>
				</div>
			<div class="first_menu_wrap">
				<div class="first_menu">
					<div>
						<div class="menu_txt">출고</div>
						<div class="menu_gbn"></div>
					</div>
				</div>
				<!-- <div class="second_menu_wrap">
				<div class="second_menu">
					<div>등급목록</div>
				</div>
				<div class="second_menu">
					<div>등급 추가/수정</div>
				</div>
			</div> -->
			</div>
			
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>출고등록</div>
					</div>
					<div class="second_menu">
						<div>출고관리</div>
					</div>
				</div>
				<div class="first_menu_wrap">
			
			<div class="first_menu">
				<div>
					<div class="menu_txt">기초코드관리</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
			</div>
			<div class="second_menu_wrap">
					<div class="second_menu">
						<div>등급코드관리</div>
					</div>
					<div class="second_menu">
						<div>시술코드관리</div>
					</div>
					<div class="second_menu">
						<div>직급코드관리</div>
					</div>
					<div class="second_menu">
						<div>상품코드관리</div>
					</div>
					<div class="second_menu">
						<div>계정코드관리</div>
					</div>
					<div class="second_menu">
						<div>거래처코드관리</div>
					</div>
					
				</div>
				<div class="first_menu_wrap">
			
			<div class="first_menu">
				<div>
					<div class="menu_txt">일정관리</div>
					<div class="menu_gbn"></div>
				</div>
			</div>
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
					<div>Home > 고객 > 고객 목록</div>
				</div>
			</div>
			<div class="person_area">
				<div class="p_img"></div>
				<div class="p_info">
					<div>
						<div>
							이성준 팀장<br />고객1팀
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
			<div class="title_area">고객 목록</div>
			<div class="content_area">
			
			</div>
		</div>
	</div>
</body>
</html>