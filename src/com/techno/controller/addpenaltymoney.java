package com.techno.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techno.dao.Dao;

/**
 * Servlet implementation class addpenaltymoney
 */
@WebServlet("/addpenaltymoney")
public class addpenaltymoney extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addpenaltymoney() {
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
		String email=request.getParameter("penaltyemail");
		String name=request.getParameter("penaltyname");
		String err=request.getParameter("error");
		String quantity=request.getParameter("quantity");
		int quan=Integer.parseInt(quantity);
		System.out.println("email :- "+email );
		System.out.println("name :- "+name );
		System.out.println("quantity :- "+quan );
		String query=null;
		if(err.equals("addpenalty")){
		query="update productdetail set penalty=penalty+"+quan+" where email='"+email+"' and ordername='"+name+"'";
		}
		if(err.equals("removepenalty")){
		query="update productdetail set penalty=penalty-"+quan+" where email='"+email+"' and ordername='"+name+"'";
		}
		Dao d=new Dao();
	    d.executeUpdate(query);
	    response.sendRedirect("member.jsp");
	}

}
