package com.crud.controller;

import java.io.IOException;
import java.util.List;

import com.crud.service.EmployeeService;

import crudcom.crud.entity.Employee;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class add
 */
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String salary=request.getParameter("salary");
		String isadmin=request.getParameter("optradio");
		List<Employee> l1;
		
		EmployeeService es=new EmployeeService();
		if(isadmin.equals("admin"))
		{
		
			l1=es.initlize(firstname, lastname, username, password, true, Double.parseDouble(salary));
			if(l1!=null)
			{
				response.sendRedirect("login.jsp");
			}
			else {
				response.sendRedirect("add.jsp");
			}
		}
		else 
			{
			l1=es.initlize(firstname, lastname, username, password, false, Double.parseDouble(salary));
			if(l1!=null)
			{
				response.sendRedirect("login.jsp");
			}
			else {
				response.sendRedirect("add.jsp");
			}
			}
			}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
