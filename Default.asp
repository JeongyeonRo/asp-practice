<!doctype html>
<% 


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
    </div>
    <div>
        <div align="center">
            <table border width="600">
                <tr align="center">
                   <td>��ȣ</td>
                   <td>����</td>
                   <td>�ۼ���</td>
                   <td>�ۼ���</td>
                   <td>��ȸ��</td>
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