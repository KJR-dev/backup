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
							
						</tr>

					</thead>

				</table>
			</div>
			
		</div>
		<div class="modal fade" id="complaint_action_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Complaint Action</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
		<!-- ./wrapper -->
		
	</div><%@ include file="../Resources/footer.jsp"%>
	<%@ include file="../Resources/script.jsp"%>
	<script type="text/javascript">
		$("document").ready(function() {
			$("li").removeClass("menu-open");
			$("a").removeClass("active");
			$("#reports1").addClass("menu-open");
			$("#reports2").addClass("active");
			$("#resolvedcomplains1").addClass("menu-open");
			$("#resolvedcomplains2").addClass("active");
			$(".heading").text("Resolved Complains");
		});
		$
				.ajax({
					url : "../User",
					type : "post",
					data : {
						action : "get_All_Resolved_Complains_admin"
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
											+ '</center></td><td><center><p class="btn btn-success" >'
											+ data[index].Complaint_Status_Name
											+ '<tr class="expandable-body d-none"><td colspan="6"><p>'
											+ data[index].Comp_desc
											+ '</p></td></tr></tbody>');

						}
					},
					error : function(data, textStatus, errorThrown) {
						alert("failed");
					}

				});
		
	</script>
</body>
</html>