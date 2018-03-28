<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JDBC사용 예제</title>
</head>
<body>
<div align="center">
<h1> 회원정보 LIST </h1>
<table border="1" align="center" width=100%>
	<tr bgcolor = "#bbbbbb">
		<td align="center"> 아이디 </td>
		<td align="center"> 이 름 </td>
		<td align="center"> 성 별 </td>
		<td align="center"> 이메일 </td>
		<td align="center"> 전화번호 </td>
		<td align="center"> 휴대폰번호 </td>
		<td align="center"> 주 소 </td>
		<td align="center"> 차량번호 </td>
		<td align="center"> 차량종류 </td>
	</tr>
	
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try { 
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcurl = "jdbc:mysql://localhost/yangjung";
			conn = DriverManager.getConnection(jdbcurl, "javabook", "1234");
			stmt = conn.createStatement();
			String sql = "select * from car_Member";
			rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}	
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%= rs.getString("id") %></td>
			<td align="center"><%= rs.getString("name") %></td>
			<td align="center"><%= rs.getString("gender") %></td>
			<td align="center"><%= rs.getString("email") %></td>
			<td align="center"><%= rs.getString("tel") %></td>
			<td align="center"><%= rs.getString("phone") %></td>
			<td align="center"><%= rs.getString("address") %></td>
			<td align="center"><%= rs.getString("carNumber") %></td>
			<td align="center"><%= rs.getString("carType") %></td>
		</tr>
		<%
			}
		%>
</table>

	<%
		stmt.close();
		conn.close();
	%>
</div>
</body>
</html>