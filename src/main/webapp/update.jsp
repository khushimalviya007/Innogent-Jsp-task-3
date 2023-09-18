<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="crudcom.crud.entity.Employee" %>
    <%@ page import="com.crud.service.EmployeeService" %>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div style="width:700px;height:500px; margin: 0 auto;">

   <form class="row g-3" action="Update" style="width : 80%; marginTop : 100px">
<%!Employee emp; %>
<%String empIdParam = request.getParameter("Empid");

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
emp= (Employee)session.getAttribute("emp");

if(emp==null){
	response.sendRedirect("login.jsp");
}
if (empIdParam != null) {
	int ee=Integer.parseInt(empIdParam);
    EmployeeService es1 = new EmployeeService();
  List<Employee> emp=es1.getEmployeeById(ee);
    if (emp != null) {
    	   for(Employee e:emp){
%>
             <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Id</label>
    <input type="text" class="form-control" id="inputEmail4" name="id"  placeholder="enter id" value="<%=e.getId()%>"required  readonly>
  </div>
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">first Name</label>
    <input type="text" class="form-control" id="inputEmail4" name="firstname"  placeholder="enter first name"  value="<%=e.getFirstName()%>"required>
  </div>
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">last Name</label>
    <input type="text" class="form-control" id="inputPassword4" name="lastname" required  value="<%=e.getLastName()%>" placeholder="enter lastname">
  </div>
  <div class="col-12">
    <label for="inputAddress" class="form-label">username</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="username" value="<%=e.getUserName()%>"required placeholder="enter username">
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">password</label>
    <input type="text" class="form-control" id="inputCity"  placeholder="password" name="password" value="<%=e.getPassword()%>" required>
  </div>

      <!-- Modal footer -->
 <div class="col-12">
<button class="btn btn-primary" type="submit" style="margin-left:40%;margin-top:0%;"name="register" value="register" >Update details </button><br>
</div> 
  
  <%}} }%>
  
  </form>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>