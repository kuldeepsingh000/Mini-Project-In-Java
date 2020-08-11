<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
</html><%@ page import="java.sql.*"%>
<html>

<head>
<title>User Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
	<div class="container my-4 ">
		<div class=" shadow-none p-4 bg-light rounded">
			<%
				String money = "", name = "", year = "";
			%>
			<%
				String id = request.getParameter("id");
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@Localhost:1521:xe", "system", "1234");
				Statement statement = con1.createStatement();
				String sql = "SELECT * FROM foodlog where id= " + id;
				ResultSet resultSet = statement.executeQuery(sql);

				if (resultSet.next() == false) {
			%>
			<p>Error finding data!!!</p>
			<br>


			<%
				} else {
			%>
			<h3 style="text-align: center">
				<%
					out.println(resultSet.getString("name"));
				%>
				Details
			</h3>
			<table class="table table-striped table-dark">
				<thead>
					<tr>

						<th scope="col">Name</th>

						<th scope="col">Year</th>

						<th scope="col">Library Id</th>

						<th scope="col">Money</th>

					</tr>

					<%
						do {
					%>

					<tr>
						<td><%=resultSet.getString("name")%></td>

						<td><%=resultSet.getString("year")%></td>

						<td><%=resultSet.getString("id")%></td>

						<td><%=resultSet.getString("money")%></td>

						<%
							money = resultSet.getString("money");
						%>
						<%
							year = resultSet.getString("year");
						%>
						<%
							name = resultSet.getString("name");
						%>
						<%
							id = resultSet.getString("id");
						%>
					</tr>

					<%
						} while (resultSet.next());
					%>
				
			</table>
			<%
				}

			} catch (Exception ex) {
			out.println("Error!!");

			}
			%>
			
			<hr>
			<hr>
			<hr>

			<form action="update.jsp" method="post">
				<table class="table table-striped table-dark">
					<thead>
						<tr>
							<th>Select to modify</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td scope="row">Amount:</td>
							<td><input style="font-size: 20px; font-family: sans-serif"
								type="text" name="amount" /></td>
							<td> <i class="fa fa-inr"></i> </td>
						</tr>
						
						<tr>
							<td>Add:<input type="radio" name="add" value="add" />
							</td>
							<td>Subtract:<input type="radio" name="subtract"
								value="subtract" />
							</td>
							<td>delete:<input type="radio" name="delete" value="delete" />
							</td>
						</tr>
						
					</tbody>
					<%
					session.setAttribute("id", id);
					session.setAttribute("year", year);
					session.setAttribute("name", name);
					session.setAttribute("money", money);
					%>
				</table>
				<button class="btn btn-primary">Submit</button>
			</form>
			<br>
		</div>
	</div>

	<div class="container ">
		<div class="  shadow-none p-2 bg-light rounded">
			<a href="index.html"><button class="btn btn-primary">Go
					back to home page</button> </a>
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