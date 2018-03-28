<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객 등록</title>
<!--  필수 입력사항 체크 -->
<script type="text/javascript">
function checkWrite3(){
	//window.open("customer_dup.jsp?id="+document.writeform3.id.value);
	if(document.customerform.id.value == ""){
		alert("아이디를 입력하세요.");
		document.customerform.id.focus();
	}else if(document.customerform.name.value == ""){
		alert("이름을 입력하세요.");
		document.customerform.name.focus();
	}else if(document.customerform.carNumber.value == ""){
		alert("차량번호 등록하세요");
		document.customerform.carNumber.focus();
	}else{
		document.customerform.submit();
	}
}

function id_chk3(){
	window.open("customer_dup.jsp?id="+document.customerform.id.value);
}
</script>
</head>

<body>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고객관리</h1>
<form name="customerform" method="post" action="customer_write.jsp">
<table border="1">
<tr><td width="120" align="center">아이디</td>
	<td><input type="text" name="id" size="30">
		<input type="button" value="중복체크" onclick="id_chk3()">*문자+숫자 10자리 이내
		</td>
</tr>
<tr><td width="120" align="center">이름</td>
	<td><input type="text" name="name" size="30"></td>
</tr>

<tr><td width="120" align="center">차량번호</td>
	<td><input type="text" name="carNumber" size="30"></td>
</tr>

<tr><td width="120" align="center">차량종류</td>
	<td><input type="text" name="carType" size="30"></td>
</tr>
<tr><td width="120" align="center">핸드폰</td>
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

<tr><td colspan="2" align="center">
	<input type="button" value="회원가입" onclick="javascript:checkWrite3()">
	<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>
</body>
</html>