<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/5
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理客户修改数据</title>
</head>
<body>
<%
    //web tomcat:默认是ISO8859-1，不支持中文的
    int id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));
    //request.getParameter() 找不到指定参数信息返回null
    byte clientNameArr[] = request.getParameter("clientName").getBytes("ISO-8859-1");
    String clientName = new String(clientNameArr, "UTF-8");
    String clientTelephone = new String(request.getParameter("clientTelephone").getBytes("ISO-8859-1"), "UTF-8");
    String clientAddress = new String(request.getParameter("clientAddress").getBytes("ISO-8859-1"), "UTF-8");
    String clientEmail = new String(request.getParameter("clientEmail").getBytes("ISO-8859-1"), "UTF-8");

    Connection conn = null;
    Statement stmt = null;

    String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
    String userName = "root";
    String password = "mysql123";
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, userName, password);
        String sql = "update client set clientName='"+clientName+"',clientTelephone='"+ clientTelephone +"',clientAddress='"+clientAddress +"',clientEmail='"+ clientEmail +"' where id=" + id;
        stmt = conn.createStatement();
        stmt.executeUpdate(sql);
        //重定向到查看客户查询页面
        response.sendRedirect("http://localhost:8088/eims/clientManage/lookClient.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if(stmt!=null)
        stmt.close();
        if(conn!=null)
        conn.close();
    }
%>
</body>
</html>
