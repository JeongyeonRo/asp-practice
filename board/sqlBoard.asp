<%

    'request 개체를 통해 넘어온 값들을 변수에 저장
    mode = request("mode")
    keyword = request("keyword")

    title = request("title")
    writer = request("writer")
    content = request("content")
    passwd_yn = request("passwd_yn")
    passwd = request("passwd")

    '출력값확인
    'response.write "글제목 "&title

    Set Conn = Server.CreateObject("ADODB.Connection") 
    '데이터베이스 연결을 위한 connection 개체의 인스턴스의 생성

    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"
    '데이터베이스를 DSN 을 이용해서 오픈

    If mode = "write" Then

        SQL = "SELECT MAX(BNO) FROM MYBOARD"
        '가져올 데이터의 쿼리문을 작성

        Set Rs = Server.CreateObject("Adodb.RecordSet")
        '레코드셋 개체의 인스턴스를 생성

        Rs.open SQL, conn
        '지정한 쿼리로 데이터베이스를 연결해서 레코드셋 개체에 결과 데이터를 저장

        If IsNULL(Rs(0)) Then       '만일 현재 가져온 데이터가 없을 경우
            bno = 1     '글번호는 1
        Else      '가져온 데이터가 있을 경우
            bno = Rs(0) + 1     '글번호 +1
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

        Conn.Execute sql        '데이터베이스 쿼리 실행

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

        Conn.Execute sql        '데이터베이스 쿼리 실행


    End If

    Rs.Close
    Conn.Close
    Set Rs = Nothing
    Set Conn = Nothing


%>