<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>글쓰기</title>
</head>
<body>
    <h2>글쓰기</h2>
    <form id="brdWrite" name="brdWrite">
        <label>제목</label>
            <input type="text" name="brdSubject"><br>
        <label>내용</label>
            <input type="text" name="brdContent"><br>
        <label>비공개/공개</label>
            <input type="radio" name="open_yn" value="y"checked>공개
            <input type="radio" name="open_yn" value="n">비공개<br>
        <label>비밀번호</label>
            <input type="password" name="passwd">
    </form>
    <button onclick="fncSave()">저장</button>        
</body>
</html>
<script>
    function fncSave() {
        alert("clcik");
    }
<script>
