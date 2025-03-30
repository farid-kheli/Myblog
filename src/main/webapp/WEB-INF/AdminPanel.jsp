<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="text-light bg-dark">
<%@ include file="A_Nav.jsp"   %>
<h1>Welcome, Admin</h1>
<table class="table table-dark table-striped">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">title</th>
				<th scope="col">discription</th>
				<th scope="col">Author</th>
				<th scope="col">createdAt</th>
				<th scope="col">Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty blogs}">
					<c:forEach var="blog" items="${blogs}">
						<tr>
							<th scope="row">${blog.id}</th>
							<td>${blog.title}</td>
							<td>Some quick example text to build on the
								card title and make up the bulk of the card's content.</td>
								<td>${blog.getusername()}</td>
							<td>${blog.createdAt}</td>
							<td>
								<a href="/Blog?id=${blog.id}" type="button" class="btn btn-primary">Check out</a>
								<a type="button" class="btn btn-warning">Update</a>
								<a type="button" class="btn btn-danger">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<p>You haven't posted any blogs yet.</p>
			</c:otherwise>
			</c:choose>
			
		</tbody>
	</table>
</body>
</html>