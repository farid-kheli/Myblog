<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-dark text-light">
	<%@ include file="P_Nav.jsp"%>

	<h2 class="mt-4">populare</h2>
	<hr />
	<div class="d-flex flex-row gap-3 mt-3">
		<c:choose>
			<c:when test="${not empty blogs}">
				<c:forEach var="blog" items="${blogs}">
					<div class="card" style="width: 18rem;">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">

							<h5 class="card-title">${blog.title}</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="Blog?id=${blog.id}" class="btn btn-primary">check it out</a> 
							<small>${blog.createdAt}</small>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
</body>
</html>