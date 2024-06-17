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
    <script src="js/config.js"></script>
</head>
<body>
<div class="user-card">
    <img class="user-avatar" src="./img/头像.jpg" id="avatar" alt="用户头像"> <!-- 添加头像的图片元素 -->
    <div class="user-info">
        <div class="user-title">用户信息</div>
        <div class="user-name">用户名：<span id="username"></span></div>
        <div class="user-real-name">真实姓名：<span id="name"></span></div>
        <div class="user-age">年龄：<span id="age"></span></div>
        <div class="user-gender">性别：<span id="gender"></span></div>
        <div class="user-phone">电话：<span id="phone"></span></div>
        <div class="user-like">爱好：<span id="like"></span></div>
        <button id="update">修改信息</button> <!-- 将修改信息按钮的 id 修改为 update -->
        <input type="file" id="upadteAvatar" accept="image/*">
        <button id="upload">上传头像</button>
    </div>
</div>
</body>
<script>
    document.getElementById('upload').addEventListener('click', function() {
        var fileInput = document.getElementById('updateAvatar');
        var file = fileInput.files[0];
        var formData = new FormData();
        formData.append('avatar', file);
        axios.post('/uploadAvatar', formData, {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        }).then(function(response) {
            console.log(response);
        }).catch(function(error) {
            console.log(error);
        });
    });
</script>
<script>
    //获取用户信息
    axios.post(api+"getUser",{
        userId:1
    })
    .then(res=>{
        console.log(res);
        let data = res.data.data;
        document.getElementById ("avatar").src = data.avatar;
        document.getElementById ("username").innerText = data.username;
        document.getElementById ("name").innerText = data.name;
        document.getElementById ("age").innerText = data.age;
        document.getElementById("gender").innerText=data.gender;
        document.getElementById("phone").innerText=data.phone;
        document.getElementById("like").innerText=data.like;
    }).catch(err=>{
        console.log(err);
    })
</script>
</html>
