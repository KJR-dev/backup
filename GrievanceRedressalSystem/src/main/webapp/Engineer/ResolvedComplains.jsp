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
						</tr>

					</thead>

				</table>
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
			$("#resolvedcomplains1").addClass("menu-open");
			$("#resolvedcomplains2").addClass("active");
			$(".heading").text("Resolved Complains");
		});
		$
				.ajax({
					url : "../Engineer",
					type : "post",
					data : {
						action : "get_All_Resolved_Complains_engineer"
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
													+ '</center></td><td class="btn btn-success my-2"><center>'
													+ data[index].Complaint_Status_Name
													+ '</center></td></tr>'
													+ '<tr class="expandable-body d-none"><td colspan="6"><p>'
													+ data[index].Comp_desc
													+ '</p></td></tr></tbody>');

						}
					},
					error : function(data, textStatus, errorThrown) {
						swal({
						    title: "Failed!",
						    text: "Something Error",
						    type: "error"
						}).then(function() {
						    window.location = "ResolvedComplains.jsp";
 						});
					}

				});
	</script>
</body>
</html>