<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- Google Sign-In -->
    <script src="https://accounts.google.com/gsi/client" async defer></script>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex align-items-center bg-dark" style="height: 100vh;">

<div class="container d-flex justify-content-center">
    <div class="bg-white p-5 rounded shadow w-100" style="max-width: 500px;">

        <h2 class="mb-4 text-center">Login</h2>

        <!-- Error messages from server -->
        <c:if test="${not empty message}">
            <div class="alert alert-danger" role="alert">${message}</div>
        </c:if>

        <!-- Traditional login form -->
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="mb-3">
                <label for="emailInput" class="form-label">Email address</label>
                <input type="email" class="form-control" id="emailInput" name="email" required>
            </div>
            <div class="mb-3">
                <label for="passwordInput" class="form-label">Password</label>
                <input type="password" class="form-control" id="passwordInput" name="password" required>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="rememberCheck">
                <label class="form-check-label" for="rememberCheck">Remember me</label>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign In</button>
        </form>

        <!-- Divider -->
        <hr class="my-4">

        <!-- Google Sign-In -->
        <div id="g_id_onload"
             data-client_id="860835309568-irtqb413o7omma4mcli4mrd78cnp6e3e.apps.googleusercontent.com"
             data-login_uri="${pageContext.request.contextPath}/login"
             data-ux_mode="redirect"
             data-auto_prompt="false">
        </div>

        <div class="g_id_signin"
             data-type="standard"
             data-shape="rectangular"
             data-theme="outline"
             data-text="signin_with"
             data-size="large"
             data-logo_alignment="left">
        </div>

        <!-- Register link -->
        <p class="mt-3 text-center">Don't have an account? <a href="register">Register</a></p>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
