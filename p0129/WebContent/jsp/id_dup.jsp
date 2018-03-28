<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<% 
	// 데이터베이스연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
	
	// 데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
	
	try{
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		
		//데이터베이스 연겨정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
		
		// Connection 클래스의 인스턴스로부터 SQL 문 작성을 위한 Statement 준비
		
		String id = request.getParameter("id");
		//이미 등록된 아이디가 있는지 검사
		sql = "select * from car_member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		// 등록된 아이디가 있는 경우
		if(rs.next()){
			%>
			<script type="text/javascript">
			 alert("중복 아이디 \n이미 등록된 아이디입니다.");
			 history.back();
			</script>
			<%
		}else
		{
			%>
			<script type="text/javascript">
			 alert("사용 가능한 아이디입니다.");
			 history.back();
			</script>
			<%
			}
		}catch(SQLException e) {
			e.getMessage();
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