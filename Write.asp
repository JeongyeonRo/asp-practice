<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<title>�۾���</title>
</head>
<body>
    <h2>�۾���</h2>
    <form id="brdWrite" name="brdWrite">
        <label>����</label>
            <input type="text" name="brdSubject"><br>
        <label>����</label>
            <input type="text" name="brdContent"><br>
        <label>�����/����</label>
            <input type="radio" name="open_yn" value="y"checked>����
            <input type="radio" name="open_yn" value="n">�����<br>
        <label>��й�ȣ</label>
            <input type="password" name="passwd">
    </form>
    <button onclick="fncSave()">����</button>        
</body>
</html>
<script>
    function fncSave() {
        alert("clcik");
    }
<script>
