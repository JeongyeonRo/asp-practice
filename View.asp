<!doctype html>
<%
    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    strSQL = "SELECT BNO, TITLE, WRITER, CONTENT, REGDATE FROM MYBOARD ORDER BY BNO DESC"

    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSql, Conn

   title = rs(1)
   writer = rs(2)
   content = rs(3)
%>
<html>
    <head>
        <meta charset="euc-kr">
        <title>�󼼺���</title>
    </head>
    <body>
    <table border cellspacing="0" width="500">
      <tr>
         <td colspan="2" align="center"><b>�󼼺���</b></td>
      </tr>
      <tr>
         <td align="center">����</td>
         <td><%=title%></td>
      </tr>
      <tr>
         <td align="center">�ۼ���</td>
         <td><input type="text" name="writer" size="50"></td>
      </tr>
      <tr>
         <td align="center">����</td>
         <td><textarea name="content" cols="51" rows="10"></textarea></td>
      </tr>
      </body>
</html>