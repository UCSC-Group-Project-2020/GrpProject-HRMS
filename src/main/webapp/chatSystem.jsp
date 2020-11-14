<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Human Resource Management System</title>
    <link rel="stylesheet" href="style/mainStyle.css">
    <link rel="stylesheet" href="style/chatSystem.css">

</head>
<div class="content">
    <div class="heading">
        <h3>Chat Coner</h3>
    </div>

    <div class="members">
        <table id="tableNames" class="employees">
            <tr></tr>
            <tr>
                <td>10001</td>
                <td>Chamika</td>
            </tr>
            <tr>
                <td>10002</td>
                <td>Supun</td>
            </tr>
            <tr>
                <td>10003</td>
                <td>Lakith</td>
            </tr>

            <tr>
                <td>10004</td>
                <td>Ravindu</td>
            </tr>

        </table>
    </div>
    <div class="chat">
        <h3 id="name" class="name">Name</h3>

        <div class="msgs">

            <div class="chatMsgs">
                <h2 class="recived">Hello</h2>
            </div>

            <div class="chatMsgs">
                <h2 class="sent">Hiii</h2>
            </div>

            <br><br><br>

            <div class="chatMsgs">
                <h2 class="recived">How Are You</h2>
            </div>

            <div class="chatMsgs">
                <h2 class="sent">I'm Fine,How About You</h2>
            </div>

            <br><br><br>

            <div class="chatMsgs">
                <h2 class="recived">I'm Also Fine</h2>
            </div>
            <br><br><br>


        </div>
        <div class="sendMsg">
            <input type="text" class="input" name="msg" id="msg">
            <input type="submit" class="send" name="Send" id="">
        </div>
    </div>
</div>
</div>

<body>
<%@include file="mainDashboard.jsp" %>
<script type="text/javascript" src="js/chatSystem.js"></script>
</body>
</html>