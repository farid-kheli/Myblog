<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form action="saveBlog" class="container-sm" method="post">
		<h1>Create a Blog Post</h1>
		<div class="d-flex gap-5">
			<div class="form-floating w-50 text-black">
				<input type="text" class="form-control" id="floatingInput"
					placeholder="name@example.com"> <label for="floatingInput">Titel</label>
			</div>
			<select class="form-select w-50" aria-label="Default select example">
				<option selected>Open this select menu</option>
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
			</select>
		</div>
		<div class="form-floating text-black mt-3 mb-3">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="name@example.com"> <label for="floatingInput">discription</label>
		</div>
		<div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupFile01">Upload</label>
			<input type="file" class="form-control" id="inputGroupFile01">
		</div>
		<div>
			<h3>Content:</h3>
			<textarea id="content" name="content"></textarea>
			<br> <br>
		</div>
		<button type="button" class="btn btn-outline-primary">Save Blog</button>
	</form>
</body>
</html>
