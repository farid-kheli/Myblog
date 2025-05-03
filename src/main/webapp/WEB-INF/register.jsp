<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <meta name="google-signin-client_id" content="YOUR_CLIENT_ID_HERE">
    <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
<body class="bg-dark d-flex align-items-center justify-content-center" style="height: 100vh;">

    <form action="register" method="post" class="bg-black text-light p-4 rounded w-50">
        <h2 class="mb-4 text-center">Register</h2>

        <!-- Email Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <c:choose>
                <c:when test="${not empty EmailTmessage}">
                    <input type="email" name="email" class="form-control is-invalid" required>
                    <div class="invalid-feedback">${EmailTmessage}</div>
                </c:when>
                <c:otherwise>
                    <input type="email" name="email" class="form-control" required>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Name Field -->
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>

        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <c:choose>
                <c:when test="${not empty Passmessage}">
                    <input type="password" name="password" class="form-control is-invalid" required>
                    <div class="invalid-feedback">${Passmessage}</div>
                </c:when>
                <c:otherwise>
                    <input type="password" name="password" class="form-control" required>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Confirm Password Field -->
        <div class="mb-3">
            <label for="Cpassword" class="form-label">Confirm Password</label>
            <c:choose>
                <c:when test="${not empty CPassmessage}">
                    <input type="password" name="Cpassword" class="form-control is-invalid" required>
                    <div class="invalid-feedback">${CPassmessage}</div>
                </c:when>
                <c:otherwise>
                    <input type="password" name="Cpassword" class="form-control" required>
                </c:otherwise>
            </c:choose>
        </div>

        <button type="submit" class="btn btn-primary w-100">Register</button>

        <div class="text-center mt-3">
            <p>Already have an account? <a href="login" class="text-info">Login</a></p>
        </div>

        <!-- Google Sign-In Button -->
        <div class="text-center mt-4">
            <div id="g_id_onload"
                 data-client_id="860835309568-irtqb413o7omma4mcli4mrd78cnp6e3e.apps.googleusercontent.com"
                 data-ux_mode="redirect"
                 data-login_uri="${pageContext.request.contextPath}/register"
                 data-auto_prompt="false">
            </div>
            <div class="g_id_signin"
                 data-type="standard"
                 data-shape="rectangular"
                 data-theme="filled_blue"
                 data-text="signup_with"
                 data-size="large"
                 data-logo_alignment="left">
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
