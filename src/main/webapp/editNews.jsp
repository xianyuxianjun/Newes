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
        <h2>编辑新闻</h2>
        <form class="news-form" action="submit-edit.html" method="post">
            <input type="hidden" name="news_id" value="1"> <!-- 新闻ID，应该从URL参数或其他方式获取 -->
            <input type="text" name="title" placeholder="新闻标题" value="新闻标题1">
            <textarea name="summary" placeholder="新闻摘要">新闻摘要1</textarea>
            <textarea name="content" placeholder="新闻内容">这里是新闻内容...</textarea>
            <textarea name="type" placeholder="新闻类型">这里是新闻类型...</textarea>
            <button type="submit">保存更改</button>
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
</script>
<script>
    //提交新闻
    function putNews(){
        axios.post(api+'/updateNews',getNews())
            .then(res=>{
                console.log(res);
                if (res.data.code === 1){
                    alert('编辑成功');
                    window.location.href = 'index.html';
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
