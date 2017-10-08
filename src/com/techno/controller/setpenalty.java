package com.techno.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class setpenalty
 */
@WebServlet("/setpenalty")
public class setpenalty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public setpenalty() {
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
	String batch=request.getParameter("penaltybatch");
	String err=request.getParameter("error");
	//response.sendRedirect("setpenalty.jsp?em="+email+" & bt="+batch+"");
	response.sendRedirect("setpenalty.jsp"+ "?"+"em="+email+"&bt="+batch+"&error="+err+"");
	}  

}
