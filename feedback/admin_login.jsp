<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Feedback Management System </title>
    <link rel="stylesheet" href="mystyle.css" />

</head>

<body>
    <center>
        <form>
		<div class="left"><a href="index.jsp"> <-Back </a></div>
                <h1 id="fb">Admin Login</h1>
                <div class="centered">
                    <label for="name"><b>Username</b></label>
                    <input type="text" name="name" placeholder="Enter Username" required>
                    <br>

                    <label for="password"><b>Password</b></label>
                    <input type="password" name="password" placeholder="Enter Password" required>
                    <br>

                    <button type="submit" name="btn" class="sign">Login</button>
                </div>
        </form>
	<%
		if(request.getParameter("btn") != null)
		{
			String username = request.getParameter("name");
			String password  = request.getParameter("password");
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url =  "jdbc:mysql://localhost:3306/feedback";
				Connection con = DriverManager.getConnection(url,"root","abc123");
				String sql = "select * from admin where username=? and password=? ";
				PreparedStatement pst = con.prepareStatement(sql);
				pst.setString(1, username);
				pst.setString(2, password);
				ResultSet rs = pst.executeQuery();
				if(rs.next()){
					session.setAttribute("name",username);
					response.sendRedirect("admin_form.jsp");
				}else {
	%>
				<script>
 					window.onload = function() {
                            		alert("Invalid login");
					};
				</script>
	<%
                        }                    
				con.close();
			}catch(SQLException e){
				out.println("issue "+e);
			}
		}
	%>
    </center>
</body>

</html>




