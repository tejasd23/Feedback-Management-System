<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title> Feedback Management System </title>
    <link rel="stylesheet" href="mystyle.css" />

</head>

<body>
    <center>
        <form name="feedbackForm" action="" method="post">
            <h1>Feedback Form</h1>
            <div class="centered">
		 <!--<label for="name"><b>Name</b></label>
                <input type="text" name="name" placeholder="Enter Name" pattern="^[A-Za-z ]{2,}$" required min=2 onchange="this.value = this.value.trim()">
                <br>

                <label for="email"><b>Email</b></label>
                <input type="text" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9.]+@[a-z.]{2,}$" required size=30 min=2>
		<br>-->


                <label for="name"><b>Name</b></label>
                <input type="text" name="name" placeholder="Enter Name"  pattern="^[A-Za-z]{2,}$" title="Please enter min 2 Alphabets, no special chars and numbers to be inserted." required min=2 onchange="this.value = this.value.trim()">
                <br>

                <label for="email"><b>Email</b></label>
		<input type="email" name="email" placeholder="Enter Email" pattern="^[A-Za-z.]+([A-Za-z0-9]+)*@gmail.com"
        + "[A-Za-z]$" required size="30" min=2 onchange="this.value = this.value.trim()">
                <br>

                <label for="feedback"><b>Feedback</b></label><br>
                <textarea type="text" name="feedback" rows="3" cols="50" placeholder="Give Feedback" required></textarea>
                <br>
			<label class="container">

  		        <input type="radio" id="star5" name="rate" value="5" checked="checked">Excellent
  		        <span class="checkmark"></span>
	        	</label>
			<label class="container">
  			<input type="radio" id="star4" name="rate" value="4">Very Good
  			<span class="checkmark"></span>
			</label>
			<label class="container">
  			<input type="radio" id="star3" name="rate" value="3">Good
  			<span class="checkmark"></span>
			</label>
			<label class="container">
  			<input type="radio" id="star2" name="rate" value="2">Satisfactory
  			<span class="checkmark"></span>
			</label>
			<label class="container">
  			<input type="radio" id="star1" name="rate" value="1">Poor
  			<span class="checkmark"></span>
			</label>
                <button type="submit" class="sign" name="btn">Submit</button>
                <a href="index.jsp"><button type="button" class="sign">Back</button></a>
                <!-- <div class="container signin">
                            <p>Already have an account? <a href="signin.jsp">Sign in</a></p>
                        </div> -->
            </div>
        </form>
	<div>
	<%
		if(request.getParameter("btn") !=null)
		{
			try{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url = "jdbc:mysql://localhost:3306/feedback";
				Connection con = DriverManager.getConnection(url, "root", "abc123");
				
				String email = request.getParameter("email");
	                    	String checkEmailSql = "SELECT * FROM student WHERE email=?";
        	            	PreparedStatement checkEmailPst = con.prepareStatement(checkEmailSql);
                	    	checkEmailPst.setString(1, email);
                    		ResultSet rs = checkEmailPst.executeQuery();
				if (rs.next()) {
	%>
				<script>
 					window.onload = function() {
                            		alert("Email already exists. Please use a different email.");
					};
				</script>
	<%
		                } else {
	                        	String insertSql = "INSERT INTO student VALUES 	(?, ?, ?, ?)";
        	                	PreparedStatement insertPst = con.prepareStatement(insertSql);
		
                	        	String name = request.getParameter("name");
                        		String feedback = request.getParameter("feedback");
                        		int star_rating = Integer.parseInt(request.getParameter("rate"));
	
		                        insertPst.setString(1, name);
        		                insertPst.setString(2, email);
                		        insertPst.setString(3, feedback);
                        		insertPst.setInt(4, star_rating);

                        		insertPst.executeUpdate();
	%>
				<script>
 					window.onload = function() {
                            		alert("Feedback Submited");
					};
				</script>
	<%
                    		}
				con.close();
			}catch(SQLException e){
				out.println("sql issues "+e);
			}
		}												
	%>
	</div>
    </center>
</body>
</html>
































<!--/*<%@ page import="java.sql.*" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Feedback Management System</title>
    <link rel="stylesheet" href="mystyle.css" />
    <style>
        .error-messages {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>

<body>
    <center>
        <form name="feedbackForm" action="" method="post">
            <h1>Feedback Form</h1>
            <div class="centered">
                <label for="name"><b>Name</b></label>
                <input type="text" name="name" placeholder="Enter Name" pattern="^[A-Za-z ]{2,}$" required>
                <br>

                <label for="email"><b>Email</b></label>
                <input type="text" name="email" placeholder="Enter Email" pattern="[a-zA-Z0-9.]+@[a-z.]{2,}$" required>

                <input type="text" name="email" placeholder="Enter Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
                <br> pattern="[a-zA-Z0-9].+@gmail.com"

                <label for="feedback"><b>Feedback</b></label><br>
                <textarea type="text" name="feedback" rows="4" cols="50" placeholder="Give Feedback" required></textarea>
                <br>

                <div class="rate">
                    <input type="radio" id="star5" name="rate" value="5" required>
                    <label for="star5" title="text">5 stars</label>

                    <input type="radio" id="star4" name="rate" value="4" required>
                    <label for="star4" title="text">4 stars</label>

                    <input type="radio" id="star3" name="rate" value="3" required>
                    <label for="star3" title="text">3 stars</label>

                    <input type="radio" id="star2" name="rate" value="2" required>
                    <label for="star2" title="text">2 stars</label>

                    <input type="radio" id="star1" name="rate" value="1" required>
                    <label for="star1" title="text">1 star</label>
                </div>

                <button type="submit" class="sign" name="btn">Submit</button>
                <a href="index.jsp"><button type="button" class="sign">Back</button></a>
            </div>
        </form>
        <div class="error-messages">
            <% 
                if(request.getParameter("btn") !=null) {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String feedback = request.getParameter("feedback");
                    int star_rating = Integer.parseInt(request.getParameter("rate"));
                    
                    boolean isValid = true;
                    String errorMessage = "";

                    if (name.length() < 2) {
                        errorMessage += "<p>Name should contain at least 2 letters.</p>";
                        isValid = false;
                    }

                    if (!email.contains("@")) {
                        errorMessage += "<p>Invalid email format. Email should contain @ symbol.</p>";
                        isValid = false;
                    }

                    if (star_rating < 1 || star_rating > 5) {
                        errorMessage += "<p>Please select a valid feedback rating.</p>";
                        isValid = false;
                    }

                    if (isValid) {
                        try {
                            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                            String url = "jdbc:mysql://localhost:3306/feedback";
                            Connection con = DriverManager.getConnection(url, "root", "abc123");
                            String sql = "insert into student values(?, ?, ?, ?)";
                            PreparedStatement pst = con.prepareStatement(sql);

                            pst.setString(1, name);
                            pst.setString(2, email);
                            pst.setString(3, feedback);
                            pst.setInt(4, star_rating);

                            pst.executeUpdate();
                            out.println("<p>Thank you for your feedback.</p>");
                            con.close();
                        } catch (SQLException e) {
                            out.println("<p>SQL issues: " + e + "</p>");
                        }
                    } else {
                        out.println(errorMessage);
                    }
                } 
            %>
        </div>
    </center>
</body>

</html>
*/


 -->




























