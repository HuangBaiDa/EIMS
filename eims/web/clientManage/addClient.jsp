<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/5
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加客户信息</title>
</head>
<body bgcolor="#CCCFFF">
<table align="center" width="500">
    <tr>
        <td><a href="http://localhost:8088/eims/clientManage/lookClient.jsp">客户查询</a></td>
        <td>
            客户添加
        </td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/searchClient.jsp">客户修改</a>
        </td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/deleteClient.jsp">客户删除</a>
        </td>
    </tr>
</table>
<br>
<hr>
<br>
<div align="center">
    <form action="http://localhost:8088/eims/clientManage/addClientCheck.jsp">
        <table bgcolor="#f0ffff">
            <tr>
                <th colspan="2">添加客户信息</th>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="clientName"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="clientTelephone"></td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="clientAddress"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="clientEmail"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="sure" value="确认">&nbsp;&nbsp;<input
                        type="reset" name="clear" value="取消"></td>
            </tr>
        </table>
    </form>
</div>
<hr>
</body>
</html>
