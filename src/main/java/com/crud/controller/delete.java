package com.crud.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.crud.service.EmployeeService;

/**
 * Servlet implementation class delete
 */
public class delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete() {
        super();
      
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("Empid");
		EmployeeService es=new EmployeeService();
		if(id!=null)
		{
			boolean flag=es.delete(Integer.parseInt(id));
			if(flag)
				{System.out.println("remove employee");
				response.sendRedirect("home.jsp");}
			else  
				{
				request.setAttribute("msg11","Admin can't be deleted");
				System.out.println(" not remove employee");
				response.sendRedirect("home.jsp");
				}			
			
		}
		else
		{
			request.setAttribute("msg1","Employee not found");
			RequestDispatcher	rs=request.getRequestDispatcher("delete.jsp");
			rs.include(request, response);
		}
	}


}
