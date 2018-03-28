<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
	String name = null;
	String password =null;
	String title = null;
	String memo =null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	
try{
	//JDBC드라이버 로드
	Class.forName(jdbc_driver);
	
	// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
	conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
	//  Connection 클래스의 인스턴스로부터 SQL 문 작성을 위한 Statement 준비
	Statement stmt = conn.createStatement();
	
		sql = "select name, password, title, memo from board where num=" + idx;
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type = "text/javascript">
function modifyCheck()
	{
	var form = document.modifyform;
	
	if(!form.password.value)
		{
		alert("비밀번호를 적어주세요");
		form.password.focus();
		return;
		}
	if(!form.title.value)
		{
		alert("제목을 적어주세요");
		form.title.focus();
		return;
		}
	if(!form.memo.value)
		{
		alert("내용을 적어주세요");
		form.memo.focus();
		return;
		}
	form.submit();
	}
</script>
</head>
<body>
<table>
<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx %>">
	<tr>
		<table width="100%" cellpadding="0" cellspacing="0" borde="0">
		<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
		<td width="5"><img src="image/table_left.gif" width="5" height="30"/></td>
		<td>수정</td>
		<td width="5"><img src="images/table_right.gif" width="5" height="30"/></td>
	</tr>
		</table>
	<table>
		<tr><td>&nbsp;</td>
			<td align="center">제목</td>
			<td><input type=text name=title size=50 maxlength=50 value="<%=title %>"></td>
			<td>&nbsp;</td></tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr><td>&nbsp;</td>
			<td align="center">이름</td>
			<td><%=name %><input type=hidden name=name size=50 maxlength=50 value="<%=name %>"></td>
			<td>&nbsp;</td></tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr><td>&nbsp;</td>
			<td align="center">비밀번호</td>
			<td><input type=password name=password id="pass" size=50 maxlength=50></td>
			<td>&nbsp;</td></tr>
			<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>	
		<tr><td>&nbsp;</td>
			<td align="center">내용</td>
			<td><textarea name=memo cols=50 rows=13><%=memo %></textarea></td>
			<td>&nbsp;</td></tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
		<tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
		<tr align="center">
			<td>&nbsp;</td>
			<td colspan="2"><input type="button" value="수정" OnClick="javascript:modifyCheck();">
			<input type=button value="취소" Onclick="javascript:history.back(-1)"></td>
			<td>&nbsp;</td>
		</tr></table>
		
		</tr>
</form>
</table>
</body>
</html>