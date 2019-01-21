<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,DataBaseDAO.UserCheck,DataBaseDAO.BaseDAO,java.util.regex.Pattern"%>

<!DOCTYPE html>
<html>
  <head>
    <title>MainTest.html</title>
	<link rel="stylesheet" href="./css/styles.css" type="text/css" >
    
    <meta name="content-type" content="text/html; charset=UTF-8">
    

  </head>
<script>
        var body = document.getElementsByTagName("body")[0]
        var aside = document.getElementsByTagName("aside")[0]

        function list() {
            if (aside.clientWidth <= 40) {
                body.className = ""
            } else if (aside.clientWidth > 40) {
                console.log("side")
                body.className = "minibody"
            }

        }
    </script>



 <body>
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
     <div class="inOneLine">
     <jsp:useBean id="db" class="DataBaseDAO.BaseDAO"/>
  <jsp:useBean id="user" scope="session" class="DataBaseDAO.UserCheck"/>
	<%
	response.setHeader("Expires","0");
	if(!user.isPassed())
	{
	response.sendRedirect("http://localhost:3306/login.html");
	
	}
	ResultSet rs=db.doQuery("select * from student");
	out.println("学生信息如下：<br>");
	out.println("<table border=1><thead><tr>");
	out.println("<th>学号</th><th>姓名</th><th>学院</th><th>专业</th><th>密码</th></tr></thead>");
	out.println("<tbody>");
	while(rs.next())
	{
	String id=rs.getString("id");
	String un=rs.getString("sname");
	String co=rs.getString("college");
	String dp=rs.getString("sdept");
	String pd=rs.getString("password");  
	
	
	out.println("<tr><td>"+id+"</td>");
	out.println("<td>"+un+"</td>");
	out.println("<td>"+co+"</td>");
	out.println("<td>"+dp+"</td>");
	out.println("<td>"+pd+"</td></tr>");

	
	
	}
	out.println("</tbody></table>");
	db.close();
	 %>
	 
	 
        </div>
</body>



</html>
