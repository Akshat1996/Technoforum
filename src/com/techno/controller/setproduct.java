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
 * Servlet implementation class setproduct
 */
@WebServlet("/setproduct")
public class setproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public setproduct() {
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
	String name=request.getParameter("product");
	String pname=null;
	String query="select name from product where id='"+name+"'";
    Dao d=new Dao();
    ResultSet rs=d.executeQuery(query);
    try {
		while(rs.next()){
			pname=rs.getString(1).toString();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	HttpSession hs=request.getSession();
	hs.setAttribute("product_name", pname);
	response.sendRedirect("quantity.jsp");
	System.out.println("product name is :- "+hs.getAttribute("product_name"));
	}
}
