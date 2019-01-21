<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*,DataBaseDAO.UserCheck,DataBaseDAO.BaseDAO,java.util.regex.Pattern"%>

<!DOCTYPE html>
<html>
  <head>
    <title>MainTest.html</title>
	
    
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="./css/styles.css" type="text/css" >

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



  <style>
 
</style>
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
                <a href="student_update.jsp">❤<span class="listtext">修改信息</span></a>
            </li>
            <li>
            	<a href="student_apply.jsp">❤<span class="listtext">申请补办</span></a>
            <li>
                <a href="student_repairView.jsp">❤<span class="listtext">申请进度</span></a>
            </li>
        </ul>
       
    </aside>
    <%
    	//String id = session.getAttribute("sessionUserId").toString();
    	//System.out.println(id); 
    	String userName = session.getAttribute("sessionUserName").toString();
    	System.out.println(userName);
     %>
     <div class="inOneLine">
   		<font size="56px" alien="center">SAU学生卡学生端</font>
       </div>
</body>



</html>
