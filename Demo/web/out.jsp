<%--
  Created by IntelliJ IDEA.
  User: Jin
  Date: 2022/4/23
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
    <%
        session.removeAttribute("userName");
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request,response);
    %>
</body>
</html>
