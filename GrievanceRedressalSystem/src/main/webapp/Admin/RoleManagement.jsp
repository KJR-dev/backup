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
      <%@ include file="../Resources/topbar.jsp"%> <%@ include
      file="../Resources/sidebar.jsp"%>
      <div class="content-wrapper">
        <%@ include file="../Resources/header.jsp"%>
        <div class="container-fluid" id="clear">
          </div>
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
             <button
                type="button"
                class="btn btn-default"
                data-toggle="modal"
                data-target="#modal-default"
                id="addroles"
              >
                <i class="fa-solid fa-user">&nbsp ADD ROLE</i>
                  <h5 class="card-title"></h5>
              </button>
                <div
                  class="input-group input-group-sm"
                  style="width: 150px; float: right"
                >
                  <input
                    type="text"
                    name="table_search"
                    class="form-control float-right"
                    placeholder="Search"
                  />

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
                      <th style="text-align: center; width: 300px">Name</th>
                      <th style="text-align: center; width: 80px">Status</th>
                      <th style="text-align: center; width: 0px">Action</th>
                    </tr>
                  </thead>
                  <tbody id="displyrole">
                  </tbody>
                </table>
              </div>
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                  <li class="page-item">
                    <a class="page-link" href="#">&laquo;</a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#">&raquo;</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      
      <!-- start modal 1 code for add role-->
      <form id="addroleform">
              <div class="modal fade" id="modal-default">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Add Role</h4>
                      <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                      >
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>

                    <div class="modal-body">
                      <div class="form-group">
                        <label for="exampleInputName">Role</label>
                        <input
                          type="text"
                          class="form-control"
                          id="exampleInputName1"
                          name="name1"
                          placeholder="Enter role name"
                        />
                      </div>

                      <!-- select -->
                      <div class="form-group">
                        <label>Status</label>
                        <select class="form-control" id="status1" name="status1">
                          <option value="1">Active</option>
                          <option value="0">Deactive</option>
                        </select>
                      </div>
                    </div>
                    <div class="modal-footer justify-content-between">
                      <input
                        type="submit"
                        class="btn btn-primary"
                        value="Add Role"
                        id="add"
                      />
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- end modal 1 code -->
              <input type="hidden" name="action" value="addrole" />
            </form>
        
        
        <!-- start modal 2 code for edit opition -->
        <div class="modal fade" id="modal-edit">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Update Role</h4>
                      <button
                        type="button"
                        class="close"
                        data-bs-dismiss="modal" aria-label="Close"
                      >
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>

                    <div class="modal-body">
                     <form id="updateroleform">
                      <div class="form-group">
                        <label for="exampleInputName2">Role</label>
                        <input
                          type="text"
                          class="form-control"
                          id="exampleInputName2"
                          name="name2"
                          placeholder="Enter role name"
                          value=""
                        />
                      </div>

                      <!-- select -->
                      <div class="form-group">
                        <label>status2</label>
                        <select class="form-control" id="status2" name="status2">
                          <option value="1">Active</option>
                          <option value="0">Deactive</option>
                        </select>
                      </div>
               		<input type="hidden" name="roleId" value="" id="hdnRoleId"/> 						<!-- important 1 -->
               		<input type="hidden" name="action" value="updaterole" id="action"/> 				<!-- important 2 -->
                      <div class="modal-footer justify-content-between">
                      <input
                        type="submit"
                        class="btn btn-primary"
                        value="UPDATE"
                        id="updateRole"
                      />
                     <!--  <button type="button" class="btn-close btn-danger" data-bs-dismiss="modal" aria-label="Close">close</button> -->
                    </div>
                      </form>	<!-- form end -->
                    </div>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- end modal 2 code -->
        

      <!-- ./wrapper -->
      <%@ include file="../Resources/footer.jsp"%>
    </div>
    <%@ include file="../Resources/script.jsp"%>
    <script type="text/javascript">
      $("document").ready(function() {
      					$("li").removeClass("menu-open");
      					$("a").removeClass("active");
      					$("#rolemanagement1").addClass("menu-open");
      					$("#rolemanagement2").addClass("active");
      					$(".heading").text("Role Management");

      					$.ajax({       								/* fetch data for table (sl.no,name,status,action) */
      								url : "../Admin",
      								type : "post",
      								data : {
      									action : "fetchroles",
      								},
      								dataType : "JSON",
      								success : function(data, textStatus,
      										jqXHR) {
      									var status;
      									for (let index = 0; index <= data.length; index++){
      										if(data[index].Status == 1){
      											status="Active";
      										}else{
      											status="Deactive";
      										}
      									$("#displyrole").append('<tr><td style="text-align:center; width: 20px">'+ (index+1) +'</td><td style="text-align:center; width: 300px">'+data[index].Name+'</td><td style="text-align:center; width: 300px">'+status+'</td><td><div class="row"><center><button type="button" class="btn btn-outline-primary mx-5 role-edit" id="'+data[index].Id+'" name="action" value="roleedit">Edit</button></center><button type="button" class="btn btn-outline-danger mx-5 role-delete" id="'+data[index].Id+'" name="action" value="roledelete" >Delete</button> </div></td></tr>');

      									}
      									/* <button type="button" class="btn btn-outline-danger mx-5 role-delete" id="'+data[index].Id+'" name="action" value="roledelete" >Delete</button> */
      									/* var s=val(data[0].name);
      													alert(s);	 */
      								},
      								error : function(data, textStatus,
      										errorThrown) {
      								},
      							});

      				});
    </script>
    
    
    <script type="text/javascript">
      $(document).ready(function () {
        $("#addroleform").on("submit", function (event) {
          event.preventDefault();
          var f = $("#addroleform").serialize();
          console.log(f);
         
          $.ajax({												/* add new role code */
            url: "../Admin",
            type: "POST",
            data: f,
            dataType: "JSON",
            success: function (data, textStatus, jqXHR) {
            	swal({
				    title: "Done!",
				    text: "New Role Successfully Registered!",
				    type: "success"
				}).then(function() {
				    window.location = "RoleManagement.jsp";
				});
            },
            error: function (data, textStatus, errorThrown) {
            	console.log(data);
            	alert("failes Tests");
            	
            },
          });
        });
        
      });
      
      $(document).on("click",'.role-edit', function (event) {
        event.preventDefault();
          var id=$(this).attr('id');
			
          /* alert("ok"); */
          $('#modal-edit').modal('show'); 
         /*  var f = $(".role-edit").serialize(); */
          $.ajax({									/* fetch data for role name and status  in edit form */
        	  url : "../Admin",
        	  type : "post",
          	data: {action : "fetchrole",id : id},
          	dataType : "json",
          	success: function (data, textStatus, jqXHR) {
          		$("#exampleInputName2").val(data[0].Name);
          		$("#status2").val(data[0].Status); 
          		$("#hdnRoleId").val(id);
          		
            },
            error: function (data, textStatus, errorThrown) {
            	alert("failes");
            },
          });
          
  	});

			$("#updateroleform").on("submit",function(event){
				event.preventDefault();
				var f=$(this).serialize();

	  			$.ajax({
	  				url : "../Admin",
	  				type : "post",
	  				data : f,
	  				dataType : "json",
	  				success : function(data,textStatus,jqXhr){
	  					swal({
						    title: "Done!",
						    text: "Your Role Edit Successful!",
						    type: "success"
						}).then(function() {
						    window.location = "RoleManagement.jsp";
						});

	  				},
	  				error : function(data,textstatus,errorThrown){
	  					console.log("faild");
	  				}
	  			});
			});

      $(document).on("click",'.role-delete', function (event){
    	  event.preventDefault();
		var id=$(this).attr("id");
		/* alert(id); */
         $.ajax({									
       	  url : "../Admin",
       	  type : "post",
         	data: {action : "deleterole",id : id},
         	dataType : "json",
         	success: function (data, textStatus, jqXHR) {
         		swal({
				    title: "Done!",
				    text: "Your Role Delete Successful!",
				    type: "success"
				}).then(function() {
				    window.location = "RoleManagement.jsp";
				});
           },
           error: function (data, textStatus, errorThrown) {
           	alert("failes");
           }
	});
      });
      
    </script>
  </body>
</html>

