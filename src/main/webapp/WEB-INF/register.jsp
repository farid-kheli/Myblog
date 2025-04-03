<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body class="d-flex align-items-center bg-dark" style="height: 100vh;">
	<form action="register"
		class=" p-4 rounded w-50 bg-black align-self-center container-fluid text-light"
		method="post">
		<h1>register</h1>
		<div class="mb-3">
			<label class="form-label">Email</label> 
				<c:choose>
				<c:when test="${not empty EmailTmessage}">
					<input type="email" name="email"
						class="form-control is-invalid" id="validationServer03" required>
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
						${EmailTmessage}</div>
				</c:when>
				<c:otherwise>
					<input name="email" type="email" class="form-control is-valid"
						id="validationServer03" required>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="mb-3">
			<label class="form-label">name</label> <input type="text" name="name"
				class="form-control" id="exampleInputName">
		</div>
		<div class="mb-3">
			<label class="form-label">Password</label>
			<c:choose>
				<c:when test="${not empty Passmessage}">
					<input type="password" name="password"
						class="form-control is-invalid" id="validationServer03" required>
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
						${Passmessage}</div>
				</c:when>
				<c:otherwise>
					<input name="password" type="password" class="form-control is-valid"
						id="validationServer03" required>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="mb-3">
			<label class="form-label">confirm Password</label>
			<c:choose>
				<c:when test="${not empty CPassmessage}">
					<input type="password" name="Cpassword"
						class="form-control is-invalid" id="validationServer03" required>
					<div id="validationServerUsernameFeedback" class="invalid-feedback">
						${CPassmessage}</div>
				</c:when>
				<c:otherwise>
					<input name="Cpassword" type="password" class="form-control is-valid"
						id="validationServer03" required>
				</c:otherwise>
			</c:choose>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
		<p>
			do have an acount <a href="login">login</a> now
		</p>
	</form>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</html>
