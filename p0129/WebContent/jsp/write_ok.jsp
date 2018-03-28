<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	
	//데이터베이스 연결관련 변수 선언
	
	Connection conn =null;
	
	
	
	PreparedStatement pstmt =null;
	String sql = "";
	ResultSet rs =null;
	String rst ="";
	String msg = "";
	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	int max=0;
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터 베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
		//connection 클래스의 인스턴스로부터SQL 문 작성을 위한Statement 준비
		
		
		
		String title = request.getParameter("title");
		String name =request.getParameter("name");
		String password = request.getParameter("password");
		String standard = request.getParameter("standard");
		String memo = request.getParameter("memo");
		sql = "select max(num) from board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			max=rs.getInt(1);
		}
		else
			max=0;
	%>
		<script>window.open("id_dup.jsp?id=""+max;)</script>
	<%
		sql = "insert into board(name,password,title,memo,ref,time) values(?,?,?,?,?,sysdate())";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		//if ((idx-1) != max);
		//	max = idx-1;
		pstmt.setInt(5, max+1);

		Statement stmt = conn.createStatement();
		String sql1 = "select num,ref from board";
		rs = stmt.executeQuery(sql1);
		
		if(rs.next()){
			int num = rs.getInt(1);
			int ref = rs.getInt(2);
			if(num != ref){
				sql = "update board set ref="+num+" where num="+num;
				stmt.executeUpdate(sql);
			}
		}
		
		pstmt.execute();
		stmt.close();		
		pstmt.close();
		conn.close();;
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