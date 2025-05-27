<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<title>Reader | Hugo Personal Blog Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="This is meta description">
<meta name="author" content="Themefisher">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- plugins -->
<link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" href="plugins/slick/slick.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css" media="screen">

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
<link rel="icon" href="images/favicon.png" type="image/x-icon">

<style>
	:root {
		--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		--secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
		--success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
		--warning-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
		--danger-gradient: linear-gradient(135deg, #ff6b6b 0%, #ee5a52 100%);
		--dark-bg: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
		--glass-bg: rgba(255, 255, 255, 0.1);
		--glass-border: rgba(255, 255, 255, 0.2);
	}

	body {
		background: var(--dark-bg);
		min-height: 100vh;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		overflow-x: hidden;
	}

	/* Animated background particles */
	body::before {
		content: '';
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-image: 
			radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%),
			radial-gradient(circle at 80% 20%, rgba(255, 119, 198, 0.3) 0%, transparent 50%),
			radial-gradient(circle at 40% 40%, rgba(120, 219, 255, 0.3) 0%, transparent 50%);
		animation: float 20s ease-in-out infinite;
		z-index: -1;
	}

	@keyframes float {
		0%, 100% { transform: translateY(0px) rotate(0deg); }
		33% { transform: translateY(-30px) rotate(120deg); }
		66% { transform: translateY(15px) rotate(240deg); }
	}

	/* Banner section */
	.banner {
		position: relative;
		padding: 150px 0 100px;
		overflow: hidden;
		background: transparent;
	}

	.banner h1 {
		color: white;
		font-size: 3.5rem;
		font-weight: 300;
		text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
		margin-bottom: 2rem;
		animation: slideUp 1s ease-out;
	}

	.banner h1 br + span,
	.banner h1 span {
		background: var(--warning-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		font-weight: 600;
	}

	@keyframes slideUp {
		from {
			opacity: 0;
			transform: translateY(50px);
		}
		to {
			opacity: 1;
			transform: translateY(0);
		}
	}

	/* Category tags */
	.widget-list-inline a {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		color: white !important;
		padding: 8px 20px;
		border-radius: 25px;
		transition: all 0.3s ease;
		text-decoration: none;
		margin: 5px;
		display: inline-block;
		font-weight: 500;
	}

	.widget-list-inline a:hover {
		background: var(--primary-gradient);
		transform: translateY(-3px);
		box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
	}

	/* Section styling */
	.section {
		padding: 80px 0;
	}

	.section-title {
		color: white;
		font-weight: 600;
		margin-bottom: 30px;
		position: relative;
		padding-bottom: 15px;
	}

	.section-title::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 50px;
		height: 3px;
		background: var(--warning-gradient);
		border-radius: 2px;
	}

	/* Card styling */
	.card {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		border-radius: 20px;
		overflow: hidden;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		margin-bottom: 30px;
	}

	.card:hover {
		transform: translateY(-10px);
		box-shadow: 0 20px 40px rgba(31, 38, 135, 0.5);
	}

	.card-img-top {
		border-radius: 20px 20px 0 0;
		transition: transform 0.4s ease;
	}

	.card:hover .card-img-top {
		transform: scale(1.05);
	}

	.card-body {
		padding: 25px;
		color: white;
	}

	.card-img-sm {
		width: 80px;
		height: 80px;
		object-fit: cover;
		border-radius: 15px;
		border: 2px solid var(--glass-border);
	}

	.post-title {
		color: white !important;
		text-decoration: none;
		font-weight: 600;
		transition: all 0.3s ease;
		line-height: 1.4;
	}

	.post-title:hover {
		background: var(--warning-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	/* Card meta styling */
	.card-meta {
		color: rgba(255, 255, 255, 0.7);
		font-size: 0.9rem;
		margin-bottom: 15px;
	}

	.card-meta a {
		color: rgba(255, 255, 255, 0.8);
		text-decoration: none;
		transition: color 0.3s ease;
	}

	.card-meta a:hover {
		color: #ffd700;
	}

	.card-meta img {
		width: 30px;
		height: 30px;
		border-radius: 50%;
		margin-right: 8px;
		border: 2px solid var(--glass-border);
	}

	.card-meta-tag a {
		background: rgba(255, 255, 255, 0.1);
		padding: 3px 12px;
		border-radius: 15px;
		font-size: 0.8rem;
		margin-right: 5px;
		transition: all 0.3s ease;
	}

	.card-meta-tag a:hover {
		background: var(--primary-gradient);
		color: white;
	}

	/* Button styling */
	.btn-outline-primary {
		border: 2px solid transparent;
		background: var(--primary-gradient);
		color: white;
		font-weight: 600;
		padding: 10px 25px;
		border-radius: 25px;
		transition: all 0.3s ease;
		text-decoration: none;
		display: inline-block;
	}

	.btn-outline-primary:hover {
		transform: translateY(-2px);
		box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
		color: white;
	}

	/* Action buttons (like, save, share) */
	.action-buttons {
		border-top: 1px solid var(--glass-border);
		margin-top: 20px;
		padding-top: 15px;
		display: flex;
		border-radius: 0 0 20px 20px;
	}

	.action-buttons a {
		flex: 1;
		padding: 12px;
		text-align: center;
		color: rgba(255, 255, 255, 0.7);
		text-decoration: none;
		transition: all 0.3s ease;
		display: flex;
		flex-direction: column;
		align-items: center;
		border-radius: 10px;
		margin: 0 5px;
	}

	.action-buttons a:hover {
		background: rgba(255, 255, 255, 0.1);
		color: white;
		transform: translateY(-2px);
	}

	.action-buttons svg {
		margin-bottom: 5px;
		transition: transform 0.3s ease;
	}

	.action-buttons a:hover svg {
		transform: scale(1.1);
	}

	/* Pagination */
	.pagination .page-link {
		background: var(--glass-bg);
		border: 1px solid var(--glass-border);
		color: white;
		margin: 0 5px;
		border-radius: 10px;
		padding: 10px 15px;
		transition: all 0.3s ease;
	}

	.pagination .page-link:hover,
	.pagination .page-item.active .page-link {
		background: var(--primary-gradient);
		border-color: transparent;
		color: white;
		transform: translateY(-2px);
		box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
	}

	/* Footer */
	.footer {
		background: rgba(30, 60, 114, 0.9);
		backdrop-filter: blur(20px);
		border-top: 1px solid var(--glass-border);
		padding: 50px 0 30px;
		color: white;
	}

	.footer-list a {
		color: rgba(255, 255, 255, 0.7);
		text-decoration: none;
		transition: color 0.3s ease;
	}

	.footer-list a:hover {
		color: #ffd700;
	}

	/* Instagram section */
	.instafeed h2 {
		color: white;
		margin-bottom: 30px;
		position: relative;
	}

	.instagram-post img {
		border-radius: 15px;
		transition: transform 0.3s ease;
		border: 2px solid var(--glass-border);
	}

	.instagram-post:hover img {
		transform: scale(1.05);
	}

	/* Responsive design */
	@media (max-width: 768px) {
		.banner h1 {
			font-size: 2.5rem;
		}
		
		.card-body {
			padding: 20px;
		}
		
		.action-buttons {
			margin-top: 15px;
		}
	}

	/* Loading animation */
	@keyframes shimmer {
		0% { background-position: -200px 0; }
		100% { background-position: calc(200px + 100%) 0; }
	}

	.card:hover::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
		animation: shimmer 1.5s ease-in-out;
		pointer-events: none;
	}
</style>
</head>
<body>
	<%@ include file="P_Nav.jsp" %>

	<!-- Banner Section -->
	<div class="banner text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mx-auto">
					<h1 class="mb-5">
						What Would You <br> <span>Like To Read</span> Today?
					</h1>
					<ul class="list-inline widget-list-inline">
						<c:choose>
							<c:when test="${not empty categrys}">
								<c:forEach var="categry" items="${categrys}">
									<li class="list-inline-item">
										<a href="tags.html">${categry.getCategory()}</a>
									</li>
								</c:forEach>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Featured Content Section -->
	<section class="section pb-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 mb-5">
					<h2 class="h5 section-title">
						<i class="fas fa-star me-2"></i>Editor's Pick
					</h2>
					<article class="card">
						<div class="post-slider slider-sm">
							<img src="images/post/post-1.jpg" class="card-img-top" alt="post-thumb">
						</div>
						<div class="card-body">
							<h3 class="h4 mb-3">
								<a class="post-title" href="post-details.html">Use apples to give your bakes caramel and a moist texture</a>
							</h3>
							<ul class="card-meta list-inline">
								<li class="list-inline-item">
									<a href="author-single.html" class="card-meta-author">
										<img src="images/john-doe.jpg" alt="Author">
										<span>Charls Xaviar</span>
									</a>
								</li>
								<li class="list-inline-item">
									<i class="fas fa-clock me-1"></i>2 Min To Read
								</li>
								<li class="list-inline-item">
									<i class="fas fa-calendar me-1"></i>14 jan, 2020
								</li>
								<li class="list-inline-item">
									<ul class="card-meta-tag list-inline">
										<li class="list-inline-item"><a href="tags.html">Color</a></li>
										<li class="list-inline-item"><a href="tags.html">Recipe</a></li>
										<li class="list-inline-item"><a href="tags.html">Fish</a></li>
									</ul>
								</li>
							</ul>
							<p style="color: rgba(255,255,255,0.8);">It's no secret that the digital industry is booming. From exciting startups to …</p>
							<a href="post-details.html" class="btn btn-outline-primary">
								<i class="fas fa-arrow-right me-2"></i>Read More
							</a>
						</div>
					</article>
				</div>

				<div class="col-lg-4 mb-5">
					<h2 class="h5 section-title">
						<i class="fas fa-fire me-2"></i>Trending Post
					</h2>

					<article class="card mb-4">
						<div class="card-body d-flex">
							<img class="card-img-sm" src="images/post/post-3.jpg">
							<div class="ml-3">
								<h4>
									<a href="post-details.html" class="post-title">Advice From
										a Twenty Something</a>
								</h4>
								<ul class="card-meta list-inline mb-0">
									<li class="list-inline-item mb-0"><i class="ti-calendar"></i>14
										jan, 2020</li>
									<li class="list-inline-item mb-0"><i class="ti-timer"></i>2
										Min To Read</li>
								</ul>
							</div>
						</div>
					</article>

					<article class="card mb-4">
						<div class="card-body d-flex">
							<img class="card-img-sm" src="images/post/post-2.jpg">
							<div class="ml-3">
								<h4>
									<a href="post-details.html" class="post-title">The Design
										Files - Homes Minimalist</a>
								</h4>
								<ul class="card-meta list-inline mb-0">
									<li class="list-inline-item mb-0"><i class="ti-calendar"></i>14
										jan, 2020</li>
									<li class="list-inline-item mb-0"><i class="ti-timer"></i>2
										Min To Read</li>
								</ul>
							</div>
						</div>
					</article>

					<article class="card mb-4">
						<div class="card-body d-flex">
							<img class="card-img-sm" src="images/post/post-4.jpg">
							<div class="ml-3">
								<h4>
									<a href="post-details.html" class="post-title">The Skinny
										Confidential</a>
								</h4>
								<ul class="card-meta list-inline mb-0">
									<li class="list-inline-item mb-0"><i class="ti-calendar"></i>14
										jan, 2020</li>
									<li class="list-inline-item mb-0"><i class="ti-timer"></i>2
										Min To Read</li>
								</ul>
							</div>
						</div>
					</article>
				</div>

				<div class="col-lg-4 mb-5">
					<h2 class="h5 section-title">
						<i class="fas fa-thumbs-up me-2"></i>Popular Post
					</h2>

					<article class="card">
						<div class="post-slider slider-sm">
							<img src="images/post/post-5.jpg" class="card-img-top"
								alt="post-thumb">
						</div>
						<div class="card-body">
							<h3 class="h4 mb-3">
								<a class="post-title" href="post-details.html">How To Make
									Cupcakes and Cashmere Recipe At Home</a>
							</h3>
							<ul class="card-meta list-inline">
								<li class="list-inline-item"><a href="author-single.html"
									class="card-meta-author"> <img src="images/kate-stone.jpg"
										alt="Kate Stone"> <span>Kate Stone</span>
								</a></li>
								<li class="list-inline-item"><i class="ti-timer"></i>2 Min
									To Read</li>
								<li class="list-inline-item"><i class="ti-calendar"></i>14
									jan, 2020</li>
								<li class="list-inline-item">
									<ul class="card-meta-tag list-inline">
										<li class="list-inline-item"><a href="tags.html">City</a></li>
										<li class="list-inline-item"><a href="tags.html">Food</a></li>
										<li class="list-inline-item"><a href="tags.html">Taste</a></li>
									</ul>
								</li>
							</ul>
							<p>Itâs no secret that the digital industry is booming.
								From exciting startups to â¦</p>
							<a href="post-details.html" class="btn btn-outline-primary">Read
								More</a>
						</div>
					</article>
				</div>
				<div class="col-12">
					<div class="border-bottom border-default"></div>
				</div>
			</div>
		</div>
	</section>

	<!-- Recent Posts Section -->
	<section class="section-sm">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<h2 class="h5 section-title">
						<i class="fas fa-newspaper me-2"></i>Recent Posts
					</h2>

					<c:choose>
						<c:when test="${not empty blogs}">
							<c:forEach var="blog" items="${blogs}">
								<article class="card mb-4">
									<div class="post-slider">
										<img src="/uploads/Blog_pictures/${blog.id}" class="card-img-top" alt="post-thumb">
									</div>
									<div class="card-body">
										<h3 class="mb-3">
											<a class="post-title" href="Blog?id=${blog.id}">${blog.title}</a>
										</h3>
										<ul class="card-meta list-inline">
											<li class="list-inline-item">
												<a href="author-single.html" class="card-meta-author">
													<c:choose>
														<c:when test="${not empty blog.getusername().getImg()}">
															<img src="${blog.getusername().getImg()}" alt="Author">
														</c:when>
														<c:otherwise>
															<img src="/uploads/profiel.webp" alt="Author">
														</c:otherwise>
													</c:choose>
													<span>${blog.getusername().getName()}</span>
												</a>
											</li>
											<li class="list-inline-item">
												<i class="fas fa-calendar me-1"></i>${blog.createdAt}
											</li>
											<li class="list-inline-item">
												<ul class="card-meta-tag list-inline">
													<li class="list-inline-item">
														<a href="tage?search=${blog.getCategory()}">${blog.getCategory()}</a>
													</li>
												</ul>
											</li>
										</ul>
										<p style="color: rgba(255,255,255,0.8);">${blog.getDiscription()}</p>
										<a href="Blog?id=${blog.id}" class="btn btn-outline-primary">
											<i class="fas fa-arrow-right me-2"></i>Read More
										</a>

										<div class="action-buttons">
											<a href="like?id=${blog.id}">
												<svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
													<path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" 
														<c:if test="${blog.Liked(userId)}">fill="#eb0b59"</c:if>
														stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
												</svg>
												<span>${blog.getLikes()}</span>
											</a>
											<a href="save?id=${blog.id}">
												<svg width="24px" height="24px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
													<path d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z" 
														<c:if test="${blog.Saved(userId)}">fill="#FFC300"</c:if>
														stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
												</svg>
												<span>${blog.getSaves()}</span>
											</a>
											<a href="share?id=${blog.id}">
												<svg fill="currentColor" height="24px" width="24px" viewBox="0 0 458.624 458.624">
													<path d="M339.588,314.529c-14.215,0-27.456,4.133-38.621,11.239l-112.682-78.67c1.809-6.315,2.798-12.976,2.798-19.871 c0-6.896-0.989-13.557-2.798-19.871l109.64-76.547c11.764,8.356,26.133,13.286,41.662,13.286c39.79,0,72.047-32.257,72.047-72.047 C411.634,32.258,379.378,0,339.588,0c-39.79,0-72.047,32.257-72.047,72.047c0,5.255,0.578,10.373,1.646,15.308l-112.424,78.491 c-10.974-6.759-23.892-10.666-37.727-10.666c-39.79,0-72.047,32.257-72.047,72.047s32.256,72.047,72.047,72.047 c13.834,0,26.753-3.907,37.727-10.666l113.292,79.097c-1.629,6.017-2.514,12.34-2.514,18.872c0,39.79,32.257,72.047,72.047,72.047 c39.79,0,72.047-32.257,72.047-72.047C411.635,346.787,379.378,314.529,339.588,314.529z"/>
												</svg>
												<span>${blog.getShares()}</span>
											</a>
										</div>
									</div>
								</article>
							</c:forEach>
						</c:when>
					</c:choose>

					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<li class="page-item active">
								<a href="#!" class="page-link">1</a>
							</li>
							<li class="page-item">
								<a href="#!" class="page-link">2</a>
							</li>
							<li class="page-item">
								<a href="#!" class="page-link">
									<i class="fas fa-arrow-right"></i>
								</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="footer">
		<div class="instafeed text-center mb-5">
			<h2 class="h3 mb-4">
				<i class="fab fa-instagram me-2"></i>INSTAGRAM POSTS
			</h2>
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
						<li class="list-inline-item">
							<a href="privacy-policy.html">Privacy Policy</a>
						</li>
						<li class="list-inline-item">
							<a href="terms-conditions.html">Terms Conditions</a>
						</li>
					</ul>
				</div>
				<div class="col-md-2 text-center mb-4">
					<a href="index.html">
						<img class="img-fluid" width="100px" src="images/logo.png" alt="Reader | Hugo Personal Blog Template">
					</a>
				</div>
				<div class="col-md-5 text-md-right text-center mb-4">
					<ul class="list-inline footer-list mb-0">
						<li class="list-inline-item">
							<a href="#"><i class="fab fa-facebook"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="fab fa-twitter"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="fab fa-linkedin"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="fab fa-github"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="fab fa-youtube"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="plugins/jQuery/jquery.min.js"></script>
	<script src="plugins/bootstrap/bootstrap.min.js"></script>
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/instafeed/instafeed.min.js"></script>
	<script src="js/script.js"></script>

	<script>
		// Add loading animations
		document.addEventListener('DOMContentLoaded', function() {
			// Animate cards on scroll
			const cards = document.querySelectorAll('.card');
			const observer = new IntersectionObserver((entries) => {
				entries.forEach(entry => {
					if (entry.isIntersecting) {
						entry.target.style.animation = 'slideUp 0.6s ease-out forwards';
					}
				});
			});

			cards.forEach(card => {
				observer.observe(card);
			});

			// Add click animations
			document.querySelectorAll('.action-buttons a').forEach(button => {
				button.addEventListener('click', function(e) {
					this.style.transform = 'scale(0.95)';
					setTimeout(() => {
						this.style.transform = '';
					}, 150);
				});
			});
		});
	</script>
</body>
</html>