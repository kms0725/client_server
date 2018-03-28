<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//입력정보 한글 처리
request.setCharacterEncoding("utf-8");
//사용자 입력정보 추출
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = "";
// DB 관련 객체/ 변수
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = "";
String rst = "success";
String msg = "";
int cnt = 0;
// 데이터베이스 연결관련벙보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/yangjung?useUnicode=yes&characterEncoding=UTF-8";
try{
	//JDBC 드라이버 로드
	Class.forName(jdbc_driver);
	// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
	conn = DriverManager.getConnection(jdbc_url, "javabook", "1234");
	
	// Connection 클래스의 인스턴스로부터 sQL 문 작성을 위한 Statement 준비
	// 등록된 아이디의 여부 검사
	
	
	sql  = "select * from car_member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	//pstmt.setString(2, passwd);
	rs = pstmt.executeQuery();
	
	// 등록된 아이디의 경우, 성명 추출
	if(rs.next()){
		//로그인 정보 설정
		String userID=rs.getString("id");
		String userPWD=rs.getString("passwd");
		String userName = rs.getString("name");
		
		if (passwd.equals(userPWD)){%>
			<%=rs.getString("name") %>님 환영합니다.<%
			session.setAttribute("s_Name", userName);
			session.setAttribute("s_Id", userID);
			response.sendRedirect("main_logout.jsp"); // main.jsp 에 session정보를 보낸다
		}
		else{
			%>
			입력된 id=<%=id %><br>
			입력된 passwd=<%=passwd %><br>
			
			패스워드가 맞지 않습니다.<br>패스워드를 다시 입력하세요.
			<a href="javascript:history.back()">뒤로</a>
			<%
		}}
	else{%>
		입력된 id=<%=id %><br>
		입력된 passwd=<%=passwd %><br>
		id와 pass 다시 입력하세요.
		<a href="javascript:history.back()">뒤로</a>
		<%}
} catch(SQLException e) {
	rst = "시스템에러";
	msg = e.getMessage();
	
} finally{ 
	rst = "finally 시스템에러";
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
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