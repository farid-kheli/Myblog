<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${blog.title}</title>
<style>
body {
  --sb-track-color: #616161;
  --sb-thumb-color: #010a05;
  --sb-size: 14px;
}

::-webkit-scrollbar {
  width: var(--sb-size)
}

::-webkit-scrollbar-track {
  background: var(--sb-track-color);
  border-radius: 9px;
}

::-webkit-scrollbar-thumb {
  background: var(--sb-thumb-color);
  border-radius: 9px;
  border: 1px solid #767b84;
}

@supports not selector(::-webkit-scrollbar) {
  body {
    scrollbar-color: var(--sb-thumb-color)
                     var(--sb-track-color);
  }
}
</style>
</head>
<body class="  text-light" style="background-image: url('/uploads/Blog_pictures/${blog.id}');background-repeat: none;background-repeat: no-repeat;
  background-size: cover; height: 100vh;">
	<%@ include file="P_Nav.jsp"%>

	<div class="d-flex justify-content-between h-75 p-4 w-100">
		<div>
			<ul class="d-flex flex-column flex-column gap-3 "
				style="list-style: none">
				<li><a style="text-decoration: none;"
					class="text-light d-flex flex-column align-items-center justify-content-center"
					href=like?id=${blog.id}> <?xml version="1.0" encoding="utf-8"?>
						<svg width="64px" height="64px" viewBox="0 0 24 24" fill="none"
							xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
								stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd"
								clip-rule="evenodd"
								d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z"
								<c:if test="${liked}">
  fill="#880808"	
</c:if>
								stroke="#000000" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round"></path> </g></svg> ${num_likes}
				</a></li>
				<li><a
					class="text-light d-flex flex-column align-items-center justify-content-center"
					style="text-decoration: none;" href=save?id=${blog.id}> <svg
							width="64px" height="64px" viewBox="0 0 24 24" fill="none"
							xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
								stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path
								d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z"
								<c:if test="${saved}">
  fill="#FFC300"	
</c:if>
								stroke="#000000" stroke-width="2" stroke-linejoin="round"></path> </g></svg>
						${num_saves}
				</a></li>
				<li><a
					class="text-light d-flex flex-column align-items-center justify-content-center"
					style="text-decoration: none;" href=share?id=${blog.id}> <svg
							fill="#000000" height="64px" width="69px" version="1.1"
							id="Layer_1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink"
							viewBox="0 0 458.624 458.624" xml:space="preserve">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
								stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <g> <g> <path
								d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z"></path> </g> </g> </g></svg>
						${num_shares}
				</a></li>
			</ul>
		</div>

		<div
			class="bg-dark w-75 overflow-scroll  rounded p-4 d-flex flex-column align-items-center h-100" style="opacity: 0.9;">
			<div class="d-flex align-items-center justify-content-between w-75">
				<h3>${blog.getusername() }</h3>
				<small>Published on : ${blog.createdAt}</small>
			</div>
			<h1>${blog.title}</h1>

			<hr class="w-100">
			<div class="w-100">
				<p>${blog.content}</p>
			</div>
		</div>

		<div class="h-75">
			<h3>Comments</h3>
			<div class="d-flex flex-column gap-4">
				<c:choose>
					<c:when test="${not empty Comments}">
						<c:forEach var="Comment" items="${Comments}">
							<div
								class="shadow-lg w-100 p-4 bg-dark border border-white rounded">
								<div class="w-100 d-flex justify-content-between">
									<p>${Comment.getUserName()}</p>
									<small>${Comment.getTime()}</small>
								</div>
								<hr>
								<p>${Comment.getcomment()}</p>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
				<div class="ms-auto">
					<form action="comment?id=${blog.id}" method="post">
						<input type="text" class="rounded-pill p-2" name="comment" />
						<button type="submit" class="p-2 btn btn-success">Success</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>