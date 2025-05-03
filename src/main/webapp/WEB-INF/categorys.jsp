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
	<div class="mt-4 container-sm">
		<form action="/admin/AddCategory" method="post">
			<div class="input-group mb-3">
				<input name="category" type="text" class="form-control"
					placeholder="ADD New Category"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary"  type="submit" 
					id="button-addon2">ADD</button>
			</div>
		</form>
		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Nme</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty categrys}">
						<c:forEach var="categry" items="${categrys}">
							<tr>
								<td>${categry.getId()}</td>
								<td>${categry.getCategory()}</td>
								<td><a type="button"
									href="/admin/AddCategory?CID=${ categry.getId() }"
									class="btn btn-outline-danger">Delete</a></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>