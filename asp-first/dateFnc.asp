<%

    Response.Write Date()&"<br><br>"       '현재 날짜를 YYYY-MM-DD 형식으로 출력

    Response.Write Now()&"<br><br>"        '현재 날짜와 시간 YYYY-MM-DD 오전/오후 HH:mm:SS 형식으로 출력

    sDate = "2019년 10월 11일" 
    Response.Write CDate(sDate)&"<br><br>"     '날짜 관련 값을 YYYY-MM-DD 형식으로 출력

    '날짜 관련 값에 대한 형식으로 출력
    Response.Write FormatDateTime(Now(), 0)&"<br>"      'YYYY-MM-DD 오전/오후 HH:mm:SS
    Response.Write FormatDateTime(Now(), 1)&"<br>"      'yyyy년 MM월 DD일 요일
    Response.Write FormatDateTime(Now(), 2)&"<br>"      'YYYY-MM-DD
    Response.Write FormatDateTime(Now(), 3)&"<br>"      '오전/오후 HH:mm:SS
    Response.Write FormatDateTime(Now(), 4)&"<br>"      'HH:mm
    '위와 같은 함수를 사용하여 Year(), Month(), Day(), Weekday() 사용

%>