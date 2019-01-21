package DataBaseDAO;

public class UserCheck {
	String userName="";
	String userPassword="";
	String userId="";
	String college = "";
	String department = "";
	
	boolean passed=false;
	
	public String getCollege()
	{
		return college;
		
	}
	public void setCollege(String college)
	{
		this.college=college;
		
	}
	
	
	public String getDepartment()
	{
		return department;
		
	}
	public void setDepartment(String department)
	{
		this.department=department;
		
	}
	
	public boolean isPassed()
	{
		return passed;
	}
	
	public void setPassed(boolean passed)
	{
		this.passed=passed;
		
	}
	
	public String getUserName()
	{
		return userName;
		
	}
	public void setUserName(String userName)
	{
		this.userName=userName;
		
	}
	
	
	public String getUserId()
	{
		return userId;
	}
	public void  setUserId(String userId)
	{
		this.userId=userId;
	}
	
	public String getUserPassword()
	{
		return userPassword;
	}
	
	public void  setUserPassword(String userPassword)
	{
		this.userPassword=userPassword;
	}
}
