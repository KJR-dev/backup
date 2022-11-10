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

		<%@ include file="../Resources/sidebar.jsp"%>
		<div class="content-wrapper">
			<%@ include file="../Resources/header.jsp"%>
			<div class="container-fluid" id="clear">
				<table class="table table-border table-hover"
					id="tbl-viewcomplaints">
					<thead>
						<tr>
							<!-- <th><center>Sl.No</center></th> -->
							<th><center>Customer Id</center></th>
							<th><center>Complaint Id</center></th>
							<th><center>Mobile</center></th>
							<th><center>Complaint Type</center></th>
							<th><center>Complaint subtype</center></th>
							<th><center>Token</center></th>
							<th><center>Date</center></th>
							<th><center>Address</center></th>
							<th><center>Pincode</center></th>
							<th><center>Status</center></th>
							<th><center>Action</center></th>
						</tr>

					</thead>

				</table>

			</div>
		</div>
		<!-- Modal -->
<div class="modal fade" id="taskModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Assign Engineer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
      </div>
      <div class="modal-body">
        <form id="set_task">
						<div class="form-group">
                        <label>Token Id</label>
                        <input type="text" class="form-control" id="Token_id" name="Token_id" readonly/>
                        </select>
                      </div>
						<div class="form-group">
                        <label>Nearest Engineer</label>
                        <select class="form-control" id="nearestEngineer" name="engineer_id" onchange=myFunction()>
                        </select>
                      </div>
                      <!-- select -->
                      <div class="form-group">
                        <label>Outside Engineer</label>
                        <select class="form-control" id="outsideEngineer" name="engineer_id">
                        </select>
                      </div>
               	<!-- 	<input type="hidden" name="roleId" value="" id="hdnRoleId"/> 						important 1
               		<input type="hidden" name="action" value="updaterole" id="action"/>  -->				<!-- important 2 -->
               		<input type="hidden" name="action" value="set_engineer_task" id="action"/> 
                      <div class="modal-footer justify-content-between">
                      <input type="hidden" id="set_token" value="" name="token">
                      <input
                        type="submit"
                        class="btn btn-primary"
                        value="Assign"
                        id="task_assign"
                      />
                     <!--  <button type="button" class="btn-close btn-danger" data-bs-dismiss="modal" aria-label="Close">close</button> -->
                    </div>
                    
                      </form>
      </div>
    </div>
  </div>
</div>
	<!-- ./wrapper -->
	<%@ include file="../Resources/footer.jsp"%>
	</div>
	<%@ include file="../Resources/script.jsp"%>
	<script type="text/javascript">
		$("document").ready(function() {
			$("li").removeClass("menu-open");
			$("a").removeClass("active");
			$("#reports1").addClass("menu-open");
			$("#reports2").addClass("active");
			$("#pendingcomplains1").addClass("menu-open");
			$("#pendingcomplains2").addClass("active");
			$(".heading").text("Pending Complains");
		});
		$
				.ajax({
					url : "../User",
					type : "post",
					data : {
						action : "get_All_Pending_Complains_admin"
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
													/* + (index + 1)
													+ '</td><td><center>' */
													+ data[index].u_id
													+ '</center></td><td>'
													+ data[index].Comp_id
													+ '</center></td><td>'
													+ data[index].mobile
													+ '</center></td><td><center>'
													+ data[index].C_Name
													+ '</center></td><td><center>'
													+ data[index].cat_name
													+ '</center></td><td><center>'
													+ data[index].Token
													+ '</center></td><td><center>'
													+ data[index].Comp_date
													+ '</center></td><td><center>'
													+ data[index].Comp_Address
													+ '</center></td><td><center>'
													+ data[index].Comp_Pincode
													+ '</center></td><td><center><p class="btn btn-secondary">'
													+ data[index].Complaint_Status_Name
													+ '</p></center></td><td><center><input type="hidden" name="id" value="'+data[index].u_id+'"/><input type="hidden" name="pincode" value="'+data[index].Comp_Pincode+'"/><input type="hidden" name="Token" value="'+data[index].Token+'"/><button type="button" id="'+data[index].Comp_Pincode+'" id2="'+data[index].Token+'" class="btn btn-dark complaints_action">Action</button></center></td></tr>'
													+ '<tr class="expandable-body d-none"><td colspan="6"><p>'
													+ data[index].Comp_desc
													+ '</p></td></tr></tbody>');
							/* $("#set_token").val(data[index].Token); */
						}
					},
					error : function(data, textStatus, errorThrown) {
						alert("failed");
					}

				});
		</script>
		 <script>
		$(document).on("click", ".complaints_action", function(event) {
			 event.preventDefault();
			 
			  /* var f=$("#auto_assign_engineer").val(); */
			 
			$("#taskModal").modal('show');
			  var f = $(this).attr('id');
			 
			  var i= $(this).attr('id2');
			  $("#Token_id").val(i);
			 /*  alert(f);  */
			$("#outsideEngineer").hide();  
			/* alert(i);  */
			 $.ajax ({
				url : "../Admin",
				type : "POST",
				data : { action : "get_all_engineers", pincode : f},
				dataType : "json",
				success : function(data, textStatus, jqXHR){
					console.log(data);
					$("#nearestEngineer").empty();
					$("#nearestEngineer").append("<option >"+'--select--'+"</option>");
					for(var index=0 ; index < data.length ; index++){
						$("#nearestEngineer").append("<option value="+data[index].id+'>'+data[index].name+"&nbsp &nbsp("+f+")</option>");
					}
					$("#nearestEngineer").append("<option value="+(0)+" id="+'defaultcall'+">"+'Outside Engineer'+"</option>"); 
				},
				error : function(data, textStatus, errorThrown) {
					alert("failed");
				}
				
			}); 
		});
		function myFunction(){
			var x = document.getElementById("nearestEngineer").value;
			/* alert(x); */
			if(x==0){
				$("#nearestEngineer").remove();
				$("#outsideEngineer").show();
				
			}
			
				if(x == 0){
					$.ajax({
						url : "../Admin",
						type : "post",
						data : {action : "fetch_all_engineers" },
						dataType : "json",
						success : function(data,textStatus,jqXHR){
							console.log(data);
							$("#outsideEngineer").empty();
							$("#outsideEngineer").append("<option >"+'--select--'+"</option>");
							for(var index=0 ; index < data.length ; index++){
							$("#outsideEngineer").append("<option value="+data[index].id+'>'+data[index].name+"&nbsp &nbsp("+data[index].Pincode+")</option>");
							}
						},
						error : function(data,textStatus,errorThrown){
							alert("faild");
						}
					});
				}
			}
		
			$("#task_assign").on("click",function(event){
				/* alert(); */
			$("#set_task").on("submit",function(event){
				event.preventDefault();
				var f=$("#set_task").serialize();
				console.log(f);
				 $.ajax({
					url : "../Admin",
					type : "post",
					data : f,
					dataType : "json",
					success : function(data,textStatus,jqXHR){
						swal({
						    title: "Done!",
						    text: "Successful Task Assigned To Engineer!",
						    type: "success"
						}).then(function() {
						    window.location = "PendingComplains.jsp";
						});

					},
					error : function(data,textStatus,errorThrown){
						alert("Outter failed");
					} 
			}); 
			}); 
		}); 
	</script> 
</body>
</html>