<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<html>
    <head>
        <meta charset="euc-kr">
        <title>write</title>
    </head>
    <script>
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
    <body>
        <form name="regForm" method= "post" action="sqlBoard.asp">
   <table border cellspacing="0" width="500">
      <tr>
         <td colspan="2" align="center"><b>���ۼ�</b></td>
      </tr>
      <tr>
         <td align="center">����</td>
         <td><input type="text" name="title" id="title" size="50"></td>
      </tr>
      <tr>
         <td align="center">�ۼ���</td>
         <td><input type="text" name="writer" size="50"></td>
      </tr>
      <tr>
         <td align="center">����</td>
         <td><textarea name="content" cols="51" rows="10"></textarea></td>
      </tr>
      <tr>
         <td align="center">����/�����</td>
         <td>
            <input type="radio" name="passwd_yn" value="T" checked>����
            <input type="radio" name="passwd_yn" value= "F">�����
         </td>
      </tr>
      <tr>
         <td align="center">��й�ȣ</td>
         <td><input type="password" name="passwd" size="50" placeholder="����� �Խñ��� ��� �ۼ�"></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="�ۼ� �Ϸ�" onclick="saveit()">&nbsp;&nbsp;&nbsp;
            <input type="reset" value="�ٽ� �ۼ�">
         </td>
      </tr>
   </table>
   </form>
    </body>
</html>