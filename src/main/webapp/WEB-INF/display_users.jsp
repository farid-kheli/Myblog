<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="A_Nav.jsp"   %>
<c:choose>
        <c:when test="${not empty users}">
            <c:forEach var="user" items="${users}">
                <div>
                    <h2>${user.getName()}</h2>
                    <h2>${user.getEmail()}</h2>
                    <hr>
                </div>
            </c:forEach>
        </c:when>
    </c:choose>
</body>
</html>