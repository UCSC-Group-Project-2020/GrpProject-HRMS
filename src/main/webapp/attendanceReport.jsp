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
    <link rel="stylesheet" href="style/staffAttendanceHistory.css">
</head><body>
<div class="content">
    <div class="heading">
        <h3>Attendance Report </h3>
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
                    <input class="send" type="submit" value="Show"/>
                </th>
            </tr>
        </table>
    </div>
    <div class="result">
        <br>
        <table id="table">
            <tr>
                <th>
                    Attendance ID
                </th>
                <th>
                    Employee ID
                </th>
                <th>
                    Date
                </th>
                <th>
                    Attend Time
                </th>
                <th>
                    Leave Time
                </th>
                <th>
                    Worked Hours
                </th>
                <th>
                    OT Hours
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
                    Sample Date 1
                </td>
                <td>
                    Sample Attend 1
                </td>
                <td>
                    Sample Leave 1
                </td>
                <td>
                    Sample W/H 1
                </td>
                <td>
                    Sample OT 1
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
                    Sample Date 2
                </td>
                <td>
                    Sample Attend 2
                </td>
                <td>
                    Sample Leave 2
                </td>
                <td>
                    Sample W/H 2
                </td>
                <td>
                    Sample OT 2
                </td>
            </tr>

        </table>
    </div>
    <div>
        <input class="show" type="submit" onclick="toPDF()" value="Download PDF"/>
    </div>
</div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
</html>
