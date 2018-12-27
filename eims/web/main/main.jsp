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
    <title>企业信息管理系统————主页面</title>
</head>
<frameset rows="*" cols="200,*">
    <frame src="left.jsp" name="left" scrolling="no">
    <frameset rows="180,*" cols="*">
        <frame src="top.jsp" name="top" scrolling="no">
        <frame src="bottom.jsp" name="main" scrolling="no">
    </frameset>
</frameset>
</html>
