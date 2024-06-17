<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/17
  Time: 上午8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="./css/user.css">
</head>
<body>
<div class="user-card">
    <img class="user-avatar" src="" id="avatar" alt="用户头像"> <!-- 添加头像的图片元素 -->
    <div class="user-info">
        <div class="user-title">用户信息</div>
        <div class="user-name">用户名：<span id="username"></span></div>
        <div class="user-real-name">真实姓名：<span id="name"></span></div>
        <div class="user-age">年龄：<span id="age"></span></div>
        <div class="user-gender">性别：<span id="gender"></span></div>
        <div class="user-phone">电话：<span id="phone"></span></div>
        <div class="user-like">爱好：<span id="like"></span></div>
        <button id="update">修改信息</button> <!-- 将修改信息按钮的 id 修改为 update -->
    </div>
</div>
</body>
<script>
    axios.post(api+'/user',{
        username:username
    }).then(res => {
        let data = res.data.data;
        document.querySelector('#username').innerText = data.username;
        document.querySelector('#name').innerText = data.name;
        document.querySelector('#age').innerText = data.age;
        document.querySelector('#gender').innerText=data.gender;
        document.querySelector('#phone').innerText = data.phone;
        document.querySelector('#like').innerText = data.like;
        document.querySelector('#avatar').src = data.avatar; // 添加获取头像的代码
    });
</script>
</html>
