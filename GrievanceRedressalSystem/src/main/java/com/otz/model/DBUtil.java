package com.otz.model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	
	static Connection getconnection() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/GRS","root","Jitu@135050");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return con;
	}
	public static String getImgPath() {
		String path="/Users/jitendrasahoo/eclipse-workspace/GrievanceRedressalSystem/src/main/webapp/Image";
		return path;
	}
}
