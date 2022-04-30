<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.jin.dao.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jin.entity.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>学生信息表</title>

</head>
<body>
<%
	Object name=null;
	if (session.getAttribute("userName") == null){
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}else {
		name = session.getAttribute("userName");
	}
    
%>
<p style="font-size: 10px">SessionID：<%=session.getId()%></p>
<p style="font-size: 15px">当前登录用户：<nobr style="color: red"><%=name %></nobr><br/><a href="out.jsp" style="font-size: 10px">重新登录</a></p>
<table border="1px" align="center">
	<caption>学生信息表</caption>
	<tr>
		<th>学号</th>
		<th>姓名</th>
		<th>性别</th>
		<th>年龄</th>
		<th>操作</th>
	</tr>
	
	<%
		//实例化一个StuInfoDAO对象
		StuInfoDAO studao=new StuInfoDAO();
		//调用查询所有学生信息方法
		List<StuInfoEntity> stuList=studao.QueryAllStuInfo();
		
		//循环遍历集合获取学生对象
		for(StuInfoEntity stuInfo:stuList){
	%>
	<!-- 使用表达式从对象中获取具体学生信息 -->
	<tr>
		<td style="text-align:center"><%=stuInfo.getStuId() %></td>
		<td style="text-align:center"><%=stuInfo.getStuName() %></td>
		<td style="text-align:center"><%=stuInfo.getStuSex()==1?"男":"女" %></td>
		<td style="text-align:center"><%=stuInfo.getStuAge() %></td>
		<td style="text-align:center"><a href="update.jsp?stuId=<%=stuInfo.getStuId() %>">修改</a> <a href="deletedao.jsp?stuId=<%=stuInfo.getStuId() %>">删除</a></td>
	</tr>
	
	<%
		}
	%>
	
	<tr>
		<td colspan="5" align="center"><a href="insert.jsp">新增</a></td>
	</tr>

</table>

</body>
</html>
