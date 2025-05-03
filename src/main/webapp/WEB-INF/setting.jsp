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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-dark" style="height: 100vh;">

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
	<div class="d-flex flex-column gap-4 h-75">
		<div
			class="d-flex align-items-center gap-5 h-50 p-4 rounded w-50 bg-black align-self-center container-fluid">
			<div class="list-group d-flex flex-column gap-3" id="list-tab"
				role="tablist">
				<a class="btn btn-outline-secondary" id="list-home-list"
					data-bs-toggle="list" href="#list-home" role="tab"
					aria-controls="list-home">Change User Name</a> <a
					class="btn btn-outline-secondary" id="list-profile-list"
					data-bs-toggle="list" href="#list-profile" role="tab"
					aria-controls="list-profile">Change Profile Picture</a> <a
					class="btn btn-outline-secondary" id="list-messages-list"
					data-bs-toggle="list" href="#list-messages" role="tab"
					aria-controls="list-messages">Change Password</a> <a
					class="btn btn-outline-secondary" id="list-settings-list"
					data-bs-toggle="list" href="#list-settings" role="tab"
					aria-controls="list-settings">Delete Acount</a>
			</div>
			<div class="tab-content w-100" id="nav-tabContent">
				<div class="tab-pane w-100 fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<form action="chengeusername" class="container-sm text-light"  method="post">
						<div class="mb-3">
							<label class="form-label">New User Name</label> <input
								type="text" name="name" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								name="password" class="form-control" id="exampleInputPassword1">
						</div>
						<button type="submit" class="btn btn-warning">update</button>
					</form>
				</div>
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list">
					<form action="uploadProfilePic" class="container-sm text-light" method="post" enctype="multipart/form-data">
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupFile01">Upload</label>
							<input type="file" name="profilePic" class="form-control" id="inputGroupFile01">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								name="password" class="form-control" id="exampleInputPassword1">
						</div>
						<button type="submit" class="btn btn-warning">update</button>
					</form>
				</div>
				<div class="tab-pane fade" id="list-messages" role="tabpanel"
					aria-labelledby="list-messages-list">
					<form action="ChangePassword" class="container-sm text-light" method="post">
						<div class="mb-3">
							<label class="form-label">Old Password</label> <input
								type="password" name="password" class="form-control"
								id="exampleInputPassword1" >
						</div>
						<div class="mb-3">
							<label class="form-label">New Password</label> <input
								type="password" name="NewPassword" class="form-control"
								>
						</div>
						<div class="mb-3">
							<label class="form-label">Confirme New Password</label> <input
								type="password" name="CPassword" class="form-control">
						</div>
						<button type="submit" class="btn btn-warning">update</button>
					</form>
				</div>
				<div class="tab-pane fade" id="list-settings" role="tabpanel"
					aria-labelledby="list-settings-list">
					<form action="deletePassword" class="container-sm text-light" method="post">
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								name="password" class="form-control">
						</div>
						<button type="submit" class="btn btn-outline-danger">Delete</button>
					</form>
				</div>
			</div>
		</div>

	</div>
</body>
<script type="text/javascript">
	document.getElementById("list-home-list").click();
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</html>