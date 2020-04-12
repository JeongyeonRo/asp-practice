<!DOCTYPE html>
<html>
<head>
  <title>AJAX로 데이터 가져오기: 마감 4/15</title>
  <meta charset="euc-kr" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <link rel="stylesheet" href="/inc/common/style.css">
</head>
<body>
<div class="page_title">
    <h3>서점별 도서 재고 수량</h3>
</div>
<div class="stock_tbl">
</div>
<div class="debug">
</div>
</body>
<script type="text/javascript">
<!--//

$(document).ready(function(){
    bbs_list();
});

function bbs_list(){
    $.ajax({
        type: "GET",
        url : "stock_proc.asp",
        dataType: "JSON",
        async:false,
        data: null,
        success: function(data, status) {
            var data_lst = "";
            for(var i=0; i<data.datalist.length; i++){
                data_lst += "<div>" + data.datalist[i].bookname + "</div>"
            }
            $('.stock_tbl').html(data_lst);
        },
        error: function(data){
            $('.debug').html(data);
        }
    });

}



//-->
</script>
</html>