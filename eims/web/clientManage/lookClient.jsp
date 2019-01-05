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
    <title>客户查询</title>
</head>
<body bgcolor="#CCCFFF">
<table align="center" width="500">
    <tr>
        <td>客户查询</td>
        <td>
            <a href="http://localhost:8088/eims/clientManage/addClient.jsp">客户添加</a>
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
<table align="center" width="700" border="2" bgcolor="#f0ffff">
    <tr>
        <th colspan="5">查看客户信息</th>
    </tr>
    <tr>
        <td>序号</td>
        <td>姓名</td>
        <td>电话</td>
        <td>地址</td>
        <td>邮箱</td>
    </tr>
    <%
        //连接数据库
        Connection connection = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            //分页参数
            int intPageSize;
            int intRowCount;
            int intPageCount = 0;
            int intPage = 1;
            String strPage;
            intPageSize = 10;
            int i;

            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/eims?useUnicode=true&characterEncoding=gbk";
            String userName = "root";
            String password = "mysql123";
            connection = DriverManager.getConnection(url, userName, password);
            stmt = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            String sql = "select * from client";
            rs = stmt.executeQuery(sql);

            //取待显示的页码
            strPage = request.getParameter("page");
            if (strPage == null) {
                //请求参数中没有page这个参数，此时显示第一页
                intPage = 1;
            } else {
                intPage = java.lang.Integer.parseInt(strPage);
                if (intPage < 1) {
                    intPage = 1;
                }
            }

            //定位到结果集的最后一条记录
            rs.last();
            //获取总记录数
            intRowCount = rs.getRow();
            //计算总页数
            intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
            if (intPage > intPageCount) {
                intPage = intPageCount;
            }
            if (intPageCount > 0) {
                //将记录定位到待显示页的第一条记录上
                rs.absolute((intPage - 1) * intPageSize + 1);
                //显示数据
                i = 0;
                while (i < intPageSize && !rs.isAfterLast()) {

    %>
    <tr>
        <td><%=rs.getRow()%>
        </td>
        <td><%=rs.getString("clientName")%>
        </td>
        <td><%=rs.getString("clientTelephone")%>
        </td>
        <td><%=rs.getString("clientAddress")%>
        </td>
        <td><%=rs.getString("clientEmail")%>
        </td>
    </tr>
    <%
                rs.next();
                i++;
            }
        }
    %>
</table>
<hr>
<div align="center">
    客户总数：<%=intRowCount%>人&nbsp;&nbsp;
    第<%=intPage%>頁&nbsp;&nbsp;共<%=intPageCount%>頁
    <%
        if (intPage < intPageCount) {
    %>
    <a href="http://localhost:8080/eims/clientManage/lookClient.jsp?page=<%=intPage+1%>">下一頁</a>
    <%
        }
        if (intPage > 1) {
    %>
    <a href="http://localhost:8080/eims/clientManage/lookClient.jsp?page=<%=intPage-1%>">上一頁</a>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    %>
</div>
</body>
</html>
