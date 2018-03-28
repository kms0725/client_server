<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("utf-8");
	//연결관련변수선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
	String password = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	String passw = request.getParameter("password");
	
	//문자열로선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
		//  Connection 클래스의 인스턴스로부터 SQL 문 작성을 위한 Statement 준비
		
		Statement stmt = conn.createStatement();
		
		sql = "select name, password, title, memo from board where num=" + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			password = rs.getString(1);
		}
			if(password.equals(passw)){
				sql = "update board set title='" + title + "' ,memo='" + memo + "' where num=" + idx;
				stmt.executeUpdate(sql);
%>			
				<script language = javascript>
				self.window.alert("글이 수정되었습니다.");
				location.href="view.jsp?idx=<%=idx%>";
				</script>
<%			rs.close();
			stmt.close();
			conn.close();
		} else {
%>
			<script language=javascript>
			self.window.alert("비밀번호를 틀렸습니다.");
			location.href="javascript:history.back()";
			</script>
<%
}

	}catch(SQLException e){
		out.println(e.toString());
		}
		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>