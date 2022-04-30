<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jin.dao.*" %>
<%@ page import="com.jin.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UpdateDAO</title>
</head>
<body>
	<%
		if (session.getAttribute("userName") == null){
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
	%>
	<%
		//设置字符集编码格式
		request.setCharacterEncoding("utf-8");
	
		//获取修改学生信息
		int stuId=Integer.parseInt(request.getParameter("stuId"));
		String stuName=request.getParameter("stuName");
		int stuSex=Integer.parseInt(request.getParameter("stuSex"));
		int stuAge=Integer.parseInt(request.getParameter("stuAge"));
		//封装学生对象
		StuInfoEntity stuInfo=new StuInfoEntity();
		stuInfo.setStuId(stuId);
		stuInfo.setStuName(stuName);
		stuInfo.setStuSex(stuSex);
		stuInfo.setStuAge(stuAge);
		//调用根据学号修改学生信息方法
		StuInfoDAO studao=new StuInfoDAO();
		int count=studao.updateStuInfo(stuInfo);
		//判断是否修改成功
		if(count>0){
			//修改成功跳转查询所有学生信息页面
			request.getRequestDispatcher("stuinfo.jsp").forward(request, response);
		}else{
			//修改失败跳转失败页面
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	%>
</body>
</html>
