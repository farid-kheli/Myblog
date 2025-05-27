<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
	/* Glass morphism navbar */
	.navbar {
		background: rgba(255, 255, 255, 0.1);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border-bottom: 1px solid rgba(255, 255, 255, 0.2);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		padding: 12px 0;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.navbar-fixed {
		background: rgba(25, 45, 90, 0.95) !important;
		backdrop-filter: blur(30px) !important;
		-webkit-backdrop-filter: blur(30px) !important;
		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3) !important;
		padding: 8px 0 !important;
	}

	.navbar-brand img {
		filter: brightness(1.2) drop-shadow(0 4px 6px rgba(0, 0, 0, 0.1));
		transition: transform 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.navbar-brand img:hover {
		transform: scale(1.05) rotate(-2deg);
	}

	.nav-link {
		color: white !important;
		font-weight: 500;
		letter-spacing: 0.3px;
		transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
		position: relative;
		padding: 10px 16px !important;
		margin: 0 4px;
		border-radius: 12px;
		overflow: hidden;
	}

	.nav-link::after {
		content: '';
		position: absolute;
		width: 0;
		height: 2px;
		bottom: 5px;
		left: 50%;
		background: var(--warning-gradient);
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		transform: translateX(-50%);
	}

	.nav-link:hover {
		color: #ffd700 !important;
		transform: translateY(-2px);
		text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);
	}

	.nav-link:hover::after {
		width: 70%;
	}

	.dropdown-menu {
		background: rgba(30, 60, 114, 0.9);
		backdrop-filter: blur(20px);
		-webkit-backdrop-filter: blur(20px);
		border: 1px solid rgba(255, 255, 255, 0.1);
		border-radius: 12px;
		box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3), 0 0 15px rgba(102, 126, 234, 0.2);
		overflow: hidden;
		transform-origin: top center;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
	}

	.dropdown-item {
		color: white;
		border-radius: 8px;
		padding: 12px 18px;
		margin: 5px;
		transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
		position: relative;
		z-index: 1;
	}

	.dropdown-item::before {
		content: '';
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: linear-gradient(135deg, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0.05) 100%);
		border-radius: 8px;
		transform: scaleX(0);
		transform-origin: left;
		transition: transform 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		z-index: -1;
	}

	.dropdown-item:hover::before {
		transform: scaleX(1);
	}

	.dropdown-item:hover {
		color: #ffd700;
		transform: translateX(5px);
	}

	/* Search bar styling */
	.search-bar {
		position: relative;
		margin-right: 10px;
	}

	.search-bar input {
		background: rgba(255, 255, 255, 0.08);
		border: 2px solid rgba(255, 255, 255, 0.1);
		color: white;
		border-radius: 25px;
		padding: 8px 20px;
		transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
		width: 180px;
		backdrop-filter: blur(10px);
		-webkit-backdrop-filter: blur(10px);
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1), inset 0 2px 5px rgba(0, 0, 0, 0.05);
	}

	.search-bar input:focus {
		outline: none;
		border-color: #667eea;
		box-shadow: 0 0 15px rgba(102, 126, 234, 0.3), inset 0 2px 5px rgba(0, 0, 0, 0);
		width: 240px;
		background: rgba(255, 255, 255, 0.15);
	}

	.search-bar input::placeholder {
		color: rgba(255, 255, 255, 0.6);
	}

	/* Language selector styling */
	#select-language {
		background: rgba(255, 255, 255, 0.08) !important;
		color: white !important;
		border: 1px solid rgba(255, 255, 255, 0.1) !important;
		border-radius: 8px !important;
		padding: 5px 10px !important;
		transition: all 0.3s ease;
		cursor: pointer;
		box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
	}

	#select-language:hover {
		background: rgba(255, 255, 255, 0.15) !important;
		box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	}

	#select-language:focus {
		outline: none;
		box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.5);
	}

	#select-language option {
		background: #1e3c72;
		color: white;
	}

	/* Responsive design */
	@media (max-width: 768px) {
		.navbar-toggler {
			border: none;
			padding: 4px 8px;
		}

		.navbar-toggler:focus {
			box-shadow: none;
		}

		.search-bar input {
			width: 150px;
		}

		.search-bar input:focus {
			width: 180px;
		}
	}
</style>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top">
	<div class="container">
		<a class="navbar-brand order-1" href="home"> 
			<img class="img-fluid" width="100px" src="images/logo.png" 
				alt="Reader | Hugo Personal Blog Template"
				onerror="this.src='https://via.placeholder.com/100x50/667eea/ffffff?text=LOGO'">
		</a>
		
		<button class="navbar-toggler border-0 order-3" type="button" 
			data-bs-toggle="collapse" data-bs-target="#navigation"
			aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
			<i class="fas fa-bars text-white"></i>
		</button>
		
		<div class="collapse navbar-collapse text-center order-lg-2 order-4" id="navigation">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item">
					<a class="nav-link" href="home"><i class="fas fa-home me-2"></i>Homepage</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="dashbord"><i class="fas fa-pen me-2"></i>Write Now</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="MyBloges"><i class="fas fa-blog me-2"></i>My Blogs</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" 
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fas fa-user me-2"></i>Profile
					</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="profiel"><i class="fas fa-user-circle me-2"></i>Profile</a></li>
						<li><a class="dropdown-item" href="MyLikes"><i class="fas fa-heart me-2"></i>My Liked Posts</a></li>
						<li><a class="dropdown-item" href="MySaves"><i class="fas fa-bookmark me-2"></i>My Saved Posts</a></li>
						<li><a class="dropdown-item" href="setting"><i class="fas fa-cog me-2"></i>Settings</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="order-2 order-lg-3 d-flex align-items-center">
			<select class="m-2 border-0" id="select-language">
				<option id="en" value="" selected>En</option>
				<option id="fr" value="">Fr</option>
			</select>

			<form action="search" method="post" class="search-bar me-3">
				<input id="search-query" name="search" type="search" placeholder="Type & Hit Enter...">
			</form>
		</div>
	</div>
</nav>

<script>
	// Fixed navbar on scroll
	window.addEventListener('scroll', function() {
		const navbar = document.querySelector('.navbar');
		if (window.scrollY > 50) {
			navbar.classList.add('navbar-fixed');
		} else {
			navbar.classList.remove('navbar-fixed');
		}
	});

	// Auto-collapse navbar on mobile after click
	document.querySelectorAll('.navbar-nav .nav-link').forEach(link => {
		link.addEventListener('click', () => {
			if (window.innerWidth < 992) {
				document.querySelector('.navbar-toggler').click();
			}
		});
	});
</script>
