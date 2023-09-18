package com.crud.controller;

import java.io.IOException;
import java.util.List;

import com.crud.service.EmployeeService;

import crudcom.crud.entity.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
    /**
     * @see HttpServlet#HttpServlet()
     */
	EmployeeService es= new EmployeeService();
	
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // TODO Auto-generated method stub
    	response.sendRedirect("login.jsp");
    	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation=request.getParameter("click");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	
		if(operation.equals("login"))
		{ 
			Employee emp=es.login(username, password);

			if(emp!=null)
			{
				HttpSession hs= request.getSession(true);
				hs.setAttribute("emp", emp);
				HttpSession hs1= request.getSession(true);
				hs1.setAttribute("empfilter", emp);
				response.sendRedirect("home.jsp");
				System.out.println("login sucessful");
			}
			else {
				request.setAttribute("msg","invalid credentials");
				RequestDispatcher rs=request.getRequestDispatcher("login.jsp");
				rs.include(request, response);
				System.out.println("login");
			}
		}
	}

}
