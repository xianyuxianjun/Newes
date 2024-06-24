<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/23
  Time: 下午7:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>News Detail</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="./js/config.js"></script>
    <link rel="stylesheet" href="./css/news.css">
</head>
<body>
<button class="back-button" onclick="goBack()">返回上一页</button>
<div class="news-container" id="newsContainer">
</div>

<script>
    function goBack() {
        window.history.back();
    }

    //获取一条新闻
    function getNews(){
        let newsId =  localStorage.getItem("newsId");
        axios.post(api+'getNews',{
            articleId:newsId
        })
            .then(res=>{
                let news = res.data.data;
                console.log(res);

                let container = document.getElementById('newsContainer');
                container.innerHTML =
                    '<div class="news-title">' + news.title + '</div>' +
                    '<div class="news-date">' + news.publishDate + '</div>' +
                    '<div class="news-summary">' + news.summary + '</div>' +
                    '<div class="news-content">' + news.content + '</div>';
            })
    }
    window.onload = getNews;
</script>
</body>
</html>
