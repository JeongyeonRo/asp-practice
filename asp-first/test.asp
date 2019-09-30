<!doctype html>
<html>
    <head>
        <meta charset="euc-kr">
        <title>TEST</title>
    </head>
    <body>
    <%
    str = "<br>오늘은 " & date() & " 입니다.<br>"
    for i = 1 to 5
    Response.Write str
    next
    %>
    </body>
</html>