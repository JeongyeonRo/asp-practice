<!doctype html>
<!--#include virtual="/inc/menu/head.asp"-->
<%
    Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    bno = Request("idx")

    strSQL = " "
    strSQL = strSQL & " SELECT TITLE, WRITER, CONTENT, BNO"
    strSQL = strSQL & " FROM MYBOARD "
    strSQL = strSQL & " WHERE BNO = " & bno

    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSQL, Conn

   title = rs(0)
   writer = rs(1)
   content = rs(2)
   bno = rs(3)
%>
<html>
    <head>
      <style>
         .content{
            position: absolute;
            top: 150px;
            left: 300px;
         }
         .content .view_content{
            background-color:#f2f2f2;
         }

      </style>
        <meta charset="euc-kr">
        <title>상세보기</title>
    </head>
    <body>
    <div class="content">
      <div class="view_content">
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
         </table>
      </div>
         <br>
         <div align="center">
            <input type="button" value="수 정" onclick="javascript:modBtn();">
         </div>
      </div>
   </body>
   <script type="text/javascript">
      function modBtn(){
         var bno = <%=bno%>;
         window.location = "/board/Write.asp?bno="+bno;      
      }

   </script>
</html>