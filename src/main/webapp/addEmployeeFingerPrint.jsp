<%@ page import="user.UserBean" %><%--
  Created by IntelliJ IDEA.
  User: SupunN
  Date: 23/18/2020
  Time: 21:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserBean" %>
<%@ page import="user.EmployeeDao" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/addFingerPrint.css">
</head>
<body>

<div class="content">
    <div class="heading">
        <h3>Add Employee FingerPrint</h3>
    </div>
    <br>
    <div class="main">
        <table>
            <tr>
                <td>
                    <label class="label">EMP ID</label>
                </td>
                <%
                    ResultSet rs = null;
                    try {
                        Connection con = DBconn.getConnection();
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery("SELECT empId FROM user ORDER BY empId DESC LIMIT 1");

                        while (rs.next()) {%>
                <th>
                    <input class="input" type="text" name="empid" value="<%=rs.getInt("empId")%>" readonly>
                </th>
            </tr>


            <tr>
                <td>
                    <label class="label">FingerPrint ID</label>
                </td>
                <th>
                    <input class="input" type="text" name="empid" value="<%=rs.getInt("empId")-10000 %>" readonly>
                </th>
            </tr>
            <%}} catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error");
                System.out.println(e);
            }%>
        </table>
        <table>
            <tr>
                <td></td>
                <th>
                    <input class="scan" type="submit" value="Scan"/>
                </th>
            </tr>
        </table>
    </div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>

</html>
