<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/28
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户信息删除</title>
</head>
<body bgcolor="#cccfff">
<table align="center" width="500">
    <tr>
        <td><a href="http://localhost:8088/eims/clientManage/lookClient.jsp">客户查询</a></td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/addClient.jsp">客户添加</a>
        </td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/searchClient.jsp">客户修改</a>
        </td>
        <td>
            客户删除
        </td>
    </tr>
</table>
<br>
<hr>
<br>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
    String userName = "root";
    String password = "mysql123";
    Connection conn = DriverManager.getConnection(url, userName, password);
    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
%>
<center>
    <br><br><br>
    <br><br><br>
    <h2>删除客户信息</h2>
    <form action="http://localhost:8088/eims/clientManage/deleteClientCheck.jsp" method="post">
        <p>请选择要删除客户的姓名
            <select name="id">
                <%
                    String sql = "select * from client";
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        String clientName = rs.getString("clientName");
                        int id = rs.getInt("id");
                %>
                <option value="<%=id%>"><%=clientName%>
                </option>
                <%
                    }
                %>
            </select>
        </p>
        <p>
            <input type="submit" value="确定">&nbsp;
            <input type="button" value="返回" onclick="javascript:history.go(-1)">
        </p>
    </form>
</center>
</body>
</html>
