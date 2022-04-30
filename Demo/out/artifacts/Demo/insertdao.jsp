<%@ page import="com.lvjin.entity.StuInfoEntity"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lvjin.dao.StuInfoDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>InsertDAO</title>
    
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
	   <%
	   request.setCharacterEncoding("UTF-8");
	   //获取前端新增的学生信息
	   String stuName=request.getParameter("stuName");
	   int stuSex=Integer.parseInt(request.getParameter("stuSex"));
	   int stuAge=Integer.parseInt(request.getParameter("stuAge"));
	   //将学生信息封装学生对象中
	   StuInfoEntity stuInfo=new StuInfoEntity();
	   stuInfo.setStuName(stuName);
	   stuInfo.setStuSex(stuSex);
	   stuInfo.setStuAge(stuAge);
	   
	   //调用后端新增方法，返回一个受影响行数
	   StuInfoDAO studao=new StuInfoDAO();
	   int count=studao.insertStuInfo(stuInfo);
	   
	   //判断是否新增成功
	   if(count>0){
	   	//新增成功跳转查询所有学生信息页面
	   	request.getRequestDispatcher("stuinfo.jsp").forward(request, response);
	   }else{
	   	//新增失败跳转失败页面
	   	response.sendRedirect("error.jsp");
	   }
	   
	    %>
 
  </body>
</html>
