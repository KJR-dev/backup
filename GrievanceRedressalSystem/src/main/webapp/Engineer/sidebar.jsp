<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="UserDashboard.jsp" class="brand-link"> <!-- <img
            src="dist/img/AdminLTELogo.png"
            alt="AdminLTE Logo"
            class="brand-image img-circle elevation-3"
            style="opacity: 0.8"
          /> --> <span class="brand-text font-weight-light">Grievance
			Redressal System</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="../Image/<% out.print(session.getAttribute("user_image"));  %>"
					class="img-circle elevation-2" alt="User Image" />
			</div>
			<div class="info">
				<a href="#" class="d-block"><% out.println(session.getAttribute("username")); %></a>
			</div>
		</div>
		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item " id="dashboard1"><a
					href="EngineerDashboard.jsp" class="nav-link " id="dashboard2"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>Dashboard</p>
				</a></li>
				<li class="nav-item" id="profile1"><a href="Profile.jsp"
					class="nav-link" id="profile2"> <i class="nav-icon fa fa-user"
						id="profile3"></i>
						<p>Profile</p>
				</a></li>
				</a>
				</li>

				<!-- <li class="nav-item" id="raiseticket1"><a
					href="RaiseTicket.jsp" class="nav-link" id="raiseticket2"> <i class="nav-icon fas fa-th"></i>
						<i class="fa-solid fa-sitemap mx-2"></i>
						<p>Raise Ticket</p>
				</a></li> -->

				<li class="nav-item" id="viewcomplains1"><a
					href="ViewComplains.jsp" class="nav-link" id="viewcomplains2">
						<!-- <i class="nav-icon fas fa-th"></i> --> <i
						class="fa-solid fa-user-tie mx-2 "></i>
						<p>View Complains</p>
				</a></li>

				<li class="nav-item" id="reports1"><a
					href="Javascript.void(0);" class="nav-link" id="reports2"> <!-- <i class="nav-icon fas fa-tachometer-alt"></i> -->
					<i class="fa-solid fa-bug mx-2"></i>
						<p>
							Reports <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item" id="resolvedcomplains1"><a
							href="ResolvedComplains.jsp" class="nav-link"
							id="resolvedcomplains2"> <!-- <i class="far fa-circle nav-icon"></i> -->
								<p>Resolved Complains</p>
						</a></li>
						<li class="nav-item" id="pendingcomplains1"><a
							href="PendingComplains.jsp" class="nav-link"
							id="pendingcomplains2"> <!-- <i class="far fa-circle nav-icon"></i> -->
								<p>Pending Complains</p>
						</a></li>
						<li class="nav-item" id="Processcomplains1"><a
							href="ProcessComplains.jsp" class="nav-link"
							id="Processcomplains2"> <!-- <i class="far fa-circle nav-icon"></i> -->
								<p>Process Complains</p>
						</a></li>
						<li class="nav-item" id="rejectedcomplains1"><a
							href="RejectedComplains.jsp" class="nav-link"
							id="rejectedcomplains2"> <!-- <i class="far fa-circle nav-icon"></i> -->
								<p>Rejected Complains</p>
						</a></li>
						<li class="nav-item" id="revertComplains1"><a
							href="RevertComplaints.jsp" class="nav-link"
							id="revertComplains2"> <!-- <i class="far fa-circle nav-icon"></i> -->
								<p>Revert Complains</p>
						</a></li>
					</ul></li>
				<!-- <li class="nav-item" id="feedback1"><a href="Feedback.jsp"
					class="nav-link" id="feedback2"> <i class="nav-icon fas fa-th"></i>
						<i class="fa-solid fa-comment mx-2"></i>
						<p>Feedback</p>
				</a></li> -->

				<li class="nav-item" id="logout1"><a href="Logout.jsp"
					class="nav-link" id="logout2"> <!-- <i class="nav-icon fas fa-th"></i> -->
						<i class="fa-solid fa-arrow-right-from-bracket mx-2"></i>
						<p>Logout</p>
				</a></li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->


	</div>
	<!-- /.sidebar -->
</aside>