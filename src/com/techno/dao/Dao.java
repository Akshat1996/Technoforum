package com.techno.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.techno.model.FormRegisterModel;

public class Dao {

	/**
	 * @param args
	 */
    static ResultSet rs;
    static int count=0;
    static String duplicateemail=null; 
	static Connection con=null;
	static String drivername="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/bias";
	static String username="root";
	static String password="nopassword";
	
	static{
	    
	    try {
	    	Class.forName(drivername);
			con=DriverManager.getConnection(url,username,password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String insertData(FormRegisterModel obj,String query){
		
		try {
			duplicateemail=obj.getEmail();
			String duplicateroll=obj.getRollnumber();
			String de=obj.getDesignation();
			String query3=null,query4=null;
			ResultSet rs1=null;
			System.out.println(duplicateemail);
			count=0;int count1=0;
			if(de.equals("admin")){
			query3="select * from ap where email='"+duplicateemail+"'";}
			if(de.equals("member")){
			query3="select * from mp where email='"+duplicateemail+"'";}
			if(de.equals("student")){
			query3="select * from sp where email='"+duplicateemail+"'";}
			PreparedStatement ps1=con.prepareStatement(query3);
			rs=ps1.executeQuery();
			while(rs.next()){
				count++;
			}
			if(count==0){
				if(de.equals("admin")){
					query4="select * from ap where rollnumber='"+duplicateroll+"'";}
				if(de.equals("member")){
					query4="select * from mp where rollnumber='"+duplicateroll+"'";}
				if(de.equals("student")){
					query4="select * from sp where rollnumber='"+duplicateroll+"'";}
				PreparedStatement ps3=con.prepareStatement(query4);
				rs1=ps3.executeQuery();
				while(rs1.next()){
					count1++;
				}
				if(count1==0){
			PreparedStatement ps2=con.prepareStatement(query);
			ps2.setString(1,obj.getEmail());
			ps2.setString(2,obj.getRollnumber());
			ps2.setString(3,obj.getPassword());
			ps2.setString(4,obj.getName());
			ps2.setString(5,obj.getCourse());
			ps2.setString(6,obj.getBranch());
			ps2.setString(7,obj.getBatch());
			ps2.setString(8,obj.getContact());
			ps2.setString(9,obj.getDesignation());
			ps2.executeUpdate();			
			return "success";
				}
				else{
					return "droll";
				}
			}else{
				return "demail";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";	
		}
	
	public void executeUpdate(String query){
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet executeQuery(String query){
		try {
			PreparedStatement ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
		
	}
	
	public ResultSet FetchStudentProfile(String query){
		
				
	try {
		PreparedStatement ps=con.prepareStatement(query);
		rs=ps.executeQuery();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}	
		return rs;
		
	}
	public String insertAdminData(FormRegisterModel obj,String query){
		
		try {
			duplicateemail=obj.getEmail();
			count=0;
			PreparedStatement ps1=con.prepareStatement("select * from ap where email='"+duplicateemail+"'");
			rs=ps1.executeQuery();
			while(rs.next()){
				count++;
			}
			if(count==0){
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,obj.getName());
			ps.setString(2,obj.getEmail());
			ps.setString(3,obj.getPassword());
			ps.setString(4,obj.getContact());
			ps.setString(5,obj.getDesignation());
			ps.executeUpdate();
				return "success";
			}else{
				return "fail";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";	
		}

	public String insertManagerData(FormRegisterModel obj,String query){
		
		try {
			duplicateemail=obj.getEmail();
			count=0;
			PreparedStatement ps1=con.prepareStatement("select * from mp where email='"+duplicateemail+"'");
			rs=ps1.executeQuery();
			while(rs.next()){
				count++;
			}
			if(count==0){
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,obj.getName());
			ps.setString(2,obj.getEmail());
			ps.setString(3,obj.getPassword());
			ps.setString(4,obj.getContact());
			ps.setString(5,obj.getDesignation());
		    ps.executeUpdate();
				return "success";
			}else{
				return "fail";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";	
		}
	
	
	
}