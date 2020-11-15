<%--
  Created by IntelliJ IDEA.
  User: Deshan-UCSC
  Date: 10/21/2020
  Time: 12:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%%>
<html>
<head>
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/addPost.css">
</head>
<body>

<div class="content">
    <div class="heading">
        <h3>Add Post</h3>
    </div>
    <form action="addpost" method="POST" enctype="multipart/form-data">
        <%
            String result= (String) request.getAttribute("result");

            if(result != null){

                if(result=="Successful"){%>
        <h4 class="response" style="color: #4bbe19;">
            Successfully Posted on the Home!
        </h4><%

        }request.setAttribute("result",null);
    %>
        <%
            if(result == "Unsuccessful"){%>
        <h4 class="response" style="color: #DC143C;">
            Unable To Send Your Post! , Try Again.
        </h4>
        <%} request.setAttribute("result",null);}
            request.setAttribute("result",null);
        %>
    <div class="main" id="m">
        <table>
            <tr hidden>
                <td>
                    <label class="label">Current Logged Employee Id</label>
                </td>
                <th>
                    <input class="input" type="text" name="empId" value="<%=session.getAttribute("empId")%>" readonly>
                </th>
            </tr>
        </table>

        <table>
            <table>
                <tr>
                    <td>
                        <label class="label">Description</label>
                    </td>
                <tr>
                    <th>
              <textarea rows="5" cols="50" name="description"
                        placeholder="Type your post here"></textarea>
                    </th>
                </tr>

                </tr>
            </table>
            <table>
                <tr>
                    <td>

                    </td>
                    <%//int i=0;%>
                    <th>
                        <!--<input type="file" id="myFile" name="imgFile" class="fileChoose" onclick="myFunction()">-->
                        <input type="button" class="addImg" name="imgbtn" value="Add a Image" onclick="addImage()">
                        <input type="text" name="tot" id="tot" value="0" readonly hidden>
                    <script>
                        let i=1;
                        function addImage()
                        {
                            var filein = document.createElement("input");
                            filein.type = "file";
                            filein.name = "imgFile"+i;
                            filein.className = "fileChoose";
                            filein.accept = "image/*";
                            document.getElementById("m").appendChild(filein);
                            document.getElementById("tot").value=i;
                            i++;
                        }
                    </script>
                    </th>
                </tr>
            </table>
            <table>
                <tr>
                    <td></td>
                    <th>
                        <input class="send" type="submit" value="Send"/>
                    </th>
                </tr>
            </table>
        </table>
    </div>
    </form>
</div>
</div>
<%@include file="mainDashboard.jsp" %>
</body>

</html>

