<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/19
  Time: 下午9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>编辑新闻</title>
    <link rel="stylesheet" href="css/editNews.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="./js/config.js"></script>
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1>新闻管理系统</h1>
        </div>
        <nav>
            <ul>
                <li ><a href="./index.jsp">首页</a></li>
                <li ><a href="newsManagement.jsp">新闻管理</a></li>
                <li><a href="addNews.jsp">添加新闻</a></li>
            </ul>
        </nav>
    </div>
</header>

<section>
    <div class="container">
        <h2>编辑新闻</h2>
        <form class="news-form" onsubmit="putNews(event)">
            <input type="text" name="title" placeholder="新闻标题" value="新闻标题1">
            <textarea name="summary" placeholder="新闻摘要"></textarea>
            <textarea name="content" placeholder="新闻内容"></textarea>
            <textarea name="type" placeholder="新闻类型"></textarea>
            <button type="submit">保存更改</button>
        </form>
    </div>
</section>
</body>
<script>
    //获取新闻表单的值
    function getNews() {
        let news = {articleId:'',title:'', summary:'', content:'',publishDate:'',authorId:'',categoryId:''};
        news.title = document.getElementsByName('title')[0].value;
        news.summary = document.getElementsByName('summary')[0].value;
        news.content = document.getElementsByName('content')[0].value;
        news.type = document.getElementsByName('type')[0].value;
        var currentDate = new Date();
        news.publishDate = currentDate.toISOString().slice(0, 10);
        news.authorId = 1;
        news.categoryId = 1;
        return news;
    }
</script>
<script>
    //提交新闻
    function putNews(event){
        event.preventDefault(); // 阻止表单的默认提交行为

        let acticleId = localStorage.getItem("articleId")
        news = getNews();
        news.articleId = acticleId;
        console.log(news);
        axios.post(api+'/updateNews',news)
            .then(res=>{
                console.log(res);
                if (res.data.code === 1){
                    alert('编辑成功');
                    window.location.href = 'newsManagement.jsp';
                }else {
                    alert('编辑失败');
                }
            })
            .catch(err=>{
                console.log(err);
            });
    }
</script>
</html>
