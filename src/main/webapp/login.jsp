<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/14
  Time: 下午3:31
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
    <h2>登录</h2>
    <form>
        <div class="user-box">
            <input type="text" name="" required="">
            <label>用户名</label>
        </div>
        <div class="user-box">
            <input type="password" name="" required="">
            <label>密码</label>
        </div>
        <div class="button-box">
            <button type="submit">登录</button>
            <button type="button" class="register">还没有账号？点击注册</button> <!-- 修改注册按钮 -->
        </div>
    </form>
</div>
</body>
<script>
    document.querySelector('.register').addEventListener('click', function () {
        window.location.href = 'register.jsp';
    });
</script>
<script>
    document.querySelector('form').addEventListener('submit', function (e) {
        e.preventDefault();
        let username = document.querySelector('input[type="text"]').value;
        let password = document.querySelector('input[type="password"]').value;
        axios.post(api+'/login', {
            username: username,
            password: password
        }).then(res => {
            if (res.data.code === 1) {
                alert('登录成功');
                window.location.href = 'index.jsp';
            } else {
                alert('登录失败');
            }
        }).catch(err => {
            console.log(err);
        });
    })
</script>
</html>
