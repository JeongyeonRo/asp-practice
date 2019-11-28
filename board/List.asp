<!doctype html>
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
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <meta charset="euc-kr">
        <title>List</title>

    </head>
    <body>
        <h2 align="center">목록보기</h2>
    <div>
        <a href="/board/Write.asp">글쓰기</a>
        <div align="center">
        <select value="" onchange="">
            <option value="">전체</option>
            <option value="title">제목</option>
            <option value="writer">작성자</option>
        </select>
        <input type="text" width="50">
        </div><br>
        <div align="center">
            <table border width="600">
                <tr align="center">
                   <td>번호</td>
                   <td>제목</td>
                   <td>작성자</td>
                   <td>작성일</td>
                   <td>조회수</td>
                </tr>
        <% If rs.BOF or rs.EOF Then %>
                <tr align="center">
                    <td colspan="5">등록된 게시물이 없습니다</td>
                </tr>
        <%
         Else
              Do Until rs.EOF
        %>
            <tr align="center">
                <td><%=rs(0)%></td>
                <td>
                    <a href="/board/View.asp?idx=<%=rs(0)%>" onclick="passwdchk()"><%=rs(1)%></a>
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