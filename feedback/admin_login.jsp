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















































<!-- <!DOCTYPE html>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        /* Button used to open the contact form - fixed at the bottom of the page */
        .open-button {
            background-color: #555;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            opacity: 0.8;
            position: fixed;
            bottom: 23px;
            right: 28px;
            width: 280px;
        }

        /* The popup form - hidden by default */
        .form-popup {
            display: none;
            position: fixed;
            bottom: 0;
            right: 15px;
            border: 3px solid #f1f1f1;
            z-index: 9;
        }

        /* Add styles to the form container */
        .form-container {
            max-width: 300px;
            padding: 10px;
            background-color: white;
        }

        /* Full-width input fields */
        .form-container input[type=text],
        .form-container input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            border: none;
            background: #f1f1f1;
        }

        /* When the inputs get focus, do something */
        .form-container input[type=text]:focus,
        .form-container input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        /* Set a style for the submit/login button */
        .form-container .btn {
            background-color: #04AA6D;
            color: white;
            padding: 16px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            margin-bottom: 10px;
            opacity: 0.8;
        }

        /* Add a red background color to the cancel button */
        .form-container .cancel {
            background-color: red;
        }

        /* Add some hover effects to buttons */
        .form-container .btn:hover,
        .open-button:hover {
            opacity: 1;
        }
    </style>
</head>

<body>


    <button class="open-button" onclick="openForm()">Open Form</button>

    <div class="form-popup" id="myForm">
        <form action="/action_page.php" class="form-container">
            <h1>Login</h1>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" required>

            <label for="psw"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="psw" required>

            <button type="submit" class="btn">Login</button>
            <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        </form>
    </div>

    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>

</body>

</html> -->