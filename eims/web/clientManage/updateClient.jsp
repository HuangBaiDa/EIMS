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
    <title>修改客户信息</title>
</head>
<body bgcolor="#CCCFFF">
<table align="center" width="500">
    <tr>
        <td><a href="http://localhost:8088/eims/clientManage/lookClient.jsp">客户查询</a></td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/addClient.jsp">客户添加</a>
        </td>
        <td>
            客户修改
        </td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/deleteClient.jsp">客户删除</a>
        </td>
    </tr>
</table>
<br>
<hr>
<br>
<%
    int id = Integer.parseInt(new String(request.getParameter("id").getBytes("ISO-8859-1"), "UTF-8"));
    String clientName = "";
    String clientTelephone = "";
    String clientAddress = "";
    String clientEmail = "";

    //连接数据库
    Connection connection = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
        String userName = "root";
        String password = "mysql123";
        connection = DriverManager.getConnection(url, userName, password);
        stmt = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        String sql = "select * from client where id=" + id;
        rs = stmt.executeQuery(sql);

        while (rs.next()) {
            clientName = rs.getString("clientName");
            clientTelephone = rs.getString("clientTelephone");
            clientAddress = rs.getString("clientAddress");
            clientEmail = rs.getString("clientEmail");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (stmt != null)
            stmt.close();
        if (connection != null)
            connection.close();
    }
%>
<div align="center">
    <form action="http://localhost:8088/eims/clientManage/updateClientCheck.jsp">
        <table bgcolor="#f0ffff">
            <tr>
                <th colspan="2">修改客户信息</th>
            </tr>
            <tr>
                <td>ID</td>
                <td><input type="text" name="id" value="<%=id%>"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="clientName" value="<%=clientName%>"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="clientTelephone" value="<%=clientTelephone%>"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="clientAddress" value="<%=clientAddress%>"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="clientEmail" value="<%=clientEmail%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="sure" value="确认">&nbsp;&nbsp;<input
                        type="reset" name="clear" value="取消">&nbsp;&nbsp;<input type="button" name="back" value="返回"
                                                                                onclick="javascript:history.go(-1)">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
