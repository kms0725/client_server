<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>Welcome to yangjung</title>
<link rel="stylesheet" type="text/css" href="main.css" />

</head>
<body>

<div class="wrap">
<header>
	<a id="logo" href="main.jsp">카센터(붕붕이 나라) </a>
	<span class="right" style="padding: 30px 10px;">
		<form method=post action="login.jsp" data-ajax="false">
		<fieldset data-role="fieldcontain">
		
			<!--  회원 ID -->
			<label for="ID">회원ID:</label>
			<input type="text" id="id" name="id" size="10" maxlength="10" required="required"/>
			
			<!--  비밀번호 -->
			<label for="pswd">비밀번호:</label>
			<input type="password" id="passwd" name="passwd" size="10" maxlength="10" required="required"/>
	
			
			<button type="submit" data-role="button" data-inline="true">로그인</button>
		</form> |
		<a href="member_form.jsp" target="display_area">회원가입</a>
	</span>
</header>

<nav>
	<ul>
		<li><a href="intro.html" target="display_area">회사소개</a></li>
		<li><a href="part_list.jsp" target="display_area">부품정보</a><li>
		<li><a href="customer_list.jsp" target="display_area">고객정보</a></li>
		<li><a href="#" target="display_area">견적관리</a></li>
		<li><a href="#" target="display_area">정비이력</a></li>
		<li><a href="list.jsp" target="display_area" align="right">게시판</a></li>
	</ul>
</nav>

<hr/>

<article class="left">
	<iframe name="display_area" src="images\logo.jpg"
		width="90%" height="100%"></iframe>
</article>

<aside class="right">
	<a href="customer_form.jsp" target="display_area"><button id="save_favorite" style="width:85px" disabled>
	고객등록</button></a><br/>
	<button id="view_favorite" style="width:85px" disabled>정비등록</button><br/>
	<a href="part.jsp" target="display_area"><button id="memo" style="width:85px" disabled>부품등록</button></a><br/>
	<button id="location" style="width:85px" disabled>현재위치</button>
</aside>

<hr/>

<footer>
	<div id="copyright">
		Copyright (c) 2017 yangjung ALL rights reserved
	</div>
	<div id="SNS">
		<a href="http://facebook.com" target="_blank">
			<img src="images\facebook.gif" height="32" alt="Facebook">
		</a>
		<a href="http://twitter.com" target="_blank">
			<img src="images\twitter.gif" height="32" alt="Twitter">
		</a>
		<a href="http://plus.google.com" target="_blank">
			<img src="images\googleplus-icon.png" height="32" alt="Google Plus">
		</a>
	</div>
</footer>
</div>
</body>
</html>




