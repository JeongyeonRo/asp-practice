<%
 'Dim i, j       ' i,j ���� ����
 
For i = 1 To 9       ' i�� 1��,2��....9�ܱ��� ó�� �ϴ� ����
    
    For j = 1 To 9       ' j�� ���ܿ� 1���� 9���� ó�� �ϴ� ����
        
        response.write i&" X "&j & " = "&i*j&"<br>"   ' �� �� �� ��� ���� //i x j = i*j ���� ����Ѵ�.

    Next
    
    response.write "<br>"       ' �ܺ� 1�� ��� �ϴ� ��

Next

%>