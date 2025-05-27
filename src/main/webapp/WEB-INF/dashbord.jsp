<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-us">
<head>
<meta charset="utf-8">
<title>Create Blog - Reader Platform</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description" content="Create and publish your blog posts">
<meta name="author" content="Themefisher">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<!-- TinyMCE Editor -->
<script src="https://cdn.tiny.cloud/1/da91lze1q4ce30bdj8na78ygotv4sushpwqxdm0y39ccoqnz/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>

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

	/* Main content container */
	.content-container {
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

	/* Content section styling */
	.content {
		color: white;
		padding: 30px;
		border-bottom: 1px solid var(--glass-border);
		background: rgba(255, 255, 255, 0.05);
	}

	.content h2 {
		color: white;
		font-weight: 600;
		margin-bottom: 20px;
		position: relative;
		padding-bottom: 10px;
	}

	.content h2::after {
		content: '';
		position: absolute;
		bottom: 0;
		left: 0;
		width: 60px;
		height: 3px;
		background: var(--warning-gradient);
		border-radius: 2px;
	}

	.content p {
		color: rgba(255, 255, 255, 0.8);
		line-height: 1.6;
	}

	/* Form styling */
	.blog-form {
		padding: 40px;
	}

	.form-group {
		margin-bottom: 25px;
	}

	.form-group label {
		color: white;
		font-weight: 500;
		margin-bottom: 8px;
		display: block;
		font-size: 0.95em;
	}

	.form-control {
		background: rgba(255, 255, 255, 0.1) !important;
		border: 2px solid rgba(255, 255, 255, 0.2) !important;
		color: white !important;
		border-radius: 12px !important;
		padding: 12px 16px !important;
		transition: all 0.3s ease;
		font-size: 1rem;
	}

	.form-control:focus {
		background: rgba(255, 255, 255, 0.15) !important;
		border-color: #667eea !important;
		box-shadow: 0 0 20px rgba(102, 126, 234, 0.3) !important;
		transform: translateY(-2px);
		outline: none;
	}

	.form-control::placeholder {
		color: rgba(255, 255, 255, 0.6) !important;
	}

	/* Select dropdown styling */
	.form-select,
	select.form-control {
		background: rgba(255, 255, 255, 0.1) !important;
		border: 2px solid rgba(255, 255, 255, 0.2) !important;
		color: white !important;
		border-radius: 12px !important;
		padding: 12px 16px !important;
		cursor: pointer;
	}

	.form-select option,
	select.form-control option {
		background: #1e3c72;
		color: white;
		padding: 10px;
	}

	/* File upload styling */
	.input-group {
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	}

	.input-group-text {
		background: var(--primary-gradient) !important;
		color: white !important;
		border: none !important;
		font-weight: 500;
		padding: 12px 20px;
	}

	.input-group .form-control {
		border-left: none !important;
		border-radius: 0 12px 12px 0 !important;
	}

	/* TinyMCE container styling */
	.editor-container {
		margin: 25px 0;
	}

	.editor-container h3 {
		color: white;
		font-weight: 600;
		margin-bottom: 15px;
		font-size: 1.2em;
	}

	/* Custom button styling */
	.btn-custom {
		background: var(--success-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 15px 40px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
		font-size: 1.1em;
		text-transform: uppercase;
		letter-spacing: 0.5px;
	}

	.btn-custom:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(79, 172, 254, 0.6);
		color: white;
	}

	.btn-custom i {
		margin-right: 8px;
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

	/* Responsive design */
	@media (max-width: 768px) {
		.header h1 {
			font-size: 2rem;
		}
		
		.content,
		.blog-form {
			padding: 20px;
		}
		
		.btn-custom {
			padding: 12px 30px;
			font-size: 1rem;
		}
	}

	/* Loading animation for form submission */
	.btn-custom.loading {
		pointer-events: none;
		opacity: 0.7;
	}

	.btn-custom.loading::after {
		content: '';
		position: absolute;
		width: 16px;
		height: 16px;
		margin: auto;
		border: 2px solid transparent;
		border-top-color: #ffffff;
		border-radius: 50%;
		animation: spin 1s linear infinite;
	}

	@keyframes spin {
		0% { transform: rotate(0deg); }
		100% { transform: rotate(360deg); }
	}

	/* TinyMCE dark theme override */
	.tox .tox-editor-header {
		background: rgba(255, 255, 255, 0.1) !important;
		border-bottom: 1px solid rgba(255, 255, 255, 0.2) !important;
	}

	.tox .tox-toolbar__group {
		border-color: rgba(255, 255, 255, 0.1) !important;
	}
</style>

<script>
	// Initialize TinyMCE with dark theme
	tinymce.init({
		selector: '#content',
		height: 400,
		plugins: 'lists link image table code fullscreen preview',
		toolbar: 'undo redo | formatselect | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image table | code fullscreen preview',
		skin: 'oxide-dark',
		content_css: 'dark',
		menubar: false,
		branding: false,
		resize: true,
		statusbar: true,
		placeholder: 'Start writing your amazing blog post here...',
		setup: function (editor) {
			editor.on('init', function () {
				// Custom styling for the editor
				editor.getContainer().style.borderRadius = '12px';
				editor.getContainer().style.overflow = 'hidden';
				editor.getContainer().style.boxShadow = '0 4px 15px rgba(0, 0, 0, 0.1)';
			});
		}
	});
</script>
</head>
<body>
	<%@ include file="P_Nav.jsp" %>

	<!-- Header Section -->
	<div class="header text-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-9 mx-auto">
					<h1 class="mb-4">Create a <span>Blog Post</span></h1>
					<ul class="list-inline">
						<li class="list-inline-item">
							<a href="MyBloges"><i class="fas fa-blog me-2"></i>My Blogs &nbsp; /</a>
						</li>
						<li class="list-inline-item text-primary">
							<i class="fas fa-plus me-2"></i>Create
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Content Section -->
	<section class="section-sm">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 mx-auto">
					<div class="content-container">
						<!-- Welcome Content -->
						<div class="content">
							<h2><i class="fas fa-pen-fancy me-3"></i>Share Your Story With The World</h2>
							<p>Create engaging blog posts that captivate your audience. Use our powerful editor to format your content, add images, and bring your ideas to life. Your voice matters, and we're here to help you share it with the world.</p>
						</div>
						
						<!-- Blog Creation Form -->
						<div class="blog-form">
							<form method="POST" action="saveBlog" enctype="multipart/form-data" id="blogForm">
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label for="title"><i class="fas fa-heading me-2"></i>Blog Title</label>
											<input type="text" name="title" id="title" class="form-control" 
												placeholder="Enter an engaging title for your blog post" required>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="category"><i class="fas fa-tags me-2"></i>Category</label>
											<select class="form-control" name="categry" id="category" required>
												<option value="" disabled selected>Select a category</option>
												<c:choose>
													<c:when test="${not empty categrys}">
														<c:forEach var="categry" items="${categrys}">
															<option value="${categry.getId()}">${categry.getCategory()}</option>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<option disabled>No categories available</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
								</div>

								<div class="form-group">
									<label for="discription"><i class="fas fa-align-left me-2"></i>Short Description</label>
									<input type="text" name="discription" id="discription" class="form-control" 
										placeholder="Write a brief description that will appear in blog previews" required>
								</div>

								<div class="form-group">
									<label for="inputGroupFile01"><i class="fas fa-image me-2"></i>Featured Image</label>
									<div class="input-group">
										<span class="input-group-text">
											<i class="fas fa-upload me-2"></i>Choose File
										</span>
										<input type="file" name="B_Img" class="form-control" id="inputGroupFile01" 
											accept="image/*" required>
									</div>
									<small class="text-white-50 mt-2">
										<i class="fas fa-info-circle me-1"></i>
										Recommended size: 1200x600px for best results
									</small>
								</div>

								<div class="editor-container">
									<label for="content"><i class="fas fa-edit me-2"></i>Blog Content</label>
									<textarea id="content" name="content" placeholder="Start writing your amazing blog post here..."></textarea>
								</div>

								<div class="text-center mt-4">
									<button type="submit" class="btn btn-custom">
										<i class="fas fa-save"></i>Publish Blog Post
									</button>
								</div>
							</form>
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
		// Form validation and submission
		document.getElementById('blogForm').addEventListener('submit', function(e) {
			const button = this.querySelector('button[type="submit"]');
			const originalText = button.innerHTML;
			
			// Add loading state
			button.classList.add('loading');
			button.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Publishing...';
			button.disabled = true;
			
			// Validate TinyMCE content
			const content = tinymce.get('content').getContent();
			if (!content.trim()) {
				e.preventDefault();
				alert('Please add some content to your blog post.');
				button.classList.remove('loading');
				button.innerHTML = originalText;
				button.disabled = false;
				return;
			}
			
			// Show success message after a delay (for demo purposes)
			setTimeout(() => {
				// Form will actually submit, this is just for UI feedback
			}, 1000);
		});

		// File upload preview
		document.getElementById('inputGroupFile01').addEventListener('change', function(e) {
			const file = e.target.files[0];
			if (file) {
				const fileSize = (file.size / 1024 / 1024).toFixed(2);
				console.log(`Selected file: ${file.name} (${fileSize} MB)`);
				
				// Show file info
				const fileInfo = document.createElement('small');
				fileInfo.className = 'text-success mt-1 d-block';
				fileInfo.innerHTML = `<i class="fas fa-check-circle me-1"></i>Selected: ${file.name}`;
				
				// Remove any existing file info
				const existingInfo = this.parentNode.parentNode.querySelector('.file-info');
				if (existingInfo) existingInfo.remove();
				
				fileInfo.className += ' file-info';
				this.parentNode.parentNode.appendChild(fileInfo);
			}
		});

		// Auto-save functionality (optional)
		let autoSaveInterval;
		function startAutoSave() {
			autoSaveInterval = setInterval(() => {
				const title = document.getElementById('title').value;
				const description = document.getElementById('discription').value;
				const content = tinymce.get('content').getContent();
				
				if (title || description || content) {
					// Save to localStorage as draft
					const draft = {
						title,
						description,
						content,
						timestamp: new Date().toISOString()
					};
					localStorage.setItem('blogDraft', JSON.stringify(draft));
					console.log('Draft saved automatically');
				}
			}, 30000); // Save every 30 seconds
		}

		// Load draft on page load
		window.addEventListener('load', () => {
			const draft = localStorage.getItem('blogDraft');
			if (draft) {
				const parsedDraft = JSON.parse(draft);
				const confirmRestore = confirm('A draft was found. Would you like to restore it?');
				
				if (confirmRestore) {
					document.getElementById('title').value = parsedDraft.title || '';
					document.getElementById('discription').value = parsedDraft.description || '';
					
					// Wait for TinyMCE to initialize
					tinymce.get('content').setContent(parsedDraft.content || '');
				}
			}
			
			// Start auto-save
			startAutoSave();
		});

		// Clear draft on successful submission
		document.getElementById('blogForm').addEventListener('submit', () => {
			localStorage.removeItem('blogDraft');
		});
	</script>
</body>
</html>
