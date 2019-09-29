<!DOCTYPE html>
<title>
    
</title>
<html>
    <body>
        '문자열 출력하기
        <%
        response.write("My first ASP script")
        %>

        '변수와 문자열 출력하기
        <%
        dim name
        name = "First ASP"
        response.write("2019-09-26" & name)

        '배열
        <%
        Dim national(5);
        national(0) = "Korea"
        national(1) = "China"
        national(2) = "USA"
        national(3) = "France"
        national(4) = "Swiss"
        '반복문을 이용해서 배열 출력하기    
        For i = 0 to 5
            response.write(national(i) & "<br/>")
            Next

            %>
        '배열 크기 재조정하기
        Redim national(10);

        'if 문
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