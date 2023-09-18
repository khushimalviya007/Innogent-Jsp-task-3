package com.crud.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import crudcom.crud.entity.Employee;

public class EmployeeService {
	private static List<Employee> employeelist=new ArrayList<>();
	public EmployeeService() {
		// TODO Auto-generated constructor stub
	}
	static  int id=1;
	public List<Employee> initlize(String firstname,String lastname,String username,String password,boolean isadmin,double salary)
	{
	
		employeelist.add(new Employee(id,firstname,lastname,username,password,isadmin,salary));
		id++;
		return employeelist;
	}
public void initilize()
{
	Employee e1= new Employee();
	e1.setFirstName("nisha");
	e1.setId(id);
	e1.setLastName("kashyap");
	e1.setIsAdmin(false);
	e1.setPassword("nisha123");
	e1.setSalary(1000.0);
	e1.setUserName("nishakashyap");
	id++;
	employeelist.add(e1);
	
	Employee e2= new Employee();
	e2.setId(id);
	e2.setLastName("malviya");
	e2.setIsAdmin(true);
	e2.setFirstName("khushi");
	e2.setPassword("khushi123");
	e2.setSalary(1000.0);
	e2.setUserName("khushimalviya");
	id++;
	employeelist.add(e2);
	System.out.println(employeelist);
}

public List<Employee> getList()
{
	//System.out.println(employeelist);
	return employeelist;
}
private static List<Employee> newlist;
public Employee login(String username, String password)
{
	Optional<Employee>e=employeelist.stream().filter(emp->username.equals(emp.getUserName())&&password.equals(emp.getPassword())).findFirst();
	//System.out.println(e);
	if(e.isPresent())
	{
		newlist=Collections.singletonList(e.get()); 
		return e.get();
	}
	return null;
}



public List<Employee> getEmployeeById(int empid)
{
	List<Employee> empp=employeelist.stream().filter(emp->empid==emp.getId()).collect(Collectors.toList());
	return empp;
}

public List<Employee> getFilterList()
{
//	System.out.println(newlist);
	return newlist;
}

public boolean delete(int id) {
	System.out.println(employeelist);
	boolean flag=employeelist.removeIf(emp->emp.getId()==id && !emp.getIsAdmin());
	System.out.println(employeelist);
	return flag;
}

public boolean update(int id,String firstname, String lastname, String username, String password) {
	//System.out.println("inside update method");
	List<Employee> e=employeelist.stream().filter(emp->id==emp.getId() && !emp.getIsAdmin()).collect(Collectors.toList());
	//System.out.println(e);
	for(Employee e1:e)
	{
		e1.setFirstName(firstname);
		e1.setLastName(lastname);
		e1.setUserName(username);
		e1.setPassword(password);
		return true;
	}
	return false;
}

}