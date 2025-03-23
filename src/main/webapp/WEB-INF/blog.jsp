<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${blog.title}</h1>
<div>
                    <p>${blog.content}</p>
                    <small>Published on: ${blog.createdAt}</small>
                    <hr>
                </div>
</body>
</html>