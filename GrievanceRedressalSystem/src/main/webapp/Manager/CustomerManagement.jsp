<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% 

if(session.getAttribute("username") == "" || session.getAttribute("username")== null)
{
	response.sendRedirect("../Login/AllLogIn.jsp");
}

   /* out.println(session.getAttribute("username"));  */
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../Resources/link.jsp"%>

</head>
<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">
		<%@ include file="../Resources/topbar.jsp"%>

		<%@ include file="sidebar.jsp"%>
		<div class="content-wrapper">
			<%@ include file="../Resources/header.jsp"%>
			
			
			<button type="button" class="btn btn-primary my-3 mx-3 " data-bs-toggle="modal" data-bs-target="#exampleModal">
  ADD USER
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Customer Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">x</button>
      </div>
      <div class="modal-body">
        <form id="form_add_new_user" class="mx-1 mx-md-4">
										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-user fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example1c">Your
													Name</label> <input type="text" id="form3Example1c"
													class="form-control" name="Name" required />

											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-envelope fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example3c">Your
													Email</label> <input type="email" id="form3Example3c"
													class="form-control" name="UserName" required />

											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-key fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4cd">Mobile
													No.</label> <input type="text" id="form3Example4cd"
													class="form-control" name="Mobile" maxlength="10"
													minlength="10" required />

											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-lock fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4c">Password</label>
												<input type="password" id="form3Example4c"
													class="form-control" name="Password" required />

											</div>
										</div>

										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-lock fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4c">Confirm
													Password</label> <input type="password" id="form3Example4c"
													class="form-control" name="Confirm_Password" required />

											</div>
										</div>


										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-lock fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label for="txtaddress" class="form-label">Address</label> <input
													type="text" id="Address" class="form-control"
													name="Address" maxlength="500"
													placeholder="Enre your Full Address separate by comma"
													required />
											</div>
										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-lock fa-lg me-3 fa-fw"></i> -->
											<div class="form-outline flex-fill mb-0">
												<label class="form-label" for="form3Example4c">Pincode</label>
												<input type="text" id="form3Example4c" class="form-control"
													name="Pincode" maxlength="6" minlength="6" required />

											</div>
										</div>
										<div class="d-flex flex-row align-items-center mb-4">
											<!-- <i class="fas fa-lock fa-lg me-3 fa-fw"></i>&nbsp -->
											<div class="form-outline flex-fill mb-0">
												 <label class="form-label" for="form3Example4c">&nbsp
													&nbsp Status</label> <select class="form-select"
													aria-label="Default select example" id="RoleStatus"
													name="RoleStatus" required>
													<option value="1">Active</option>
													<option value="0">Deactive</option>
												</select>
											</div>
										</div>


										<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
											<input type="hidden" name="action" value="adduserdata" /> 
											
										</div>
										<input type="submit" class="btn btn-primary btn-lg"/>
									</form>
									
      </div>
      
    </div>
  </div>
</div>






			<div class="container-fluid" id="clear">
				<div class="row">
					<table id="tbl-Users" style="width: 100%">
						<thead>
							<tr>
								<th width="150px"><center>Sl.No</center></th>
								<th width="150px"><center>Id</center></th>
								<th width="150px"><center>Name</center></th>
								<th width="150px"><center>Email</center></th>
								<th width="150px"><center>Password</center></th>
								<th width="150px"><center>Mobile</center></th>
								<th width="150px"><center>Address</center></th>
								<th width="150px"><center>Pincode</center></th>
								<th colspan="3" width="150px"><center>Action</center></th>
							</tr>
						</thead>

					</table>
				</div>
			</div>
		</div>

		<div class="modal fade" id="userEditModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Customer
							Details</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">X</button>
					</div>
					<div class="modal-body">
						<form id="userdetails">
							<div class="mb-3">
								<label for="txtname" class="form-label">Name</label> <input
									type="text" class="form-control" id="txtname" name="txtname"
									placeholder="Enter Your Name">
							</div>
							<div class="mb-3">
								<label for="txtemail" class="form-label">Email</label> <input
									type="email" class="form-control" id="txtemail" name="txtemail"
									placeholder="name@example.com">
							</div>
							<div class="mb-3">
								<label for="txtpassword" class="form-label">Password</label> <input
									type="password" class="form-control" id="txtpassword"
									name="txtpassword" placeholder="Enter your password">
							</div>
							<div class="mb-3">
								<label for="txtmobile" class="form-label">Mobile</label> <input
									type="text" class="form-control" id="txtmobile" maxlength="10"
									minlength="10" name="txtmobile"
									placeholder="Enter your mobile number">
							</div>
							<div class="mb-3">
								<label for="txtaddress" class="form-label">Address</label>
								<textarea rows="" cols="" class="form-control" id="txtaddress"
									maxlength="500" name="txtaddress"
									placeholder="Enter your address"></textarea>
							</div>
							<div class="mb-3">
								<label for="txtpincode" class="form-label">Pincode</label> <input
									type="text" class="form-control" id="txtpincode" maxlength="6"
									minlength="6" name="txtpincode"
									placeholder="Enter your pincode">
							</div>
							<div>
								Role :<select class="form-select"
									aria-label="Default select example" id="RoleTypes"
									name="txtrole">
									<!-- <option value="1">User</option>
									<option value="2">Admin</option>
									<option value="3">Engineer</option> -->
								</select>
							</div>
							<br>
							<div>
								Status <select class="form-select"
									aria-label="Default select example" id="RoleStatus"
									name="txtstatus">
									<option value="">--select--</option>
									<!-- <option value="1">Active</option>
									<option value="0">Deactive</option> -->
								</select>
							</div>
							<br> <input type="hidden" name="userid" val=""
								id="hdnuserid" /> <input type="hidden" name="action"
								value="changeuser" />
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-primary" id="">Cancel</button> -->
								<input type="submit" class="btn btn-success" id="updateuser"
									value="Saven changes" />
						</form>

					</div>


				</div>
			</div>
		</div>
	
		<!-- registration modal end -->
		<%@ include file="../Resources/footer.jsp"%>
	</div>
	<%@ include file="../Resources/script.jsp"%>
	<script type="text/javascript">
		$("document").ready(function() {
			$("li").removeClass("menu-open");
			$("a").removeClass("active");
			$("#customermanagement1").addClass("menu-open")
			$("#customermanagement2").addClass("active")
			$(".heading").text("Customer's Management");
		});
		$.ajax({
			url : "../Admin",
			type : "post",
			data : {action : "get_all_customers"},
			dataType : "json",
			success : function(data,textStatus,jqXHR){
				console.log(data);
				$('#tbl-Users').DataTable();
				$('.odd').hide();		
				for(let index=0 ; index < data.length ; index++){
					$("#tbl-Users")
					.append(
							'<tbody><tr><td><center>'
									+ (index + 1)
									+ '</center></td><td><center>'
									+ data[index].id
									+ '</center></td><td><center>'
									+ data[index].name
									+ '</center></td><td><center>'
									+ data[index].username
									+ '</center></td><td><center>'
									+ data[index].password
									+ '</center></td><td><center>'
									+ data[index].mobile
									+ '</center></td><td><center>'
									+ data[index].Address
									+ '</center></td><td><center>'
									+ data[index].Pincode
									+ '</center></td><td><center><input type="submit" id="'+data[index].id+'" value="Edit" class="btn btn-success EditUser"/><input type="hidden" value="'+data[index].id+'"/></center></td><td><center><button type="button" id="'+data[index].id+'" class="btn btn-danger DeleteUser" name="action" value="deleteuser">Delete</button></center></td></tr></tbody>');
				}
			},
			error : function(data,textStatus,errorThrown){
				alert("bye");
			}
		});
		$(document)
		.on(
				"click",
				'.EditUser',
				function(event) {
					event.preventDefault();
					var id = $(this).attr('id');
					$('#userEditModal').modal('show');
					$
							.ajax({ /* fetch data for role name and status  in edit form */
								url : "../Admin",
								type : "post",
								data : {
									action : "fetchuser",
									id : id
								},
								dataType : "json",
								success : function(data, textStatus,
										jqXHR) {
									console.log(data);
									$("#hdnuserid").val(data[0].id);
									$("#txtname").val(data[0].name);
									$("#txtemail")
											.val(data[0].username);
									$("#txtpassword").val(
											data[0].password);
									$("#txtmobile").val(data[0].mobile);
									$("#txtaddress").val(
											data[0].Address);
									$("#txtpincode").val(
											data[0].Pincode);
									
									$("#RoleTypes").empty();
									$.ajax({ /* fetch data for role name and status  in edit form */
										url : "../Admin",
										type : "post",
										data : { action : "fetchroles" },
										dataType : "json",
										success : function(data2, textStatus,
												jqXHR) {
											/* alert(data[0].Role_id); */
											$("#RoleTypes").append("<option><--select--></option>");
												 for(var index=0 ; index< data2.length ; index++){
													$("#RoleTypes").append("<option value="+data2[index].Id+'>'+data2[index].Name+"</option>");
													
												} 
										},
										error : function(data2, textStatus,
												errorThrown) {
											swal("Failed!", "", "error");
										},
									});
									if (data[0].Status == 1) {
										$("#RoleStatus")
												.html(
														'<option value="1">Active</option><option value="0">Deactive</option>');
									} else if (data[0].Status == 0) {
										$("#RoleStatus")
												.html(
														'<option value="0">Deactive</option><option value="1">Active</option>');
									} 
									/* swal({
										title : "Done!",
										text : "Successful!",
										type : "success"
									}).then(function() {
										 window.location = "UserManagement.jsp";
									}); */
								},
								error : function(data, textStatus,
										errorThrown) {
									swal("Failed!", "", "error");
								},
							});

				});

$("#updateuser").on("click",function() {
	$("#userdetails").on("submit", function(event) {
		event.preventDefault();
		var f = $("#userdetails").serialize();
		console.log(f);
		$.ajax({
			url : "../Admin",
			type : "post",
			data : f,
			dataType : "JSON",
			success : function(data, textStatus, jqXHR) {
				swal({
					title : "Done!",
					text : "Successful!",
					type : "success"
				}).then(function() {
					window.location = "CustomerManagement.jsp";
				});
			},
			error : function(data, textStatus, errorThrown) {
				swal("Failed!", "", "error");
			}
		});
	});
});
$(document).on("click",'.DeleteUser', function (event){
	event.preventDefault();
	var id=$(this).attr("id");
	$.ajax({
		url : "../Admin",
		type : "post",
		data : {action : "delete_user_data", id : id},
		dataType : "json",
		success : function(data,textStatus,jqXHR){
			swal({
				title : "Done!",
				text : "Successful!",
				type : "success"
			}).then(function() {
				window.location = "CustomerManagement.jsp";
			});
		},
		error : function(data,textStatus,errorThrown){
			swal("Failed!", "", "error");
		}
	})
});

$("#form_add_new_user").on("submit", function(event) {
	event.preventDefault();
	var f = $(this).serialize();
	console.log(f);
	$.ajax({
		url : "../Admin",
		type : "POST",
		data : f,
		dataType : "json",
		success : function(data, textStatus, jqXHR) {
			swal({
				title : "Done!",
				text : "Successful!",
				type : "success"
			}).then(function() {
				window.location = "CustomerManagement.jsp";
			});
		},
		error : function(data, textStatus, errorThrown) {
			swal("Failed!", "", "error");
		}
	});
});

	</script>
</body>
</html>




