<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,DataBaseDAO.UserCheck,DataBaseDAO.BaseDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>Check Login </title>


  </head>
  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
     %>
   
     <jsp:useBean id="db" class="DataBaseDAO.BaseDAO"/>
     <jsp:useBean id="user" scope="session"  class="DataBaseDAO.UserCheck"/>
     <jsp:setProperty property="*" name="user"/>
     <%
      int flag=0;
      String identity=request.getParameter("identity");
      System.out.println(identity);
       String sql;
      if(identity.equals("stu"))
      	  flag=1;    	
     if(user.getUserId()!=""&&flag==1) 
     {
     	sql="select * from student where id='"+user.getUserId()+"' and password= '"+user.getUserPassword()+"'";
     	System.out.println(sql);
     	ResultSet rs=db.doQuery(sql);
	     if( rs.next())
		     {
		     	 String userName = rs.getString("sname"); 
		     	 System.out.println("sessionUserName" + userName);
		         request.getSession().setAttribute("sessionUserId", user.getUserId());
		         request.getSession().setAttribute("sessionUserName", userName);
		         System.out.println(user.getUserName());
		    	 user.setPassed(true);
		     	 out.print("Success!");
		     	 response.sendRedirect("Student.jsp");
		     }
	     else 
		     {
		     out.print("<font color=red>用户名或口令不正确</font><br>");
		     }
     }   
  	  
 	else 
 	{			
	 	sql="select * from admin where id='"+user.getUserId()+"' and password= '"+user.getUserPassword()+"'";
	    System.out.println(sql);
	    ResultSet rs=db.doQuery(sql);
	     if( rs.next())
		     {
		     	String userName = rs.getString("name");
		     	System.out.println("sessionUserName" + userName);
		     	request.getSession().setAttribute("sessionUserId", user.getUserId());
		     	request.getSession().setAttribute("sessionUserName", userName);
		     	user.setPassed(true);
		     	out.print("Success!");
		     	response.sendRedirect("MainIndex.jsp");
		     }
	     else 
		     {
		     out.print("<font color=red>用户名或口令不正确</font><br>");
		     }	         
 	}
     db.close();    
%>
      
  </body>
</html>
