package com.techno.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techno.dao.Dao;

/**
 * Servlet implementation class completerequest
 */
@WebServlet("/completerequest")
public class completerequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public completerequest() {
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
		
	String email=hs.getAttribute("email").toString(); 
	String remaining=hs.getAttribute("remain").toString();
	String query1="update sp set itemnumber='"+remaining+"' where email='"+email+"'";
	String query="update productdetail set status='complete' where email='"+email+"' and status='incomplete'";
	Dao d=new Dao();
	d.executeUpdate(query);
	d.executeUpdate(query1);
	response.sendRedirect("student.jsp");
	}

}
