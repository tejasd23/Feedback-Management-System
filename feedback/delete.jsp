<%@ page import="java.sql.*" %>

<html lang="en">

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
			<h1> Delete Page </h1>
			<form onsubmit="return confirmDelete();"> 
				<br>
				<label for="name"><b>Name</b></label><br>
				<input type="text" name="name" placeholder="Enter Name" id="text" required pattern="^[A-Za-z ]+$">
				<br>
				<label for="email"><b>Email</b></label><br>
				<input type="email" name="email" placeholder="Enter Email" id="text" required>
				<br>
			 	<button type="submit" class="delete" name="btn">Delete</button>
			
			</form>
			<%
				if(request.getParameter("btn") != null)
				{
					String name = request.getParameter("name");
					String email = request.getParameter("email");					

					try{
						DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
						String url = "jdbc:mysql://localhost:3306/feedback";
						Connection con = DriverManager.getConnection(url, "root", "abc123");
						String sql = "delete from student where name=? and email=?";
						PreparedStatement pst = con.prepareStatement(sql);
						pst.setString(1, name);
						pst.setString(2, email);
						long r = pst.executeUpdate();
						out.println(r + " record deleted");
						con.close();
					}catch(SQLException e){
						out.println("issues "+e);
					}
				}
			%>
			<script>
            			function confirmDelete() {
                			return confirm("Are you sure you want to delete this record?");
            			}
        		</script>
		</center>
	</body>
</html>