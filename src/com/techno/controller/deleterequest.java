 package com.techno.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techno.dao.Dao;

/**
 * Servlet implementation class deleterequest
 */
@WebServlet("/deleterequest")
public class deleterequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleterequest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	HttpSession hs=request.getSession();
	String number=null;String q1=null,q2=null;
	String order=null;
	int num;
	String email=hs.getAttribute("email").toString();
	String query="select * from productdetail where email='"+email+"' and status='incomplete'";
	Dao d=new Dao();
	ResultSet rs1=d.executeQuery(query);
	try {
		while(rs1.next()){
			order=rs1.getString(7).toString();
			num=Integer.parseInt(rs1.getString(8).toString());
			q1="update product set quantity=(quantity + "+num+") where name='"+order+"'";
			q2="delete from productdetail where ordername='"+order+"'";
			d.executeUpdate(q1);
			d.executeUpdate(q2);
		}
	} catch (SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	String query1="select itemnumber from sp where email='"+email+"'";
	ResultSet rs=d.executeQuery(query1);
	try {
		while(rs.next()){
			 number=rs.getString(1).toString();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	hs.setAttribute("remain",number);
	response.sendRedirect("student.jsp");
	}
}
