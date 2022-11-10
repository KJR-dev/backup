package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.AdminBean;
import com.otz.bean.ComplaintBean;
import com.otz.bean.RoleBean;
import com.otz.bean.TempBean;
import com.otz.bean.UserBean;
import com.otz.model.AdminDao;
import com.otz.model.ComplaintDao;
import com.otz.model.DBUtil;
import com.otz.model.RoleDao;
import com.otz.model.UserDao;
import javax.servlet.http.Part;
/**
 * Servlet implementation class Admin
 */

@MultipartConfig(maxFileSize = 1024 * 1024 * 2)

public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		String username = (String) session.getAttribute("username");
		String password = (String) session.getAttribute("password");
		String action = request.getParameter("action");
		AdminBean adminbean = new AdminBean();
		AdminDao admindao = new AdminDao();
//		System.out.print(username);
//		System.out.print(password);
		System.out.println(action);
		
		if (action.equals("admingetdata")) {
			AdminDao obj = new AdminDao();
			List<AdminBean> admins = obj.getAdmins(username);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(admins);
			/*
			 * Gson prettyGson= new GsonBuilder().setPrettyPrinting().create(); String
			 * prettyJson = prettyGson.toJson(products);
			 */
			out.print(JSONObject);

		} else if (action.equals("usersetdata")) {
			String paddress = request.getParameter("paddress");
			String ppincode = request.getParameter("ppincode");
			
			
			Part p1=request.getPart("pphoto");
			
	        String appPath =DBUtil.getImgPath();
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	       // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	        //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        System.out.println(finalImgPath1);
	        if(validateImage1(imageName1)){
	            try{
	                p1.write(imagePath + "/" + imgname1);
	              
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	        	
	            out.print("<script> alert('Invalid Image Format')</script>");
	        }
			
			
			
			
			
			
			
//			System.out.print(paddress);
//			System.out.print(ppincode);
			adminbean.setUsername(username);
			adminbean.setPassword(password);
			adminbean.setAddress(paddress);
			adminbean.setPincode(ppincode);
			adminbean.setImg_profile(imgname1);
			session.removeAttribute("user_image");
			session.setAttribute("user_image", imgname1);
			int status = admindao.updateadmin(adminbean);
			response.sendRedirect("User/EditProfile.jsp?message=Your Profile Edit Successfully");  
//			out.print(status);
//			out.print("<script> swal({\n"
//					+ "						    title: \"Done!\",\n"
//					+ "						    text: \"Your Profile Edit Successful!\",\n"
//					+ "						    type: \"success\"\n"
//					+ "						}).then(function() {\n"
//					+ "						    window.location = \"Profile.jsp\";\n"
//					+ "						}); </script>");
			
		}
		
		
		else if (action.equals("adminsetdata")) {
			String paddress = request.getParameter("paddress");
			String ppincode = request.getParameter("ppincode");
			
			
			Part p1=request.getPart("pphoto");
			
	        String appPath =DBUtil.getImgPath();
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	       // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	        //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        System.out.println(finalImgPath1);
	        if(validateImage1(imageName1)){
	            try{
	                p1.write(imagePath + "/" + imgname1);
	              
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	        	
	            out.print("<script> alert('Invalid Image Format')</script>");
	        }
			
			
			
			
			
			
			
//			System.out.print(paddress);
//			System.out.print(ppincode);
			adminbean.setUsername(username);
			adminbean.setPassword(password);
			adminbean.setAddress(paddress);
			adminbean.setPincode(ppincode);
			adminbean.setImg_profile(imgname1);
			session.removeAttribute("user_image");
			session.setAttribute("user_image", imgname1);
			int status = admindao.updateadmin(adminbean);
			response.sendRedirect("Admin/EditProfile.jsp?message=Your Profile Edit Successfully");  
//			out.print(status);
//			out.print("<script> swal({\n"
//					+ "						    title: \"Done!\",\n"
//					+ "						    text: \"Your Profile Edit Successful!\",\n"
//					+ "						    type: \"success\"\n"
//					+ "						}).then(function() {\n"
//					+ "						    window.location = \"Profile.jsp\";\n"
//					+ "						}); </script>");
			
		}
		
		
		else if (action.equals("engineersetdata")) {
			String paddress = request.getParameter("paddress");
			String ppincode = request.getParameter("ppincode");
			
			
			Part p1=request.getPart("pphoto");
			
	        String appPath =DBUtil.getImgPath();
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	       // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	        //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        System.out.println(finalImgPath1);
	        if(validateImage1(imageName1)){
	            try{
	                p1.write(imagePath + "/" + imgname1);
	              
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	        	
	            out.print("<script> alert('Invalid Image Format')</script>");
	        }
			
			
			
			
			
			
			
//			System.out.print(paddress);
//			System.out.print(ppincode);
			adminbean.setUsername(username);
			adminbean.setPassword(password);
			adminbean.setAddress(paddress);
			adminbean.setPincode(ppincode);
			adminbean.setImg_profile(imgname1);
			session.removeAttribute("user_image");
			session.setAttribute("user_image", imgname1);
			int status = admindao.updateadmin(adminbean);
			response.sendRedirect("Engineer/EditProfile.jsp?message=Your Profile Edit Successfully");  
//			out.print(status);
//			out.print("<script> swal({\n"
//					+ "						    title: \"Done!\",\n"
//					+ "						    text: \"Your Profile Edit Successful!\",\n"
//					+ "						    type: \"success\"\n"
//					+ "						}).then(function() {\n"
//					+ "						    window.location = \"Profile.jsp\";\n"
//					+ "						}); </script>");
			
		}
		
		else if (action.equals("managersetdata")) {
			String paddress = request.getParameter("paddress");
			String ppincode = request.getParameter("ppincode");
			
			
			Part p1=request.getPart("pphoto");
			
	        String appPath =DBUtil.getImgPath();
	        // File path where all files will be stored
	        String imagePath = appPath + "";
	       // Creates the file directory if it does not exists
	        File fileDir = new File(imagePath);
	        if (!fileDir.exists()) {
	            fileDir.mkdirs();
	        }
	        //Get Image Name
	        String imageName1 = p1.getSubmittedFileName();
	        System.out.println(imageName1);
	        String fileExt1 = imageName1.substring(imageName1.length()-3);
	        String imgname1=new Date().getTime() +"1"+"."+fileExt1;
	        String finalImgPath1=imagePath + "/"+ imgname1;
	        System.out.println(finalImgPath1);
	        if(validateImage1(imageName1)){
	            try{
	                p1.write(imagePath + "/" + imgname1);
	              
	                //out.print("<img src=\"images/"+imageName+"\" >");
	            }catch (Exception ex) {
	                //out.print("<h1>"+ex.getMessage()+"</h1>");
	            }
	        }else{
	        	
	            out.print("<script> alert('Invalid Image Format')</script>");
	        }
			
			
			
			
			
			
			
//			System.out.print(paddress);
//			System.out.print(ppincode);
			adminbean.setUsername(username);
			adminbean.setPassword(password);
			adminbean.setAddress(paddress);
			adminbean.setPincode(ppincode);
			adminbean.setImg_profile(imgname1);
			session.removeAttribute("user_image");
			session.setAttribute("user_image", imgname1);
			int status = admindao.updateadmin(adminbean);
			response.sendRedirect("Admin/EditProfile.jsp?message=Your Profile Edit Successfully");  
//			out.print(status);
//			out.print("<script> swal({\n"
//					+ "						    title: \"Done!\",\n"
//					+ "						    text: \"Your Profile Edit Successful!\",\n"
//					+ "						    type: \"success\"\n"
//					+ "						}).then(function() {\n"
//					+ "						    window.location = \"Profile.jsp\";\n"
//					+ "						}); </script>");
			
		}
		
		
		

		else if (action.equals("adminchangepassword")) {
//			String new_password = request.getParameter("password");
			String confirm_password = request.getParameter("confirmPassword");
//			System.out.println(new_password);
//			System.out.println(confirm_password);
			adminbean.setUsername(username);
			adminbean.setPassword(password);
			adminbean.setConfirm_password(confirm_password);
			int status = admindao.changepassword(adminbean);
			out.print(status);
		} else if (action.equals("fetchroles")) {
			RoleDao role = new RoleDao();
			List<RoleBean> roleslist = role.getRoles();
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(roleslist);
			out.print(JSONObject);

		} else if (action.equals("addrole")) {
			String name = request.getParameter("name1");
			int status = Integer.parseInt(request.getParameter("status1"));
			System.out.println(name);
			System.out.println(status);
			RoleBean setdata = new RoleBean();
			setdata.setName(name);
			setdata.setStatus(status);
			RoleDao set = new RoleDao();
			int temp = set.setRole(setdata);
			out.print(temp);

		} else if (action.equals("fetchrole")) {
			int id = Integer.parseInt(request.getParameter("id"));
			RoleDao role = new RoleDao();
			List<RoleBean> rolelist = role.getRole(id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(rolelist);
			out.print(JSONObject);

		} else if (action.equals("updaterole")) {
			String name = request.getParameter("name2");
			int status = Integer.parseInt(request.getParameter("status2"));
			int id = Integer.parseInt(request.getParameter("roleId"));
			RoleBean role = new RoleBean();
			role.setName(name);
			role.setStatus(status);
			role.setId(id);
			RoleDao update = new RoleDao();
			int temp = update.updaterole(role);
			out.print(temp);

		} else if (action.equals("deleterole")) {
			int id = Integer.parseInt(request.getParameter("id"));
			RoleBean role = new RoleBean();
			role.setId(id);
			RoleDao delete = new RoleDao();
			int status = delete.deleterole(role);
			out.print(status);

		} else if (action.equals("getalluser")) {
			UserDao role = new UserDao();
			List<TempBean> userlist = role.getAllUser();
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(userlist);
			out.print(JSONObject);

		} else if (action.equals("fetchuser")) {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDao user = new UserDao();
			List<UserBean> rolelist = user.getUser(id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(rolelist);
			out.print(JSONObject);

		} else if (action.equals("changeuser")) {
			int id = Integer.parseInt(request.getParameter("userid"));
			String Name = request.getParameter("txtname");
			String Email = request.getParameter("txtemail");
			String Mobile = request.getParameter("txtmobile");
			String Password = request.getParameter("txtpassword");
			int Roleid = Integer.parseInt(request.getParameter("txtrole"));
			String Address = request.getParameter("txtaddress");
			String Pincode = request.getParameter("txtpincode");
			int Status = Integer.parseInt(request.getParameter("txtstatus"));
			UserBean user = new UserBean();
			user.setId(id);
			user.setName(Name);
			user.setUsername(Email);
			user.setMobile(Mobile);
			user.setPassword(Password);
			user.setRole_id(Roleid);
			user.setAddress(Address);
			user.setPincode(Pincode);
			user.setStatus(Status);
			UserDao userdata = new UserDao();
			int temp = userdata.setUserData(user);
			out.print(temp);
		}

		else if (action.equals("adduserdata")) {
			int Roleid = 1;
			String Name = request.getParameter("Name");
			String Email = request.getParameter("UserName");
			String Mobile = request.getParameter("Mobile");
			String Password = request.getParameter("Password");
			String Address = request.getParameter("Address");
			String Pincode = request.getParameter("Pincode");
			int Status = Integer.parseInt(request.getParameter("RoleStatus"));
			System.out.println(Name);
			UserBean user = new UserBean();
			user.setName(Name);
			user.setUsername(Email);
			user.setMobile(Mobile);
			user.setPassword(Password);
			user.setRole_id(Roleid);
			user.setAddress(Address);
			user.setPincode(Pincode);
			user.setStatus(Status);
			UserDao userdata = new UserDao();
			int temp = userdata.setNewUserData(user);
			out.print(temp);

		} else if (action.equals("Adduserdata")) {
			String Name = request.getParameter("Name");
			String Email = request.getParameter("UserName");
			String Mobile = request.getParameter("Mobile");
			String Password = request.getParameter("Password");
			String Address = request.getParameter("Address");
			String Pincode = request.getParameter("Pincode");
			int Status = Integer.parseInt(request.getParameter("RoleStatus"));
			int Roleid = Integer.parseInt(request.getParameter("RoleType"));
			System.out.println(Name);
			UserBean user = new UserBean();
			user.setName(Name);
			user.setUsername(Email);
			user.setMobile(Mobile);
			user.setPassword(Password);
			user.setRole_id(Roleid);
			user.setAddress(Address);
			user.setPincode(Pincode);
			user.setStatus(Status);
			UserDao userdata = new UserDao();
			int temp = userdata.setNewUserData(user);
			if (temp > 0) {
				out.print(temp);
			}

		} else if (action.equals("delete_user_data")) {
			int id = Integer.parseInt(request.getParameter("id"));
			UserDao user = new UserDao();
			int temp = user.deleteuser(id);
			out.print(temp);

		} else if (action.equals("get_all_complaint_name")) {
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.getComplaintsName();
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);

		} else if (action.equals("add_complaint")) {
			String name = request.getParameter("name1");
			int status = Integer.parseInt(request.getParameter("status1"));
			ComplaintBean set_Complaint = new ComplaintBean();
			set_Complaint.setC_Name(name);
			set_Complaint.setC_Status(status);
			ComplaintDao settemp = new ComplaintDao();
			int temp = settemp.set_complaint(set_Complaint);
			out.print(temp);

		} else if (action.equals("delete_complaint_type")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ComplaintDao deletecomplaint = new ComplaintDao();
			int temp = deletecomplaint.deleteComplaintType(id);
			out.print(temp);

		} else if (action.equals("fetch_complaint")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ComplaintDao getdata = new ComplaintDao();
			List<ComplaintBean> fetchdata = getdata.fetchComplaint(id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(fetchdata);
			out.print(JSONObject);

		} else if (action.equals("update_complaint")) {
			int id = Integer.parseInt(request.getParameter("Complaint_Id"));
			String name = request.getParameter("set_complaint_name");
			int status = Integer.parseInt(request.getParameter("set_complaint_status"));
			ComplaintBean complaint = new ComplaintBean();
			complaint.setC_Id(id);
			complaint.setC_Name(name);
			complaint.setC_Status(status);
			ComplaintDao data = new ComplaintDao();
			int temp = data.update_complaint(complaint);
			out.print(temp);
		} else if (action.equals("add_new_catagory")) {
			String name = request.getParameter("set_catagory_name");
			int status = Integer.parseInt(request.getParameter("set_catagory_status"));
			int id = Integer.parseInt(request.getParameter("Catagory_Id"));
			System.out.println(id);
			ComplaintBean catagory = new ComplaintBean();
			catagory.setC_Name(name);
			catagory.setC_Status(status);
			catagory.setC_Id(id);
			ComplaintDao set_catagory = new ComplaintDao();
			int temp = set_catagory.setNewCatagory(catagory);
			out.print(temp);
		} else if (action.equals("fetch_all_complaint_catagory")) {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			ComplaintDao getdata = new ComplaintDao();
			List<ComplaintBean> fetchdata = getdata.fetchAllComplaintData(id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(fetchdata);
			out.print(JSONObject);
		} else if (action.equals("status_change_to_zero")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ComplaintDao status = new ComplaintDao();
			int temp = status.change_Status_To_Zero(id);
			out.print(temp);
		} else if (action.equals("status_change_to_one")) {
			int id = Integer.parseInt(request.getParameter("id"));
			ComplaintDao status = new ComplaintDao();
			int temp = status.change_Status_To_One(id);
			out.print(temp);
		} else if (action.equals("get_all_feedback")) {
			ComplaintDao c = new ComplaintDao();
			List<ComplaintBean> fetchdata = c.get_all_feedback();
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(fetchdata);
			out.print(JSONObject);
		} else if (action.equals("get_all_customers")) {
			int customer_id = 1;
			UserDao u = new UserDao();
			List<TempBean> lists = u.getAllUser(customer_id);
//			for (int i = 0; i < lists.size(); i++) 
//	            System.out.print(lists.get(i) + " ");
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(lists);
			out.print(JSONObject);
		} else if (action.equals("get_all_engineers")) {
			String pincode = request.getParameter("pincode");
			System.out.println(pincode);
			UserDao u = new UserDao();
			List<UserBean> lists = u.get_all_engineers(pincode);
//			for (int i = 0; i < lists.size(); i++) 
//	            System.out.print(lists.get(i) + " ");
//			System.out.println(lists);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(lists);
			out.print(JSONObject);
		} else if (action.equals("fetch_all_engineers")) {
			UserDao u = new UserDao();
			List<UserBean> lists = u.fetch_all_engineers();
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(lists);
			out.print(JSONObject);

		} else if (action.equals("set_engineer_task")) {
			String token = request.getParameter("Token_id");
			int id = Integer.parseInt(request.getParameter("engineer_id"));
			UserDao u = new UserDao();
			int status = u.set_engineer_task(token, id);
			out.print(status);
		}
//			
		else if (action.equals("countmanager")) {
			AdminDao u = new AdminDao();
			int status = u.countmanager();
			out.print(status);
		} else if (action.equals("countuser")) {
			AdminDao u = new AdminDao();
			int status = u.countuser();
			out.print(status);
		} else if (action.equals("countadmin")) {
			AdminDao u = new AdminDao();
			int status = u.countadmin();
			out.print(status);
		}else if (action.equals("countengineer")) {
		AdminDao u = new AdminDao();
		int status = u.countengineer();
		out.print(status);
	}else if (action.equals("countfeedback")) {
		AdminDao u=new AdminDao();
		int status=u.countfeedback();
		out.print(status);
	}else if (action.equals("successcomplaintcount")) {
		AdminDao u=new AdminDao();
		int status=u.successcomplaintcount();
		out.print(status);
	}else if (action.equals("processcomplaintcount")) {
		AdminDao u=new AdminDao();
		int status=u.processcomplaintcount();
		out.print(status);
	}else if (action.equals("rejectcomplaintcount")) {
		AdminDao u=new AdminDao();
		int status=u.rejectcomplaintcount();
		out.print(status);
	}

	}
	private boolean validateImage1(String imageName1){
        String fileExt1 = imageName1.substring(imageName1.length()-3);
        if("jpg".equals(fileExt1) || "png".equals(fileExt1) || "JPG".equals(fileExt1) || "PNG".equals(fileExt1))
            return true;
        return false;
    }
}
