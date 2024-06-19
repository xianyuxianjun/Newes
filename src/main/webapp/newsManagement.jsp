<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/19
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>新闻管理</title>
    <link rel="stylesheet" href="css/newsManagement.css">
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1>新闻管理系统</h1>
        </div>
        <nav>
            <ul>
                <li class="current"><a href="index.html">首页</a></li>
                <li><a href="add-news.html">添加新闻</a></li>
            </ul>
        </nav>
    </div>
</header>

<section>
    <div class="container">
        <table class="news-table">
            <thead>
            <tr>
                <th>标题</th>
                <th>摘要</th>
                <th>发布日期</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>新闻标题1</td>
                <td>新闻摘要1</td>
                <td>2024-01-01</td>
                <td class="actions">
                    <a href="edit-news.html?id=1">编辑</a>
                    <a href="#">删除</a>
                </td>
            </tr>
            <!-- 更多新闻条目 -->
            </tbody>
        </table>
    </div>
</section>
</body>
<script>
    //删除新闻
    function deleteNews(id){
        axios.post(api+'/deleteNews',{id:id})
            .then(res=>{
                console.log(res);
            })
            .catch(err=>{
                console.log(err);
            })
    }
    //获取新闻列表
    function getNewsList(){
        axios.get(api+'/getNewsList')
            .then(res=>{
                console.log(res);
                let newsList = res.data.data;
                let tbody = document.querySelector('.news-table tbody');
                tbody.innerHTML = '';
                newsList.forEach(news=>{
                    let tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>${news.title}</td>
                        <td>${news.summary}</td>
                        <td>${news.publishDate}</td>
                        <td class="actions">
                            <a href="edit-news.html?id=${news.id}">编辑</a>
                            <a href="javascript:deleteNews(${news.id})">删除</a>
                        </td>
                    `;
                    tbody.appendChild(tr);
                });
            })
            .catch(err=>{
                console.log(err);
            });
    }
</script>
</html>
