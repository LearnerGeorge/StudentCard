<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,DataBaseDAO.UserCheck,DataBaseDAO.BaseDAO,java.util.regex.Pattern"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Person.jsp' starting page</title>
    	<link rel="stylesheet" href="./css/styles.css" type="text/css" >
    	<link rel="stylesheet" href="./css/Menu.css" type="text/css" >
	  <meta name="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
#right{
	
	height:200px;
	width:100%;
	float:left;
	background-color:#E0FFFF;
}

*{
padding:0;
margin:5px;
}	

</style>
  </head>
  
  <body>
  <jsp:useBean id="db" class="DataBaseDAO.BaseDAO"/>
<jsp:useBean id="user" scope="session" class="DataBaseDAO.UserCheck"/>
  <%
    request.setCharacterEncoding("utf-8");
     %>
   <aside class="inOneLine>
        <button class="btn" onclick="list()">三</button>
        <ul>
            <li class="first">
                <div class="logo">
                    LOGO
                </div>

            </li>
           <li>
                <a href="select.jsp">❤<span class="listtext">学生信息</span></a>
            </li>
            <li>
                <a href="Delete.jsp">❤<span class="listtext">删除信息</span></a>
            </li>
            <li>
                <a href="Add.jsp">❤<span class="listtext">添加信息</span></a>
            </li>
            <li>
            	<a href="Updata.jsp">❤<span class="listtext">修改信息</span></a>
            <li>
                <a href="Repair.jsp">❤<span class="listtext">补办受理</span></a>
            </li>
            <li>
                <a href="Log.jsp">❤<span class="listtext">发放记录</span></a>
            </li>
        </ul>
       
    </aside>
    
		<div class="right">
				 <div class="input" >  
		   			<form action="Person.jsp" method="post">	 					
					      <label><b>请输入相关信息</b></label>
					      <input placeholder="学号或姓名" name="infor" value="" required> 						
		  				 <button type="submit" >查询</button>
		  			</form>
		  		</div>	
	<div class="show">
		<%
	  	out.println("学生信息如下：<br>");		
		String infor=request.getParameter("infor");
		//System.out.println(infor);
		String sql;	
		Pattern pattern=Pattern.compile("[0-9]*");
		
	      if( infor!=null&& pattern.matcher(infor).matches())
			sql="select * from student where id ="+infor;
		 else
			sql="select * from student where sname ='"+infor+"'";
		
	            ResultSet rs=db.doQuery(sql);
    
	           	if(rs.next())
	             {		
		         	String id=rs.getString("id");
					String name=rs.getString("sname");		           
					String pwd=rs.getString("password");
					String college=rs.getString("college");  
					String department = rs.getString("sdept");  
					out.print("学号："+id+"<br/>");
					out.print("姓名："+name+"<br/>");    
					out.print("密码："+pwd+"<br/>");
					out.print("学院："+college+"<br/>");	
					out.print("专业：" + department + "<br/>");	  		   
	          	 }  
	          	 else
	          	 {
	          	 	out.print("没有此学生");
	          	 }	                  	          
	           db.close();
	  		 %>
  		 </div>
     </div>  
</html>
