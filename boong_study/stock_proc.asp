<% Response.CharSet = "UTF-8"   '인코딩이 utf-8이 아니면 한글이 깨짐%>
<!--#include virtual="/inc/common/JSON.asp"--> 
<%
'bookstore_info /  BSI
'book_info      / BI
'bookstore_stockinfo    /SI

Dim dbConn        ' Connection 객체 선언
Dim rcdst         ' Record Set 객체 선언

Set clsJson = new JSON  '클래스생성

Set dbConn = Server.CreateObject("ADODB.Connection")  ' ADODB
    
dbConn.Open "Driver={MySQL ODBC 8.0 ANSI Driver}; Server=220.116.235.90:3306; Database=jungyeon; Uid=jungyeon; Pwd=1234;" 

    
'if dbConn.errors.count = 0 then ' 접속 시, 에러 발생 여부를 확인합니다.
'    Response.Write "MySQL 접속 성공!" 
'else
'    Response.Write "MySQL 접속 실패!"
'end if 
 

'데이터 가져오기
Sql = ""
Sql = Sql & " SELECT BSI.storename, SI.BookStoreSEQ, BI.BookName, SI.stockSUM "
Sql = Sql & " FROM BOOKSTORE_STOCKINFO SI"
Sql = Sql & " JOIN BOOK_INFO BI ON SI.BookSEQ = BI.BookSEQ "
Sql = Sql & " JOIN BOOKSTORE_INFO BSI ON SI.BookStoreSEQ = BSI.BookStoreSEQ"
' Sql = Sql & " GROUP BY BOOKSTORE_STOCKINFO.BookStoreSEQ"

'Response.Write Sql

Set rs = dbConn.Execute(Sql)

'Response.Write rs.RecordCount


If not rs.Eof then
  sRtn_jsonText = clsJson.toJSON("datalist", rs, false) '데이터를 json 형식으로 변경
'    arrBook = rs.getRows()
else
    Response.Write "데이터없음"
end if

rs.Close    ' Record Set 객체 닫기

dbConn.close    ' MySQL Connection 객체 닫기
set dbConn = nothing

Response.Write(sRtn_jsonText)

%>

