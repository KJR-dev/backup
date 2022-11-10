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

		<%@ include file="../Resources/sidebar.jsp"%>
		<div class="content-wrapper">
			<%@ include file="../Resources/header.jsp"%>
			<div class="container-fluid" id="clear">
			<table id="tbl-feedback">
					<thead>
						<tr>
							<th width="5%"><center>Sl.No</center></th>
							<th width="10%"><center>Customer Id</center></th>
							<th width="10%"><center>Date</center></th>
							<th width="10%"><center>Token</center></th>
							<th><center>Description</center></th>
							
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
	$("#feedback1").addClass("menu-open")
	$("#feedback2").addClass("active")
	$(".heading").text("Feedback");
	$.ajax({ 
		url : "../Admin",
		type : "post",
		data : {action : "get_all_feedback"},
		dataType : "json",
		success : function(data,textStatus,jqXHR){
			console.log(data);
			$('#tbl-feedback').DataTable();
			$('.odd').hide();										/* ********Important********** */
			for (let index = 0; index < data.length; index++) {
				
				$("#tbl-feedback").append(
								'<tbody><tr><td><center>'
										+ (index + 1)
										+ '</center></td><td><center>'
										+ data[index].u_id
										+ '</center></td><td><center>'
										+ data[index].Comp_date
										+ '</center></td><td><center>'
										+ data[index].Token
										+ '</center></td><td><center>'
										+ data[index].Comp_desc
										+ '</center></td></tr></tbody>');
			}																																															 
			/* $('#tbl-employees').dataTable( {
			    "language": {
			      "emptyTable": "No data available in table"
			    }
			} ); */
		},
		error : function(data,textStatus,errorThrown){
			alert("failed");
		}
	});
});
</script>
</body>
</html>




