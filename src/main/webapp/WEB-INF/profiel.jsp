<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en-us"><head>
  <meta charset="utf-8">
  <title>Reader | Hugo Personal Blog Template</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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

<div class="author">
	<div class="container">
		<div class="row no-gutters justify-content-center">
			<div class="col-lg-3 col-md-4 mb-4 mb-md-0">
				<c:choose>

			<c:when test="${not empty user.getImg()}">
				<img style="height: 250px; Width: 250px"
					src="${user.getImg() }" class="author-image" alt="Profile" width="100" />
			</c:when>
			<c:otherwise>
				<img  class="author-image" style="height: 250px; Width: 250px"
					src="/uploads/profiel.webp" alt="Profile" width="100" />
			</c:otherwise>
		</c:choose>
				
			</div>
			<div class="col-md-8 col-lg-6 text-center text-md-left">
				<h3 class="mb-2">${user.getName()}</h2>
					<strong class="mb-2 d-block">
					<c:choose>
					<c:when test="${ not empty NumBlogs}">
					Reader
					</c:when>
					<c:otherwise>
					Author
					</c:otherwise>
					</c:choose>
					${country}
					<img width="30" src="${flag}"/>
					</strong>
					<div class="content">
						<p>Donec nisi dolor, consequat vel pretium id, auctor in dui. Nam iaculis, neque ac ullamcorper.</p>

					</div>
					
					<a class="post-count mb-1" href="profiel#post"><i class="ti-pencil-alt mr-2"></i><span
							class="text-primary">${NumBlogs }</span> Posts by this author</a>
					<div class="content">
						<p>${user.getEmail()}</p>

					</div>
			</div>
		</div>
	</div>
	
	<svg class="author-shape-1" width="39" height="40" viewBox="0 0 39 40" fill="none" xmlns="http://www.w3.org/2000/svg">
		<path d="M0.965848 20.6397L0.943848 38.3906L18.6947 38.4126L18.7167 20.6617L0.965848 20.6397Z" stroke="#040306"
			stroke-miterlimit="10" />
		<path class="path" d="M10.4966 11.1283L10.4746 28.8792L28.2255 28.9012L28.2475 11.1503L10.4966 11.1283Z" />
		<path d="M20.0078 1.62949L19.9858 19.3804L37.7367 19.4024L37.7587 1.65149L20.0078 1.62949Z" stroke="#040306"
			stroke-miterlimit="10" />
	</svg>

	
	<svg class="author-shape-2" width="39" height="39" viewBox="0 0 39 39" fill="none" xmlns="http://www.w3.org/2000/svg">
		<g filter="url(#filter0_d)">
			<path class="path"
				d="M24.1587 21.5623C30.02 21.3764 34.6209 16.4742 34.435 10.6128C34.2491 4.75147 29.3468 0.1506 23.4855 0.336498C17.6241 0.522396 13.0233 5.42466 13.2092 11.286C13.3951 17.1474 18.2973 21.7482 24.1587 21.5623Z" />
			<path
				d="M5.64626 20.0297C11.1568 19.9267 15.7407 24.2062 16.0362 29.6855L24.631 29.4616L24.1476 10.8081L5.41797 11.296L5.64626 20.0297Z"
				stroke="#040306" stroke-miterlimit="10" />
		</g>
		<defs>
			<filter id="filter0_d" x="0.905273" y="0" width="37.8663" height="38.1979" filterUnits="userSpaceOnUse"
				color-interpolation-filters="sRGB">
				<feFlood flood-opacity="0" result="BackgroundImageFix" />
				<feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" />
				<feOffset dy="4" />
				<feGaussianBlur stdDeviation="2" />
				<feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0" />
				<feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow" />
				<feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow" result="shape" />
			</filter>
		</defs>
	</svg>

	
	<svg class="author-shape-3" width="39" height="40" viewBox="0 0 39 40" fill="none" xmlns="http://www.w3.org/2000/svg">
		<path d="M0.965848 20.6397L0.943848 38.3906L18.6947 38.4126L18.7167 20.6617L0.965848 20.6397Z" stroke="#040306"
			stroke-miterlimit="10" />
		<path class="path" d="M10.4966 11.1283L10.4746 28.8792L28.2255 28.9012L28.2475 11.1503L10.4966 11.1283Z" />
		<path d="M20.0078 1.62949L19.9858 19.3804L37.7367 19.4024L37.7587 1.65149L20.0078 1.62949Z" stroke="#040306"
			stroke-miterlimit="10" />
	</svg>

	
	<svg class="author-border" height="240" viewBox="0 0 2202 240" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path
      d="M1 123.043C67.2858 167.865 259.022 257.325 549.762 188.784C764.181 125.427 967.75 112.601 1200.42 169.707C1347.76 205.869 1901.91 374.562 2201 1"
      stroke-width="2" />
  </svg>
</div>

<section class="section-sm" id="post">
	<div class="container">
		<div class="row">
			
			<div class="col-lg-8 mx-auto">
<c:choose>
						<c:when test="${not empty blogs}">
							<c:forEach var="blog" items="${blogs}">
								<article class="card mb-4">
									<div class="post-slider">
										<img src="/uploads/Blog_pictures/${blog.id}"
											class="card-img-top" alt="post-thumb">
									</div>
									<div class="card-body">
										<h3 class="mb-3">
											<a class="post-title" href="post-elements.html">${blog.title}</a>
										</h3>
										<ul class="card-meta list-inline">
											<li class="list-inline-item"><a
												href="author-single.html" class="card-meta-author"> <c:choose>
														<c:when test="${not empty blog.getusername().getImg()}">
															<img src="${blog.getusername().getImg()}" alt="John Doe">
														</c:when>
														<c:otherwise>
															<img src="/uploads/profiel.webp" alt="John Doe">
														</c:otherwise>
													</c:choose> <span>${blog.getusername().getName() }</span></a></li>
											<li class="list-inline-item"><i class="ti-calendar"></i>${blog.createdAt}</li>
											<li class="list-inline-item">
												<ul class="card-meta-tag list-inline">
													<li class="list-inline-item"><a href="tage?search=${blog.getCategory()}">${blog.getCategory()}</a></li>
												</ul>
											</li>
										</ul>
										<p>${blog.getDiscription()}</p>
										<a href="Blog?id=${blog.id}" class="btn btn-outline-primary">Read
											More</a>
										<div class="w-100 mt-2 border-dark border-bottom d-flex ">
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
  fill="#eb0b59"	
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
									</div>
								</article>

							</c:forEach>
						</c:when>
					</c:choose>
			</div>
			
			
		</div>
	</div>
</section>

<footer class="footer">
  <svg class="footer-border" height="214" viewBox="0 0 2204 214" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M2203 213C2136.58 157.994 1942.77 -33.1996 1633.1 53.0486C1414.13 114.038 1200.92 188.208 967.765 118.127C820.12 73.7483 263.977 -143.754 0.999958 158.899"
      stroke-width="2" />
  </svg>
  
  <div class="instafeed text-center mb-5">
      <h2 class="h3 mb-4">INSTAGRAM POST</h2>
      
      <div class="instagram-slider">
        <div class="instagram-post"><img src="images/instagram/1.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/2.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/4.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/3.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/2.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/1.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/3.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/4.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/2.jpg"></div>
        <div class="instagram-post"><img src="images/instagram/4.jpg"></div>
      </div>
  </div>
  
  <div class="container">
      <div class="row align-items-center">
      <div class="col-md-5 text-center text-md-left mb-4">
          <ul class="list-inline footer-list mb-0">
            <li class="list-inline-item"><a href="privacy-policy.html">Privacy Policy</a></li>
            <li class="list-inline-item"><a href="terms-conditions.html">Terms Conditions</a></li>
          </ul>
      </div>
      <div class="col-md-2 text-center mb-4">
          <a href="index.html"><img class="img-fluid" width="100px" src="images/logo.png" alt="Reader | Hugo Personal Blog Template"></a>
      </div>
      <div class="col-md-5 text-md-right text-center mb-4">
          <ul class="list-inline footer-list mb-0">
          
          <li class="list-inline-item"><a href="#"><i class="ti-facebook"></i></a></li>
          
          <li class="list-inline-item"><a href="#"><i class="ti-twitter-alt"></i></a></li>
          
          <li class="list-inline-item"><a href="#"><i class="ti-linkedin"></i></a></li>
          
          <li class="list-inline-item"><a href="#"><i class="ti-github"></i></a></li>
          
          <li class="list-inline-item"><a href="#"><i class="ti-youtube"></i></a></li>
          
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
  <script src="js/script.js"></script></body>
</html>