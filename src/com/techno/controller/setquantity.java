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
 * Servlet implementation class setquantity
 */
@WebServlet("/setquantity")
public class setquantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public setquantity() {
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
	int table_quan=0,user_quan=0;
	String user_quantity=request.getParameter("qunatity");
	String quantity=null,query1=null;
	String product_name=hs.getAttribute("product_name").toString();
	String query="select * from product where name='"+product_name+"'";
	Dao d=new Dao();
	ResultSet rs=d.executeQuery(query);
	try {
		while(rs.next()){
			quantity=rs.getString(3).toString();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	table_quan=Integer.parseInt(quantity);
	user_quan=Integer.parseInt(user_quantity);
	if(user_quan>table_quan){
		response.sendRedirect("addproduct.jsp?error=extra");
		
	}
	else{
		query1="select * from ";
		response.sendRedirect("");
	}
	
	}

}
