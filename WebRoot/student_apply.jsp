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
     	  <form name="so" action="#" method="post">	 											
			      <label><b>输入补办信息</b></label>
			      <br>
			      <span>学号</span>
			      <input placeholder="学号" name="id" value=""  id="box" required><br>
			      <span>姓名</span>
			      <input placeholder="姓名" name="name" value=""  id="box" required> 	<br>
			      <span>学院</span>
			      <input placeholder="学院" name="college" value=""  id="box" required><br> 	
			      <span>专业</span>
			      <input placeholder="专业" name="department" value=""  id="box" required> <br>

			           						
  				 <button type="submit" >申请补办</button>			 
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
    String userId = session.getAttribute("sessionUserId").toString();
    
    if(name!=null && id!=null && college!=null && department!=null && userId.equals(id))
  {  String sql="insert into apply_info(id,sname,college,sdept,state) values("+ "'"+ id+"','"+name+"','"+college+"','"+department+"','"+"未补办"+"')";
     //System.out.println(sql);
     String rs=db.doUpgrade(sql);
   	 out.print("申请成功");  
   }  
   
   db.close();
  
  
 %>	
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







