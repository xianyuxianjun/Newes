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
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .news-container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        .news-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .news-date {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }
        .news-summary {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .news-content {
            font-size: 16px;
        }
        .back-button {
            margin: 20px 0;
            padding: 10px 20px;
            background-color: #f0f0f0;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
        }
    </style>
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
