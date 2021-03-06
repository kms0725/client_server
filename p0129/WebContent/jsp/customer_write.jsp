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
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String carNumber = request.getParameter("carNumber");
		String carType = request.getParameter("carType");
		
		String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
		String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String address = request.getParameter("address");
		
		// 이미 등록된 아이디가 있는지 검사
		sql = "select * from customertbl where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		// 등록된 아이디가 있는 경우
		if(rs.next()){
			rst = "중복 아이디";
			msg = "이미 등록된 아이디입니다.";
			throw new SQLException(msg);
		}
		// 이미 등록된 아이디가 아닌 경우
		else{
			sql = "insert into customertbl values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			
			pstmt.setString(3,carNumber);
			pstmt.setString(4,carType);
			pstmt.setString(5,phone);
			pstmt.setString(6,tel);
			pstmt.setString(7,address);
			
			pstmt.executeUpdate();
			%>
			<h4><%= id %></h4>
			<h4><%= name %></h4>
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