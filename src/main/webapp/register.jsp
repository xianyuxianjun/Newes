<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/15
  Time: 下午6:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="js/config.js"></script>
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
<div class="login-box">
    <h2>注册</h2>
    <form>
        <div class="user-box">
            <input type="text" name="username" required="">
            <label>用户名</label>
        </div>
        <div class="user-box">
            <input type="password" name="password" required="">
            <label>密码</label>
        </div>
        <div class="user-box">
            <input type="text" name="name" required="">
            <label>真实姓名</label>
        </div>
        <div class="user-box">
            <input type="text" name="age" required="">
            <label>年龄</label>
        </div>
        <div class="user-box">
            <input type="text" name="gender" required="">
            <label>性别</label>
        </div>
        <div class="user-box">
            <input type="text" name="phone" required="">
            <label>电话</label>
        </div>
        <div class="user-box">
            <input type="text" name="like" required="">
            <label>爱好</label>
        </div>
        <div class="button-box">
            <button type="submit">注册</button>
            <button type="button" class="register">已有账号？登录</button> <!-- 修改注册按钮 -->
        </div>
    </form>
</div>
</body>
<script>
    document.querySelector('.register').addEventListener('click', function () {
        window.location.href = 'login.jsp';
    });
</script>
<script>
    document.querySelector('form').addEventListener('submit', function (e) {
        e.preventDefault();
        let username = document.querySelector('input[name="username"]').value;
        let password = document.querySelector('input[name="password"]').value;
        let name = document.querySelector('input[name="name"]').value;
        let age = document.querySelector('input[name="age"]').value;
        let gender = document.querySelector('input[name=gender]').value;
        let phone = document.querySelector('input[name=phone]').value;
        let like = document.querySelector('input[name=like]').value;
        axios.post(api+'/register', {
            username: username,
            password: password,
            name: name,
            age: age,
            gender:gender,
            phone:phone,
            like:like
        }).then(res => {
            if (res.data.code === 1) {
                alert('注册成功');
                window.location.href = 'login.jsp';
            } else {
                alert('注册失败');
            }
        }).catch(err => {
            console.log(err);
        });
    })
</script>
</html>