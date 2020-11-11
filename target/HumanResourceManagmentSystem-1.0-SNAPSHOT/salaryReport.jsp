<%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/18/2020
  Time: 6:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="leave.LeaveBean" %>
<%@ page import="leave.LeaveDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import ="java.util.Date" %>
<html>
<head>
    <title class="mainHEAD">Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/staffSalaryOverview.css">
</head><body>
<div class="content">
        <div class="heading">
            <h3>Salary Report </h3>
        </div>
        <br>
        <div class="selection">
            <table>
                <tr>
                    <td>
                        <label class="label">From</label>
                    </td>
                    <th>
                        <div class="year">
                            <input type="number" id="fromYear" name="fromYear" value="2020">
                        </div>

                    </th>
                    <th>
                        <div class="date">
                            <select name="fromMonth" id="fromMonth">
                                <option>Select Month</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">Auguest</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </div>

                    </th>

                </tr>
                <tr>
                    <td>
                        <label class="label">To</label>
                    </td>
                    <th>
                        <div class="year">
                            <input type="number" id="toYear" name="toYear" value="2020">
                        </div>

                    </th>
                    <th>
                        <div class="date">
                            <select name="toMonth" id="toMonth">
                                <option>Select Month</option>
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">Auguest</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </div>

                    </th>

                </tr>
                <tr>
                    <td>

                    </td>
                    <th></th>
                    <th>
                        <a href="#" class="show">Show</a>
                    </th>
                </tr>
            </table>
        </div>
        <div class="result">
            <br>
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
                        A
                    </td>
                    <td>
                        A
                    </td>
                    <td>
                        B
                    </td>
                    <td>
                        C
                    </td>
                    <td>
                        B
                    </td>
                    <td>
                        C
                    </td>
                    <td>
                        A
                    </td>
                    <td>
                        D
                    </td>
                </tr>
                <tr>
                    <td>
                        A
                    </td>
                    <td>
                        D
                    </td>
                    <td>
                        A
                    </td>
                    <td>
                        B
                    </td>
                    <td>
                        C
                    </td>
                    <td>
                        B
                    </td>
                    <td>
                        C
                    </td>
                    <td>
                        D
                    </td>
                </tr>

            </table>
            <div>
                <input class="show" type="submit" onclick="toPDF()" value="Download PDF"/>
            </div>
        </div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
</html>
