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
	<%@ include file="A_Nav.jsp"%>
	<table class="mt-4 container-sm table table-dark table-striped">
		<thead>
			<tr>
				<th scope="col">ID</th>
				<th scope="col">Nme</th>
				<th scope="col">Email</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty users}">
					<c:forEach var="user" items="${users}">
						<tr>
							<td>${user.getId()}</td>
							<td>${user.getName()}</td>
							<td>${user.getEmail()}</td>
							<td>
							<button type="button" class="btn btn-outline-info">profile</button>
							<button type="button" class="btn btn-outline-warning">Update</button>
							<button type="button" class="btn btn-outline-danger">Delete</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

</body>
</html>