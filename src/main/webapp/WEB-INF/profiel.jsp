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
	<div class="d-flex mt-5 flex-row gap-3 mt-5">
		<c:choose>

			<c:when test="${not empty user.getImg()}">
				<img class="img-thumbnail" style="height: 250px; Width: 250px"
					src="${user.getImg() }" alt="Profile" width="100" />
			</c:when>
			<c:otherwise>
				<img class="img-thumbnail" style="height: 250px; Width: 250px"
					src="/uploads/profiel.webp" alt="Profile" width="100" />
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

			<c:choose>
				<c:when test="${not empty blogsLikeds}">
					<h1>Posts You Liked</h1>
					<hr>
					<div class="d-flex flex-row gap-3 mt-3">
						<c:forEach var="blog" items="${blogsLikeds}">
							<div class="card" style="width: 18rem;">
								<div class="w-100 border-dark border-bottom d-flex ">
									<a href=like?id=${blog.id}
										class="w-100 p-2 pb-0 text-black border-dark d-flex flex-column align-items-center">
										<svg width="24px" height="24px" viewBox="0 0 24 24"
											fill="none" xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd"
												clip-rule="evenodd"
												d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z"
												<c:if test="${blog.Liked(user.getId())}">
  fill="#880808"	
</c:if>
												stroke="#000000" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round"></path> </g></svg>
										<p>${blog.getLikes()}</p>
									</a> <a href=save?id=${blog.id}
										class="text-black w-100 p-2 border-dark border-end border-start d-flex flex-column align-items-center">
										<svg width="24px" height="24px" viewBox="0 0 24 24"
											fill="none" xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path
												d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z"
												<c:if test="${blog.Saved(user.getId())}">
  fill="#FFC300"	
</c:if>
												stroke="#000000" stroke-width="2" stroke-linejoin="round"></path> </g></svg>
										<p>${blog.getSaves()}</p>
									</a> <a
										class="w-100 p-2 border-dark text-black d-flex flex-column align-items-center"
										href=share?id=${blog.id}> <svg fill="#000000"
											height="24px" width="24px" version="1.1" id="Layer_1"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											viewBox="0 0 458.624 458.624" xml:space="preserve">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <g> <g> <path
												d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z"></path> </g> </g> </g></svg>

										<p>${blog.getShares()}</p>
									</a>
								</div>
								<img src="/uploads/Blog_pictures/${blog.id}"
									class="card-img-top" alt="...">
								<div class="card-body">

									<h5 class="card-title">${blog.title}</h5>
									<p class="card-text">${blog.getDiscription()}</p>

								</div>
								<small>${blog.createdAt}</small> <a href="Blog?id=${blog.id}"
									class="w-100 btn btn-primary">check it out</a>
							</div>
						</c:forEach>

					</div>
				</c:when>
			</c:choose>
		</div>
		<div>

			<c:choose>
				<c:when test="${not empty UserSavedBlogs}">

					<h1>Posts You Saved</h1>
					<hr>
					<div class="d-flex flex-row gap-3 mt-3">
						<c:forEach var="blog" items="${UserSavedBlogs}">
							<div class="card" style="width: 18rem;">
								<div class="w-100 border-dark border-bottom d-flex ">
									<a href=like?id=${blog.id}
										class="w-100 p-2 pb-0 text-black border-dark d-flex flex-column align-items-center">
										<svg width="24px" height="24px" viewBox="0 0 24 24"
											fill="none" xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path fill-rule="evenodd"
												clip-rule="evenodd"
												d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z"
												<c:if test="${blog.Liked(user.getId())}">
  fill="#880808"	
</c:if>
												stroke="#000000" stroke-width="2" stroke-linecap="round"
												stroke-linejoin="round"></path> </g></svg>
										<p>${blog.getLikes()}</p>
									</a> <a href=save?id=${blog.id}
										class="text-black w-100 p-2 border-dark border-end border-start d-flex flex-column align-items-center">
										<svg width="24px" height="24px" viewBox="0 0 24 24"
											fill="none" xmlns="http://www.w3.org/2000/svg">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <path
												d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z"
												<c:if test="${blog.Saved(user.getId())}">
  fill="#FFC300"	
</c:if>
												stroke="#000000" stroke-width="2" stroke-linejoin="round"></path> </g></svg>
										<p>${blog.getSaves()}</p>
									</a> <a
										class="w-100 p-2 border-dark text-black d-flex flex-column align-items-center"
										href=share?id=${blog.id}> <svg fill="#000000"
											height="24px" width="24px" version="1.1" id="Layer_1"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											viewBox="0 0 458.624 458.624" xml:space="preserve">
							<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
							<g id="SVGRepo_tracerCarrier" stroke-linecap="round"
												stroke-linejoin="round"></g>
							<g id="SVGRepo_iconCarrier"> <g> <g> <path
												d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z"></path> </g> </g> </g></svg>

										<p>${blog.getShares()}</p>
									</a>
								</div>
								<img src="/uploads/Blog_pictures/${blog.id}"
									class="card-img-top" alt="...">
								<div class="card-body">

									<h5 class="card-title">${blog.title}</h5>
									<p class="card-text">${blog.getDiscription()}</p>

								</div>
								<small>${blog.createdAt}</small> <a href="Blog?id=${blog.id}"
									class="w-100 btn btn-primary">check it out</a>
							</div>
						</c:forEach>
					</div>
				</c:when>
			</c:choose>
		</div>
	</div>
</body>
</html>