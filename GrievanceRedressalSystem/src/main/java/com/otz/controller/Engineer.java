package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.ComplaintBean;
import com.otz.model.ComplaintDao;
import com.otz.model.EngineerDao;
import com.otz.model.UserDao;

/**
 * Servlet implementation class Engineer
 */
public class Engineer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Engineer() {
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
//		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
//		String username=(String)session.getAttribute("username");  
//		String password=(String)session.getAttribute("password");  
		String action = request.getParameter("action");
//		System.out.println(username);
//		System.out.println(password);
		System.out.println(action);
		PrintWriter out = response.getWriter();
		if (action.equals("get_All_Complaint")) {
			String username = (String) session.getAttribute("username");
//			String password=(String)session.getAttribute("password"); 
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_engineer_task(e_id);
			System.out.println(complaintlist);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("get_All_Pending_Complains_engineer")) {
			String username = (String) session.getAttribute("username");
//			String password=(String)session.getAttribute("password"); 
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_pending_engineer_task(e_id);
			System.out.println(complaintlist);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("makeProcess")) {
			String username = (String) session.getAttribute("username");
			String pincode = request.getParameter("pincode");
//			System.out.println(pincode);
//			String password=(String)session.getAttribute("password"); 
//			EngineerDao engineer = new EngineerDao();
//			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			int temp = complaint.makeComplaintProcess(pincode);
			out.print(temp);
		} else if (action.equals("get_All_Process_Complains_engineer")) {
			String username = (String) session.getAttribute("username");
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_process_engineer_task(e_id);
			System.out.println(complaintlist);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("Solved")) {
			String username = (String) session.getAttribute("username");
			String pincode = request.getParameter("pincode");
			ComplaintDao complaint = new ComplaintDao();
			int temp = complaint.makeComplaintSolved(pincode);
			out.print(temp);
		} else if (action.equals("get_All_Resolved_Complains_engineer")) {
			String username = (String) session.getAttribute("username");
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_Resolved_engineer_task(e_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("Reject")) {
			String token = request.getParameter("token");
			String remark = request.getParameter("txtRemark");
			ComplaintDao complaint = new ComplaintDao();
			int temp = complaint.makeComplaintReject(token, remark);
			out.print(temp);
		} else if (action.equals("get_All_Rejected_Complains_engineer")) {
			String username = (String) session.getAttribute("username");
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_Rejected_engineer_task(e_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("get_All_Revert_Complains_engineer")) {
			String username = (String) session.getAttribute("username");
			EngineerDao engineer = new EngineerDao();
			int e_id = engineer.get_engineer_id(username);
			ComplaintDao complaint = new ComplaintDao();
			List<ComplaintBean> complaintlist = complaint.get_all_Revert_engineer_task(e_id);
			GsonBuilder gsonBuilder = new GsonBuilder();
			Gson gson = gsonBuilder.create();
			String JSONObject = gson.toJson(complaintlist);
			out.print(JSONObject);
		} else if (action.equals("RevertTask")) {
			String token = request.getParameter("token");
			String remark = request.getParameter("txtRemark");
			ComplaintDao complaint = new ComplaintDao();
			int temp = complaint.makeComplaintRevert(token, remark);
			out.print(temp);
		} else if (action.equals("pendingcomplaintcount")) {
			String username = (String) session.getAttribute("username");
			EngineerDao u = new EngineerDao();
			int u_id = u.get_engineer_id(username);
			int status = u.pendingcomplaintcount(u_id);
			out.print(status);
		} else if (action.equals("successcomplaintcount")) {
			String username = (String) session.getAttribute("username");
			EngineerDao u = new EngineerDao();
			int u_id = u.get_engineer_id(username);
			int status = u.successcomplaintcount(u_id);
			out.print(status);
		} else if (action.equals("processcomplaintcount")) {
			String username = (String) session.getAttribute("username");
			EngineerDao u = new EngineerDao();
			int u_id = u.get_engineer_id(username);
			int status = u.processcomplaintcount(u_id);
			out.print(status);
		} else if (action.equals("rejectcomplaintcount")) {
			String username = (String) session.getAttribute("username");
			EngineerDao u = new EngineerDao();
			int u_id = u.get_engineer_id(username);
			int status = u.rejectcomplaintcount(u_id);
			out.print(status);
		}

	}

}
