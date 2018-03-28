<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	
//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";	
//데이터베이스 연결관련 변수 선언
	Connection conn =null;
	String name =request.getParameter("name");
	String password = request.getParameter("password");
	String memo = request.getParameter("memo");
	String title = request.getParameter("title");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try{
		int ref = 0;
		int indent = 0;
		int step = 0;
		
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터 베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
		//connection 클래스의 인스턴스로부터SQL 문 작성을 위한Statement 준비
		
		Statement stmt = conn.createStatement();
		String sql = "select num,ref,indent,step from board where num=" +idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			ref=rs.getInt(1);
			indent = rs.getInt(3);
			if(indent > 0)
				ref = rs.getInt(2);
			else
				ref = rs.getInt(1);
			step = rs.getInt(4);
		}
		sql = "update board set step = step+1 where ref = "+ref+" and step > " +step;
		stmt.executeUpdate(sql);
		
		sql = "insert into board(name,password,title,memo,ref,indent,step,time) "+"values(?,?,?,?,?,?,?,sysdate())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		//pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute();
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.toString());
	}		
	%>
	<script languate=javascript>
	self.window.alert("입력한 글을 저장하였습니다.");
	location.href="list.jsp";
	</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>