<%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/19/2020
  Time: 1:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="ISO-8859-1"%>
<%@ page import="DBconnection.DBconn" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>

<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="icon" href="img/logo.png" sizes="25x25" type="image/png">
    <link rel="stylesheet" href="style/home.css">

</head>
<body>
<div class="content">
    <div class="heading">
        <h3>InfoCorner</h3>
    </div>
    <%if(session.getAttribute("postView").equals(0)){%>

    <img class="noPostImg" src="img/noPost.jpg" />

    <%}else{%>
    <form method="POST" action="home.jsp">
        <div class="post">

            <table id="post_table">
                <%
                    ResultSet rs= null;
                    try
                    {
                        Connection con = DBconn.getConnection();
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery("SELECT post.*,user.firstName,user.lastName FROM post INNER JOIN user ON user.empId = post.empId GROUP BY post.postId DESC");

                        while(rs.next()){
                            String pId = rs.getString("postId");
                            int count = rs.getInt("postImage");
                %>
                <tr>
                    <tr>
                        <th class="name"><%=rs.getString("firstName")%> <%=rs.getString("lastName")%></th>
                    </tr>
                    <tr>
                        <td class="date"><%=rs.getString("dateTime")%></td>
                    </tr>
                    <tr>
                         <td class="des"><%=rs.getString("postText")%></td>
                    </tr >
                    <tr>
                         <%
            String imgs[] = new String[count];
            Blob img;
            int a=0;
            ResultSet rsImg = null;
            Statement getImg = con.createStatement();
            rsImg = getImg.executeQuery("SELECT * FROM postimgs WHERE postId = '"+pId+"'");
            while(rsImg.next())
            {
                img = rsImg.getBlob("image");
                InputStream inputStream = img.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1)
                {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                imgs[a] = Base64.getEncoder().encodeToString(imageBytes);
                a++;
            }
            if(count%2==0){
                for(int j=0;j<count;j=j+2){%>
                        <tr>
                            <th class="image">
                                <img class="imgL" src="data:image/jpg;base64,<%=imgs[j]%>" />
                                <img class="imgR" src="data:image/jpg;base64,<%=imgs[j+1]%>"/>
                            </th>
                        </tr>
                            <%}}
                            else{%>
                        <tr>
                            <th class="image"><img class="singleImg" src="data:image/jpg;base64,<%=imgs[0]%>"/></th>
                        </tr>
                        <%for(int j=1;j<count;j=j+2){%>
                        <tr>
                            <th class="image">
                                <img class="imgL" src="data:image/jpg;base64,<%=imgs[j]%>"/>
                                <img class="imgR" src="data:image/jpg;base64,<%=imgs[j+1]%>"/>
                            </th>
                        </tr>
                        <%}}}}catch (SQLException e){e.printStackTrace();}%>
                    </tr>

                </tr>
            </table>
        </div>
        <%}%>
    </form>


</div>
<%@include file="mainDashboard.jsp" %>

</body>
</html>