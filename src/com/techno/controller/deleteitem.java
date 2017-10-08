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
 * Servlet implementation class deleteitem
 */
@WebServlet("/deleteitem")
public class deleteitem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteitem() {
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
	String em=hs.getAttribute("email").toString();
	String name=request.getParameter("pname");
	String quan=request.getParameter("pquantity");
    String query="delete from productdetail where email='"+em+"' and ordername='"+name+"'";
    String query1="update product set quantity=(quantity + '"+quan+"') where name='"+name+"'";
    Dao d=new Dao();
	d.executeUpdate(query);
	d.executeUpdate(query1);
	response.sendRedirect("addproduct.jsp?error=repeat");
	}

}
