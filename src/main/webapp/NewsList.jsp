<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/22
  Time: 下午4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <title>新闻展示页面</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="./js/config.js"></script>
    <link rel="stylesheet" href="./css/newsList.css">
</head>
<body>
<nav>
    <a href="index.jsp">首页</a>
    <form onsubmit="submitSearch(event)">
        <input type="text" id="searchInput" placeholder="搜索...">
        <button type="submit">搜索</button>
    </form>
</nav>
<div id="newsContainer"></div>

<script>
    function submitSearch(event) {
        event.preventDefault();
        sousuo(event);
    }
    var currentPage = 1; // 当前页码
    var pageSize = 100; // 每页显示条数
    var newsContainer = document.getElementById('newsContainer');

    // 获取新闻列表
    function getNewsList() {
        axios.post(api + '/getNewsList', {
            offset: (currentPage - 1) * pageSize,
            limit: pageSize
        }).then(function(res) {
            console.log("页面刷新获取的数据")
            console.log(res);
            var newsList = res.data.data;
            renderNewsList(newsList);
        }).catch(function(err) {
            console.error('获取新闻列表失败:', err);
        });
    }

    // 渲染新闻列表
    function renderNewsList(newsList) {
        newsContainer.innerHTML = ''; // 清空容器

        newsList.forEach(function(news) {
            var card = document.createElement('div');
            card.classList.add('news-card');
            card.innerHTML = '<h2>' + news.title + '</h2>' +
                '<p>' + news.summary + '</p>' +
                '<p><strong>发布日期:</strong> ' + news.publishDate + '</p>' +
                '<p><strong>分类:</strong> ' + news.category + '</p>';

            // 添加点击事件，跳转到新闻详情页
            card.addEventListener('click', function() {
                localStorage.setItem("newsId",news.articleId)
                window.location.href ='News.jsp'
            });

            newsContainer.appendChild(card);
        });
    }
    //搜索
    function sousuo(event){
        event.preventDefault();
        var searchInput = document.getElementById('searchInput').value;
        axios.post(api + 'searchNews', {
            keyword: searchInput,
            offset: (currentPage - 1) * pageSize,
            limit: pageSize
        }).then(function(res) {
            console.log(res);
            var newsList = res.data.data;
            renderNewsList(newsList);
        }).catch(function(err) {
            console.error('搜索新闻失败:', err);
        });
    }
    // 页面加载完成时获取新闻列表
    window.onload = function() {
        getNewsList();
    };
</script>
</body>
</html>
