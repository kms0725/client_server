<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passwd = request.getParameter("password");
	
	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		//데이터베이스 연결정보를 이용해 Connection 인스턴수 확보
		conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
		// Connection  클래스의 인스턴스로부터 sql 문 작성을 위한 statement 준비
		Statement stmt = conn.createStatement();
		
		sql = "select password from board where num = " + idx;
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			password=rs.getString("password");
			if(passwd.equals(password)){
				sql = "delete from board where num=" + idx;
				stmt.executeUpdate(sql);
			%>
				<script language=javascript>
				self.window.alert("해당 글을 삭제하였습니다.");
				location.href="javascript:history.back()";
				location.href="list.jsp";
				</script>
			<%
				rs.close();
				stmt.close();
				conn.close();
				
				} else {
			%>
				<script language = javascript>
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
				</script>
			<%
				}}
				else{
				%>
				<script language=javascript>
				self.window.alert("없는 num입니다.");
				location.href="javascript:history.back()";
				</script>
			<%
			}
		}catch(SQLException e){
			out.println(e.toString());
		}
		%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>