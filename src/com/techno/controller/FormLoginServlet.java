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
 * Servlet implementation class FormLoginServlet
 */
@WebServlet("/FormLoginServlet")
public class FormLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormLoginServlet() {
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
	String query=null,tpassword=null,tstatus=null,tremain=null,batch=null;int count=0;
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String designation=request.getParameter("designation");
	if(designation.equals("student")){
		query="select * from sp where email='"+email+"'";
		System.out.println(email);

	}
	if(designation.equals("member")){
		query="select * from mp where email='"+email+"'";
	}
	if(designation.equals("admin")){
		query="select * from ap where email='"+email+"'";
	}
	Dao d=new Dao();
	ResultSet rs=d.executeQuery(query);
	try {
		while(rs.next()){
			count++;
			tpassword=rs.getString(4).toString();
			batch=rs.getString(9);
			if(designation.equals("student")){
				tremain=rs.getString(13).toString();
			}
			tstatus=rs.getString(5).toString();
			System.out.println(tpassword+"  "+tstatus);
		}
		System.out.println("Count is :- "+count);
		if(count==0){
			if(designation.equals("student")){
				response.sendRedirect("loginstudent.jsp?error=noemail");
			}
			if(designation.equals("member")){
				response.sendRedirect("loginclubmember.jsp?error=noemail");
			}
			if(designation.equals("admin")){
				response.sendRedirect("loginadmin.jsp?error=noemail");
			}
			
		}
		if(count>0){
			if(tstatus.equals("inactivate")){
				if(designation.equals("student")){
					response.sendRedirect("activateaccount.jsp?error=student");
				}
				if(designation.equals("member")){
					response.sendRedirect("activateaccount.jsp?error=member");
				}
				if(designation.equals("admin")){
					response.sendRedirect("activateaccount.jsp?error=admin");
				}
			}else{
				if(tpassword.equals(password)){
					HttpSession hs=request.getSession(); 
					hs.setAttribute("email", email);
					hs.setAttribute("designation", designation);
					hs.setAttribute("batch",batch);
					System.out.println("BAtch is:- "+batch);
					if(designation.equals("student")){
					String query1="select itemnumber from sp where email='"+email+"'";
					ResultSet rs1=d.executeQuery(query1);
					while(rs1.next()){
						tremain=rs1.getString(1).toString();
						System.out.println("tremain :- "+tremain);
					}
					hs.setAttribute("remain",tremain);
					}
					System.out.println("Session created for:- "+hs.getAttribute("email"));
					if(designation.equals("student")){
						response.sendRedirect("student.jsp");
					}
					if(designation.equals("member")){
						response.sendRedirect("member.jsp");
					}
					if(designation.equals("admin")){
						response.sendRedirect("admin.jsp");
					}
				}else{
					if(designation.equals("student")){
						response.sendRedirect("loginstudent.jsp?error=wrongpassword");
					}
					if(designation.equals("member")){
						response.sendRedirect("loginclubmember.jsp?error=wrongpassword");
					}
					if(designation.equals("admin")){
						response.sendRedirect("loginadmin.jsp?error=wrongpassword");
					}
 				}
			}
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

}
