<%

    'request ��ü�� ���� �Ѿ�� ������ ������ ����
    mode = request("mode")
    keyword = request("keyword")

    title = request("title")
    writer = request("writer")
    content = request("content")
    passwd_yn = request("passwd_yn")
    passwd = request("passwd")

    '��°�Ȯ��
    'response.write "������ "&title

    Set Conn = Server.CreateObject("ADODB.Connection") 
    '�����ͺ��̽� ������ ���� connection ��ü�� �ν��Ͻ��� ����

    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"
    '�����ͺ��̽��� DSN �� �̿��ؼ� ����

    If mode = "write" Then

        SQL = "SELECT MAX(BNO) FROM MYBOARD"
        '������ �������� �������� �ۼ�

        Set Rs = Server.CreateObject("Adodb.RecordSet")
        '���ڵ�� ��ü�� �ν��Ͻ��� ����

        Rs.open SQL, conn
        '������ ������ �����ͺ��̽��� �����ؼ� ���ڵ�� ��ü�� ��� �����͸� ����

        If IsNULL(Rs(0)) Then       '���� ���� ������ �����Ͱ� ���� ���
            bno = 1     '�۹�ȣ�� 1
        Else      '������ �����Ͱ� ���� ���
            bno = Rs(0) + 1     '�۹�ȣ +1
        End If

        sql = "INSERT INTO MYBOARD"
        sql = sql & "(BNO, TITLE, WRITER, CONTENT, PASSWD_YN, PASSWD, READCNT, REGDATE)"
        sql = sql & " VALUES"
        sql = sql & "('" & bno & "',"
        sql = sql & "'" & title & "',"
        sql = sql & "'" & writer & "',"
        sql = sql & "'" & content & "',"
        sql = sql & "'" & passwd_yn & "',"
        sql = sql & "'" & passwd & "',"
        sql = sql & "'" & readcnt & "',"
        sql = sql & "'" & date() & "')"

        Conn.Execute sql        '�����ͺ��̽� ���� ����

        Response.redirect "/board/List.asp"


    ElseIf mode = "list" Then

        sql = ""            
        sql = "SELECT ROW_NUMBER() OVER( ORDER BY REGDATE DESC) AS NUM , TITLE, WRITER, REGDATE, READCNT, PASSWD_YN "
        sql = sql & "FROM MYBOARD "
        sql = sql & "WHERE 1 = 1"
        if keyword <> "" Then
            sql = sql & "AND TITLE LIKE %" & keyword & "%"
        end If
        sql = sql & "ORDER BY NUM DESC"

        Response.Write sql
        Response.Write 

        Conn.Execute sql        '�����ͺ��̽� ���� ����


    End If

    Rs.Close
    Conn.Close
    Set Rs = Nothing
    Set Conn = Nothing


%>