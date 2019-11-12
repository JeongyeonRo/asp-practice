<!doctype html>
<% 


%>
<html>
    <head>
        <meta charset="euc-kr">
        <title>Default</title>
    </head>
    <body>
        <h2 align="center">목록보기</h2>
    <div>
        <a href="Write.asp">글쓰기</a>
    </div>
    <div>
        <div align="center">
            <table border width="600">
                <tr align="center">
                   <td>번호</td>
                   <td>제목</td>
                   <td>작성자</td>
                   <td>작성일</td>
                   <td>조회수</td>
                </tr>


        </table>
        </div>
    </div>

    </body>
    <script>

    function bbsList(){
        $.ajax({
            type:"GET",
            url:"/Proc.asp",
            dataType:"JSON",
            success:function(){
            }
        });           

    }




    </script>
</html>