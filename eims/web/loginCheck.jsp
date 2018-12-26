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
    <title>数据处理页面</title>
  </head>
  <body>
  <%
    String userName = request.getParameter("userName");
    byte b [] = userName.getBytes("ISO-8859-1");
    userName = new String(b,"UTF-8");

//    String password = request.getParameter("password");
//    byte b1 [] = password.getBytes("ISO-8859-1");
//    password = new String(b1,"UTF-8");

    String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
    Connection conn = null;
    Statement  stmt = null;
    ResultSet rs = null;
    if(userName.equals("")){
        response.sendRedirect("login.jsp");
    }
    try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
      String user = "root";
      String pwd = "mysql123";
      conn = DriverManager.getConnection(url, user, pwd);
      stmt = conn.createStatement();
      String query = "select * from user where userName='" + userName + "'";
      rs = stmt.executeQuery(query);
      if(rs.next()){
        String query2 = "select * from user where password='" + password + "'";
        rs = stmt.executeQuery(query2);
        if(rs.next()){
            response.sendRedirect("main/main.jsp");
        }else{
          response.sendRedirect("login.jsp");
        }
      }else{
        response.sendRedirect("login.jsp");
      }
    }catch (Exception e){
        e.printStackTrace();
    }finally {
        rs.close();
        stmt.close();
        conn.close();
    }

  %>
  </body>
</html>
