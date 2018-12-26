<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/26
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>企业信息管理系统————登录页面</title>
  </head>
  <body background="img/login.JPG">
  <%--<h1>从入门到放弃！</h1>--%>
  <br><br><br><br><br><br>
  <br><br><br><br><br><br>
  <center>
    <form action="loginCheck.jsp" method="post">
      <tr>
        <td>
          <table border="1" cellpadding="0" cellspacing="0" bgcolor="#dddddd" width="360" height="200">
            <tr height="130">
              <td align="center">
                输入用户姓名<input type="text" name="userName" size="20">
                <br>
                输入用户密码<input type="text" name="password" size="20">
                <br>
                <input type="submit" value="登录" size="12">&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="reset" value="清除" size="12">
              </td>
            </tr>
            <tr height="30">
              <td bgcolor="#95BDFF">&nbsp;&nbsp;</td>
            </tr>
          </table>
        </td>
      </tr>

    </form>
  </center>

  </body>
</html>
