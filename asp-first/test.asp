<!doctype html>
<html>
    <head>
        <meta charset="euc-kr">
        <title>TEST</title>
    </head>
    <body>
    <%
    str = "<br>������ " & date() & " �Դϴ�.<br>"
    for i = 1 to 5
    Response.Write str
    next
    %>
    </body>
</html>