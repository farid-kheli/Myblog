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
<%@ include file="P_Nav.jsp"   %>
<ul>
<li><a href=like?id=${blog.id}>like ${num_likes}</a></li>
<li><a href=save?id=${blog.id}>save ${num_saves}</a></li>
<li><a href=share?id=${blog.id}>share ${num_shares}</a></li>
</ul>

<h1>${blog.title}</h1>
<div>
                    <p>${blog.content}</p>
                    <small>Published on: ${blog.createdAt}</small>
                    <hr>
</div>
<h3>Comments</h3>
<c:choose>
        <c:when test="${not empty Comments}">
            <c:forEach var="Comment" items="${Comments}">
                <div>
                    <p>${Comment.getcomment()}</p>
                    <hr>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <p>You haven't posted any blogs yet.</p>
        </c:otherwise>
    </c:choose>
<form action="comment?id=${blog.id}" method="post">
<input type="text" name="comment"/>
<input type="submit"/>
</form>
</body>
</html>