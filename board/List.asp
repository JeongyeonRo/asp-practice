<!doctype html>
<!--#include virtual="/inc/head.asp"-->
<%
    nextPage   = request("Nextpage")
        if nextPage = "0" Or nextPage = "" then
            nextPage = "1"
        end if
%>
<html>
    <head>
        <style>
            .content{
                position: absolute;
                top: 150px;
                left: 300px;
            }
            .content .bbs_table{
                background-color: white;
                margin: 10px;
            }

        </style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <meta charset="euc-kr">
        <title>List</title>

    </head>
    <body>

    <div class="content">
        <div class="search_word">
            <select id="searchWord" value="" onchange="">
                <option value="">전체</option>
                <option value="title">제목</option>
                <option value="writer">작성자</option>
            </select>
            <input type="text" width="30" value="">
            <input type="button" value="검색">
        </div>
        <div id="bbs_list"></div>
        <div id="bbs_list_no"></div>
    </div>
    </body>
    <script>
    //<![CDATA[

        //페이징 처리를 위한 변수 설정
        let recordCount = 10;
        let pageCount = 0;
        let skipPage = 0;
        let page = <%=nextPage%>;
        let pageSize = 10;   //한 페이지에 보여질 게시글 수
        let blockPage = 10;  //페이지 하단 숫자 1-10/ 11-20/ ...

          //게시판 목록 가져오기
          function bbs_list(page, pagesize) {
             var param = {};
             var tr_list = "";
             var tr_list_no = "";
             cate = $("#cate option:selected").val();
             searchWord = $('#searchWord').val();
             $.ajax({
                type: "GET",
                url: "/board/sqlBoard.asp?mode=list&Nextpage="+page+"&PageSize=10&cate="+cate+"&searchWord="+searchWord,
                dataType: "JSON",
                async:false,
                data: null,
                success: function(data, status) {                    
                   if (data.List[0]) {
                      RecordCount = parseInt(data.List[0].BBS_ALLCOUNT);
                   }else{
                      RecordCount = 0
                   }
                   Pagecount = parseInt((RecordCount)/PageSize)+1
                   SkipPageCount = parseInt(PageSize * (Page - 1));
                   Page = parseInt(data.Page);
                   if (PageSize == "") {
                      PageSize = parseInt(data.PageSize);
                   }
                   var cCnt = parseInt(data.SkipPageCount);
                   var cMax = parseInt(data.List.length);

                        tr_list += '<table border="0" bordercolordark="white" bordercolorlight="#AECCA2" cellpadding="6" cellspacing="1" bgcolor="#E0EBDB" width="100%"> ' ;
                        tr_list += '    <tr align="center"> ' ;
                        tr_list += '        <td>번호</td> ';
                        tr_list += '        <td>제목</td> ';
                        tr_list += '        <td>작성자</td> ';
                        tr_list += '        <td>작성일</td> ';
                        tr_list += '        <td>조회수</td> ';
                        tr_list += '    </tr> ' ;

                        //테이블 목록 추가
                  if (RecordCount > 0 ) {
                  FnGetLoading('bbs_list', 0);
                  for (cCnt; cCnt < cMax; cCnt++) {
                     tr_list    += '   <tr bgcolor="white" align="center">';
                     //tr_list    += '      <td>'+(RecordCount-(Page-1)*PageSize-(cCnt+1)+1)+'</td>';
                            tr_list    += '      <td>'+(RecordCount-parseInt(data.List[cCnt].ROW_NUMBER)+1)+'</td>';
                     tr_list += '         <td><a href="javascript:;" onclick="goViewPG('+data.List[cCnt].IDX+');">'+data.List[cCnt].DISPLAY_SDT+'</td>';
                     tr_list += '         <td>'+data.List[cCnt].SM_SUB_NM+'</td>';
                     tr_list += '         <td>'+data.List[cCnt].TM_TEC_NM+'</td>';
                     tr_list += '         <td><a href="<%=file_main%>/script/fileDown.asp?name=fileData/evt/evt_ytube_live/'+ data.List[cCnt].IMAGE_URL +'">'+ data.List[cCnt].IMAGE_URL +'</a>&nbsp&nbsp<a href="<%=file_main%>/script/fileDown.asp?name=fileData/evt/evt_ytube_live/'+data.List[cCnt].IMAGE_URL2+'">'+data.List[cCnt].IMAGE_URL2 +'</a></td>';
                     tr_list += '         <td>'+data.List[cCnt].TITLE+'</td>';
                     tr_list += '         <td>'+data.List[cCnt].DISPLAY_YN+'</td>';
                     tr_list += '      </tr>';
                  }
                  tr_list += ' </tbody> ';
                  tr_list += ' </table> ';
               } else {
                  tr_list_no += tr_list;
                  tr_list_no += '<tr bgcolor="white"><td colspan="5" align="center">조건에 맞는 글이 없습니다.</td></tr>';
                  tr_list_no += ' </tbody> ';
                  tr_list_no += ' </table> ';
               }
               $('#bbs_list_loding').css("display","");
               //리스트
               if (RecordCount > 0 ) {
                  $('#bbs_list').html("");
                  $('#bbs_list').html(tr_list).show();
                  $('#bbs_list_no').html("").hide();
               }else{
                  //조건 없을때 리스트
                  $('#bbs_list_no').html("");
                  $('#bbs_list_no').html(tr_list_no).show();
                  $('#bbs_list').html("").hide();
               }
               //BBS 페이징 함수 호출
               getPaging(RecordCount, PageSize, BlockSize, page, "bbsPage");
            },
            error: function(request,status,error) {
               alert(status+'\n'+error);
               tr_list += '   <tr>';
               tr_list += '      <td colspan="5">code:'+request.status+"</br>"+"message:"+request.responseText+"/br"+"error:"+error +'</td>';
               tr_list += '   </tr>';
               tr_list = '';
               tr_list_no += '<tr bgcolor="white"><td colspan="5" align="center">AJAX 에러. 조건에 맞는 글이 없습니다.</td></tr>';
               //리스트
               $('#bbs_list').html("");
               $('#bbs_list').html(tr_list);
               //조건 없을때 리스트
               $('#bbs_list_no').html("");
               $('#bbs_list_no').html(tr_list_no);
            }
         });
      }
      
      $(document).ready(function() {
         //BBS Load
         bbs_list(page, pageSize);
      });

    //-->
    </script>
</html>