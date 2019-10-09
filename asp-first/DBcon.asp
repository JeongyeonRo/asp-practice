<%
    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"
    'provider은 SQLOLEDB로 데이터베이스에 접근하겠다 이런 뜻입니다.
    'USER ID : mssql접근 계정의 아이이디
    'Password : mssql접근 계정의 비밀번호
    'Initial Catalog : mssql 데이터베이스 이름
    'Data Source = mssql서버가 설치된 아이피 입니다. 웹서버와 DB서버가 분리된 경우는 아이피를 적어주시면 되고
    '혹시 웹서버와 DB서버가 하나의 서버에서 운영되어지면 아이피를 적어줘도 되지만 localhost라고 해도 동일하게 사용할 수 있습니다.

    Set Rs = Server.CreateObject("Adodb.RecordSet") 
    SQL = "SELECT COUNT(BNO) from MYBOARD"

    Rs.open SQL, conn
    'conn으로 mssql에 연결하고 SQL구문을 실행한 다음 결과값을 Rs(레코드셋)에 담았습니다.

    '

    Rs_count = Rs(0)

    Response.write Rs_count

%>