<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String checkName = "";
	checkName = (String)session.getAttribute("s_Name");
	if(checkName == null)
	{
		%>
		<script>
		self.window.alert("먼저 로그인 하세요.");
		location.href="javascript:history.back()";
		</script>
		<%
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
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
	
		sql = "select name, title, memo, time, hit from board where num=" + idx;
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
			hit++;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
</head>
<body>
<table>
	<tr>
		<td>
		<table width="100%" cellpadding="0" cellspacing = "0" border="0">
		<tr style="background:url('images/table_mid.gif') repeat-x; text-align:center;">
		<td width="5"><img src="images/table_left.gif" width="5" height="30" /></td>
		<td>내 용</td>
		<td width="5"><img src="images/table_right.gif" width="5" height="30" /></td>
		</tr>
		</table>
		<table width="413">
		<tr>
		<td width="0">&nbsp;</td>
		<td align="center" width="76">글번호</td>
		<td width="319"><%=idx%></td>
		<td width="0">&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
		<td width="0">&nbsp;</td>
		<td align="center" width="76">조회수</td>
		<td width="319"><%=hit %></td>
		<td width="0">&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
		<td width="0">&nbsp;</td>
		<td align="center" width="76">이름</td>
		<td width="319"><%=name %></td>
		<td width="0">&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
		<td width="0">&nbsp;</td>
		<td align="center" width="76">작성일</td>
		<td width="319"><%=time %></td>
		<td width="0">&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
		<td width="0">&nbsp;</td>
		<td align="center" width="76">제목</td>
		<td width="319"><%=title %></td>
		<td width="0">&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr>
		<td width="0"></td>
		<td width="399" colspan="2" height="180"><%=memo %>
		</tr>
		<%
		sql = "update board set hit=" + hit + " where num = " + idx;
		stmt.executeUpdate(sql);
		rs.close();
		stmt.close();
		conn.close();
		}
		}catch(SQLException e){
		}
		
		%>
		<tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
		<tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
		<tr align="center">
		<td width="0">&nbsp;</td>
		<td colspan="2" width="399"><input type=button value="글쓰기" onClick="window.location='write.jsp'">
		<input type=button value="답글" onClick="window.location='reply.jsp?idx=<%=idx %>'">
		<input type=button value="목록" onClick="window.location='list.jsp'">
		<input type=button value="수정" onClick="window.location='modify.jsp?idx=<%=idx %>'">
		<input type=button value="삭제" onClick="window.location='delete.jsp?idx=<%=idx %>'">
		<td width="0">&nbsp;</td>
		</tr>
		</table>
		</td>
		</tr></table>
</body>
</html>