<!doctype html>
<%
    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    bno = Request("idx")

    strSQL = " "
    strSQL = strSQL & " SELECT TITLE, WRITER, CONTENT"
    strSQL = strSQL & " FROM MYBOARD "
    strSQL = strSQL & " WHERE BNO = " & bno

    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSQL, Conn

   title = rs(0)
   writer = rs(1)
   content = rs(2)
%>
<html>
    <head>
        <meta charset="euc-kr">
        <title>상세보기</title>
    </head>
    <body>
    <table border cellspacing="0" width="500">
      <tr>
         <td colspan="2" align="center"><b>상세보기</b></td>
      </tr>
      <tr>
         <td align="center" width="70" height="30">제목</td>
         <td><%=title%></td>
      </tr>
      <tr>
         <td align="center" width="70" height="30">작성자</td>
         <td><%=writer%></td>
      </tr>
      <tr>
         <td align="center" width="70" height="100">내용</td>
         <td><%=content%></td>
      </tr>
      </body>
</html>