package com.crud.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.crud.service.EmployeeService;

import crudcom.crud.entity.Employee;

/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id=request.getParameter("id");
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		List<Employee> l1;
		
		EmployeeService es=new EmployeeService();
		List<Employee> e =es.getEmployeeById(Integer.parseInt(id));
		for(Employee e1:e) {
		if(!e1.getIsAdmin()) {
		boolean flag=es.update(Integer.parseInt(id),firstname, lastname, username, password);
			if(flag)
			{
				request.setAttribute("msg21","Details updated");
				response.sendRedirect("home.jsp");
			}
			}
		else {
			request.setAttribute("adminnotdeleted","Admin can't update their details");

		}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
