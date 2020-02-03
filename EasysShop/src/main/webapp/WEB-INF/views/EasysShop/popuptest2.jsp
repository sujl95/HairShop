<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@include file="test.html" %>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월간 예약 목록</title>
<!-- popup추가 -->
<!-- <link rel="import" href="test.html"> -->
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
 

</script>


<!-- 주소 api -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>
</head>
<body>
<header id="header">
</header>
<div id="popup_wrap">
<%@include file="test.html" %> 
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
			<div class="second_menu_wrap">
				<div class="second_menu">
					<div>예약 & 일정</div>
				</div>
				<div class="second_menu">
					<div>월간 예약 목록</div>
				</div>
				<div class="second_menu">
					<div>월간 일정 목록</div>
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
			<div class="title_area">월간 예약 목록</div>
			<div class="content_area">
				<input type="text" id="sample5_address" placeholder="주소">
<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 API KEY를 사용하세요&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = fullAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>​
			</div>
		</div>
	</div>
</body>
</html>