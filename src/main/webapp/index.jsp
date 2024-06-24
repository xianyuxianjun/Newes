<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/15
  Time: 下午8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <link rel="stylesheet" href="./css/index.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="js/config.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Press+Start+2P&display=swap" rel="stylesheet">
</head>
<body>
<div class="bg">
    <video autoplay loop muted>
        <source src="./img/背景视频.mp4" type="video/mp4">
    </video>
</div>
<div class="dao-box">
    <ul>
        <li><a href="index.jsp">首页</a></li>
        <li><a href="NewsList.jsp">情报广场</a></li>
        <li><a href="论坛">论坛</a></li>
        <li><a href="user.jsp">个人信息</a></li>
    </ul>
</div>
<div class="info-center">
    <div class="info">
        <div class="info-title">
            欢迎来到冒险岛情报中心，这里是一个关于冒险岛的情报中心，你可以在这里查看到关于冒险岛的一切情报，包括世界上最近的新闻，冒险岛官方发布的情报等，希望你能在这里找到你想要的一切情报。
        </div>
    </div>
    <div id="computer"></div>
</div>
<div class="card">
    <p>尊敬的冒险家您好，欢迎您来到冒险岛，请问你有什么需要帮忙的吗？</p>
    <ul>
        <li><button onclick="toGL()">我是情报官，我要进入管理中心</button></li>
        <li><a href="News.jsp">我想去浏览一些情报</a></li>
        <li><a href="#">我想去冒险岛广场聊聊天</a></li>
        <li><a href="user.jsp">我想去信息局修改我的身份信息</a></li>
    </ul>
</div>
<h1 id="topNewsTitle"></h1>
<div id="topNewsContainer" class="top-news-card"></div>
</body>
<script>
    //读取用户信息
    function getUserInfo(){
        let userId=localStorage.getItem("userId");
        return axios.post(api+'getUser',{
            userId:userId
        })
            .then(res=>{
                let user=res.data.data;
                return user;
            })
            .catch(err=>{
                console.log(err);
            });
    }

    //检查用户类型
    function toGL(){
        getUserInfo().then(user => {
            if (user.type=='1'){
                window.location.href='newsManagement.jsp';
            }else {
                alert('您不是情报官，无法进入管理中心');
            }
        });
    }

    //获取Top5新闻
    function getTop5News(){
        return axios.post(api+'tupFive')
            .then(res=>{
                console.log(res)
                let news=res.data.data;
                return news;
            })
            .catch(err=>{
                console.log(err);
            });
    }

    //渲染Top5新闻
    function renderTop5News(newsList) {
        var topNewsContainer = document.getElementById('topNewsContainer');
        topNewsContainer.innerHTML = ''; // 清空容器

        newsList.forEach(function(news) {
            var title = document.createElement('h2');
            title.textContent = news.title;
            topNewsContainer.appendChild(title);

            // 添加点击事件，跳转到新闻详情页
            title.addEventListener('click', function() {
                localStorage.setItem("newsId",news.articleId)
                window.location.href ='News.jsp'
            });
        });
    }

    //页面加载完成时获取Top5新闻
    window.onload = function() {
        // 设置标题的文本
        document.getElementById('topNewsTitle').textContent = '本周热点';
        getTop5News().then(newsList => {
            renderTop5News(newsList);
        });
    };
</script>
</html>