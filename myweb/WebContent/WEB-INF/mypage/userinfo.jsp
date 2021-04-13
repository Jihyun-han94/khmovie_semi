<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="mypage.MypageVO" %>
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
		<%@ include file="/WEB-INF/module/mypage_lnb_nav.jsp" %>
	</div>
	<%
		MypageVO userinfo = (MypageVO) request.getAttribute("userinfo");
	%>
	<div id="contents">
		<h2 class="tit">개인 정보 수정</h2>
		<form name="mbInfoForm" action="./userinfo" method="post">
              <div class="table-wrap mb40">
                  <table class="board-form">
                      <colgroup>
                          <col style="width:180px;">
                          <col>
                      </colgroup>
                      <tbody>
                      <tr>
                              <th scope="row">아이디</th>
                              <td>
                     	 <input type="hidden" name="id" value="<%= userinfo.getUserId() %>" readonly>
                      </td>
                          </tr>
                          <tr>
                              <th scope="row">이름</th>
                              <td>
                                  <span class="mbNmClass"><%=userinfo.getUserName() %></span>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row"> 생년월일</th>
                              <td><%=userinfo.getBirthDate() %>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="num">휴대폰</label>
                              </th>
                              <td>
                                  <div class="change-phone-num-area">
                                      <div class="position">
                                          <input type="text" id="phone" class="input-text w160px numType" placeholder="010-0000-0000" title="변경할 휴대폰 번호 입력" maxlength="11" />
                                      </div>
                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="email">이메일</label>
                              </th>
                              <td>
                                  <input type="text" id="email" name="mbEmail" class="input-text w500px" value="<%=userinfo.getEmail() %>" />
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">현재 비밀번호</th>
                              <td>
                                  <input type="password" id="bfpw" name="password" class="input-text w500px"/>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">변경할 비밀번호</th>
                              <td>
                                  <input type="password" id="afpw" name="password" class="input-text w500px"/>
                              </td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="btn-group">
			<button type="submit" class="button gray-line small ml05">수정</button>
		</div>
               
              </div>
          </form>
          
          </div>
          </div>
</body>
</html>