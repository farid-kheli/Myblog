<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html lang="en-us"><head>
  <meta charset="utf-8">
  <title>Profile | Reader Blog</title>

  <!-- mobile responsive meta -->
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="description" content="User Profile Page">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Hugo 0.74.3" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <!-- plugins -->
  <link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="plugins/slick/slick.css">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css" media="screen">
  
  <!-- Custom Profile Styles -->
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

    /* Profile Header */
    .profile-header {
      position: relative;
      padding: 150px 0 100px;
      overflow: hidden;
      background: transparent;
    }

    .profile-image-container {
      position: relative;
      margin-bottom: 2rem;
      animation: slideUp 1s ease-out;
    }

    .author-image {
      border-radius: 50%;
      border: 6px solid rgba(255,255,255,0.9);
      box-shadow: 0 15px 35px rgba(0,0,0,0.3);
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      backdrop-filter: blur(10px);
    }

    .author-image:hover {
      transform: scale(1.05) rotate(5deg);
      box-shadow: 0 25px 50px rgba(0,0,0,0.4);
    }

    .profile-info {
      background: var(--glass-bg);
      backdrop-filter: blur(20px);
      border: 1px solid var(--glass-border);
      border-radius: 20px;
      padding: 2.5rem;
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      animation: slideUp 1.2s ease-out;
    }

    .profile-info:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(31, 38, 135, 0.5);
    }

    .profile-title {
      color: white;
      font-weight: 700;
      margin-bottom: 0.5rem;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .profile-badge {
      background: var(--warning-gradient);
      color: white;
      padding: 0.5rem 1.5rem;
      border-radius: 25px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      margin-bottom: 1rem;
      box-shadow: 0 8px 25px rgba(250, 112, 154, 0.4);
      transition: all 0.3s ease;
    }

    .profile-badge:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 30px rgba(250, 112, 154, 0.6);
    }

    .profile-stats {
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.1);
      border-radius: 15px;
      padding: 1.5rem;
      margin: 1.5rem 0;
      transition: all 0.3s ease;
    }

    .profile-stats:hover {
      background: rgba(255, 255, 255, 0.1);
      transform: translateY(-3px);
    }

    .stat-item {
      text-align: center;
      padding: 0.5rem;
      transition: transform 0.3s ease;
    }

    .stat-item:hover {
      transform: scale(1.1);
    }

    .stat-number {
      font-size: 1.8rem;
      font-weight: 700;
      background: var(--warning-gradient);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .stat-label {
      font-size: 0.9rem;
      color: rgba(255, 255, 255, 0.7);
      font-weight: 500;
    }

    /* Blog Section */
    .blog-section {
      padding: 80px 0;
      position: relative;
    }

    .section-title {
      color: white;
      font-weight: 600;
      margin-bottom: 3rem;
      position: relative;
      text-align: center;
      font-size: 2.5rem;
      text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
    }

    .section-title::after {
      content: '';
      position: absolute;
      bottom: -10px;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background: var(--warning-gradient);
      border-radius: 2px;
    }

    /* Card styling matching index page */
    .blog-card {
      background: var(--glass-bg);
      backdrop-filter: blur(20px);
      border: 1px solid var(--glass-border);
      border-radius: 20px;
      overflow: hidden;
      transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
      box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
      margin-bottom: 2rem;
      position: relative;
    }

    .blog-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 40px rgba(31, 38, 135, 0.5);
    }

    .blog-card:hover::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
      animation: shimmer 1.5s ease-in-out;
      pointer-events: none;
      z-index: 1;
    }

    @keyframes shimmer {
      0% { background-position: -200px 0; }
      100% { background-position: calc(200px + 100%) 0; }
    }

    .blog-image {
      height: 250px;
      object-fit: cover;
      width: 100%;
      transition: transform 0.4s ease;
    }

    .blog-card:hover .blog-image {
      transform: scale(1.05);
    }

    .blog-content {
      padding: 2rem;
      color: white;
      position: relative;
      z-index: 2;
    }

    .blog-title {
      color: white !important;
      font-weight: 600;
      margin-bottom: 1rem;
      line-height: 1.3;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .blog-title:hover {
      background: var(--warning-gradient);
      -webkit-background-clip: text;
      background-clip: text;
      -webkit-text-fill-color: transparent;
      text-decoration: none;
    }

    .blog-meta {
      margin-bottom: 1rem;
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.9rem;
    }

    .blog-meta .list-inline-item {
      margin-right: 1.5rem;
    }

    .blog-meta a {
      color: rgba(255, 255, 255, 0.8);
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .blog-meta a:hover {
      color: #ffd700;
    }

    .blog-meta img {
      width: 30px;
      height: 30px;
      border-radius: 50%;
      margin-right: 8px;
      border: 2px solid var(--glass-border);
    }

    /* Action buttons matching index page style */
    .blog-actions {
      border-top: 1px solid var(--glass-border);
      margin-top: 1.5rem;
      padding-top: 1rem;
      display: flex;
      border-radius: 0 0 20px 20px;
    }

    .action-btn {
      flex: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 0.75rem;
      color: rgba(255, 255, 255, 0.7);
      text-decoration: none;
      border-radius: 10px;
      transition: all 0.3s ease;
      margin: 0 5px;
    }

    .action-btn:hover {
      background: rgba(255, 255, 255, 0.1);
      color: white;
      text-decoration: none;
      transform: translateY(-2px);
    }

    .action-btn svg {
      margin-bottom: 0.25rem;
      transition: transform 0.3s ease;
    }

    .action-btn:hover svg {
      transform: scale(1.1);
    }

    .action-btn.liked svg {
      fill: #eb0b59;
      stroke: #eb0b59;
    }

    .action-btn.saved svg {
      fill: #FFC300;
      stroke: #FFC300;
    }

    /* Button styling */
    .btn-primary {
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

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
      color: white;
    }

    .country-flag {
      border-radius: 4px;
      margin-left: 0.5rem;
      transition: transform 0.3s ease;
    }

    .country-flag:hover {
      transform: scale(1.1);
    }

    /* Empty state styling */
    .empty-state {
      text-align: center;
      padding: 4rem 2rem;
      background: var(--glass-bg);
      backdrop-filter: blur(20px);
      border: 1px solid var(--glass-border);
      border-radius: 20px;
      color: white;
      animation: slideUp 1s ease-out;
    }

    .empty-state i {
      color: rgba(255, 255, 255, 0.3);
      margin-bottom: 1rem;
    }

    .empty-state h4 {
      color: white;
      margin-bottom: 1rem;
    }

    .empty-state p {
      color: rgba(255, 255, 255, 0.7);
      margin-bottom: 2rem;
    }

    /* Responsive design */
    @media (max-width: 768px) {
      .profile-header {
        padding: 120px 0 80px;
      }
      
      .profile-title {
        font-size: 2rem;
      }
      
      .section-title {
        font-size: 2rem;
      }
      
      .blog-content {
        padding: 1.5rem;
      }
      
      .profile-info {
        padding: 2rem;
      }
    }

    /* Author shapes with glassmorphism */
    .author-shape-1, .author-shape-2, .author-shape-3 {
      opacity: 0.1;
      filter: drop-shadow(0 0 20px rgba(255, 255, 255, 0.1));
    }

    .author-border {
      opacity: 0.2;
      stroke: rgba(255, 255, 255, 0.3);
    }
  </style>

  <!--Favicon-->
  <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
  <link rel="icon" href="images/favicon.png" type="image/x-icon">
</head>
<body>
  <!-- navigation -->

<!-- /navigation -->
<%@ include file="P_Nav.jsp" %>
<!-- Enhanced Profile Header -->
<div class="profile-header">
	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-lg-4 col-md-5 text-center">
				<div class="profile-image-container">
					<c:choose>
						<c:when test="${not empty user.getImg()}">
							<img class="author-image" style="height: 200px; width: 200px; object-fit: cover;"
								src="${user.getImg()}" alt="Profile" />
						</c:when>
						<c:otherwise>
							<img class="author-image" style="height: 200px; width: 200px; object-fit: cover;"
								src="/uploads/profiel.webp" alt="Profile" />
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col-lg-6 col-md-7">
				<div class="profile-info">
					<h1 class="profile-title">${user.getName()}</h1>
					
					<div class="profile-badge">
						<c:choose>
							<c:when test="${not empty NumBlogs}">
								<i class="fas fa-book me-2"></i> Reader
							</c:when>
							<c:otherwise>
								<i class="fas fa-pen-alt me-2"></i> Author
							</c:otherwise>
						</c:choose>
						<span class="country-info">
							${country}
							<img class="country-flag" width="24" src="${flag}"/>
						</span>
					</div>
					
					<div class="profile-stats">
						<div class="row">
							<div class="col-4">
								<div class="stat-item">
									<div class="stat-number">${NumBlogs}</div>
									<div class="stat-label">Posts</div>
								</div>
							</div>
							<div class="col-4">
								<div class="stat-item">
									<div class="stat-number">1.2K</div>
									<div class="stat-label">Followers</div>
								</div>
							</div>
							<div class="col-4">
								<div class="stat-item">
									<div class="stat-number">892</div>
									<div class="stat-label">Following</div>
								</div>
							</div>
						</div>
					</div>
					
					<p class="mb-2" style="color: rgba(255,255,255,0.9);"><i class="fas fa-envelope me-2"></i>${user.getEmail()}</p>
					<p style="color: rgba(255,255,255,0.7);">Passionate writer sharing insights about technology, lifestyle, and personal growth. Always exploring new ideas and connecting with fellow readers.</p>
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

<!-- Enhanced Blog Section -->
<section class="blog-section" id="post">
	<div class="container">
		<h2 class="section-title">
			<i class="fas fa-newspaper me-3"></i>Published Articles
		</h2>
		<div class="row">
			<div class="col-lg-10 mx-auto">
				<c:choose>
					<c:when test="${not empty blogs}">
						<c:forEach var="blog" items="${blogs}">
							<article class="blog-card card">
								<img src="/uploads/Blog_pictures/${blog.id}" class="blog-image" alt="Blog Image">
								
								<div class="blog-content">
									<h3 class="blog-title">
										<a href="Blog?id=${blog.id}">${blog.title}</a>
									</h3>
									
									<ul class="blog-meta list-inline">
										<li class="list-inline-item">
											<i class="fas fa-user me-1"></i>
											<a href="author-single.html" class="text-decoration-none">
												${blog.getusername().getName()}
											</a>
										</li>
										<li class="list-inline-item">
											<i class="fas fa-calendar me-1"></i>${blog.createdAt}
										</li>
										<li class="list-inline-item">
											<i class="fas fa-tag me-1"></i>
											<a href="tage?search=${blog.getCategory()}" class="text-decoration-none">${blog.getCategory()}</a>
										</li>
									</ul>
									
									<p style="color: rgba(255,255,255,0.8);">${blog.getDiscription()}</p>
									
									<div class="d-flex justify-content-between align-items-center mb-3">
										<a href="Blog?id=${blog.id}" class="btn btn-primary">
											<i class="fas fa-arrow-right me-2"></i>Read More
										</a>
										<small style="color: rgba(255,255,255,0.6);">5 min read</small>
									</div>
									
									<div class="blog-actions">
										<a href="like?id=${blog.id}" class="action-btn ${blog.Liked(user.getId()) ? 'liked' : ''}">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
											</svg>
											<span>${blog.getLikes()}</span>
										</a>
										
										<a href="save?id=${blog.id}" class="action-btn ${blog.Saved(user.getId()) ? 'saved' : ''}">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path d="M5 6.2C5 5.07989 5 4.51984 5.21799 4.09202C5.40973 3.71569 5.71569 3.40973 6.09202 3.21799C6.51984 3 7.07989 3 8.2 3H15.8C16.9201 3 17.4802 3 17.908 3.21799C18.2843 3.40973 18.5903 3.71569 18.782 4.09202C19 4.51984 19 5.07989 19 6.2V21L12 16L5 21V6.2Z" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
											</svg>
											<span>${blog.getSaves()}</span>
										</a>
										
										<a href="share?id=${blog.id}" class="action-btn">
											<svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
												<path d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.367 2.684 3 3 0 00-5.367-2.684z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
											</svg>
											<span>${blog.getShares()}</span>
										</a>
									</div>
								</div>
							</article>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="empty-state">
							<i class="fas fa-pen-alt fa-4x"></i>
							<h4>No articles published yet</h4>
							<p>Start writing your first blog post and share your thoughts with the world!</p>
							<a href="dashbord" class="btn btn-primary">
								<i class="fas fa-plus me-2"></i>Write Now
							</a>
						</div>
					</c:otherwise>
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
  <script src="js/script.js"></script>

  <script>
	// Add loading animations matching index page
	document.addEventListener('DOMContentLoaded', function() {
		// Animate cards on scroll
		const cards = document.querySelectorAll('.blog-card, .profile-info');
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

		// Add click animations for action buttons
		document.querySelectorAll('.action-btn').forEach(button => {
			button.addEventListener('click', function(e) {
				this.style.transform = 'scale(0.95)';
				setTimeout(() => {
					this.style.transform = '';
				}, 150);
			});
		});

		// Add hover effect for stats
		document.querySelectorAll('.stat-item').forEach(stat => {
			stat.addEventListener('mouseenter', function() {
				this.style.transform = 'scale(1.1) rotate(5deg)';
			});
			stat.addEventListener('mouseleave', function() {
				this.style.transform = 'scale(1) rotate(0deg)';
			});
		});
	});
</script>
</body>
</html>