<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<!--  필수 입력사항 체크 -->
<script type="text/javascript">
function checkWrite(){
	//window.open("id_dup.jsp?id="+document.writeform.id.value);
	if(document.writeform.id.value == ""){
		alert("아이디를 입력하세요.");
		document.writeform.id.focus();
	}else if(document.writeform.name.value == ""){
		alert("이름을 입력하세요.");
		document.writeform.name.focus();
	}else if(document.writeform.passwd.value == ""){
		alert("비밀번호를 입력하세요.");
		document.writeform.passwd.focus();
	}else if(document.writeform.repasswd.value == ""){
		alert("확인 비밀번호를 입력하세요.");
		document.writeform.repasswd.focus();
	}else if(document.writeform.passwd.value != "" && document.writeform.repasswd.value != "")
		if(document.writeform.repasswd.value !=document.writeform.passwd.value){
			alert("비밀번호가 일치하지 않습니다..");
			document.writeform.passwd.focus();
		}
	else{
		document.writeform.submit();
	}
}

function id_chk(){
	window.open("id_dup.jsp?id="+document.writeform.id.value);
}
</script>
</head>

<body>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객관리</h1>
<form name="writeform" method="post" action="member_write.jsp">
<table border="1">
<tr><td width="120" align="center">아이디</td>
	<td><input type="text" name="id" size="30">
		<input type="button" value="중복체크" onclick="id_chk()")>
		</td>
</tr>
<tr><td width="120" align="center">이름</td>
	<td><input type="text" name="name" size="30"></td>
</tr>
<tr><td width="120" align="center">비밀번호</td>
	<td><input type="password" name="passwd" size="30"></td>
</tr>
<tr><td width="120" align="center">비밀번호확인</td>
	<td><input type="password" name="repasswd" size="30"></td>
<tr><td width="120" align="center">성별</td>
	<td><input type="radio" name="gender" value="0" checked>남
		<input type="radio" name="gender" value="1">여</td>
</tr>
<tr><td width="120" align="center">이메일</td>
	<td><input type="text" name="email1" size="30">@
		<select name="email2" style="width:100px;">
			<option value="naver.com">naver.com
			<option value="hanmail.net">hanmail.net
			<option value="gmail.com">gmail.com
			<option value="nate.com">nate.com
		</select>
	</td>
</tr>
<tr><td width="120" align="center">핸드폰</td>
	<td>
		<select name="hp1" style="width:70px;">
			<option value="010">010
			<option value="011">011
			<option value="017">017
			<option value="019">019
		</select>-
		<input type="text" name="hp2" size="10">-
		<input type="text" name="hp3" size="10">
	</td></tr>
<tr><td width="120" align="center">전화번호</td>
	<td>
		<input type="text" name="tel1" size="10">-
		<input type="text" name="tel2" size="10">-
		<input type="text" name="tel3" size="10">
	</td></tr>
<tr>
	<td width="120" align="center">주소</td>
	<td><input type="text" name="address" size="80"></td>
</tr>
<tr>
	<td width="120" align="center">차량번호</td>
	<td><input type="text" name="carNumbert" size="30"></td>
</tr>
<tr>
	<td width="120" align="center">차량종류</td>
	<td><input type="text" name="carType" size="30"></td>
</tr>
<tr><td colspan="2" align="center">
	<input type="button" value="회원가입" onclick="javascript:checkWrite()">
	<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>
</body>
</html>