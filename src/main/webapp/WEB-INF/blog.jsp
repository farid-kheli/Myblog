<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>


<html lang="en-us">
<head>
<meta charset="utf-8">
<title>Reader | Hugo Personal Blog Template</title>

<!-- mobile responsive meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">
<meta name="generator" content="Hugo 0.74.3" />

<!-- plugins -->

<link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" href="plugins/slick/slick.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css" media="screen">

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<meta property="og:title" content="Reader | Hugo Personal Blog Template" />
<meta property="og:description" content="This is meta description" />
<meta property="og:type" content="website" />
<meta property="og:url" content="" />
<meta property="og:updated_time" content="2020-03-15T15:40:24+06:00" />
</head>
<body>
	<!-- navigation -->
	<header class="navigation fixed-top">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-white">
				<a class="navbar-brand order-1" href="index.html"> <img
					class="img-fluid" width="100px" src="images/logo.png"
					alt="Reader | Hugo Personal Blog Template">
				</a>
				<div class="collapse navbar-collapse text-center order-lg-2 order-3"
					id="navigation">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item dropdown"><a class="nav-link" href=home
							aria-haspopup="true" aria-expanded="false"> homepage </a></li>


						<li class="nav-item"><a class="nav-link" href="dashbord">Write
								Now</a></li>



						<li class="nav-item"><a class="nav-link" href="MyBloges">My
								Bloges</a></li>
						<li class="nav-item dropdown"><a class="nav-link" href="#"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> profiel <i class="ti-angle-down ml-1"></i>
						</a>
							<div class="dropdown-menu">

								<a class="dropdown-item" href="profiel">profiel</a> <a
									class="dropdown-item" href="MyLikes">My Liked Posts</a> <a
									class="dropdown-item" href="MySaves">My Saved Posts</a> <a
									class="dropdown-item" href="setting">setting</a> <a
									class="dropdown-item" href="logout">logout</a>
							</div></li>
					</ul>
				</div>

				<div class="order-2 order-lg-3 d-flex align-items-center">
					<select class="m-2 border-0 bg-transparent" id="select-language">
						<option id="en" value="" selected>En</option>
						<option id="fr" value="">Fr</option>
					</select>

					<form action="search" method="post" class="search-bar">
						<input id="search-query" name="search" type="search"
							placeholder="Type &amp; Hit Enter...">
					</form>

					<button class="navbar-toggler border-0 order-1" type="button"
						data-toggle="collapse" data-target="#navigation">
						<i class="ti-menu"></i>
					</button>
				</div>

			</nav>
		</div>
	</header>
	<!-- /navigation -->

	<div class="py-4"></div>
	<section class="section">
		<div class="container d-flex">
			<div>
				<ul class="d-flex flex-column flex-column gap-3 "
					style="list-style: none">
					<li><a style="text-decoration: none;"
						class=" text-dark d-flex flex-column align-items-center justify-content-center"
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
						class=" text-dark d-flex flex-column align-items-center justify-content-center"
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
						class=" text-dark d-flex flex-column align-items-center justify-content-center"
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
			<div class="row justify-content-center">
				<div class=" col-lg-9   mb-5 mb-lg-0">
					<article>
						<div class="post-slider mb-4">
							<img src="/uploads/Blog_pictures/${blog.id}" class="card-img"
								alt="post-thumb">
						</div>

						<h1 class="h2">${blog.title}</h1>
						<ul class="card-meta my-3 list-inline">
							<li class="list-inline-item"><a href="author-single.html"
								class="card-meta-author"> <c:choose>
										<c:when test="${not empty blog.getusername().getImg()}">
											<img src="${blog.getusername().getImg()}">
										</c:when>
										<c:otherwise>
											<img src="/uploads/profiel.webp">
										</c:otherwise>
									</c:choose>
									<span>${blog.getusername().getName() }</span>
							</a></li>
							<li class="list-inline-item"></i>
							<li class="list-inline-item"><i class="ti-calendar"></i>${blog.createdAt}</li>
							<li class="list-inline-item">
								<ul class="card-meta-tag list-inline">
									<li class="list-inline-item"><a href="tags.html">Color</a></li>
								</ul>
							</li>
						</ul>
						<div class="content">
							<hr class="w-100">
							<div class="w-100">
								<p>${blog.content}</p>
							</div>
						</div>
					</article>

				</div>

				<div class="col-lg-9 col-md-12">
					<div class="mb-5 border-top mt-4 pt-5">
						<h3 class="mb-4">Comments</h3>
						<c:choose>
							<c:when test="${not empty Comments}">
								<c:forEach var="Comment" items="${Comments}">
									<div class="media d-block d-sm-flex">
										<div class="d-inline-block mr-2 mb-3 mb-md-0" href="#">
											<img class="mr-3" src="images/post/arrow.png" alt=""> <a
												href="#!"> <c:choose>
													<c:when test="${not empty blog.getusername().getImg()}">
														<img src="${blog.getusername().getImg()}"
															class="mr-3 rounded-circle" alt="">
													</c:when>
													<c:otherwise>
														<img src="/uploads/profiel.webp"
															class="mr-3 rounded-circle" width="50px" alt="">
													</c:otherwise>
												</c:choose></a>
										</div>
										<div class="media-body">
											<a href="#!" class="h4 d-inline-block mb-3">${Comment.getUserName()}</a>

											<p>${Comment.getcomment()}</p>

											<span class="text-black-800 mr-3 font-weight-600">${Comment.getTime()}</span>
										</div>
									</div>
									<hr />
								</c:forEach>
							</c:when>
						</c:choose>

					</div>

					<div>
						<h3 class="mb-4">Leave a Reply</h3>
						<form action="comment?id=${blog.id}" method="POST">
							<div class="row">
								<div class="form-group col-md-12">
									<textarea class="form-control shadow-none" name="comment"
										rows="7" required></textarea>
								</div>
							</div>
							<button class="btn btn-primary" type="submit">Comment
								Now</button>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>

	<footer class="footer">
		<svg class="footer-border" height="214" viewBox="0 0 2204 214"
			fill="none" xmlns="http://www.w3.org/2000/svg">
      <path
				d="M2203 213C2136.58 157.994 1942.77 -33.1996 1633.1 53.0486C1414.13 114.038 1200.92 188.208 967.765 118.127C820.12 73.7483 263.977 -143.754 0.999958 158.899"
				stroke-width="2" />
  </svg>

		<div class="instafeed text-center mb-5">
			<h2 class="h3 mb-4">INSTAGRAM POST</h2>

			<div class="instagram-slider">
				<div class="instagram-post">
					<img src="images/instagram/1.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/2.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/4.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/3.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/2.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/1.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/3.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/4.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/2.jpg">
				</div>
				<div class="instagram-post">
					<img src="images/instagram/4.jpg">
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-5 text-center text-md-left mb-4">
					<ul class="list-inline footer-list mb-0">
						<li class="list-inline-item"><a href="privacy-policy.html">Privacy
								Policy</a></li>
						<li class="list-inline-item"><a href="terms-conditions.html">Terms
								Conditions</a></li>
					</ul>
				</div>
				<div class="col-md-2 text-center mb-4">
					<a href="index.html"><img class="img-fluid" width="100px"
						src="images/logo.png" alt="Reader | Hugo Personal Blog Template"></a>
				</div>
				<div class="col-md-5 text-md-right text-center mb-4">
					<ul class="list-inline footer-list mb-0">

						<li class="list-inline-item"><a href="#"><i
								class="ti-facebook"></i></a></li>

						<li class="list-inline-item"><a href="#"><i
								class="ti-twitter-alt"></i></a></li>

						<li class="list-inline-item"><a href="#"><i
								class="ti-linkedin"></i></a></li>

						<li class="list-inline-item"><a href="#"><i
								class="ti-github"></i></a></li>

						<li class="list-inline-item"><a href="#"><i
								class="ti-youtube"></i></a></li>

					</ul>
				</div>
				<div class="col-12">
					<div class="border-bottom border-default"></div>
				</div>
			</div>
		</div>
	</footer>


	<!-- JS Plugins -->
	<script src="plugins/jQuery/jquery.min.js"></script>

	<script src="plugins/bootstrap/bootstrap.min.js"></script>

	<script src="plugins/slick/slick.min.js"></script>

	<script src="plugins/instafeed/instafeed.min.js"></script>


	<!-- Main Script -->
	<script src="js/script.js"></script>
</body>
</html>