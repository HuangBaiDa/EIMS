<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/5
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除客户信息处理页面</title>
</head>
<body bgcolor="#CCCFFF">
<%
    int id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));
    //连接数据库
    Connection connection = null;
    Statement stmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
        String userName = "root";
        String password = "mysql123";
        connection = DriverManager.getConnection(url, userName, password);
        stmt = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "delete from client where id=" + id;
        stmt.executeUpdate(sql);
        response.sendRedirect("http://localhost:8088/eims/clientManage/lookClient.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null)
            stmt.close();
        if (connection != null)
            connection.close();
    }
%>
</body>
</html>
