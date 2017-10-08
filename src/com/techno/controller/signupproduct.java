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
 * Servlet implementation class signupproduct
 */
@WebServlet("/signupproduct")
public class signupproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupproduct() {
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
		String name=request.getParameter("name");
		int count=0;
		String quantity1=request.getParameter("quantity");
		String price=request.getParameter("price");
		System.out.println("name   quantiyt   price "+name+"\t"+quantity1+"\t"+price);
		String query="select * from product where name='"+name+"'";
		String query1="insert into product(name,quantity,price,productimage) values('"+name+"','"+quantity1+"','"+price+"','noimage.jpg')";
		Dao d=new Dao();
		ResultSet rs=d.executeQuery(query);
		try {
			while(rs.next()){
				count++;
			}
			if(count>0){
				
				response.sendRedirect("signupproduct.jsp?error=duplicate");
			}else{
				d.executeUpdate(query1);
				response.sendRedirect("uploadpic.jsp?error="+name+"");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
