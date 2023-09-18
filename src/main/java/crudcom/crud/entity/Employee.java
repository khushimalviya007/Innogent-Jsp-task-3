package crudcom.crud.entity;

public class Employee {

	public Employee() {
		// TODO Auto-generated constructor stub
	}
 private int id;
 private String FirstName;
 private String LastName;
 private String UserName;
 private String Password;
 private boolean isAdmin;
 private double Salary;
@Override
public String toString() {
	return "Employee [id=" + id + ", FirstName=" + FirstName + ", LastName=" + LastName + ", UserName=" + UserName
			+ ", Password=" + Password + ", isAdmin=" + isAdmin + ", Salary=" + Salary + "]";
}
public Employee(int id, String firstName, String lastName, String userName, String password, boolean isAdmin,
		double salary) {
	super();
	this.id = id;
	FirstName = firstName;
	LastName = lastName;
	UserName = userName;
	Password = password;
	this.isAdmin = isAdmin;
	Salary = salary;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFirstName() {
	return FirstName;
}
public void setFirstName(String firstName) {
	FirstName = firstName;
}
public String getLastName() {
	return LastName;
}
public void setLastName(String lastName) {
	LastName = lastName;
}
public String getUserName() {
	return UserName;
}
public void setUserName(String userName) {
	UserName = userName;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
public boolean getIsAdmin() {
	return isAdmin;
}
public void setIsAdmin(boolean isAdmin) {
	this.isAdmin = isAdmin;
}
public double getSalary() {
	return Salary;
}
public void setSalary(double salary) {
	Salary = salary;
}
 
}
