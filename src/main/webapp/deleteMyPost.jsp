<%--
  Created by IntelliJ IDEA.
  User: SupunN
  Date: 11/10/2020
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
    <link rel="stylesheet" href="style/deletePost.css">

</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="content">
    <div class="heading">
        <h3>Delete Post</h3>
    </div>
    <form method="POST" action="deletepost">
        <%
            String result= (String) request.getAttribute("result");

            if(result != null){

                if(result=="Successful"){%>
        <h4 class="response" style="color: #4bbe19;">
            Post Removed Successfully!
        </h4><%

        }request.setAttribute("result",null);
    %>
        <%
            if(result == "Unsuccessful"){%>
        <h4 class="response" style="color: #DC143C;">
            Unable To Remove Your Post! , Try Again.
        </h4>
        <%} request.setAttribute("result",null);}
            request.setAttribute("result",null);
        %>
        <div class="top">
            <table class="main">
                <tr>
                    <th> <h3 for="delButton" class="help">Select Post to Delete</h3></th>

                <th>
                    <h3 class="count">Selected Number Of Posts -</h3>
                </th>
                <th>
                    <input class="Delete" id="delButton" name="delButton" type="submit" value="Remove"/>
                </th>
                </tr>
            </table>


            <input type="text" name="pId" readonly hidden/>
        </div>

        <div class="post">
            <br>
            <table id="post_table">
                <%
                    Object empId = session.getAttribute("empId");
                    ResultSet rs= null;
                    int n=0;
                    try
                    {
                        Connection con = DBconn.getConnection();
                        Statement statement = con.createStatement();
                        rs = statement.executeQuery("SELECT post.*,user.firstName,user.lastName FROM post INNER JOIN user ON user.empId = post.empId WHERE post.empId = '"+empId+"' GROUP BY post.postId DESC");

                        while(rs.next()){
                            String pId = rs.getString("postId");
                            int count = rs.getInt("postImage");
                            n++;
                %>
                <tr>
                <tr>
                    <th class="name"><%=rs.getString("firstName")%> <%=rs.getString("lastName")%>   <input type="checkbox" class="selectPost" id="<%=n%>" name="post<%=n%>" value="<%=pId%>"></th>
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
                    <th class="image">
                        <img class="singleImg" src="data:image/jpg;base64,<%=imgs[0]%>" width="400" height="400"/>
                    </th>
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
    </form>

    <script>
        $(document).ready(getSelectedCB);

        CountSelectedCB = [];
        function getSelectedCB()
        {
            $("input:checkbox").change(function()
            {

                CountSelectedCB.length = 0;
                $("input:checkbox").each(function()
                {
                    if ($(this).is(":checked"))
                    {
                        CountSelectedCB.push($(this).attr("value"));
                    }
                });

                $('input[name=pId]').val(CountSelectedCB);
            });
        }
    </script>

</div>
<%@include file="mainDashboard.jsp" %>
</body>
</html>
