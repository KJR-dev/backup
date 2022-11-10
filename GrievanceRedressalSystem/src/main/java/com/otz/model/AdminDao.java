package com.otz.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.AdminBean;

public class AdminDao {
	public static boolean admin(AdminBean admin) {
		boolean status = false;

		try {
			Connection con = DBUtil.getconnection();
			String sql = "select * from uld where UserName=? and Password=? and Role_id=2";
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, admin.getUsername());
			stmt.setString(2, admin.getPassword());
			ResultSet rs = stmt.executeQuery();
			status = rs.next();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public List<AdminBean> getAdmins(String username) {
		ArrayList<AdminBean> adminlists = new ArrayList<AdminBean>();
		try {
			Connection con = DBUtil.getconnection();
			String sql = "select * from uld where username=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AdminBean admins = new AdminBean();
				admins.setId(rs.getInt("Id"));
				admins.setName(rs.getString("Name"));
				admins.setUsername(rs.getString("UserName"));
				admins.setPassword(rs.getString("Password"));
				admins.setMobile(rs.getString("Mobile"));
				admins.setRole_id(rs.getInt("Role_id"));
				admins.setAddress(rs.getString("Address"));
				admins.setPincode(rs.getString("Pincode"));
				admins.setImg_profile(rs.getString("Image"));
				adminlists.add(admins);
			}
			con.close();
			ps.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		return adminlists;
	}

	public int updateadmin(AdminBean admin) {
		// TODO Auto-generated method stub
		System.out.println();
		int status = 0;
		try {
			Connection con = DBUtil.getconnection();
			String sql = "update uld set address=?,pincode=?,Image=? where username=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, admin.getAddress());
			ps.setString(2, admin.getPincode());
			ps.setString(3, admin.getImg_profile());
			ps.setString(4, admin.getUsername());
			ps.setString(5, admin.getPassword());
			
		
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	public int changepassword(AdminBean admin) {
		// TODO Auto-generated method stub
		int status = 0;
//		System.out.println("username "+admin.getUsername());
//		System.out.println("old password "+admin.getPassword());
//		System.out.println("new password "+admin.getConfirm_password());
		try {
			Connection con = DBUtil.getconnection();
			String sql = "update uld set password=? where username=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, admin.getConfirm_password());
			ps.setString(2, admin.getUsername());
			ps.setString(3, admin.getPassword());
			status = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;

	}

	public int countfeedback() {
		// TODO Auto-generated method stub
		int temp=0;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Token) as feedcount from feedback;";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("feedcount");
			}
//			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int countmanager() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=4;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Role_id) as managercount from uld where Role_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("managercount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int countuser() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=1;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Role_id) as usercount from uld where Role_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("usercount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int countadmin() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=2;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Role_id) as admincount from uld where Role_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("admincount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int countengineer() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=3;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Role_id) as engineercount from uld where Role_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("engineercount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int successcomplaintcount() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=3;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as successcount from Complaints_table where Comp_status=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("successcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int processcomplaintcount() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=2;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as processcount from Complaints_table where Comp_status=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("processcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}

	public int rejectcomplaintcount() {
		// TODO Auto-generated method stub
		int temp=0;
		int a=4;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as rejectcount from Complaints_table where Comp_status=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("rejectcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}
	
}
