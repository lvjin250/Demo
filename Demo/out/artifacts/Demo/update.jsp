<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lvjin.entity.*" %>
<%@ page import="com.lvjin.dao.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update</title>
</head>
<body>
	<%
		if (session.getAttribute("userName") == null){
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}
	%>
		<%
		//获取查询学号
		int stuId=Integer.parseInt(request.getParameter("stuId"));
		//实例化一个StuInfoDAO对象
		StuInfoDAO studao=new StuInfoDAO();
		//调用根据学号查询单个学生信息方法,返回一个学生对象
		StuInfoEntity stuInfo=studao.queryStuInfoByStuId(stuId);
		%>
		
		<!-- 绘制一个修改学生信息页面 -->
		<form action="updatedao.jsp" method="post">
			<table border="1" align="center">
				<caption>修改学生信息</caption>
				<tr>
					<td style="text-align:center">学号:</td>
					<td>
						<input type="text" name="stuId" value="<%=stuInfo.getStuId() %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td style="text-align:center">姓名:</td>
					<td>
						<input type="text" name="stuName" value="<%=stuInfo.getStuName() %>">
					</td>
				</tr>
				<tr>
					<td style="text-align:center">性别:</td>
					<td>
						<!-- 判断性别默认选中 -->
						<%
							if(stuInfo.getStuSex()==1){
						%>	
							<!-- 默认选中“男” -->
							<input type="radio" name="stuSex" value="1" checked="checked">男
							<input type="radio" name="stuSex" value="0">女
						<%		
							}else{
						%>	
							<!-- 默认选中"女" -->
							<input type="radio" name="stuSex" value="1">男
							<input type="radio" name="stuSex" value="0" checked="checked">女
						<%		
							}
						%>
						
					</td>
				</tr>
				<tr>
					<td style="text-align:center">年龄:</td>
					<td>
						<input type="text" name="stuAge" value="<%=stuInfo.getStuAge() %>" >
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="修改">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>
