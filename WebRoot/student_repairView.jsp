<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,DataBaseDAO.UserCheck,DataBaseDAO.BaseDAO,java.util.regex.Pattern"%>

<!DOCTYPE html>
<html>
  <head>
    <title>MainTest.html</title>
	
    
    <meta name="content-type" content="text/html; charset=UTF-8">
    
<link rel="stylesheet" href="./css/styles.css" type="text/css" >
  </head>


 
 <body>
    <aside class="inOneLine>
        <button class="btn" onclick="list()"></button>
        <ul>
            <li class="first">
                <div class="logo">
                    LOGO
                </div>

            </li>
            <li>
                <a href="student_update.jsp">❤<span class="listtext">修改信息</span></a>
            </li>
            <li>
            	<a href="student_apply.jsp">❤<span class="listtext">申请补办</span></a>
            <li>
                <a href="student_repairView.jsp">❤<span class="listtext">申请进度</span></a>
            </li>
        </ul>
       
    </aside>
     <div class="inOneLine">
  		<div id="test" style="display: none;">
			<label>	申请补证状态查询 </label><br>	
  		</div> 		  		  		
  	</div> 
<jsp:useBean id="db" class="DataBaseDAO.BaseDAO"/>
<jsp:useBean id="user" scope="session" class="DataBaseDAO.UserCheck"/>

<%
	String userId = session.getAttribute("sessionUserId").toString();
	System.out.println(userId);
	String sql = "select * from apply_info where id = '" + userId+ "'";
	ResultSet rs=db.doQuery(sql);
	if(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("sname");		           
		String college=rs.getString("college");  
		String department = rs.getString("sdept"); 
		String state = rs.getString("state"); 
		out.print("您的补办信息：<br>");
		out.print("........................................................................<br>");
		out.print("学号："+id+"<br/>");
		out.print("姓名："+name+"<br/>");    
		out.print("学院："+college+"<br/>");	
		out.print("专业：" + department + "<br/>");
		out.print("状态：" + state + "<br>");
		out.print("........................................................................");
	}else{
		out.print("无申请，你看什么看！");
	}

 %>
</body>
</html>







