<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="bg-dark" style="height: 100vh;">

	<%@ include file="P_Nav.jsp"%>
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
</html>