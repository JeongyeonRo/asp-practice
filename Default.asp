<!doctype html>
<!--#include virtual="/inc/head.asp"-->
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <meta charset="euc-kr">
    <title>main</title>
    </head>
    <body>
        <h2 align="center">HELLO</h2>
        <div class="now_time" align="center">
            <h1>00:00</h1>
        </div>
    <div class="main">
        <a href="/board/List.asp">리스트<a>
    </div>
    </body>
    <script>

        const clockContainer = document.querySelector(".now_time"),
          clockTitle = clockContainer.querySelector("h1");

        function getTime() {
          const date = new Date();
          const minutes = date.getMinutes();
          const hours = date.getHours();
          const seconds = date.getSeconds();
          clockTitle.innerText = `${hours < 10 ? `0${hours}` : hours}:${
            minutes < 10 ? `0${minutes}` : minutes
          }:${seconds < 10 ? `0${seconds}` : seconds}`;
        }

        function init() {
          getTime();
          setInterval(getTime, 1000);
        }

        init();
    </script>
</html>