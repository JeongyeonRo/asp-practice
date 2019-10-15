<%
 'Dim i, j       ' i,j 변수 선언
 
For i = 1 To 9       ' i는 1단,2단....9단까지 처리 하는 변수
    
    For j = 1 To 9       ' j는 각단에 1부터 9까지 처리 하는 변수
        
        response.write i&" X "&j & " = "&i*j&"<br>"   ' 각 단 별 출력 구문 //i x j = i*j 값을 출력한다.

    Next
    
    response.write "<br>"       ' 단별 1줄 띄게 하는 것

Next

%>