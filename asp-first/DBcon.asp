<%
    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open "Provider=SQLOLEDB;User ID=sa;Password=0000;Initial Catalog=MyDB;Data Source=DESKTOP-BK7PT8N"
    'provider�� SQLOLEDB�� �����ͺ��̽��� �����ϰڴ� �̷� ���Դϴ�.
    'USER ID : mssql���� ������ �����̵�
    'Password : mssql���� ������ ��й�ȣ
    'Initial Catalog : mssql �����ͺ��̽� �̸�
    'Data Source = mssql������ ��ġ�� ������ �Դϴ�. �������� DB������ �и��� ���� �����Ǹ� �����ֽø� �ǰ�
    'Ȥ�� �������� DB������ �ϳ��� �������� ��Ǿ����� �����Ǹ� �����൵ ������ localhost��� �ص� �����ϰ� ����� �� �ֽ��ϴ�.

    Set Rs = Server.CreateObject("Adodb.RecordSet") 
    SQL = "SELECT COUNT(BNO) from MYBOARD"

    Rs.open SQL, conn
    'conn���� mssql�� �����ϰ� SQL������ ������ ���� ������� Rs(���ڵ��)�� ��ҽ��ϴ�.

    '

    Rs_count = Rs(0)

    Response.write Rs_count

%>