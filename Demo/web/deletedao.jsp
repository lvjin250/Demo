<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jin.dao.StuInfoDAO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>DeleteDAO</title>
    
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
    //获取前端删除学生的学号
    int stuId=Integer.parseInt(request.getParameter("stuId"));
    //调用删除学生信息方法，返回一个受影响行数
    StuInfoDAO studao=new StuInfoDAO();
    int count=studao.deleteStuInfoByStuId(stuId);
    //判断是否删除成功
    if(count>0){
	   	//删除成功跳转查询所有学生信息页面
	   	request.getRequestDispatcher("stuinfo.jsp").forward(request, response);
	}else{
	   	//删除失败跳转失败页面
	   	response.sendRedirect("error.jsp");
	}
     %>
    
  </body>
</html>
