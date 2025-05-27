<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<meta charset="UTF-8">
<title>Settings - Blog Platform</title>
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

	/* Glass morphism navbar */
	.navbar {
		background: rgba(255, 255, 255, 0.1);
		backdrop-filter: blur(20px);
		border-bottom: 1px solid rgba(255, 255, 255, 0.2);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	}

	.navbar-brand img {
		filter: brightness(1.2);
		transition: transform 0.3s ease;
	}

	.navbar-brand img:hover {
		transform: scale(1.05);
	}

	.nav-link {
		color: white !important;
		font-weight: 500;
		transition: all 0.3s ease;
		position: relative;
	}

	.nav-link::after {
		content: '';
		position: absolute;
		width: 0;
		height: 2px;
		bottom: -5px;
		left: 50%;
		background: var(--warning-gradient);
		transition: all 0.3s ease;
		transform: translateX(-50%);
	}

	.nav-link:hover::after {
		width: 100%;
	}

	.nav-link:hover {
		color: #ffd700 !important;
		transform: translateY(-2px);
	}

	/* Main settings container */
	.settings-container {
		background: var(--glass-bg);
		backdrop-filter: blur(20px);
		border: 1px solid var(--glass-border);
		border-radius: 20px;
		box-shadow: 
			0 8px 32px 0 rgba(31, 38, 135, 0.37),
			inset 0 1px 0 rgba(255, 255, 255, 0.2);
		animation: slideUp 0.6s ease-out;
		overflow: hidden;
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

	/* Tab buttons */
	.list-group a {
		background: transparent !important;
		border: 2px solid transparent !important;
		color: rgba(255, 255, 255, 0.8) !important;
		border-radius: 15px !important;
		margin: 8px 0 !important;
		padding: 15px 20px !important;
		font-weight: 500;
		transition: all 0.3s ease;
		position: relative;
		overflow: hidden;
	}

	.list-group a::before {
		content: '';
		position: absolute;
		top: 0;
		left: -100%;
		width: 100%;
		height: 100%;
		background: var(--primary-gradient);
		transition: left 0.3s ease;
		z-index: -1;
	}

	.list-group a:hover::before,
	.list-group a.active::before {
		left: 0;
	}

	.list-group a:hover,
	.list-group a.active {
		color: white !important;
		border-color: rgba(255, 255, 255, 0.3) !important;
		transform: translateX(10px);
		box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
	}

	/* Tab icons */
	.list-group a i {
		margin-right: 10px;
		font-size: 1.2em;
	}

	/* Form styling */
	.form-control {
		background: rgba(255, 255, 255, 0.1) !important;
		border: 2px solid rgba(255, 255, 255, 0.2) !important;
		color: white !important;
		border-radius: 12px !important;
		padding: 12px 16px !important;
		transition: all 0.3s ease;
	}

	.form-control:focus {
		background: rgba(255, 255, 255, 0.15) !important;
		border-color: #667eea !important;
		box-shadow: 0 0 20px rgba(102, 126, 234, 0.3) !important;
		transform: translateY(-2px);
	}

	.form-control::placeholder {
		color: rgba(255, 255, 255, 0.6) !important;
	}

	.form-label {
		color: rgba(255, 255, 255, 0.9) !important;
		font-weight: 500;
		margin-bottom: 8px !important;
		font-size: 0.95em;
	}

	/* Button styling */
	.btn-custom {
		background: var(--warning-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 12px 30px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(250, 112, 154, 0.4);
	}

	.btn-custom:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(250, 112, 154, 0.6);
		color: white;
	}

	.btn-danger-custom {
		background: var(--danger-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 12px 30px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
	}

	.btn-danger-custom:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(255, 107, 107, 0.6);
		color: white;
	}

	/* Coffee button styling */
	.btn-coffee {
		background: var(--success-gradient);
		border: none;
		color: white;
		font-weight: 600;
		padding: 12px 30px;
		border-radius: 25px;
		transition: all 0.3s ease;
		box-shadow: 0 4px 15px rgba(79, 172, 254, 0.4);
	}

	.btn-coffee:hover {
		transform: translateY(-3px);
		box-shadow: 0 8px 25px rgba(79, 172, 254, 0.6);
		color: white;
	}

	.btn-coffee i {
		animation: bounce 2s infinite;
	}

	@keyframes bounce {
		0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
		40% { transform: translateY(-5px); }
		60% { transform: translateY(-3px); }
	}

	/* Search bar styling */
	.search-bar input {
		background: rgba(255, 255, 255, 0.1);
		border: 2px solid rgba(255, 255, 255, 0.2);
		color: white;
		border-radius: 25px;
		padding: 8px 20px;
		transition: all 0.3s ease;
	}

	.search-bar input:focus {
		outline: none;
		border-color: #667eea;
		box-shadow: 0 0 15px rgba(102, 126, 234, 0.3);
	}

	.search-bar input::placeholder {
		color: rgba(255, 255, 255, 0.6);
	}

	/* Language selector */
	select {
		background: rgba(255, 255, 255, 0.1) !important;
		color: white !important;
		border: 2px solid rgba(255, 255, 255, 0.2) !important;
		border-radius: 10px !important;
		padding: 5px 10px !important;
	}

	select option {
		background: #1e3c72;
		color: white;
	}

	/* Tab content animation */
	.tab-pane {
		animation: fadeIn 0.5s ease-in;
	}

	@keyframes fadeIn {
		from { opacity: 0; transform: translateX(20px); }
		to { opacity: 1; transform: translateX(0); }
	}

	/* File upload styling */
	.input-group-text {
		background: var(--primary-gradient) !important;
		color: white !important;
		border: none !important;
		border-radius: 12px 0 0 12px !important;
		font-weight: 500;
	}

	/* Responsive design */
	@media (max-width: 768px) {
		.settings-container {
			margin: 10px;
			padding: 15px;
		}
		
		.list-group a {
			padding: 12px 15px !important;
			font-size: 0.9em;
		}
	}

	/* Page title */
	.page-title {
		text-align: center;
		color: white;
		font-size: 2.5em;
		font-weight: 300;
		margin-bottom: 30px;
		text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
	}

	.page-title span {
		background: var(--warning-gradient);
		-webkit-background-clip: text;
		background-clip: text;
		-webkit-text-fill-color: transparent;
		font-weight: 600;
	}
</style>
</head>
<body>
	<%@ include file="P_Nav.jsp" %>

	<div class="container-fluid mt-5 py-5">
		<h1 class="page-title">Account <span>Settings</span></h1>
		
		<div class="row justify-content-center">
			<div class="col-lg-10 col-xl-8">
				<div class="settings-container p-4">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div class="list-group" id="list-tab" role="tablist">
								<a class="btn" id="list-home-list" data-bs-toggle="list" href="#list-home" role="tab">
									<i class="fas fa-user-edit"></i>Change Username
								</a>
								<a class="btn" id="list-profile-list" data-bs-toggle="list" href="#list-profile" role="tab">
									<i class="fas fa-camera"></i>Profile Picture
								</a>
								<a class="btn" id="list-messages-list" data-bs-toggle="list" href="#list-messages" role="tab">
									<i class="fas fa-lock"></i>Change Password
								</a>
								<a class="btn" id="list-coffee-list" data-bs-toggle="list" href="#list-coffee" role="tab">
									<i class="fas fa-coffee"></i>Buy Me Coffee
								</a>
								<a class="btn" id="list-settings-list" data-bs-toggle="list" href="#list-settings" role="tab">
									<i class="fas fa-trash-alt"></i>Delete Account
								</a>
							</div>
						</div>
						
						<div class="col-lg-8 col-md-7">
							<div class="tab-content" id="nav-tabContent">
								<!-- Change Username Tab -->
								<div class="tab-pane fade show active" id="list-home" role="tabpanel">
									<h4 class="text-white mb-4"><i class="fas fa-user-edit me-2"></i>Change Username</h4>
									<form action="chengeusername" method="post">
										<div class="mb-4">
											<label class="form-label">New Username</label>
											<input type="text" name="name" class="form-control" placeholder="Enter your new username">
										</div>
										<div class="mb-4">
											<label class="form-label">Current Password</label>
											<input type="password" name="password" class="form-control" placeholder="Enter your current password">
										</div>
										<button type="submit" class="btn btn-custom">
											<i class="fas fa-save me-2"></i>Update Username
										</button>
									</form>
								</div>

								<!-- Change Profile Picture Tab -->
								<div class="tab-pane fade" id="list-profile" role="tabpanel">
									<h4 class="text-white mb-4"><i class="fas fa-camera me-2"></i>Change Profile Picture</h4>
									<form action="uploadProfilePic" method="post" enctype="multipart/form-data">
										<div class="input-group mb-4">
											<label class="input-group-text"><i class="fas fa-upload me-2"></i>Choose File</label>
											<input type="file" name="profilePic" class="form-control" accept="image/*">
										</div>
										<div class="mb-4">
											<label class="form-label">Current Password</label>
											<input type="password" name="password" class="form-control" placeholder="Enter your current password">
										</div>
										<button type="submit" class="btn btn-custom">
											<i class="fas fa-save me-2"></i>Update Picture
										</button>
									</form>
								</div>

								<!-- Change Password Tab -->
								<div class="tab-pane fade" id="list-messages" role="tabpanel">
									<h4 class="text-white mb-4"><i class="fas fa-lock me-2"></i>Change Password</h4>
									<form action="ChangePassword" method="post">
										<div class="mb-4">
											<label class="form-label">Current Password</label>
											<input type="password" name="password" class="form-control" placeholder="Enter your current password">
										</div>
										<div class="mb-4">
											<label class="form-label">New Password</label>
											<input type="password" name="NewPassword" class="form-control" placeholder="Enter your new password">
										</div>
										<div class="mb-4">
											<label class="form-label">Confirm New Password</label>
											<input type="password" name="CPassword" class="form-control" placeholder="Confirm your new password">
										</div>
										<button type="submit" class="btn btn-custom">
											<i class="fas fa-save me-2"></i>Update Password
										</button>
									</form>
								</div>

								<!-- Buy Me Coffee Tab -->
								<div class="tab-pane fade" id="list-coffee" role="tabpanel">
									<h4 class="text-white mb-4"><i class="fas fa-coffee me-2"></i>Support authers</h4>
									<form action="/addWalletAddress" method=post class="text-center p-4">
										<div class="mb-4">
											<i class="fas fa-coffee text-warning" style="font-size: 4em;"></i>
										</div>
										<h5 class="text-white mb-3">Enjoying our platform?</h5>
										<p class="text-white-50 mb-4">
											Your support helps us maintain and improve this blog platform. 
											Consider buying us a coffee to keep the servers running!
										</p>
										<div class="mb-4">
											<label class="form-label">Coffee ACCOUNT ADDRESS</label>
											<input type="text" name=address class="form-control" placeholder="Enter your Buy Me Coffee URL">
										</div>
										<button  type=submit class="btn btn-coffee">
											<i class="fas fa-coffee me-2"></i>Buy Me a Coffee
										</button>
										<div class="mt-3">
											<small class="text-white-50">
												<i class="fas fa-info-circle me-1"></i>
												add a Crypto wallet ACCOUNT ADDRESS
											</small>
										</div>
									</form>
								</div>

								<!-- Delete Account Tab -->
								<div class="tab-pane fade" id="list-settings" role="tabpanel">
									<h4 class="text-white mb-4"><i class="fas fa-exclamation-triangle me-2"></i>Delete Account</h4>
									<div class="alert alert-danger" role="alert">
										<i class="fas fa-exclamation-triangle me-2"></i>
										<strong>Warning!</strong> This action cannot be undone. All your blogs and data will be permanently deleted.
									</div>
									<form action="deletePassword" method="post">
										<div class="mb-4">
											<label class="form-label">Password Confirmation</label>
											<input type="password" name="password" class="form-control" placeholder="Enter your password to confirm deletion">
										</div>
										<button type="submit" class="btn btn-danger-custom">
											<i class="fas fa-trash-alt me-2"></i>Delete Account Permanently
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		

		// Add smooth transitions between tabs
		document.querySelectorAll('[data-bs-toggle="list"]').forEach(function(tab) {
			tab.addEventListener('shown.bs.tab', function (e) {
				// Add animation class to active tab content
				const targetPane = document.querySelector(e.target.getAttribute('href'));
				targetPane.style.animation = 'none';
				targetPane.offsetHeight; // Trigger reflow
				targetPane.style.animation = 'fadeIn 0.5s ease-in';
			});
		});

		// Coffee URL functionality
		const coffeeUrlInput = document.querySelector('input[type="url"]');
		const coffeeButton = document.querySelector('.btn-coffee');
		
		
		// Form validation feedback
		document.querySelectorAll('form').forEach(form => {
			form.addEventListener('submit', function(e) {
				const button = this.querySelector('button[type="submit"]');
				const originalText = button.innerHTML;
				
				button.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Processing...';
				button.disabled = true;
				
				// Re-enable after 3 seconds (for demo purposes)
				setTimeout(() => {
					button.innerHTML = originalText;
					button.disabled = false;
				}, 3000);
			});
		});
	</script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" 
		crossorigin="anonymous"></script>
</body>
</html>