<%@ page import="java.sql.*" %>
<html>
	<head>
		<meta charset="UTF-8">
    		<title> Feedback Management System </title>
    		<link rel="stylesheet" href="mystyle.css" />
	</head>
	<body>
		<center>
			<div class="nav">
				<a href="admin_form.jsp"> View </a>
				<a href="delete.jsp"> Delete </a>
				<a href="admin_login.jsp"> Logout </a>
			</div>
			<h1> Students Feedback </h1>
			<table border="5" style="width:60%; ">
			<tr>
			<th> Name </th>
			<th> Email </th>
			<th> Feedback Message </th>
			<th> Rating </th>
			</tr>

			<%
				try{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url = "jdbc:mysql://localhost:3306/feedback";
					Connection con = DriverManager.getConnection(url, "root", "abc123");
					String sql = "select * from student";
					PreparedStatement pst = con.prepareStatement(sql);
					ResultSet rs = pst.executeQuery();

					while(rs.next()){
			%>
					<tr style="text-align:center;">
					<td> <%= rs.getString(1) %> </td>
					<td> <%= rs.getString(2) %> </td>
					<td> <%= rs.getString(3) %> </td>
					<td> <%= rs.getInt(4) %> </td>
					</tr>
			<%
					}
					con.close();
				}catch(SQLException e){
					out.println("issue "+e);
				}
			%>
			</table>
		</center>
	</body>
</html>