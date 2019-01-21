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
     <jsp:useBean id="user" scope="session"  class="DataBaseDAO.UserCheck"/>

	<%
	response.setHeader("Expires","0");
	if(!user.isPassed())
	{
	response.sendRedirect("http://localhost:3306/login.html");
	
	}
	ResultSet rs=db.doQuery("select * from apply_info where state = '未补办'");
	out.println("申请信息如下：<br>");
	out.println("<table border=1><thead><tr>");
	out.println("<th>学号</th><th>姓名</th><th>学院</th><th>专业</th><th>状态</th></tr></thead>");
	out.println("<tbody>");
	
	while(rs.next())
	{
	out.println("<form action = 'Repair.jsp' method = 'post'> ");
	String id=rs.getString("id");
	String un=rs.getString("sname");
	String co=rs.getString("college");
	String dp=rs.getString("sdept");
	String state=rs.getString("state");  
	
	
	out.println("<tr><td>"+id+ "<input type= 'hidden' name='id' display ='block' value = '"+id+"' </td>");
	out.println("<td>"+un+ "<input type= 'hidden' name='name'  value = '"+un+"' </td>");
	out.println("<td>"+co+ "<input type= 'hidden' name='sdept'  value = '"+co+"' </td>");
	out.println("<td>"+dp+ "<input type= 'hidden' name='state'  value = '"+dp+"' </td>");
	//out.println("<td>"+state+"</td>");

	out.print("<td><button type='submit'>" + state);
	out.println("</button></td></tr>");
	out.println("</form>");
	}
	out.println("</tbody></table>");
	 %>
	 
	 <%
	 	request.setCharacterEncoding("utf-8");
	 	//完成补办
	 	String id=request.getParameter("id");
	 	String name = request.getParameter("name");
	 	
	 	//System.out.println(id);
	 	if(id != null){
	 		String sql = "update apply_info set state = '补办完成' where id='" + id +"'";
	 		//System.out.println(sql);
	 		String rs1 =db.doUpgrade(sql);
	 		String userId = session.getAttribute("sessionUserId").toString();
	 		String userName = session.getAttribute("sessionUserName").toString();
	 		//System.out.println("userId = "+ userId);
	 		//System.out.println("userUserName = "+ userName);
	 		sql="insert into log(id,name,sid,sname) values("+"'"+userId+"'"+",'"+userName+"','"+id+"','"+name+"')";
	 		//System.out.println(sql);  
    		String rs2 = db.doUpgrade(sql);
    		response.sendRedirect("Repair.jsp");
    		
    		sql = "delete from apply_info where state = '补办完成'";
    		String rs3 = db.doUpgrade(sql);
    		//response.sendRedirect("Repair.jsp");
	 	}	 
	 	db.close();	
	  %>
	 
        </div>
</body>



</html>
