<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql="";
	ResultSet rs = null;
	String rst="success";
	String msg = "";
	
	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	
	try{
		//JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"javabook", "1234");
		
		// Connection 클래스의 인스턴스로부터 SQL문 작성을 위한 Statement 준비
		
		String partCode = request.getParameter("partCode");
		String partname = request.getParameter("partname");
		String model = request.getParameter("model");
		String size = request.getParameter("size");
		String unit = request.getParameter("unit");
		String purchase = request.getParameter("purchase");
		String sales = request.getParameter("sales");
		String memo = request.getParameter("memo");
		
		sql = "select * from car_part where partCode = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,partCode);
		rs = pstmt.executeQuery();
		// 등록된 부품이 있는 경우
		if(rs.next()){
			rst = "중복된 부품";
			msg = "이미 등록된 부품입니다.";
			throw new SQLException(msg);
		}
		// 이미 등록된 부품이 아닌 경우
		else{
			sql = "insert into car_part values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,partCode);
			pstmt.setString(2,partname);
			
			pstmt.setString(3,model);
			pstmt.setString(4,size);
			pstmt.setString(5,unit);
			pstmt.setString(6,purchase);
			pstmt.setString(7,sales);
			pstmt.setString(8,memo);
			
			pstmt.executeUpdate();
			%>
			<h4><%= partCode %></h4>
			<h4><%= partname %></h4>
			<h4>등록되었습니다.</h4>
			<%
			}
		%>
		<%
	}catch(SQLException e){
		msg=e.getMessage();
		out.print("결과: "+rst+"<br>");
		out.print("내용: "+msg+"<br>");
	
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