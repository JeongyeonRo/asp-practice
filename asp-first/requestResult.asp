<!DOCTYPE html>
<html>
    <head>
        <meta charset="euc-kr">
        <title>requestResult</title>
    </head>
    <body>
        <h2 align="center">Request�� ���� ��</h2><br>
            My name is <%=Request.QueryString("username")%><br>
            I'm <%=Request.QueryString("userage")%> years old<br>
            My phone number is <%=Request.QueryString("usertel")%><br>
    </body>
</html>