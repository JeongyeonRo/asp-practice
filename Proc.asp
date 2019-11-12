<%

    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"
    
    strSQL = "SELECT BNO, TITLE, WRITER, REGDATE, READCNT, PASSWD_YN FROM MYBOARD ORDER BY BNO DESC"


    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSql, Conn

    Response.Write "DATA:"
    Response.Writ

    %>