<!doctype html>
<% 
    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    strSQL = "SELECT BNO, TITLE, WRITER, REGDATE, READCNT, PASSWD_YN FROM MYBOARD ORDER BY BNO DESC"


    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSql, Conn

    PASSWD_YN = rs(5)

%>
<html>
    <head>
        <meta charset="euc-kr">
        <title>Default</title>
    </head>
    <body>
        <h2 align="center">��Ϻ���</h2>
    <div>
        <a href="Write.asp">�۾���</a>
        <div align="center">
            <table border width="600">
                <tr align="center">
                   <td>��ȣ</td>
                   <td>����</td>
                   <td>�ۼ���</td>
                   <td>�ۼ���</td>
                   <td>��ȸ��</td>
                </tr>
        <% If rs.BOF or rs.EOF Then %>
                <tr align="center">
                    <td colspan="5">��ϵ� �Խù��� �����ϴ�</td>
                </tr>
        <%
         Else
              Do Until rs.EOF
        %>
            <tr align="center">
                <td><%=rs(0)%></td>
                <td>
                    <a href="content.asp?seq=<%=rs(0)%>" onclick="passwdchk()"><%=rs(1)%></a>
                </td>
                <td><%=rs(2)%></td> 
                <td><%=left(rs(3), 10)%></td>
                <td><%=rs(4)%></td>
            </tr>
        <%
                  rs.MoveNext
              Loop
        End If
 
        rs.Close
        Set rs = nothing
        Conn.Close
        Set Conn = nothing
        %>
        </table>
        </div>
    </div>
    </body>
    <script>
    </script>
</html>