package com.techno.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techno.dao.Dao;

/**
 * Servlet implementation class confirmrequest
 */
@WebServlet("/confirmrequest")
public class confirmrequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmrequest() {
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
		HttpSession hs=request.getSession();
		String batch=hs.getAttribute("batch").toString();
		System.out.println("confirm email :- "+cemail);	 
		System.out.println("confirm name :- "+cname);
		System.out.println("Confirm Batch :- "+batch);
		String query="update productdetail set accepted='yes' where email='"+cemail+"' and ordername='"+cname+"' and batch='"+batch+"'";
		String query1="update productdetail set dayleft='15' where email='"+cemail+"' and ordername='"+cname+"' and batch='"+batch+"'";
		Dao d=new Dao();
		d.executeUpdate(query1);
		d.executeUpdate(query);
        response.sendRedirect("requestconfirm.jsp");
	
	}

}
