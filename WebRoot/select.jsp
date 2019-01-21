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
     
     
     
     <form action="select.jsp" method="post" id="1">	 					
			
			  <button type="submit" name="choice1" value="person"> 查询单个学生信息</button>
			<button type="submit" name="choice1" value="all"> 查询全部学生信息 </button>
  		</form>
  	
  		</div>
<%	

Enumeration hn=request.getParameterNames();
	while(hn.hasMoreElements())
	{
		String name=hn.nextElement().toString();		
		String choice=request.getParameter(name);
		if(choice.equals("person"))		
				 response.sendRedirect("Person.jsp");
				 else 
				 	response.sendRedirect("AllInfor.jsp");
				 	
				 	
	} 	
 %>
 
 
 
 
	 </div>

        </div>
</body>



</html>
