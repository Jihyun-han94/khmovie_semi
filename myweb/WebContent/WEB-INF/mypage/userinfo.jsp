<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="mypage.MypageVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">

<script>
	    function check() {
	      var bfpw = document.getElementById('bfpw').value;
	      var afpw = document.getElementById('afpw').value;
	      var chpw = document.getElementById('chpw').value;
	      var hdpw = document.getElementById('userpw').value;
	      
	      if(afpw != null) {
		      if(afpw != chpw) {
		        alert("변경한 비밀번호가 일치 하지 않습니다");
		        return false;
		      }
		  }
	      
	      if(bfpw != hdpw){
	    	  alert("현재 비밀번호가 일치 하지 않습니다");
		        return false;
	      }
	      
	      return true;
		
	    }
	    
	    function deleteMember() {
	    	var con = confirm("정말로 탈퇴하십니까?");
	    	if (con){
	    		var pw = document.getElementById('userpw').value;
	    		var pwcheck = prompt("현재 비밀번호를 입력해주세요.");
	    		if(pwcheck == pw)
	    			location.href="/deleteMember";
	    		else
	    			alert("현재 비밀번호가 일치 하지 않습니다");
	    	}
	    }
	    
	    
	   </script>

</head>
<body>
<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
</header>
<div class="inner-wrap">
	<div class="lnb-area location-fixed">
		<%@ include file="/WEB-INF/module/mypage_lnb_nav.jsp" %>
	</div>
	<% MypageVO userinfo = (MypageVO) request.getAttribute("userinfo"); %>
	<div id="contents">
		<h2 class="tit">개인 정보 수정</h2>
		<form name="mbInfoForm" action="infoupdate" method="post" onsubmit="return check()">
		      <input type="hidden" name="userid" id="userid" value="<%=userinfo.getUserId() %>">
              <input type="hidden" name="userpw" id="userpw" value="<%=userinfo.getUserPw() %>">
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

                                 <input type="text" name="phone" id="phone" class="input-text w500px" placeholder="010-0000-0000" maxlength="13" value="<%= userinfo.getPhoneNumber() %>"/>

                              </td>
                          </tr>
                          <tr>
                              <th scope="row">
                                  <label for="email">이메일</label>
                              </th>
                              <td>
                                  <input type="text" id="email" name="email" class="input-text w500px" value="<%=userinfo.getEmail() %>" />
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">현재 비밀번호</th>
                              <td>
                                  <input type="password" id="bfpw" name="bfpw" class="input-text w500px"/>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">변경할 비밀번호</th>
                              <td>
                                  <input type="password" id="afpw" name="afpw" class="input-text w500px"/>
                              </td>
                          </tr>
                          <tr>
                              <th scope="row">비밀번호 확인</th>
                              <td>
                                  <input type="password" id="chpw" name="chpw" class="input-text w500px"/>
                              </td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="btn-group">
			<button type="submit" class="button gray-line small ml05">수정</button>
			<button type="button" class="button gray-line small ml05" onclick="return deleteMember()">회원 탈퇴</button>
		</div>
               
              </div>
          </form>
          
          </div>
          </div>
</body>
</html>