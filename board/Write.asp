<!DOCTYPE html>

<!--#include virtual="/inc/menu/head.asp"-->

<%
   Set Conn = Server.CreateObject("ADODB.Connection") 
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"

    bno = Request("bno")

   If bno <> "" Then
    strSQL = " "
    strSQL = strSQL & " SELECT TITLE, WRITER, CONTENT, PASSWD_YN"
    strSQL = strSQL & " FROM MYBOARD "
    strSQL = strSQL & " WHERE BNO = " & bno

    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open strSQL, Conn

   title = rs(0)
   writer = rs(1)
   content = rs(2)
   passwd_yn = rs(3)

   End If
%>
<html>
    <head>
      <style>
         .content{
            position: absolute;
            top: 150px;
            left: 300px;
         }
         .content .write_content{
            background-color:#f2f2f2;
         }

      </style>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <meta charset="euc-kr">
        <title>write</title>
    </head>
    <body>
      <div class="content">
         <div class="write_content">
            <form name="regForm" method= "post" action="/board/sqlBoard.asp">
               <table border cellspacing="0" width="500">
               <input type="hidden" name="mode" value="write">
               <tr>
                  <td colspan="2" align="center"><b>���ۼ�</b></td>
               </tr>
               <tr>
                  <td align="center">����</td>
                  <td><input type="text" name="title" id="title" size="50" value="<%=title%>"></   td>
               </tr>
               <tr>
                  <td align="center">�ۼ���</td>
                  <td><input type="text" name="writer" size="50" value="<%=writer%>"></td>
               </tr>
               <tr>
                  <td align="center">����</td>
                  <td><textarea name="content" cols="51" rows="10"><%=content%></textarea></td>
               </tr>
               <tr>
                  <td align="center">����/�����</td>
                  <td>
                     <input type="radio" name="passwd_yn" value="T" checked>����
                     <input type="radio" name="passwd_yn" value= "F" <%If passwd_yn="F" Then%>  checked      <%End If%>>�����
                  </td>
               </tr>
               <tr>
                  <td align="center">��й�ȣ</td>
                  <td><input type="password" name="passwd" size="50" placeholder="����� �Խñ��� ��� �ۼ�"></td>
               </tr>
               <tr>
                  <td colspan="2" align="center">
                     <input type="submit" value="�ۼ��Ϸ�" onclick="saveit()">&nbsp;&nbsp;&nbsp;
                     <input type="reset" value="�ٽ� �ۼ�">
                  </td>
               </tr>
               </table>
            </form>
         </div>
   </body>

    <script type="text/javascript">
        function saveit(){
            if(document.regForm.title.value == ""){
                alert("�������� �ʼ��Դϴ�.");
                event.preventDefault();
                document.getElementById("title").focus();
                return false;
            }
            document.regForm.submit();
        }
    </script>
</html>