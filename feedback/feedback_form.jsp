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
