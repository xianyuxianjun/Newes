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
    <style>
        html {
            height: 100%;
        }
        .login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 400px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,.5);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0,0,0,.6);
            border-radius: 10px;
        }
        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
        }
        .login-box .user-box {
            position: relative;
        }
        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }
        .login-box .user-box label {
            position: absolute;
            top:0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: none;
            transition: .5s;
        }
        .login-box .user-box input:focus ~ label,
        .login-box .user-box input:valid ~ label {
            top: -20px;
            left: 0;
            color: #03e9f4;
            font-size: 12px;
        }
        .login-box form a {
            position: relative;
            display: inline-block;
            padding: 10px 20px;
            color: #03e9f4;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            margin-top: 40px;
            letter-spacing: 4px
        }
        .button-box {
            text-align: center;
            margin-top: 40px;
        }
        .button-box button {
            padding: 10px 20px;
            color: #03e9f4;
            font-size: 16px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            letter-spacing: 4px;
            border: none;
            background-color: transparent;
            cursor: pointer;
        }
        .button-box button:hover {
            background-color: #03e9f4;
            color: #fff;
        }
        .button-box .register {
            font-size: 14px;
            text-transform: none;
            letter-spacing: normal;
        }
    </style>
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
