<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("username") == "" || session.getAttribute("username")== null)
{
	response.sendRedirect("../Login/AllLogIn.jsp");
}
/* String username=(String)request.getAttribute("username");
String password=(String)request.getAttribute("password"); */
%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../Resources/link.jsp"%>
<script type="text/javascript">
  window.onload = function () {
    var chart = new CanvasJS.Chart("chartContainer",
    {

      title:{
      text: "Grievance - per month"
      },
       data: [
      {
        type: "line",

        dataPoints: [
        	{ x: new Date(2012, 00, 1), y: 450 },
            { x: new Date(2012, 01, 1), y: 414 },
            { x: new Date(2012, 02, 1), y: 520 },
            { x: new Date(2012, 03, 1), y: 460 },
            { x: new Date(2012, 04, 1), y: 450 },
            { x: new Date(2012, 05, 1), y: 500 },
            { x: new Date(2012, 06, 1), y: 480 },
            { x: new Date(2012, 07, 1), y: 490 },
            { x: new Date(2012, 08, 1), y: 410 },
            { x: new Date(2012, 09, 1), y: 500 },
            { x: new Date(2012, 10, 1), y: 480 },
            { x: new Date(2012, 11, 1), y: 510 }
        ]
      }
      ]
    });

    chart.render();
  }
  </script>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
  </script>
 <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
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
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-info"><i class="fa-solid fa-user-tie"></i></span>

              <div class="info-box-content" id="feedback">
                <span class="info-box-text">Manager</span>
                <span class="info-box-number" id="managercount"></span>
              </div>
              <!-- /.info-box-content-->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-success"><i class="fa-solid fa-user"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">User</span>
                <span class="info-box-number" id="usercount">></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-warning"><i class="fa-solid fa-user-tie"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Admin</span>
                <span class="info-box-number" id="admincount">></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-3 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-danger"><i class="fa-solid fa-users-gear"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Engineer</span>
                <span class="info-box-number" id="engineercount">></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        
        
        
       
        
        
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3 id="feedcount"></h3>

                <p>Feedback</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="Feedback.jsp" class="small-box-footer">View Details<i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3 id="successcomplaintcount"></h3>

                <p>Sloved Complaints</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="ResolvedComplains.jsp" class="small-box-footer">View Details <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3 id="processcomplaintcount"></h3>

                <p>Process Complaints</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="ProcessComplains.jsp" class="small-box-footer">View Details <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3 id="rejectcomplaintcount"></h3>

                <p>Rejects Complaints</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="RejectedComplains.jsp" class="small-box-footer">View Details <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        
        
        
        
        
			
			<div id="chartContainer" style="height: 370px; width: 100%;">
			
			
			</div>
		</div>
		<!-- ./wrapper -->
		
	</div><%@ include file="../Resources/footer.jsp"%>
	<%@ include file="../Resources/script.jsp"%>
<script type="text/javascript">
		$(document).ready(function() {
			$("#dashboard2").add(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#dashboard1").addClass("menu-open");
				$("#dashboard2").addClass("active");
				$(".heading").text("Manager Dashboard");
			});
			/* $("#profile2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#profile1").addClass("menu-open")
				$("#profile2").addClass("active")
				$(".heading").text("Profile");
				});
			}); */
			/* $("#changepassword2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#changepassword1").addClass("menu-open")
				$("#changepassword2").addClass("active")
				$(".heading").text("Change Password");
				$("#clear").empty();
				$.get("ChangePassword.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#usermanagement2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#usermanagement1").addClass("menu-open")
				$("#usermanagement2").addClass("active")
				$(".heading").text("User Management");
				$("#clear").empty();
				$.get("UserManagement.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#rolemanagement2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#rolemanagement1").addClass("menu-open")
				$("#rolemanagement2").addClass("active")
				$(".heading").text("Role Management");
				$("#clear").empty();
				$.get("RoleManagement.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#customermanagement2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#customermanagement1").addClass("menu-open")
				$("#customermanagement2").addClass("active")
				$(".heading").text("Customer Management");
				$("#clear").empty();
				$.get("CustomerManagement.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#viewcomplaints2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#viewcomplaints1").addClass("menu-open")
				$("#viewcomplaints2").addClass("active")
				$(".heading").text("View Complaints");
				$("#clear").empty();
				$.get("ViewComplaints.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#reports2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#reports1").addClass("menu-open")
				$("#reports2").addClass("active")
				$(".heading").text("Reports");
				$("#clear").empty();
				$.get("Reports.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#feedback2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#feedback1").addClass("menu-open")
				$("#feedback2").addClass("active")
				$(".heading").text("Feedback");
				$("#clear").empty();
				$.get("Feedback.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
			/* $("#logout2").click(function() {
				$("li").removeClass("menu-open");
				$("a").removeClass("active");
				$("#logout1").addClass("menu-open")
				$("#logout2").addClass("active")
				$(".heading").text("Logout");
				$("#clear").empty();
				$.get("Logout.jsp", function(data) {
					$("#clear").append(data);
				});
			}); */
		});
		
		
		/*  */
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"countmanager"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#managercount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"countuser"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#usercount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"countadmin"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#admincount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"countengineer"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#engineercount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"countfeedback"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#feedcount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"successcomplaintcount"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#successcomplaintcount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"processcomplaintcount"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#processcomplaintcount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
		$( document ).ready(function() {
		    console.log( "ready!" );
		    $.ajax({
			url : "../Admin",
			type : 'post',
			data : {action:"rejectcomplaintcount"},
			dataType : "JSON",
			success : function(data,textstatus,jqXHR){
				/* alert(data); */
				$("#rejectcomplaintcount").text(data);
			},
			error : function (data,textStatus,errorThrown){
				alert("failed");
			}
		});
		});
	</script>
	



</body>

</html>
