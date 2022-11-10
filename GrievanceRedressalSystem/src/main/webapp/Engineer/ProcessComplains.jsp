<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("username") == "" || session.getAttribute("username") == null) {
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
				<table class="table table-border table-hover"
					id="tbl-viewcomplaints">
					<thead>
						<tr>
							<th><center>Sl.No</center></th>
							<th><center>Complaint Id</center></th>
							<th><center>Mobile</center></th>
							<th><center>Complaint Type</center></th>
							<th><center>Complaint subtype</center></th>
							<th><center>Token</center></th>
							<th><center>Date & Time</center></th>
							<th><center>Address</center></th>
							<th><center>Pincode</center></th>
							<th><center>Status</center></th>
							<th><center>Action</center></th>
						</tr>

					</thead>

				</table>
			</div>
		</div>
		<!-- ./wrapper -->
		<div class="modal fade" id="otherModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Other Action</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close">x</button>
					</div>
					<div class="modal-body">
						<form id="updateTask" >
							<div class="form-group">
								<label for="exampleInputName2">Remark</label> <textarea
									class="form-control" id="txtRemark" name="txtRemark"
									placeholder="Remark..." required></textarea>
							</div>
							<div class="modal-footer">
							
						<button type="button" class="btn btn-secondary" id="revert" value="revert">Revert</button>
						<button type="submit" class="btn btn-primary" id="reject" value="reject">Reject</button>
					    <!-- <input type="hidden" value="Reject" name="action"/>
					    <input type="hidden" value="Revert" name="action2"/> -->
					</div>
					<input type="hidden" id="token" name="token" value=""/> 
					<input type="hidden" id="action" name="action" value=""/> 
					<!-- <input type="hidden" id="RejectTask" name="action" value=""/>  -->
					
						</form>
					</div>
					
				</div>
			</div>
		</div>
		<%@ include file="../Resources/footer.jsp"%>
	</div>
	<%@ include file="../Resources/script.jsp"%>
	<script type="text/javascript">
		$("document").ready(function() {
			$("li").removeClass("menu-open");
			$("a").removeClass("active");
			$("#reports1").addClass("menu-open");
			$("#reports2").addClass("active");
			$("#Processcomplains1").addClass("menu-open");
			$("#Processcomplains2").addClass("active");
			$(".heading").text("Process Complains");
		});
		$
				.ajax({
					url : "../Engineer",
					type : "post",
					data : {
						action : "get_All_Process_Complains_engineer"
					},
					dataType : "json",
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$('#tbl-viewcomplaints').DataTable();

						$('.odd').hide();
						for (let index = 0; index < data.length; index++) {
							$("#tbl-viewcomplaints")
									.append(
											'<tbody><tr data-widget="expandable-table" aria-expanded="false"><td><center>'
													+ (index + 1)
													+ '</td><td><center>'
													+ data[index].Comp_id
													+ '</center></td><td>'
													+ data[index].mobile
													+ '</center></td><td><center>'
													+ data[index].C_Name
													+ '</center></td><td><center>'
													+ data[index].Comp_desc
													+ '</center></td><td><center>'
													+ data[index].Token
													+ '</center></td><td><center>'
													+ data[index].Comp_date
													+ '</center></td><td><center>'
													+ data[index].Comp_Address
													+ '</center></td><td><center>'
													+ data[index].Comp_Pincode
													+ '</center></td><td class="btn btn-primary my-2"><center>'
													+ data[index].Complaint_Status_Name
													+ '</center></td><td><center>'
													+ '<button class="btn btn-success" value="'
													+ data[index].Token
													+ '" id="Solved" onclick="Solved()" >Solved</button><button class="btn btn-dark my-1" value="'+data[index].Token+'" id="other"  >Other</button></center><td></td></tr>'
													+ '<tr class="expandable-body d-none"><td colspan="6"><p>'
													+ data[index].Comp_desc
													+ '</p></td></tr></tbody>');

						}
					},
					error : function(data, textStatus, errorThrown) {
						alert("failed");
					}

				});
		function Solved() {
			var x = document.getElementById("Solved").value;
			/* alert(x); */
			$.ajax({
				url : "../Engineer",
				type : "post",
				data : {
					action : "Solved",
					pincode : x
				},
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					swal({
					    title: "Done!",
					    text: "Your Task Solved Successful!",
					    type: "success"
					}).then(function() {
					    window.location = "ProcessComplains.jsp";
						});
				},
				error : function(data, textStatus, errorThrown) {
					swal({
					    title: "Failed!",
					    text: "Your Task Unsolved Successful!",
					    type: "success"
					}).then(function() {
					    window.location = "ProcessComplains.jsp";
						});
				}
			});
		}
		$(document).on("click", "#other", function(event) {
			event.preventDefault();
			var f = $(this).val();
			$("#otherModal").modal('show');
			$("#token").val(f);
			$("#revert").val(f);
		});
		$(document).on("click", "#reject", function(event) {
			$("#action").val('Reject');
			event.preventDefault();
			/* $("#action").val('Reject'); */
			var f=$("#updateTask").serialize();
			console.log(f);
			 $.ajax({
				url : "../Engineer",
				type : "post",
				data : f,
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					swal({
					    title: "Done!",
					    text: "Your Task Rejected Successfully!",
					    type: "error"
					}).then(function() {
						 window.location = "ProcessComplains.jsp";
						});
				},
				error : function(data, textStatus, errorThrown) {
					swal({
					    title: "Failed!",
					    text: "Your Task Not Rejected!",
					    type: "error"
					}).then(function() {
						 window.location = "ProcessComplains.jsp";
						});
				}
			});
		});
		$(document).on("click", "#revert", function(event) {
			$("#action").val('RevertTask');
			event.preventDefault();
			var f=$("#updateTask").serialize();
			console.log(f);
			 $.ajax({
				url : "../Engineer",
				type : "post",
				data : f,
				dataType : "json",
				success : function(data, textStatus, jqXHR) {
					swal({
					    title: "Done!",
					    text: "Your Complaint Revert Successful!",
					    type: "success"
					}).then(function() {
					    window.location = "ProcessComplains.jsp";
						});
				},
				error : function(data, textStatus, errorThrown) {
					swal({
					    title: "Failed!",
					    text: "Something Error",
					    type: "error"
					}).then(function() {
					    window.location = "ProcessComplains.jsp";
						});
				}
			})  
		});
	</script>
</body>
</html>