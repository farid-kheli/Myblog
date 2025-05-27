<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<title>My Blogs - Reader Platform</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Manage your blog posts">
<meta name="author" content="Themefisher">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- Original stylesheets -->
<link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<link rel="stylesheet" href="plugins/slick/slick.css">
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

	/* Header section */
	.header {
		position: relative;
		padding: 150px 0 100px;
		overflow: hidden;
		background: transparent;
	}

	.header h1 {
		color: white;
		font-size: 3rem;
		font-weight: 300;
		text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
		margin-bottom: 1.5rem;
		animation: slideUp 1s ease-out;
	}

	.header h1 span {
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

	.list-inline-item a {
		color: rgba(255, 255, 255, 0.8) !important;
		text-decoration: none;
		transition: color 0.3s ease;
	}

	.list-inline-item a:hover {
		color: #ffd700 !important;
	}

	.text-primary {
		color: #ffd700 !important;
	}

	/* Main container */
	.blogs-container {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		border-radius: 20px;
		box-shadow: 
			0 8px 32px 0 rgba(31, 38, 135, 0.37),
			inset 0 1px 0 rgba(255, 255, 255, 0.2);
		animation: slideUp 0.6s ease-out 0.3s both;
		overflow: hidden;
		margin-bottom: 50px;
	}

	/* Header section inside container */
	.blogs-header {
		background: rgba(255, 255, 255, 0.05);
		padding: 30px;
		border-bottom: 1px solid var(--glass-border);
		text-align: center;
	}

	.blogs-header h2 {
		color: white;
		font-weight: 600;
		margin-bottom: 15px;
		font-size: 1.8rem;
	}

	.blogs-header p {
		color: rgba(255, 255, 255, 0.8);
		margin-bottom: 20px;
	}

	.btn-create {
		background: var(--success-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 12px 25px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
		text-decoration: none;
		display: inline-block;
	}

	.btn-create:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(79, 172, 254, 0.6);
		color: white;
	}

	/* Blog cards grid */
	.blogs-grid {
		padding: 30px;
	}

	.blog-card {
		background: rgba(255, 255, 255, 0.08);
		backdrop-filter: blur(10px);
		border: 1px solid rgba(255, 255, 255, 0.1);
		border-radius: 15px;
		padding: 25px;
		margin-bottom: 20px;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		position: relative;
		overflow: hidden;
	}

	.blog-card::before {
		content: '';
		position: absolute;
		top: 0;
		left: -100%;
		width: 100%;
		height: 100%;
		background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
		transition: left 0.6s ease;
	}

	.blog-card:hover::before {
		left: 100%;
	}

	.blog-card:hover {
		transform: translateY(-5px);
		box-shadow: 0 15px 35px rgba(31, 38, 135, 0.4);
		border-color: rgba(255, 255, 255, 0.2);
	}

	.blog-card-header {
		display: flex;
		justify-content: between;
		align-items: flex-start;
		margin-bottom: 15px;
	}

	.blog-id {
		background: var(--primary-gradient);
		color: white;
		padding: 5px 12px;
		border-radius: 20px;
		font-size: 0.85rem;
		font-weight: 600;
		min-width: 60px;
		text-align: center;
	}

	.blog-title {
		color: white;
		font-size: 1.3rem;
		font-weight: 600;
		margin: 0 0 10px 0;
		line-height: 1.4;
		flex: 1;
		margin-left: 15px;
	}

	.blog-description {
		color: rgba(255, 255, 255, 0.8);
		margin-bottom: 15px;
		line-height: 1.5;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		overflow: hidden;
	}

	.blog-meta {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 20px;
		flex-wrap: wrap;
		gap: 10px;
	}

	.blog-date {
		color: rgba(255, 255, 255, 0.7);
		font-size: 0.9rem;
		display: flex;
		align-items: center;
		gap: 5px;
	}

	.blog-actions {
		display: flex;
		gap: 10px;
		flex-wrap: wrap;
	}

	.btn-action {
		padding: 8px 16px;
		border-radius: 20px;
		border: none;
		font-weight: 500;
		font-size: 0.85rem;
		transition: all 0.3s ease;
		text-decoration: none;
		display: inline-flex;
		align-items: center;
		gap: 5px;
	}

	.btn-view {
		background: var(--primary-gradient);
		color: white;
		box-shadow: 0 3px 10px rgba(102, 126, 234, 0.3);
	}

	.btn-view:hover {
		transform: translateY(-2px);
		box-shadow: 0 5px 15px rgba(102, 126, 234, 0.5);
		color: white;
	}

	.btn-edit {
		background: var(--warning-gradient);
		color: white;
		box-shadow: 0 3px 10px rgba(250, 112, 154, 0.3);
	}

	.btn-edit:hover {
		transform: translateY(-2px);
		box-shadow: 0 5px 15px rgba(250, 112, 154, 0.5);
		color: white;
	}

	.btn-delete {
		background: var(--danger-gradient);
		color: white;
		box-shadow: 0 3px 10px rgba(255, 107, 107, 0.3);
	}

	.btn-delete:hover {
		transform: translateY(-2px);
		box-shadow: 0 5px 15px rgba(255, 107, 107, 0.5);
		color: white;
	}

	/* Empty state */
	.empty-state {
		text-align: center;
		padding: 60px 30px;
		color: rgba(255, 255, 255, 0.8);
	}

	.empty-state i {
		font-size: 4rem;
		margin-bottom: 20px;
		color: rgba(255, 255, 255, 0.5);
	}

	.empty-state h3 {
		color: white;
		margin-bottom: 15px;
	}

	.empty-state p {
		margin-bottom: 25px;
		font-size: 1.1rem;
	}

	/* Footer styling */
	.footer {
		background: rgba(30, 60, 114, 0.9);
		backdrop-filter: blur(20px);
		border-top: 1px solid var(--glass-border);
		color: white;
		margin-top: 50px;
	}

	.instafeed h2 {
		color: white;
		margin-bottom: 30px;
	}

	.instagram-post img {
		border-radius: 15px;
		transition: transform 0.3s ease;
		border: 2px solid var(--glass-border);
	}

	.instagram-post:hover img {
		transform: scale(1.05);
	}

	.footer-list a {
		color: rgba(255, 255, 255, 0.7);
		text-decoration: none;
		transition: color 0.3s ease;
	}

	.footer-list a:hover {
		color: #ffd700;
	}

	/* Stats bar */
	.stats-bar {
		display: flex;
		justify-content: space-around;
		padding: 20px;
		background: rgba(255, 255, 255, 0.05);
		border-radius: 15px;
		margin-bottom: 30px;
	}

	.stat-item {
		text-align: center;
		color: white;
	}

	.stat-number {
		font-size: 1.8rem;
		font-weight: 600;
		display: block;
		background: var(--success-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
	}

	.stat-label {
		font-size: 0.9rem;
		color: rgba(255, 255, 255, 0.7);
		margin-top: 5px;
	}

	/* Responsive design */
	@media (max-width: 768px) {
		.header h1 {
			font-size: 2rem;
		}
		
		.blog-card {
			padding: 20px;
		}
		
		.blog-card-header {
			flex-direction: column;
			align-items: flex-start;
			gap: 10px;
		}
		
		.blog-title {
			margin-left: 0;
		}
		
		.blog-meta {
			flex-direction: column;
			align-items: flex-start;
		}
		
		.blog-actions {
			width: 100%;
			justify-content: flex-start;
		}
		
		.stats-bar {
			flex-direction: column;
			gap: 15px;
		}
	}

	/* Loading animation */
	@keyframes pulse {
		0%, 100% { opacity: 1; }
		50% { opacity: 0.5; }
	}

	.loading {
		animation: pulse 1.5s ease-in-out infinite;
	}
</style>
</head>
<body>
	<%@ include file="P_Nav.jsp" %>

	<!-- Header Section -->
	<div class="header text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mx-auto">
					<h1 class="mb-4">My <span>Blog Posts</span></h1>
					<ul class="list-inline">
						<li class="list-inline-item text-primary">
							<i class="fas fa-blog me-2"></i>My Blogs
						</li>
						<li class="list-inline-item">
							<a href="dashbord"><i class="fas fa-plus me-2"></i>/ Create New</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Content Section -->
	<section class="section-sm">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="blogs-container">
						<!-- Header -->
						<div class="blogs-header">
							<h2><i class="fas fa-newspaper me-3"></i>Manage Your Content</h2>
							<p>Create, edit, and manage all your blog posts from one place</p>
							<a href="dashbord" class="btn-create">
								<i class="fas fa-plus me-2"></i>Create New Blog
							</a>
						</div>

						<div class="blogs-grid">
							<!-- Stats Bar -->
							<c:if test="${not empty blogs}">
								<div class="stats-bar">
									<div class="stat-item">
										<span class="stat-number">${blogs.size()}</span>
										<div class="stat-label">Total Posts</div>
									</div>
									<div class="stat-item">
										<span class="stat-number">
											<c:set var="totalViews" value="0" />
											<c:forEach var="blog" items="${blogs}">
												<c:set var="totalViews" value="${totalViews + (blog.likes != null ? blog.likes : 0)}" />
											</c:forEach>
											${totalViews}
										</span>
										<div class="stat-label">Total Likes</div>
									</div>
									<div class="stat-item">
										<span class="stat-number">
											<c:set var="totalSaves" value="0" />
											<c:forEach var="blog" items="${blogs}">
												<c:set var="totalSaves" value="${totalSaves + (blog.saves != null ? blog.saves : 0)}" />
											</c:forEach>
											${totalSaves}
										</span>
										<div class="stat-label">Total Saves</div>
									</div>
								</div>
							</c:if>

							<!-- Blog Posts -->
							<c:choose>
								<c:when test="${not empty blogs}">
									<c:forEach var="blog" items="${blogs}" varStatus="status">
										<div class="blog-card" style="animation-delay: ${status.index * 0.1}s">
											<div class="blog-card-header">
												<div class="blog-id">#${blog.id}</div>
												<h3 class="blog-title">${blog.title}</h3>
											</div>
											
											<p class="blog-description">${blog.discription}</p>
											
											<div class="blog-meta">
												<div class="blog-date">
													<i class="fas fa-calendar-alt"></i>
													<span>${blog.createdAt}</span>
												</div>
												
												<div class="blog-actions">
													<a href="Blog?id=${blog.id}" class="btn-action btn-view">
														<i class="fas fa-eye"></i>View
													</a>
													<a href="EditBlog?id=${blog.id}" class="btn-action btn-edit">
														<i class="fas fa-edit"></i>Edit
													</a>
													<a href="DeleteBloge?id=${blog.id}" class="btn-action btn-delete" 
														onclick="return confirm('Are you sure you want to delete this blog post?')">
														<i class="fas fa-trash"></i>Delete
													</a>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="empty-state">
										<i class="fas fa-file-alt"></i>
										<h3>No Blog Posts Yet</h3>
										<p>You haven't created any blog posts yet. Start sharing your thoughts with the world!</p>
										<a href="dashbord" class="btn-create">
											<i class="fas fa-plus me-2"></i>Create Your First Blog
										</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
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
				<!-- ...existing instagram posts structure... -->
				<div class="instagram-post"><img src="images/instagram/1.jpg"></div>
				<div class="instagram-post"><img src="images/instagram/2.jpg"></div>
				<div class="instagram-post"><img src="images/instagram/4.jpg"></div>
				<div class="instagram-post"><img src="images/instagram/3.jpg"></div>
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
		// Add staggered animation to blog cards
		document.addEventListener('DOMContentLoaded', function() {
			const cards = document.querySelectorAll('.blog-card');
			cards.forEach((card, index) => {
				card.style.animation = `slideUp 0.6s ease-out ${index * 0.1}s both`;
			});

			// Add loading state to action buttons
			document.querySelectorAll('.btn-action').forEach(button => {
				button.addEventListener('click', function(e) {
					if (this.classList.contains('btn-delete')) {
						// Handle delete confirmation separately
						return;
					}
					
					this.style.transform = 'scale(0.95)';
					this.classList.add('loading');
					
					setTimeout(() => {
						this.style.transform = '';
						this.classList.remove('loading');
					}, 200);
				});
			});

			// Add search functionality (if needed)
			const searchInput = document.querySelector('#search-query');
			if (searchInput) {
				searchInput.addEventListener('input', function() {
					const searchTerm = this.value.toLowerCase();
					const blogCards = document.querySelectorAll('.blog-card');
					
					blogCards.forEach(card => {
						const title = card.querySelector('.blog-title').textContent.toLowerCase();
						const description = card.querySelector('.blog-description').textContent.toLowerCase();
						
						if (title.includes(searchTerm) || description.includes(searchTerm)) {
							card.style.display = 'block';
							card.style.animation = 'slideUp 0.3s ease-out';
						} else {
							card.style.display = 'none';
						}
					});
				});
			}
		});

		// Smooth scroll to top function
		function scrollToTop() {
			window.scrollTo({
				top: 0,
				behavior: 'smooth'
			});
		}

		// Add floating action button for create new blog (optional)
		if (window.innerWidth > 768) {
			const fab = document.createElement('div');
			fab.innerHTML = '<i class="fas fa-plus"></i>';
			fab.className = 'floating-action-btn';
			fab.onclick = () => window.location.href = 'dashbord';
			
			fab.style.cssText = `
				position: fixed;
				bottom: 30px;
				right: 30px;
				width: 60px;
				height: 60px;
				background: var(--success-gradient);
				border-radius: 50%;
				display: flex;
				align-items: center;
				justify-content: center;
				color: white;
				font-size: 1.5rem;
				cursor: pointer;
				box-shadow: 0 4px 20px rgba(79, 172, 254, 0.4);
				transition: all 0.3s ease;
				z-index: 1000;
			`;
			
			fab.onmouseenter = () => {
				fab.style.transform = 'scale(1.1)';
				fab.style.boxShadow = '0 8px 30px rgba(79, 172, 254, 0.6)';
			};
			
			fab.onmouseleave = () => {
				fab.style.transform = 'scale(1)';
				fab.style.boxShadow = '0 4px 20px rgba(79, 172, 254, 0.4)';
			};
			
			document.body.appendChild(fab);
		}
	</script>
</body>
</html>
