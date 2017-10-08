package com.techno.controller;
import java.text.*;
import java.util.*;
import java.lang.*;
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
 * Servlet implementation class addproduct
 */
@WebServlet("/addproduct")
public class addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addproduct() {
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
	int rr=0;String batch=null;
	String query1=null,query2=null,query3=null;
	String q=null;int intquan=0,intq=0,remaining=0;
	String email=null,productname=null;
	SimpleDateFormat sdf =new SimpleDateFormat("dd/MM/yyyy");
	Date date=new Date();
	String d1=sdf.format(date).toString();
	HttpSession hs=request.getSession();
	email=hs.getAttribute("email").toString();
	String s2="select batch from sp where email='"+email+"'";
	String rem=hs.getAttribute("remain").toString();
	System.out.println(rem);
	productname=hs.getAttribute("product_name").toString();
	String formquantity=request.getParameter("quantity").toString();
	intquan=Integer.parseInt(formquantity);
	System.out.println("Form Quantity :- "+formquantity);
	System.out.println("Remain is from session :- "+rem);
	remaining=Integer.parseInt(rem);
	String query="select * from product where name='"+productname+"'";
	Dao d=new Dao();
	ResultSet rs=d.executeQuery(query);
	ResultSet rs1=d.executeQuery(s2);
	if(remaining>0){
	try {
		while(rs1.next()){
			batch=rs1.getString(1);
		}
		while(rs.next()){
		q=rs.getString(3).toString();
		productname=rs.getString(2).toString();
		}
		intq=Integer.parseInt(q);
		if(intq >= intquan){		
	    //table quantity is grater than required		
		query1="insert into productdetail(email,status,penalty,starting_date,dayleft,ordername,quantity,batch) values('"+email+"','incomplete','0','"+d1+"','0','"+productname+"','"+formquantity+"','"+batch+"') "; 
		d.executeUpdate(query1);
		System.out.println("intq = "+intq+" intquan = "+intquan );
		query2="update product set quantity=(quantity - '"+intquan+"') where name='"+productname+"'";
		d.executeUpdate(query2);
		//reducing remaining value
		rr=Integer.parseInt(hs.getAttribute("remain").toString());
		rr=rr-1;
		query3="update product set itemnumber='"+rr+"' where email='"+email+"'";
		d.executeUpdate(query3);
		hs.setAttribute("remain",rr);		
		System.out.println("remain set to :- "+hs.getAttribute("remain"));
		hs.setAttribute("product_name","");
		response.sendRedirect("addproduct.jsp?error=repeat");
		}else{
			response.sendRedirect("addproduct.jsp?error=extra");
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}else{
		response.sendRedirect("addproduct.jsp?error=noremain");
	}
	}

}
