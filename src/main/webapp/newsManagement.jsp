<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/19
  Time: 下午9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>新闻管理</title>
    <link rel="stylesheet" href="css/newsManagement.css">
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
                <th>阅读量</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 这里将通过 JavaScript 动态添加新闻条目 -->
            </tbody>
        </table>

        <div class="pagination">
            <button id="prevBtn">上一页</button>
            <span id="currentPage"></span>
            <button id="nextBtn">下一页</button>
        </div>
    </div>
</section>

<script>
    let currentPage = 1; // 当前页码
    const pageSize = 10; // 每页显示条数

    // 获取新闻列表
    function getNewsList() {
        axios.post(api + '/getNewsList', {
            offset: (currentPage - 1) * pageSize,
            limit: pageSize
        })
            .then(res => {
                let newsList = res.data.data;
                console.log('获取到的新闻列表:', newsList);
                let tbody = document.querySelector('.news-table tbody');
                tbody.innerHTML = ''; // 清空表格内容

                // 遍历新闻列表，动态添加表格行
                newsList.forEach(news => {
                    // 创建表格行
                    let tr = document.createElement('tr');

                    // 创建并设置每个单元格的文本内容
                    let titleCell = document.createElement('td');
                    titleCell.textContent = news.title;
                    tr.appendChild(titleCell);

                    let summaryCell = document.createElement('td');
                    summaryCell.textContent = news.summary;
                    tr.appendChild(summaryCell);

                    let publishDateCell = document.createElement('td');
                    publishDateCell.textContent = news.publishDate;
                    tr.appendChild(publishDateCell);

                    // 添加阅读量单元格
                    let numCell = document.createElement('td');
                    numCell.textContent = news.num; // 假设你的数据中有一个字段叫做 num 来表示阅读量
                    tr.appendChild(numCell);

                    // 创建操作单元格
                    let actionsCell = document.createElement('td');
                    actionsCell.className = 'actions';

                    // 创建编辑按钮
                    let editBtn = document.createElement('button');
                    editBtn.textContent = '编辑';
                    editBtn.className = 'edit-btn'; // 添加类名以便样式控制
                    editBtn.addEventListener('click', function() {
                        editNews(news.articleId);
                    });
                    actionsCell.appendChild(editBtn);

                    // 创建删除链接
                    let deleteLink = document.createElement('a');
                    deleteLink.href = 'javascript:void(0);';
                    deleteLink.textContent = '删除';
                    deleteLink.className = 'delete-btn'; // 添加类名以便样式控制
                    deleteLink.onclick = function() {
                        deleteNews(news.articleId);
                    };
                    actionsCell.appendChild(deleteLink);

                    // 将操作单元格添加到行中
                    tr.appendChild(actionsCell);

                    // 将行添加到表格中
                    tbody.appendChild(tr);
                });

                // 更新当前页码显示
                document.getElementById('currentPage').textContent = '当前页码：' + currentPage;
            })
            .catch(err => {
                console.error('获取新闻列表失败:', err);
                // 可以在页面上显示错误信息或者进行其他处理
            });
    }

    // 删除新闻
    function deleteNews(id) {
        axios.post(api + '/deleteNews', { articleId: id })
            .then(res => {
                console.log(res);
                // 在成功删除后，重新加载新闻列表
                getNewsList();
            })
            .catch(err => {
                console.error('删除新闻失败:', err);
                // 可以在页面上显示删除失败的提示或者进行其他处理
            });
    }

    // 编辑新闻
    function editNews(id) {
        console.log('执行编辑操作，文章ID为：', id);
        // 例如跳转到编辑页面
        window.location.href = `edit-news.html?id=${id}`;
    }

    // 上一页按钮点击事件
    document.getElementById('prevBtn').addEventListener('click', function() {
        if (currentPage > 1) {
            currentPage--;
            getNewsList();
        }
    });

    // 下一页按钮点击事件
    document.getElementById('nextBtn').addEventListener('click', function() {
        // 这里可以根据实际情况判断是否还有下一页数据
        currentPage++;
        getNewsList();
    });

    // 页面加载完成后立即获取新闻列表
    document.addEventListener('DOMContentLoaded', function() {
        getNewsList();
    });
</script>

</body>
</html>






