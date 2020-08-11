<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class=" shadow-none p-4 bg-light rounded">

			<h1 class="alert alert-success" role="alert"
				style="text-align: center">CAFETERIA CUSTOMER
				SERVICE-FOODMaster</h1>

			<button class="btn btn-primary float-left" data-toggle="modal"
				data-target="#loginModal">Login</button>
			<button class="btn btn-primary float-right " data-toggle="modal"
				data-target="#signupModal">SignUp</button>


		</div>
	</div>
	<!-- Login modal-->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="loginModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Login using
						your credentials</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="login" method="post">
						<div class="form-group">
							<label>Your Name</label> <input type="text" class="form-control"
								name="uname"> <small class="form-text text-muted">We'll
								never share your details with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="upass">
						</div>
						<button type="submit" class="btn btn-primary">Login</button>
					</form>
				</div>

			</div>

		</div>
	</div>

	<!-- Sign Up Modal -->
	<div class="modal fade" id="signupModal" tabindex="-1" role="dialog"
		aria-labelledby="signupModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h6 class="modal-title" id="exampleModalLabel">Create Your Own
						CFM Account</h6>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="signup" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Your name</label> <input
								type="text" class="form-control" name="uname"> <small
								class="form-text text-muted">In small letters</small>
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password"
								class="form-control" id="exampleInputPassword1" name="upass">
						</div>
						<div class="form-group">
							<label for="cexampleInputPassword1">Confirm Password</label> <input
								type="password" class="form-control" id="cexampleInputPassword1">
						</div>

						<button type="submit" class="btn btn-primary">Creat
							Account</button>
					</form>
				</div>
			</div>
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