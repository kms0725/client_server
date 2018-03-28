<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1> 부품정보 LIST </h1>
<table border="1" align="center" width=100%>
	<tr bgcolor = "#bbbbbb">
		<td align="center"> 부품번호 </td>
		<td align="center"> 부품명 </td>
		<td align="center"> 모델병 </td>
		<td align="center"> 규 격  </td>
		<td align="center"> 단 위 </td>
		<td align="center"> 매입가 </td>
		<td align="center"> 매출가 </td>
		<td align="center"> 메모 </td>
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
			String sql = "select * from car_part";
			rs = stmt.executeQuery(sql);
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다. : " + e.getMessage());
		}	
			while(rs.next()){
		%>
		<tr>
			<td align="center"><%= rs.getString("partCode") %></td>
			<td align="center"><%= rs.getString("partname") %></td>
			<td align="center"><%= rs.getString("model") %></td>
			<td align="center"><%= rs.getString("size") %></td>
			<td align="center"><%= rs.getString("unit") %></td>
			<td align="center"><%= rs.getInt("purchase") %></td>
			<td align="center"><%= rs.getInt("sales") %></td>
			<td align="center"><%= rs.getString("memo") %></td>
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