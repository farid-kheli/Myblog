<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Blog</title>
<script
	src="https://cdn.tiny.cloud/1/da91lze1q4ce30bdj8na78ygotv4sushpwqxdm0y39ccoqnz/tinymce/7/tinymce.min.js"
	referrerpolicy="origin"></script>
<script>
	tinymce
			.init({
				selector : '#content',
				plugins : 'lists link image table',
				toolbar : 'undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
			});
</script>
</head>
<body class="text-light bg-dark">
	<%@ include file="P_Nav.jsp"%>
	<form action="EditBlog" class="container-sm" method="post"
		enctype="multipart/form-data">
		<h1>Create a Blog Post</h1>

		<input type="hidden" name="id" value="${blog.id}" />
		<div class="d-flex gap-5">
			<div class="form-floating w-50 text-black">
				<input type="text" class="form-control" id="floatingInput"
					name="title" value="${blog.getTitle()}"> <label
					for="floatingInput">Titel</label>
			</div>
			<select class="form-select w-50" name="categry"
				aria-label="Default select example">
				<c:choose>
					<c:when test="${not empty categrys}">
						<c:forEach var="categry" items="${categrys}">
							<option
								<c:if test="${category.id == blog.CID}">
                selected
            </c:if>
								value="${categry.getId()}"> ${categry.getCategory()}</option>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<p>There is no Categorys yet.</p>
					</c:otherwise>
				</c:choose>
			</select>
		</div>
		<div class="form-floating text-black mt-3 mb-3">
			<input type="text" name="discription" class="form-control"
				value="${blog.getDiscription()}"> <label>discription</label>
		</div>
		<div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupFile01">Upload</label>
			<input type="file" name="B_Img" class="form-control"
				id="inputGroupFile01">
		</div>
		<div>
			<h3>Content:</h3>
			<textarea id="content" name="content">${blog.getContent()}</textarea>
			<br> <br>
		</div>
		<button type="submit" class="btn btn-outline-primary">Save
			Blog</button>
	</form>
</body>
</html>
