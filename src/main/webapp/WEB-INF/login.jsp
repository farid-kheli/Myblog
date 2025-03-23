<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <c:if test="${not empty message && empty emailmessage}">
        <p style="color: red;">${message}</p>
    </c:if>
<form action="login" method="post">
<input type="email" name="email"/>
<input type="password" name="password"/>
<button type=submit>enter</button>
<p> don't have an acount <a href="register">register</a> now</p>
</form>
</body>
</html>