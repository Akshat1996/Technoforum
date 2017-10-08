package com.techno.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techno.dao.Dao;
import com.techno.model.FormRegisterModel;

/**
 * Servlet implementation class FormRegisterServlet
 */
@WebServlet("/FormRegisterServlet")
public class FormRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormRegisterServlet() {
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
		String query1=null;
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String rollnumber=request.getParameter("rollnumber");
		String course=request.getParameter("course");
		String branch=request.getParameter("branch");
		String batch=request.getParameter("batch");
		String contact=request.getParameter("contact");
		String designation=request.getParameter("designation");	
		FormRegisterModel frm=new FormRegisterModel();
		frm.setName(name);
		frm.setEmail(email);
		frm.setPassword(password);
		frm.setRollnumber(rollnumber);
		frm.setCourse(course);
		frm.setContact(contact);
		frm.setDesignation(designation);
		frm.setBranch(branch);
		frm.setBatch(batch);
		System.out.println(designation);
		if(designation.equals("student")){
		query1="insert into sp(email,rollnumber,password,name,course,branch,batch,contact,designation) values(?,?,?,?,?,?,?,?,?)";
		}
		if(designation.equals("member")){
			query1="insert into mp(email,rollnumber,password,name,course,branch,batch,contact,designation) values(?,?,?,?,?,?,?,?,?)";
			}
		if(designation.equals("admin")){
			query1="insert into ap(email,rollnumber,password,name,course,branch,batch,contact,designation) values(?,?,?,?,?,?,?,?,?)";
			}
		Dao d=new Dao();
	    String result=d.insertData(frm,query1);
	    if(result.equals("demail")){
	    	if(designation.equals("admin")){
	    	response.sendRedirect("adminsignup.jsp?error=duplicateemail");}
	    	if(designation.equals("member")){
		    	response.sendRedirect("membersignup.jsp?error=duplicateemail");}
	    	if(designation.equals("student")){
		    	response.sendRedirect("signup.jsp?error=duplicateemail");}
	    }
	    else{
	    	if(result.equals("droll")){
	    		if(designation.equals("admin")){
	    			response.sendRedirect("adminsignup.jsp?error=duplicateroll");}
	    	    if(designation.equals("member")){
	    	    	response.sendRedirect("membersignup.jsp?error=duplicateroll");}
	    	    if(designation.equals("student")){
	    	    	response.sendRedirect("signup.jsp?error=duplicateroll");}
		    	
		    }else{
		    	if(designation.equals("admin")){
	    			response.sendRedirect("admin.jsp");}
	    	    if(designation.equals("member")){
	    	    	response.sendRedirect("admin.jsp");}
	    	    if(designation.equals("student")){
	    	    	response.sendRedirect("index.html");}
	    	    }
	    }
	}

}
