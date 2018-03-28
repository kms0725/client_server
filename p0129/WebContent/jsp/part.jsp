<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function partWrite(){
	//window.open("id_dup.jsp?id="+document.writeform.id.value);
	if(document.partform.partCode.value == ""){
		alert("부품번호를 입력하세요.");
		document.partform.partCode.focus();
	}else if(document.partform.partname.value == ""){
		alert("부품명을 입력하세요.");
		document.partform.partname.focus();
	}else if(document.partform.model.value == ""){
		alert("모델명을 입력하세요.");
		document.partform.model.focus();
	}else if(document.partform.unit.value == ""){
		alert("규격를 입력하세요.");
		document.partform.unit.focus();
	}else if(document.partform.purchase.value == ""){
		alert("매입가를 입력하세요.");
		document.partform.purchase.focus();
	}else if(document.partform.sales.value == ""){
		alert("매출가를 입력하세요.");
		document.partform.sales.focus();
	}
	else{
		document.partform.submit();
	}
}

</script>
</head>
<body>
<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;차량 부품 관리</h1>
<form name="partform" method="post" action="part_write.jsp">
<table border="2">
<tr><td width="80" align="center">부품번호</td>
	<td colspan="3"><input type="text" name="partCode" size="100">		</td>
</tr>
<tr><td width="80" align="center">부품명</td>
	<td colspan="3"><input type="text" name="partname" size="100"></td>
</tr>
<tr><td width="80" align="center">모델명</td>
	<td colspan="3"><input type="text" name="model" size="100"></td>
</tr>
<tr><td width="80" align="center">규격</td>
	<td colspan="3"><input type="text" name="size" size="100"></td>
</tr>
<tr>
	<td width="80" align="center">단위</td>
	<td colspan="3"><input type="text" name="unit" size="100"></td>
</tr>
<tr>
	<td align="center">매입가</td>
	<td><input type="text" name="purchase" size="35"></td>
	<td width="80" align="center">매출가</td>
	<td><input type="text" name="sales" size="35"></td>
</tr>
<tr>
	<td width="70" align="center">메모</td>
	<td colspan="3"><textarea placeholer=""  cols="80" rows="10" name="memo" size="90"></textarea></td>
</tr>
<tr><td colspan="4" align="center">
	<input type="button" value="부품등록" onclick="javascript:partWrite()">
	<input type="reset" value="다시작성">
	</td>
</tr>
</table>
</form>
</body>
</html>