<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">

</head>
<body>
<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
</header>
<div class="inner-wrap">
	<div class="lnb-area location-fixed">
		<nav id="lnb">
			<ul>
				<li style="border-top: 0px solid #d8d9db;"><a href="/mypage" title="예매 내역 조회">마이페이지</a></li>
				<li><a href="<%=request.getContextPath() %>/myreserve" title="예매 내역 조회">예매 내역 조회</a></li>
                <li><a href="<%=request.getContextPath() %>/userinfo" title="개인 정보 수정">개인정보 수정</a></li>
				<li><a href="<%=request.getContextPath() %>/myreview" title="나의 리뷰 관리">나의 후기 관리</a></li>
				<li><a href="<%=request.getContextPath() %>/grade"	title="나의 등급 조회">나의 등급 조회</a></li>
			</ul>
		</nav>
	</div>

	<div id="contents">
		<h2 class="tit">개인 정보 수정</h2>
		<form name="mbInfoForm">
              <input type="hidden" name="mbNo" value="10412389" />
              
              <input type="hidden" name="phoneNo" value="010-0000-0000" />
              <input type="hidden" name="zipcd" value="" />
              <input type="hidden" name="mbAddr" value="" />
              <input type="hidden" name="mbProfilFileNo" value="" />
              <input type="hidden" id="mbByymmdd" value="19930824" />

              <div class="table-wrap mb40">
                  <table class="board-form">
                      <colgroup>
                          <col style="width:180px;">
                          <col>
                      </colgroup>
                      <tbody>
                          <tr>
                              <th scope="row">이름</th>
                              <td>
                                  <span class="mbNmClass">사용자 이름</span>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row"> 생년월일</th>
                              <td>1993년 8월 24일
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="num">휴대폰</label>
                              </th>
                              <td>
                                  <div class="change-phone-num-area">
                                      <div class="position">
                                          <input type="text" id="chPhone" class="input-text w160px numType" placeholder="'-'없이 입력해 주세요" title="변경할 휴대폰 번호 입력" maxlength="11" />
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="email">이메일</label>
                              </th>
                              <td>
                                  <input type="text" id="email" name="mbEmail" class="input-text w500px" value="aaa@naver.com" />
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">현재 비밀번호</th>
                              <td>
                                  <input type="text" id="nowpw" name="password" class="input-text w500px"/>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">변경할 비밀번호</th>
                              <td>
                                  <input type="text" id="nowpw" name="password" class="input-text w500px"/>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </form>
          
          </div>
          </div>
</body>
</html>