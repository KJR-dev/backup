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
			<div class="container-fluid" id="clear">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#modal-default" id="addroles">
									<div class="fa-solid fa-user">&nbsp Add Complaint Type</div>
									<h5 class="card-title"></h5>
								</button>
								<div class="input-group input-group-sm"
									style="width: 150px; float: right">
									<input type="text" name="table_search"
										class="form-control float-right" placeholder="Search" />

									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th style="text-align: center; width: 40px">Sl.No</th>
											<th style="text-align: center; width: 300px">Complaint
												Type Id</th>
											<th style="text-align: center; width: 400px">Complaint
												Type Name</th>
											<th style="text-align: center">Action</th>
										</tr>
									</thead>
									<tbody id="displycomplaint">
									</tbody>
								</table>
							</div>
							<div class="card-footer clearfix">
								<ul class="pagination pagination-sm m-0 float-right">
									<li class="page-item"><a class="page-link" href="#">&laquo;</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">&raquo;</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>



			<form id="add_complaint_form">
				<div class="modal fade" id="modal-default">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Add Role</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="form-group">
									<label for="exampleInputName">Complaint</label> <input
										type="text" class="form-control" id="exampleInputName1"
										name="name1" placeholder="Enter Complaint Name" />
								</div>

								<!-- select -->
								<div class="form-group">
									<label>Status</label> <select class="form-control" id="status1"
										name="status1">
										<option value="1">Active</option>
										<option value="0">Deactive</option>
									</select>
								</div>
							</div>
							<div class="modal-footer justify-content-between">
								<input type="submit" class="btn btn-primary" value="Add Role"
									id="add" />
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- end modal 1 code -->
				<input type="hidden" name="action" value="add_complaint" />
			</form>


			<!--  MOdal 2 -->

			<div class="modal fade" id="Complaint-edit-modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Update Complaint</h4>
							<button type="button" class="close" data-bs-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<form id="update_complaint_form">
								<div class="form-group">
									<label for="exampleInputName2">Complaint Name</label> <input
										type="text" class="form-control" id="set_complaint_name"
										name="set_complaint_name"
										placeholder="Enter New Complaint Name" value="" />
								</div>

								<!-- select -->
								<div class="form-group">
									<label>status</label> <select class="form-control"
										id="set_complaint_status" name="set_complaint_status">
										<option value="1">Active</option>
										<option value="0">Deactive</option>
									</select>
								</div>
								<input type="hidden" name="Complaint_Id" value=""
									id="hdn_Complaint_Id" />
								<!-- important 1 -->
								<input type="hidden" name="action" value="update_complaint"
									id="action" />
								<!-- important 2 -->
								<div class="modal-footer justify-content-between">
									<input type="submit" class="btn btn-primary" value="UPDATE"
										id="update_complaint" />
									<!--  <button type="button" class="btn-close btn-danger" data-bs-dismiss="modal" aria-label="Close">close</button> -->
								</div>
							</form>
							<!-- form end -->
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- end modal 2 code -->



			<div class="modal fade" id="catagoryModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Complaint
								Catagory Management</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close">X</button>
						</div>
						<div class="col-4">
							<button type="button" class="btn btn-success" value="" id="add_complaint_catagory">
							<input type="hidden" name="Catagory_Id" value="" name="add_complaint_catagory_id" id="hdn_add_complaint_catagory_id"/> 
								<div class="fa-solid fa-user">&nbsp; Add Complaint
									Catagory</div>
								<h5 class="card-title"></h5>
							</button>
						</div>
						<div class="modal-body" id="display_all_complaint_catagory">
							<!-- <div class="row" id="add_catagory">
								<button type="button" class="btn btn-danger mx-2 my-2"
									style="font-size: 25px; text-align: center; border-radius: 25px;">Phone
									Dead</button>
							</div> -->
						</div>
					</div>
				</div>
			</div>

<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Add Complaint Catagory</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body">
        <form id="Add_complaint_catagory_form">
                      <div class="form-group">
                        <label for="exampleInputName2">Complaint Catagory Name</label>
                        <input
                          type="text"
                          class="form-control"
                          id="set_catagory_name"
                          name="set_catagory_name"
                          placeholder="Enter New Catagory Name"
                          value=""
                        />
                      </div>

               
                      <div class="form-group">
                        <label>status</label>
                        <select class="form-control" id="set_catagory_status" name="set_catagory_status">
                          <option value="1">Active</option>
                          <option value="0">Deactive</option>
                        </select>
                      </div>
               		<input type="hidden" name="Catagory_Id" value="" id="hdn_catagory_Id"/> 				<!-- important 1 -->
               		<input type="hidden" name="action" value="add_new_catagory" id="action"/> 				<!-- important 2 -->
                      <div class="modal-footer justify-content-between">
                      <input
                        type="submit"
                        class="btn btn-primary"
                        value="Add"
                        id="Add_Complaint_catagory"
                      />
                      <button type="button" class="btn-close btn-danger" data-bs-dismiss="modal" aria-label="Close">close</button>
                    </div>
                      </form>
      </div>
    </div>
  </div>
</div>




			


		</div>
		<%@ include file="../Resources/footer.jsp"%>
	</div>
	<!-- ./wrapper -->


	<%@ include file="../Resources/script.jsp"%>
	<script type="text/javascript">
	var gobal_id;
		$("document").ready(function() {
			$("li").removeClass("menu-open");
			$("a").removeClass("active");
			$("#complaintmanagement1").addClass("menu-open");
			$("#complaintmanagement2").addClass("active");
			$(".heading").text("Complaint Management");
		});
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : "../Admin",
										type : "post",
										data : {
											action : "get_all_complaint_name"
										},
										dataType : "json",
										success : function(data, textStatus,
												jqXHR) {
											for (let index = 0; index < data.length; index++) {
												console.log(data);
												$("#displycomplaint")
														.append(
																'<tr><td style="text-align:center; width: 20px">'
																		+ (index + 1)
																		+ '</td><td style="text-align:center; width: 300px">'
																		+ data[index].C_Id
																		+ '</td><td style="text-align:center; width: 300px">'
																		+ data[index].C_Name
																		+ '</td><td><div class="row"><button type="button" class="btn btn-outline-primary Complaint-edit" id="'+data[index].C_Id+'">Edit</button><button type="button" class="btn btn-outline-danger mx-1 complaint-delete" id="'+data[index].C_Id+'">Delete</button><button type="button" class="btn btn-outline-success mx-1 complaint_catagory" id="'+data[index].C_Id+'">Complaint Catagory</button></div></td></tr>');
											}
										},
										error : function(data, textStatus,
												errorThrown) {
										},
									});
							$("#add_complaint_form")
									.on(
											"submit",
											function(event) {
												event.preventDefault();
												var f = $("#add_complaint_form")
														.serialize();
												console.log(f);

												$
														.ajax({ /* add new complaint code */
															url : "../Admin",
															type : "POST",
															data : f,
															dataType : "JSON",
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																swal(
																		{
																			title : "Done!",
																			text : "New Role Successfully Registered!",
																			type : "success"
																		})
																		.then(
																				function() {
																					window.location = "ComplaintManagement.jsp";
																				});
															},
															error : function(
																	data,
																	textStatus,
																	errorThrown) {
																/* console.log(data); */
																alert("failes Tests");

															},
														});
											});

							$(document)
									.on(
											"click",
											'.complaint-delete',
											function(event) {
												event.preventDefault();
												var id = $(this).attr("id");
												/* alert(id); */
												console.log(id);
												$
														.ajax({
															url : "../Admin",
															type : "post",
															data : {
																action : "delete_complaint_type",
																id : id
															},
															dataType : "json",
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																swal({
																    title: "Done!",
																    text: "Complaint Delete Successful!",
																    type: "success"
																}).then(function() {
																    window.location = "ComplaintManagement.jsp";
																});
															},
															error : function(
																	data,
																	textStatus,
																	errorThrown) {
																alert("failes");
															}
														});
											});

							$(document).on(
									"click",
									'.Complaint-edit',
									function(event) {
										event.preventDefault();
										var id = $(this).attr('id');
										/* alert(id); */
										$('#Complaint-edit-modal')
												.modal('show');
										var f = $(".Complaint-edit")
												.serialize();
										$.ajax({ /* fetch data for complaint name and status  in edit form */
											url : "../Admin",
											type : "post",
											data : {
												action : "fetch_complaint",
												id : id
											},
											dataType : "json",
											success : function(data,
													textStatus, jqXHR) {
												$("#set_complaint_name").val(
														data[0].C_Name);
												$("#set_complaint_status").val(
														data[0].C_Status);
												$("#hdn_Complaint_Id").val(
														data[0].C_Id);
											},
											error : function(data, textStatus,
													errorThrown) {
												alert("failes");
											},
										});

									});

						});
		$("#update_complaint_form").on("submit", function(event) {       /* final update process code */
			event.preventDefault();
			var f = $(this).serialize();
			console.log(f);
			$.ajax({
				url : "../Admin",
				type : "post",
				data : f,
				dataType : "json",
				success : function(data, textStaus, jqXHR) {
					swal({
					    title: "Done!",
					    text: "Complaint Edit Successful!",
					    type: "success"
					}).then(function() {
					    window.location = "ComplaintManagement.jsp";
					});

				},
				error : function(data, textStatus, errorThrown) {
					alert("failed");
				}
			});
		});

		$(document).on("click", ".complaint_catagory", function() {
			var id = $(this).attr('id');
			$("#catagoryModal").modal('show');
			$.ajax({
				url : "../Admin",
				type : "post",
				data : { action:"fetch_all_complaint_catagory", id:id},
				dataType : "json",
				success : function(data, textStaus, jqXHR) {
					console.log(data);
					$("#display_all_complaint_catagory").empty();
					 for(var index=0 ; index < data.length ; index++){
						  console.log(data[index].C_Status);
						 if(data[index].C_Status == 1){						/* <span data-toggle="tooltip" title="Hooray!">Hover over me</span> */
							 $("#display_all_complaint_catagory").append(' <button type="button" class="btn btn-primary mx-2 my-2 change_complaint_catagory_status"style="font-size: 25px; text-align: center; border-radius: 25px;" id='+data[index].Cat_Id+' id2='+data[index].C_Status+' data-toggle="tooltip" title="Click Here To Deactive!"data-toggle="tooltip">'+data[index].C_Name+'</button> ');
							  }
						 else{
							 $("#display_all_complaint_catagory").append(' <button type="button" class="btn btn-danger mx-2 my-2 change_complaint_catagory_status"style="font-size: 25px; text-align: center; border-radius: 25px;" id='+data[index].Cat_Id+' id2='+data[index].C_Status+' data-toggle="tooltip" title="Click Here To Active!"data-toggle="tooltip">'+data[index].C_Name+'</button>');
						 }
					}
				},
					error : function(data, textStatus, errorThrown) {
					alert("Something worng");
				}
			});
		});
		
		$(document).on("click", ".change_complaint_catagory_status", function() {
			var id = $(this).attr('id');
			var id2 = $(this).attr('id2');
			/* alert(id);
			alert(id2); */
			if(id2 == 1){
				$.ajax({
					url : "../Admin",
					type : "post",
					data : {action : "status_change_to_zero", id : id },
					dataType : "json",
					success : function(data,textStatus,jqXHR){
						swal({
						    title: "Done!",
						    text: "Update Complaint Catagory Status Successful!",
						    type: "success"
						}).then(function() {
						    window.location = "ComplaintManagement.jsp";
						});

					},
					error : function(data,textStatus,errorThrown){
						alert("faild");
					}
					
				});
			}else{
				$.ajax({
					url : "../Admin",
					type : "post",
					data : {action : "status_change_to_one", id : id },
					dataType : "json",
					success : function(data,textStatus,jqXHR){
						swal({
						    title: "Done!",
						    text: "Update Complaint Catagory Status Successful!",
						    type: "success"
						}).then(function() {
						    window.location = "ComplaintManagement.jsp";
						});
					},
					error : function(data,textStatus,errorThrown){
						alert("faild");
					}
					
				});
			}
		});
		
		
		$(document).on("click", ".complaint_catagory", function() {
			var id = $(this).attr('id');
			$("#catagoryModal").modal('show');
			$.ajax({
				url : "../Admin",
				type : "post",
				data : { action:"fetch_complaint", id:id},
				dataType : "json",
				success : function(data, textStaus, jqXHR) {
					console.log(data);
					$("#hdn_add_complaint_catagory_id,#hdn_catagory_Id").val(data[0].C_Id); 
				},
				error : function(data, textStatus, errorThrown) {
					alert("failed");
				}
			});
		});
		$(document).on("click", "#add_complaint_catagory", function() {
			$("#catagoryModal").modal('hide');
			$("#staticBackdrop").modal('show');
		});
		$(document).on("submit", "#Add_complaint_catagory_form", function(event) {
			event.preventDefault();
			var f = $(this).serialize();
			console.log(f);
			$.ajax({
				url : "../Admin",
				type : "post",
				data : f,
				dataType : "json",
				success : function(data, textStaus, jqXHR) {
					 location.reload();
				},
				error : function(data, textStatus, errorThrown) {
					alert("failed");
				}
			});
		});
		
	</script>
</body>
</html>