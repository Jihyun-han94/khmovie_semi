<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="inner-wrap">
	<div class="lnb-area location-fixed">
		<nav id="lnb">
			<ul>
				<li style="border-top: 0px solid #d8d9db;"><a href="/mypage" title="예매 내역 조회">마이페이지</a></li>
				<li><a href="#" title="예매 내역 조회">예매 내역 조회</a></li>
                <li><a href="#" title="개인 정보 수정">개인정보 수정</a></li>
				<li><a href="#" 	titel="나의 후기 관리">나의 후기 관리</a></li>
				<li><a href="#"		title="나의 등급 조회">나의 등급 조회</a></li>
			</ul>
		</nav>
	</div>


<div id="contents">

	<!-- my-megabox-main -->
	<div class="my-megabox-main">

		<div class="my-magabox-info ">
			<!-- top -->
			<div class="top">
				<div class="photo" id="myPhoto">
					<div class="wrap">
						<button type="button" class="img">
							<img src="/static/pc/images/mypage/bg-photo.png" alt="박하경"
							onerror="noImg(this, 'human')">
						</button>
					</div>
				</div>

				<div class="grade">
					<p class="name">
					사용자 님은 <br>
					일반 등급입니다.
					</p>

					<div class="link">
						<a href="/mypage/myinfo?returnURL=info" title="개인정보수정 페이지로 이동">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
						<a href="#layer_before_grade" id="bfrClassSearch" class="btn-modal-open" w-data="400" h-data="400" title="지난등급 상세보기">
							지난등급조회 <i class="iconset ico-arr-right-reverse"></i>
						</a>
					</div>
				</div>
			</div>
			<!--// top -->
		</div>
		<!--// my-magabox-info -->


		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 예매내역</h2>

				<a href="/mypage/bookinglist?tab=01" class="more" title="나의 예매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<!-- my-reserve-history -->
			<div class="my-reserve-history">
				<ul>
					<li class="no-result">
						<div class="no-history-reservation">
							예매 내역이 없습니다.
						</div>
					</li>
				</ul>
			</div>
			<!--// my-reserve-history -->
		</div>

		<div id="myPurc">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 구매내역</h2>

				<a href="/mypage/bookinglist?tab=02" class="more" title="나의 구매내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<div class="table-wrap">
				<table class="board-list line" summary="나의 구매내역 요약 표">
					<caption>나의 구매내역 요약 표</caption>
					<colgroup>
						<col style="width:160px;">
						<col style="width:140px;">
						<col>
						<col style="width:120px;">
						<col style="width:80px;">
					</colgroup>
					<tbody>
						<tr></tr>
					</tbody>
				</table>
			</div>
		</div>

			<!-- right -->
			<div class="col right" id="myInq">
				<div class="tit-util">
					<h2 class="tit small">문의내역</h2>

					<a href="/mypage/myinquiry?tab=" class="more" title="문의내역 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
				</div>

				<div class="brd-list">
					<ul>
						<li class="no-result">
							문의내역이 없습니다.
						</li>
					</ul>
				</div>
			</div>
			<!--// right -->
		</div>
		<!--// column -->
	</div>
	<!--// my-megabox-main -->
</div>
</div>

</body>
</html>