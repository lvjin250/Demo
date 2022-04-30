<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Insert</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
	    if (session.getAttribute("userName") == null){
		    request.getRequestDispatcher("login.jsp").forward(request,response);
	    }
    %>
    <!-- 使用表单实现学生新增 -->
    <form action="insertdao.jsp" method="post">
    	<table border="1" align="center">
    		<caption>新增学生信息</caption>
    		<tr>
    			<td style="text-align:center">姓名:</td>
    			<td>
    				<input type="text" name="stuName">
    			</td>
    		</tr>
    		<tr>
    			<td style="text-align:center">性别:</td>
    			<td>
    				<input type="radio" name="stuSex" value="1" checked="checked">男
    				<input type="radio" name="stuSex" value="0">女
    			</td>
    		</tr>
    		<tr>
    			<td style="text-align:center">年龄:</td>
    			<td>
    				<input type="text" name="stuAge">
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
    				<input type="submit" value="新增">
    			</td>
    		</tr>
    	
    	</table>
    
    </form>
    
  </body>
</html>
