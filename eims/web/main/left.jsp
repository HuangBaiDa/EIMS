<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/26
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页</title>
</head>
<body bgcolor="#cccfff">
<table>
    <tr>
        <td>
            <img src="../img/l1.jpg" width="180px" height="300px">
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/clientManage/lookClient.jsp" target="main">客户管理</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/contractManage/lookContract.jsp" target="main">合同管理</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/CSManage/lookCS.jsp" target="main">售后管理</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/productManage/lookProduct.jsp" target="main">产品管理</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/staffManage/lookStaff.jsp" target="main">员工管理</a>
        </td>
    </tr>
    <tr>
        <td>
            <a href="http://localhost:8080/eims/login.jsp" target="_parent">退出系统</a>
        </td>
    </tr>
</table>

</body>
</html>
