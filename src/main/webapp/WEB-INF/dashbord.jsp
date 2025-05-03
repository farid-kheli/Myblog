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
<div class="header text-center">
  <div class="container">
    <div class="row">
      <div class="col-lg-9 mx-auto">
        <h1 class="mb-4">Create a Blog Post</h1>
        <ul class="list-inline">
          <li class="list-inline-item"><a class="text-default" href="MyBloges">My Blogs
              &nbsp; &nbsp; /</a></li>
          <li class="list-inline-item text-primary">Create</li>
        </ul>
      </div>
    </div>
  </div>
  
  <svg class="header-shape-1" width="39" height="40" viewBox="0 0 39 40" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0.965848 20.6397L0.943848 38.3906L18.6947 38.4126L18.7167 20.6617L0.965848 20.6397Z" stroke="#040306"
      stroke-miterlimit="10" />
    <path class="path" d="M10.4966 11.1283L10.4746 28.8792L28.2255 28.9012L28.2475 11.1503L10.4966 11.1283Z" />
    <path d="M20.0078 1.62949L19.9858 19.3804L37.7367 19.4024L37.7587 1.65149L20.0078 1.62949Z" stroke="#040306"
      stroke-miterlimit="10" />
  </svg>

  
  <svg class="header-shape-2" width="39" height="39" viewBox="0 0 39 39" fill="none" xmlns="http://www.w3.org/2000/svg">
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

  
  <svg class="header-shape-3" width="39" height="40" viewBox="0 0 39 40" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M0.965848 20.6397L0.943848 38.3906L18.6947 38.4126L18.7167 20.6617L0.965848 20.6397Z" stroke="#040306"
      stroke-miterlimit="10" />
    <path class="path" d="M10.4966 11.1283L10.4746 28.8792L28.2255 28.9012L28.2475 11.1503L10.4966 11.1283Z" />
    <path d="M20.0078 1.62949L19.9858 19.3804L37.7367 19.4024L37.7587 1.65149L20.0078 1.62949Z" stroke="#040306"
      stroke-miterlimit="10" />
  </svg>

  
  <svg class="header-border" height="240" viewBox="0 0 2202 240" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path
      d="M1 123.043C67.2858 167.865 259.022 257.325 549.762 188.784C764.181 125.427 967.75 112.601 1200.42 169.707C1347.76 205.869 1901.91 374.562 2201 1"
      stroke-width="2" />
  </svg>
</div>

<section class="section-sm">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        
        <div class="content mb-5">
          <h2 id="we-would-love-to-hear-from-you">We would Love To Hear From You&hellip;.</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit massa vitae felis augue. In venenatis scelerisque accumsan egestas mattis. Massa feugiat in sem pellentesque.</p>
        </div>
        
        <form method="POST" action="saveBlog" enctype="multipart/form-data">
          <div class="form-group">
            <label for="title">Titel</label>
            <input type="text" name="title" id="title" class="form-control" placeholder="John Doe" required>
          </div>
          <div class="form-group">
            <label for="discription">discription</label>
            <input type="text" name="discription" id="discription" class="form-control" placeholder="enter a discription for your blog" required>
          </div>
           <div class="form-group">
            <label for="discription">discription</label>
         			<select class="form-control p-2 bg-secendary mb-4 w-100" name="categry" aria-label="Default select example">
				<option selected>Open this select menu</option>
				<c:choose>
					<c:when test="${not empty categrys}">
						<c:forEach var="categry" items="${categrys}">
							<option  value="${categry.getId()}"> ${categry.getCategory()}</option>
							<option class="dropdown-item"  value="${categry.getId()}"> ${categry.getCategory()}</option>
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
				> <label >discription</label>
		</div>
		<div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupFile01">Upload</label>
			<input type="file" name="B_Img" class="form-control" id="inputGroupFile01">
		</div>
		<div>
			</div>
          <div class="input-group mb-3">
			<label class="input-group-text" for="inputGroupFile01">Upload</label>
			<input type="file" name="B_Img" class="form-control" id="inputGroupFile01">
		</div>
          <div>
			<h3>Content:</h3>
			<textarea id="content" name="content"></textarea>
			<br> <br>
		</div>
		<button type="submit" class="btn btn-outline-primary">Save
			Blog</button>
	</form>
         
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
