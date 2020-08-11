<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>

<head>
<title>Data</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>

<body>
	<div class="container my-4 ">
		<div class=" shadow-none p-4 bg-light rounded">
			 <h3 style = "text-align: center;" > Foodlog Details </h3>
			<%
				try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");
				Statement statement = con1.createStatement();
				String sql = "SELECT * FROM foodlog";
				ResultSet resultSet = statement.executeQuery(sql);
			%>
			<table class="table table-striped table-dark">
				<thead>
					<tr>
						<th scope="col">##</th>
						<th scope="col">Name</th>

						<th scope="col">Year</th>

						<th scope="col">Library Id</th>

						<th scope="col">Money</th>

					</tr>
					</thead>

					<%
						int i = 1;
						while (resultSet.next()) {
						if (resultSet.getString("name") == null)
							continue;
					%>

					<tr>
						<td><%=i++%></td>
						<td><%=resultSet.getString("name")%></td>

						<td><%=resultSet.getString("year")%></td>

						<td><%=resultSet.getString("id")%></td>

						<td><%=resultSet.getString("money")%></td>


					</tr>

					<%
						
						}
					%>
				
			</table>
		</div>
	</div>
	<%
		} catch (Exception ex) {
			out.println("Error!!");
	}
	%>
	<br>
	<br>
	<br>

	<div class="container ">
		<div class="  shadow-none p-2 bg-light rounded">
			<a href="index.html"><button class="btn btn-primary">Go back to home page</button> </a>
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