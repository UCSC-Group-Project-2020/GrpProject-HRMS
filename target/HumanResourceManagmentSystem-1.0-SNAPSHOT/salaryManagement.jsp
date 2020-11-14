<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<%@ page import="DBconnection.DBconn" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/18/2020
  Time: 6:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/salaryManagement.css">
</head>
<body>
<%  Date date = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("dd");
    String d= formatter.format(date);
    int today=Integer.parseInt(d);
    int salaryCalculation = 0;
    String s=null;
%>
<div class="content">

    <div class="heading">
        <h3> Salary Management </h3>
    </div>
    <div class="result">
        <table id="table">
            <tr>
                <th>
                    Salary ID
                </th>
                <th>
                    Employee ID
                </th>
                <th>
                    From Date
                </th>
                <th>
                    To Date
                </th>
                <th>
                    Basic Salary
                </th>
                <th>
                    OT rate
                </th>
                <th>
                    OT Payment
                </th>
                <th>
                    Total
                </th>
            </tr>
            <tr>
                <td>
                    Sample ID 1
                </td>
                <td>
                    Sample Emp 1
                </td>
                <td>
                    Sample From 1
                </td>
                <td>
                    Sample To 1
                </td>
                <td>
                    Basic 1
                </td>
                <td>
                    OT Rate 1
                </td>
                <td>
                    OT Pay 1
                </td>
                <td>
                    Tot 1
                </td>
            </tr>
            <tr>
                <td>
                    Sample ID 2
                </td>
                <td>
                    Sample Emp 2
                </td>
                <td>
                    Sample From 2
                </td>
                <td>
                    Sample To 2
                </td>
                <td>
                    Basic 2
                </td>
                <td>
                    OT Rate 2
                </td>
                <td>
                    OT Pay 2
                </td>
                <td>
                    Tot 2
                </td>
            </tr>
        </table>
        <br>
    </div>
    <hr>
    <div class="main">
        <%
            try {
            Connection con = DBconn.getConnection();
            Statement statement = con.createStatement();
            ResultSet rs1 = null;

            rs1 = statement.executeQuery("SELECT * FROM `customizeddata` ORDER BY`ID` DESC LIMIT 1");

            if (rs1.next()) {
                salaryCalculation= rs1.getInt("salaryCalculationDate");
            }
            }catch (SQLException e) {
                e.printStackTrace();
            }
            if (salaryCalculation%10==1){
                s="st";
            }else if(salaryCalculation%10==2){
                s="nd";
            }else if(salaryCalculation%10==3){
                s="rd";
            }else {
                s="th";
            }
            System.out.println(salaryCalculation);
            System.out.println(s);
            System.out.println(today);
            if (salaryCalculation==today){
        %>
        <input class="send" type="submit" value="Send Salary Calculations To Employees">
        <%}else {%>

        <h2 class="notify">Salaries Can Be Finalized And Send To Employees Only On Next <b><%=salaryCalculation%><%=s%></b></h2>

        <%}%>
    </div>
</div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>
</html>
