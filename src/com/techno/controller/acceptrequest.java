package com.techno.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techno.dao.Dao;

/**
 * Servlet implementation class acceptrequest
 */
@WebServlet("/acceptrequest")
public class acceptrequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public acceptrequest() {
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
		String cemail=request.getParameter("confirmemail");
		String cname=request.getParameter("confirmname");
		String batch=request.getParameter("batch");
		String quantity1=null;
		System.out.println("confirm email :- "+cemail);	 
		System.out.println("confirm name :- "+cname);
		String query="select quantity from productdetail where email='"+cemail+"' and ordername='"+cname+"'";
		Dao d=new Dao();
		ResultSet rs=d.executeQuery(query);
		try {
		while(rs.next()){
				quantity1=rs.getString(1);
			}
		 } catch (SQLException e) {
				e.printStackTrace();
			}
		int quan=Integer.parseInt(quantity1);
		String query1="update product set quantity=quantity + '"+quantity1+"' where name='"+cname+"'";
		String query2="delete from productdetail where email='"+cemail+"' and ordername='"+cname+"'";
		String query3="update sp set itemnumber=(itemnumber + 1) where email='"+cemail+"'";
		d.executeUpdate(query1);
		d.executeUpdate(query2);
		d.executeUpdate(query3);
        response.sendRedirect("acceptrequest.jsp");
	}

}
