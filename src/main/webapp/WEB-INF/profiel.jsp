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
        <img class="img-thumbnail" style="height: 250px; Width: 250px"
					src="/uploads/profile_pictures/farid" alt="Profile" width="100" />
    </c:otherwise>
		</c:choose>
		<div class="d-flex flex-column gap-3 mt-3">
		<h3>${user.getName()}</h3>
			<small>${user.getEmail()}</small>
			
		</div>
	</div>
	<hr />
	<div>
		<div>
			<h1>Posts You Liked</h1>
			<hr>
			<div class="d-flex flex-row gap-3 mt-3">
				<c:choose>
					<c:when test="${not empty blogsLikeds}">
						<c:forEach var="blogsLiked" items="${blogsLikeds}">
							<div class="card" style="width: 18rem;">
								<img src="/uploads/Blog_pictures/${blog.id}" class="card-img-top" alt="...">
								<div class="card-body">

									<h5 class="card-title">${blogsLiked.title}</h5>
									<p class="card-text">${blog.getDiscription()}</p>
									<a href="Blog?id=${blogsLiked.id}" class="btn btn-primary">check
										it out</a> <small>${blogsLiked.createdAt}</small>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div>
			<h1>Posts You Saved</h1>
			<hr>
			<div class="d-flex flex-row gap-3 mt-3">
				<c:choose>
					<c:when test="${not empty UserSavedBlogs}">
						<c:forEach var="UserSavedBlog" items="${UserSavedBlogs}">
							<div class="card" style="width: 18rem;">
								<img src="..." class="card-img-top" alt="...">
								<div class="card-body">

									<h5 class="card-title">${UserSavedBlog.title}</h5>
									<p class="card-text">Some quick example text to build on
										the card title and make up the bulk of the card's content.</p>
									<a href="Blog?id=${UserSavedBlog.id}" class="btn btn-primary">check
										it out</a> <small>${UserSavedBlog.createdAt}</small>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>