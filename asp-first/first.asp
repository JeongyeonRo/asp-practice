<!DOCTYPE html>
<title>
    
</title>
<html>
    <body>
        '���ڿ� ����ϱ�
        <%
        response.write("My first ASP script")
        %>

        '������ ���ڿ� ����ϱ�
        <%
        dim name
        name = "First ASP"
        response.write("2019-09-26" & name)

        '�迭
        <%
        Dim national(5);
        national(0) = "Korea"
        national(1) = "China"
        national(2) = "USA"
        national(3) = "France"
        national(4) = "Swiss"
        '�ݺ����� �̿��ؼ� �迭 ����ϱ�
        For i = 0 to 5
            response.write(national(i) & "<br/>")
            Next

            %>
        '�迭 ũ�� �缳���ϱ�
        Redim national(10);

        'if ��
        dim = hour
        hour = hour(now())
        response.write("<p>" & now())
        response.write("</p>")
        if hour < 12 then
            response.write("Good Morning")
        else
            response.write("Godd Day")
        end if
        %>

    </body>
</html>