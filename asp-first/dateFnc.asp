<%

    Response.Write Date()&"<br><br>"       '���� ��¥�� YYYY-MM-DD �������� ���

    Response.Write Now()&"<br><br>"        '���� ��¥�� �ð� YYYY-MM-DD ����/���� HH:mm:SS �������� ���

    sDate = "2019�� 10�� 11��" 
    Response.Write CDate(sDate)&"<br><br>"     '��¥ ���� ���� YYYY-MM-DD �������� ���

    '��¥ ���� ���� ���� �������� ���
    Response.Write FormatDateTime(Now(), 0)&"<br>"      'YYYY-MM-DD ����/���� HH:mm:SS
    Response.Write FormatDateTime(Now(), 1)&"<br>"      'yyyy�� MM�� DD�� ����
    Response.Write FormatDateTime(Now(), 2)&"<br>"      'YYYY-MM-DD
    Response.Write FormatDateTime(Now(), 3)&"<br>"      '����/���� HH:mm:SS
    Response.Write FormatDateTime(Now(), 4)&"<br>"      'HH:mm
    '���� ���� �Լ��� ����Ͽ� Year(), Month(), Day(), Weekday() ���

%>