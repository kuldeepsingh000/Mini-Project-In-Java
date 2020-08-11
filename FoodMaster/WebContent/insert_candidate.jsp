<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<html>

<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

</head>

<body>
<div class="container my-4 ">
		<div class=" shadow-none p-4 bg-light rounded">
	<%
	String name = request.getParameter("rname");
	String year = request.getParameter("year");
	String id = request.getParameter("id");
	String money = request.getParameter("money");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");
		PreparedStatement pst = con.prepareStatement("insert into foodlog values(?,?,?,?)");
		pst.setString(1, name);
		pst.setString(2, year);
		pst.setString(3, id);
		pst.setString(4, money);
		int x = pst.executeUpdate();
		System.out.println(x);
		if (x != 0) {
	%>
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		Candidate
		<%=name%>
		added successfully!!
	
	</h1>
	<br>

	<%
		} 
	
	else {
	%>
	<p>Error updating data!!!</p>
	<br>


	<%
		}
	} catch (Exception e) {
		out.print(e);
	}
	%>

	<br>
	<div class="container ">
		<div class="  shadow-none p-2 bg-light rounded">
			<a href="index.html"><button class="btn btn-primary">Go back to home page</button> </a>
		</div>
	</div>
	<br>
	</div>
	</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>