package com.otz.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.otz.bean.EngineerBean;

public class EngineerDao {
	public static boolean engineer(EngineerBean u) {
		boolean status = false;
		try {

			Connection con = DBUtil.getconnection();
			String sql = "select * from uld where UserName=? and Password=? and Role_id=3";
			PreparedStatement stmt = con.prepareStatement(sql);
//			stmt.setString(1, u.getUsername());
//			stmt.setString(2, u.getPassword());
			ResultSet rs = stmt.executeQuery();
			status = rs.next();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}
	public int get_engineer_id(String username) {
		// TODO Auto-generated method stub
		int id = 0;
		try {
			Connection con = DBUtil.getconnection();
			String sql = "select Id from uld where UserName=? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			rs.next();
			id = rs.getInt("Id");
			System.out.println(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	public int pendingcomplaintcount(int u_id) {
		// TODO Auto-generated method stub
		int temp=0;
		int a=1;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as pendingcount from Complaints_table where Comp_status=? and Engineer_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setInt(2, u_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("pendingcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}
	public int successcomplaintcount(int u_id) {
		// TODO Auto-generated method stub
		int temp=0;
		int a=3;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as pendingcount from Complaints_table where Comp_status=? and Engineer_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setInt(2, u_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("pendingcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}
	public int processcomplaintcount(int u_id) {
		// TODO Auto-generated method stub
		int temp=0;
		int a=2;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as pendingcount from Complaints_table where Comp_status=? and Engineer_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setInt(2, u_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("pendingcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}
	public int rejectcomplaintcount(int u_id) {
		// TODO Auto-generated method stub
		int temp=0;
		int a=4;
		try {
			
			Connection con=DBUtil.getconnection();
			String sql="select count(Comp_status) as pendingcount from Complaints_table where Comp_status=? and Engineer_id=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, a);
			ps.setInt(2, u_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				temp=rs.getInt("pendingcount");
			}
			System.out.println(temp);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return temp;
	}
}
