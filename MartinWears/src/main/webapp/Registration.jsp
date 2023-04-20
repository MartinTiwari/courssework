<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up Page</title>
<link rel="stylesheet" href="CSS/Signup.css">
</head>
<body>
	
	<jsp:include page="includes/header.jsp"/>
	<div class="container">
		<h1>Sign Up</h1>
		<form method="post" action="register" enctype="multipart/form-data">
			<label id="label" for="name">Name:</label> <input type="text"
				id="name" name="name" required> <label id="label"
				for="email">Email:</label> <input type="text" id="email"
				name="email" required> <label id="label" for="password">Password:</label>
			<input type="password" id="password" name="password" required>
			<label id="label" for="confirm-password">Confirm Password:</label> <input
				type="password" id="confirm-password" name="confirm-password"
				required> <label id="label" for="image">Image:</label> <input
				type="file" id="image" name="image">
			<button id="submit" type="submit">Sign Up</button>
		</form>
		<p id="member">
			Already a member? <a id="form" href="login.jsp">Log in</a>
		</p>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>