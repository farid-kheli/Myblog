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
        <c:when test="${not empty categrys}">
            <c:forEach var="categry" items="${categrys}">
                <div>
                    <h2>${categry.getId()}</h2>
                    <h2>${categry.getCategory()}</h2>
                    <a href="/admin/AddCategory?CID=${ categry.getId() }">delete</a>
                    <hr>
                </div>
            </c:forEach>
        </c:when>
    </c:choose>
<form action="/admin/AddCategory" method="post">
    <input type="text" name="category"/>
    <input type="submit"/>
</form>
</body>
</html>