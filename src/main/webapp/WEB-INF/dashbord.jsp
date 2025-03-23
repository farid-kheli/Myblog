<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Blog</title>
<script src="https://cdn.tiny.cloud/1/da91lze1q4ce30bdj8na78ygotv4sushpwqxdm0y39ccoqnz/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
<script>
  tinymce.init({
    selector: '#content',
    plugins: 'lists link image table',
    toolbar: 'undo redo | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
  });
</script>
</head>
<body>
<h1>Create a Blog Post</h1>

<form action="saveBlog" method="post">
    <label>Title:</label>
    <input type="text" name="title" required><br><br>
    <label>Content:</label>
    <textarea id="content" name="content"></textarea><br><br>
    <button type="submit">Save Blog</button>
</form>


</body>
</html>
