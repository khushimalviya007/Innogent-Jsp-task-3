<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="crudcom.crud.entity.Employee" %>
    <%@ page import="com.crud.service.EmployeeService" %>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
body{
  background-image: linear-gradient(to right ,white,skyblue,white);
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
 
<%!String msg111; %>
<%msg111=(String)request.getAttribute("adminnotdeleted"); 
if(msg111!=null){%>
 <div class="alert alert-danger alert-dismissible">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong><%=msg111%></strong> 
</div>
   <%} %>
 <%!String msg1; %>
  <%msg1=(String)request.getAttribute("msg1"); 
   if(msg1!=null){ %>

   <div class="alert alert-danger alert-dismissible">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong><%=msg1%></strong> 
</div>
   <%} %>
     <%!String msg123; %>
  <%
  msg123=(String)request.getAttribute("msg11"); 
   if(msg123!=null){ %>

   <div class="alert alert-danger alert-dismissible">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong><%=msg123%></strong> admin can't be deleted
</div>
<%} %>

<%! Employee emp; %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

 emp= (Employee)session.getAttribute("emp");

if(emp==null){
	
	response.sendRedirect("login.jsp");
}
else if(emp.getIsAdmin()){
	
	
	EmployeeService es= new  EmployeeService();
List<Employee> newlist=	es.getList();
%>

	
<table class="table table-dark">
    <thead>
      <tr>
        <th>Id</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>UserName</th>
        <th>Password</th>
        <th>isAdmin</th>
        <th>Salary</th>
         <th>Update</th>
        <th>Delete</th>
        <th> <form action="logout">
  <button class="btn btn-primary" style="width:200px;height:40px;text-align:center;">Logout</button>
</form></th>
      </tr>
    </thead>
    <tbody>
        <%for(Employee e:newlist){%>
      <tr>
        <td><%=e.getId()%></td>
        <td><%=e.getFirstName()%></td>
        <td><%=e.getLastName()%></td>
        <td><%=e.getUserName()%></td>
        <td><%=e.getPassword()%></td>
        <td><%=e.getIsAdmin()%></td>
        <td><%=e.getSalary()%></td>
        <% if(e.getIsAdmin()) {%>
                <td><button class="btn btn-info" disabled>Update Details</button></td>
                 <td><button href="delete.jsp"  disabled class="btn btn-info" style="width:200px;height:40px;text-align:center;">Delete</button>	</td>
                
        <%} else{%>
        <td><a class="btn btn-info" href="update.jsp?Empid=<%=e.getId()%>">Update Details</a></td>
         <td><a href="delete?Empid=<%=e.getId()%>"  class="btn btn-info" style="width:200px;height:40px;text-align:center;">Delete</a>	</td>
        <%} %>
      </tr>
       <%} %>
    </tbody>
  </table>

  
<div class="container mt-3" style="display:flex;justify-content: center;">

  <button type="button" class="btn btn-warning " data-bs-toggle="modal" data-bs-target="#myModal"style=" font-weight: bold;width:200px;height:40px;text-align:center;">
    Add Employee
  </button>
</div>
       <form class="row g-3" action="add" style="width : 80%; marginTop : 100px">

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Add new Employee</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">first Name</label>
    <input type="text" class="form-control" id="inputEmail4" name="firstname"  placeholder="enter first name" required>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">last Name</label>
    <input type="text" class="form-control" id="inputPassword4" name="lastname" required placeholder="enter lastname">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">username</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="username" required placeholder="enter username">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">password</label>
    <input type="text" class="form-control" id="inputCity"  placeholder="password" name="password" required>
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">salary</label>
    <input type="text" class="form-control" id="inputCity"  placeholder="salary" name="salary" required>
  </div>

    <div class="form-check">
  <input type="radio" class="form-check-input" id="radio1" name="optradio" value="admin" checked>Admin
  <label class="form-check-label" for="radio1"></label>
</div>
<div class="form-check">
  <input type="radio" class="form-check-input" id="radio2" name="optradio" value="user">User
  <label class="form-check-label" for="radio2"></label>
</div>
</div>
      <!-- Modal footer -->
      <div class="modal-footer">
       <div class="col-12">
<button class="btn btn-warning" type="submit" style="margin-left:40%;margin-top:0%;"name="register" value="register" >Register </button><br>
</div></div>

    </div>
  </div>
</div>
</form>

<%}else{ 
	if(emp==null){
		response.sendRedirect("login.jsp");
	}
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);	
	
	EmployeeService es1= new  EmployeeService();
	List<Employee> e1=es1.getFilterList();
	%>
	 <%!String msg; %>
  <%msg=(String)request.getAttribute("msg21"); 
   if(msg!=null){ %>
<div class="alert alert-success alert-dismissible">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong><%=msg%></strong> Employee details successfully updated
</div>
  <%} %>
<table class="table table-dark">
    <thead>
      <tr>
        <th>Id</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>UserName</th>
        <th>Password</th>
        <th>isAdmin</th>
        <th>Salary</th>
        <th> <form action="logout">
  <button class="btn btn-primary" style="width:200px;height:40px;text-align:center;">Logout</button>
</form></th>
      </tr>
    </thead>
    <tbody>
        <%for(Employee e:e1){%>
      <tr>
        <td><%=e.getId()%></td>
        <td><%=e.getFirstName()%></td>
        <td><%=e.getLastName()%></td>
        <td><%=e.getUserName()%></td>
        <td><%=e.getPassword()%></td>
        <td><%=e.getIsAdmin()%></td>
        <td><%=e.getSalary()%></td>
      </tr>
     
    </tbody>
  </table>

  
<div class="container mt-3" style="display:flex;justify-content: center;">

  <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#myModal"style="width:200px;height:40px;text-align:center;">
    Update details
  </button>
</div>
       <form class="row g-3" action="Update" style="width : 80%; marginTop : 100px">

<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Update Details</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Id</label>
    <input type="text" class="form-control" id="inputEmail4" name="id"  placeholder="enter id" value="<%=e.getId()%>"required  readonly>
  </div>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">first Name</label>
    <input type="text" class="form-control" id="inputEmail4" name="firstname"  placeholder="enter first name" value="<%=e.getFirstName()%>" required>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">last Name</label>
    <input type="text" class="form-control" id="inputPassword4" name="lastname" required placeholder="enter lastname" value="<%=e.getLastName()%>">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">username</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="username"  value="<%=e.getUserName()%>" required placeholder="enter username">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">password</label>
    <input type="text" class="form-control" id="inputCity"  placeholder="password" name="password" value="<%=e.getPassword()%>" required>
  </div>
 
</div>
      <!-- Modal footer -->
      <div class="modal-footer">
       <div class="col-12">
<button class="btn btn-warning" type="submit" style="margin-left:40%;margin-top:0%;"name="register" value="register" >Update details </button><br>
</div></div>
    </div>
  </div>
</div>
</form>

  <%} %>
<%}%>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>