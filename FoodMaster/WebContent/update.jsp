<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Update..</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

</head>
<body>
	<div class="container my-4 ">
		<div class=" shadow-none p-4 bg-light rounded">
	<%
		String id = session.getAttribute("id").toString();
		String name = session.getAttribute("name").toString();
		String year = session.getAttribute("year").toString();
		String money = session.getAttribute("money").toString();
		String amount = request.getParameter("amount");
		String subtract = request.getParameter("subtract");
		String add = request.getParameter("add");
		String delete = request.getParameter("delete");

	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");

		if (delete != null) {
			String qry = "delete from foodlog where id=\'" + id + "\'";
			Statement st1 = con1.createStatement();
			ResultSet rs = st1.executeQuery(qry);
	%>
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>Customer details deleted!</p>
	
	</h1>
	<%
		} else if (add != null) {
	int a = Integer.parseInt(amount);
	int m = Integer.parseInt(money);
	int t = m + a;
	String mm = Integer.toString(t);
	String sql1 = "update foodlog set name=?, year=?, id=?, money=? where id=\'" + id + "\'";
	PreparedStatement ps = con1.prepareStatement(sql1);
	ps.setString(1, name);
	ps.setString(2, year);
	ps.setString(3, id);
	ps.setString(4, mm);

	int i = ps.executeUpdate();
	if (i > 0) {
	%>
	
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>Updated successfully!!</p>
	
	</h1>

	<br>
	
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>
		Money added=
		<%=amount%>
	</p>

	
	</h1>
	

	<%
		} else {
	%>
	
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>Error updating data!!!</p>
	
	</h1>

	<br>

	<%
		}

	} else {
	int a = Integer.parseInt(amount);
	int m = Integer.parseInt(money);
	int t = m - a;
	String mm = Integer.toString(t);
	String sql1 = "update foodlog set name=?,year=?, id=?, money=? where id=\'" + id + "\'";
	PreparedStatement ps = con1.prepareStatement(sql1);
	ps.setString(1, name);
	ps.setString(2, year);
	ps.setString(3, id);
	ps.setString(4, mm);

	int i = ps.executeUpdate();
	if (i > 0) {
	%>
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>Updated successfully!!</p>
	
	</h1>
	<br>
	
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>
		Money deducted=
		<%=amount%></p>
	</p>

	
	</h1>
	

	<%
		} else {
	%>
	<h1 class="alert alert-success" role="alert" style="text-align: center">
	
		<p>Error updating data!!!</p>
	
	</h1>
	
	<br>

	<%
		}

	}
	} catch (Exception e) {
	out.print(e);
	}
	%>
	<br>
	<form action="search_candi.jsp" method="post">
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th scope="row">SEARCH STUDENT </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">Library Id</th>
							<td><input style="font-size: 20px; font-family: sans-serif"
								type="text" name="id" /></td>
						</tr>
						
					</tbody>
				</table>
				<button class="btn btn-primary float-sm-left">Submit</button>
				<button type="reset" class="btn btn-primary float-md-right">Reset</button>
			</form>
	<br>
	<br>
	<br>
	<h4 class="alert alert-success" role="alert" style="text-align: center; margin-top:30px;">
		<a href="fulldb.jsp"><button class="btn btn-primary"> SEE WHOLE LIST </button> </a>
	</h4>

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