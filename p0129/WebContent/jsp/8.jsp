<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 등록</title>

</script>
</head>

<body>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회 원 등 록</h1>
<form name="customerform" method="post" action="customer_write.jsp">
<table border="1">
<tr><td width="120">* 아이디</td>
	<td width="400"><input type="text" name="id" size="30">
		<input type="button" value="중복확인">&nbsp;&nbsp;4~12자의 영문 소문자, 숫자와 특수기호(_)만 사용
		</td>
</tr>
<tr><td width="120">* 이름</td>
	<td><input type="text" name="name" size="30"></td>
</tr>

<tr><td width="120">* 비밀번호</td>
	<td><input type="password" name="passwd" size="30"></td>
</tr>

<tr><td width="120">* 비밀번호 확인</td>
	<td><input type="password" name="passwd2" size="30"></td>
</tr>
<tr><td width="120">* 성별</td>
	<td><input type="radio" name="gender" value="0">남
		<input type="radio" name="gender" value="1">여</td>
</tr>
<tr><td width="120">* 휴대폰</td>
	<td>
		<select name="phone1" style="width:95px;">
			<option value="010">010
			<option value="011">011
			<option value="017">017
			<option value="019">019
		</select>-
		<input type="text" name="phone2" size="10">-
		<input type="text" name="phone3" size="10">
	</td></tr>
<tr>
	<td width="120">* 주소</td>
	<td><input type="text" name="address" size="80"></td>
</tr>
<tr>
	<td width="120">자기소개</td>
	<td><textarea placeholer="" cols="90" rows="10" name="memo" size="120"></textarea></td>
</tr>
<tr><td colspan="2">&nbsp;&nbsp;*는 필수 입력항목입니다.^^</td></tr>
<tr><td colspan="2" align="right">
	<input type="button" value="확인">&nbsp;&nbsp;
	<input type="reset" value="새로작성">
	</td>
</tr>
</table>
</form>
</body>
</html>