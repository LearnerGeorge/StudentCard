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
     	  <form name="so" action="#" method="post">	 											
			      <label><b>请输入相关信息</b></label>
			      <br>
			      <span>学号</span>
			      <input placeholder="学号" name="id" value=""  id="box" required><br>
			      <span>姓名</span>
			      <input placeholder="姓名" name="name" value=""  id="box" required> 	<br>
			      <span>学院</span>
			      <input placeholder="学院" name="college" value=""  id="box" required><br> 	
			      <span>专业</span>
			      <input placeholder="专业" name="department" value=""  id="box" required> 	<br>
			      <span>密码</span>
			      <input placeholder="密码" name="pwd" value=""  id="box" required> 	<br>
			           						
  				 <button type="submit" >更新</button>			 
  		</form> 		
  			  		  		
  		</div> 
<jsp:useBean id="db" class="DataBaseDAO.BaseDAO"/>
<jsp:useBean id="user" scope="session" class="DataBaseDAO.UserCheck"/>
<%
  request.setCharacterEncoding("utf-8");
  
  	String name=request.getParameter("name");
    String id=request.getParameter("id");
    String college=request.getParameter("college");
    String department=request.getParameter("department");
    String pwd=request.getParameter("pwd");
    
    
    if(name!=null&&id!=null&&college!=null&&department!=null&&pwd!=null)
  {  String sql="update student set id='" + id + "', sname ='" + name + "', password='" +pwd+
  					"', sdept='" +department + "', college='" + college + "' where id ='" +id+ "'";  
  	//System.out.println(sql);
     String rs=db.doUpgrade(sql);
   	 out.print("更新成功");  
   }  
  
  
 %>	
 <a href="select.jsp">查看添加情况</a>
</body>
<script>
        var body = document.getElementsByTagName("body")[0]
        var aside = document.getElementsByTagName("aside")[0]
		var div = document.getElementById("test");
   		 var box = document.getElementById("box");
        function list() {
            if (aside.clientWidth <= 40) {
                body.className = ""
            } else if (aside.clientWidth > 40) {
                console.log("side")
                body.className = "minibody"
            }

        }
           function myCheck1()
       {
          if(so.infor.value=="")
          {
             alert("内容不能为空,请输入内容");
             so.infor.focus();
             return ;
          }
          so.submit();
       }
        function myCheck2()
       {
          if(del.choice1.value=="")
          {
             alert("内容不能为空,请输入内容");
             del.choice1.focus();
             return ;
          }
           del.submit();
       }   

    </script>

 
</html>







