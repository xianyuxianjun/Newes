<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/19
  Time: 下午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>新增新闻</title>
    <link rel="stylesheet" href="css/addNews.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1>新闻管理系统</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.html">首页</a></li>
                <li><a href="add-news.html">添加新闻</a></li>
            </ul>
        </nav>
    </div>
</header>
<section>
    <div class="container">
        <h2>新增新闻</h2>
        <form class="news-form" method="post">
            <input type="text" name="title" placeholder="新闻标题" required>
            <textarea name="summary" placeholder="新闻摘要" required></textarea>
            <textarea name="content" placeholder="新闻内容" required></textarea>
            <textarea name="type" placeholder="type" required></textarea>
            <button type="submit">发布新闻</button>
        </form>
    </div>
</section>
</body>
<script>
    //获取新闻表单的值
    function getNews() {
        let news = {title:'', summary:'', content:'',publishDate:'',authorId:'',categoryId:''};
        news.title = document.getElementsByName('title')[0].value;
        news.summary = document.getElementsByName('summary')[0].value;
        news.content = document.getElementsByName('content')[0].value;
        news.type = document.getElementsByName('type')[0].value;
        return news;
    }
    //提交新闻
    function putNews(){
        axios.post(api+'/addNews',getNews())
            .then(res=>{
                console.log(res);
            })
            .catch(err=>{
                console.log(err);
            });axios.post(api+'/addNews',getNews())
            .then(res=>{
                console.log(res);
                if (res.data.code === 1){
                    alert('发布成功');
                    window.location.href = 'index.html';
                }else {
                    alert('发布失败');
                }
            })
            .catch(err=>{
                console.log(err);
            });
    }

</script>
</html>
