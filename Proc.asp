<%
    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    strSQL = "SELECT BNO, TITLE, WRITER, REGDATE, READCNT, PASSWD_YN "
    strSQL = strSQL & "FROM MYBOARD "
    strSQL = strSQL & "WHERE 1 = 1"
    If keyword <> "" Then
        strSQL = strSQL & "AND TITLE LIKE %" & keyword & "%"
    End If
    strSQL = strSQL & "ORDER BY BNO DESC"


    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSql, Conn
%>