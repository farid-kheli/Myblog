<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Blogs</title>
</head>
<body>
    <h1>My Blogs</h1>

    <c:choose>
        <c:when test="${not empty blogs}">
            <c:forEach var="blog" items="${blogs}">
                <div>
                    <h2><a href="Blog?id=${blog.id}">${blog.title}</a></h2>
                    <small>Published on: ${blog.createdAt}</small>
                    <hr>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>You haven't posted any blogs yet.</p>
        </c:otherwise>
    </c:choose>

</body>
</html>
