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
	<%@ include file="P_Nav.jsp"%>
	<div class="d-flex flex-row gap-3 mt-5">
		<c:choose>

			<c:when test="${not empty user.getImg()}">
				<img class="img-thumbnail" style="height: 250px; Width: 250px"
					src="${user.getImg() }" alt="Profile" width="100" />
			</c:when>
			<c:otherwise>
        NOTHING
    </c:otherwise>
		</c:choose>
		<div class="d-flex flex-column gap-3 mt-3">
			<h3>${user.getEmail()}</h3>
			<h3>${user.getName()}</h3>
		</div>
	</div>
	<hr />
	<form action="uploadProfilePic" method="post"
		enctype="multipart/form-data">
		<label for="profilePic">Upload Profile Picture:</label> <input
			type="file" name="profilePic" accept="image/*" required>
		<button type="submit">Upload</button>
	</form>
</body>
</html>