<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lvjin.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>LoginDAO</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	  <link rel="stylesheet" type="text/css" href="./css/stuinfo.css">

  </head>
  
  <body>
  	<%
  		//获取用户输入的用户名和密码
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		if (userName == null){
			request.getRequestDispatcher("loginerror.jsp").forward(request,response);
		}
		//实例化一个用户对象
		UserInfoDAO userdao = new UserInfoDAO();
		//判断密码是否正确
		if(userPwd.equals(userdao.UserLogin(userName).getUserPwd())){
			//登录成功跳转查询所有学生信息页面
			session.setAttribute("userName",userName);
			request.getRequestDispatcher("stuinfo.jsp?userName=" + userName).forward(request, response);
		}else{
			//登录失败跳转重新登录页面
			request.getRequestDispatcher("loginerror.jsp").forward(request, response);
		}
  	 %>
  </body>
</html>
