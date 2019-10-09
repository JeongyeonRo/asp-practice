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
                alert("글제목은 필수입니다.");
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
         <td colspan="2" align="center"><b>글작성</b></td>
      </tr>
      <tr>
         <td align="center">제목</td>
         <td><input type="text" name="title" id="title" size="50"></td>
      </tr>
      <tr>
         <td align="center">작성자</td>
         <td><input type="text" name="writer" size="50"></td>
      </tr>
      <tr>
         <td align="center">내용</td>
         <td><textarea name="content" cols="51" rows="10"></textarea></td>
      </tr>
      <tr>
         <td align="center">공개/비공개</td>
         <td>
            <input type="radio" name="passwd_yn" value="T" checked>공개
            <input type="radio" name="passwd_yn" value= "F">비공개
         </td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="passwd" size="50" placeholder="비공개 게시글일 경우 작성"></td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit" value="작성 완료" onclick="saveit()">&nbsp;&nbsp;&nbsp;
            <input type="reset" value="다시 작성">
         </td>
      </tr>
   </table>
   </form>
    </body>
</html>