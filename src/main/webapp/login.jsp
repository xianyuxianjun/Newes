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
    <form onsubmit="login(event)">
        <div class="user-box">
            <input type="text" name="" required="">
            <label>用户名</label>
        </div>
        <div class="user-box">
            <input type="password" name="" required="">
            <label>密码</label>
        </div>
        <div class="user-box">
            <input type="text" id="captchaInput" required="">
            <label>验证码</label>
        </div>
        <div id="captchaDisplay"></div>
        <button type="button" onclick="generateCaptcha()">生成新的验证码</button>
        <div class="button-box">
            <button onclick="login()">登录</button>
            <button type="button" class="register" onclick="register()">还没有账号？点击注册</button> <!-- 修改注册按钮 -->
        </div>
    </form>
</div>
</body>
<script>
    let captcha = '';

    // 生成一个新的验证码
    function generateCaptcha() {
        captcha = '';
        let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        for (let i = 0; i < 5; i++) {
            captcha += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        document.getElementById('captchaDisplay').innerText = captcha;
    }

    // 验证输入的验证码是否正确
    function validateCaptcha() {
        let input = document.getElementById('captchaInput').value.toLowerCase();
        if (input !== captcha.toLowerCase()) {
            alert('验证码错误');
            return false;
        }
        return true;
    }

    //跳转注册
    function register(){
        document.querySelector('.register').addEventListener('click',function(){
            window.location.href = 'register.jsp';
        })
    }

    //登录
    function login(){
        event.preventDefault(); // 阻止表单的默认提交行为
        if (!validateCaptcha()) {
            alert("验证码错误")
            return;
        }
        let user={username:'',password:''};
        user.username = document.querySelector('input[type="text"]').value;
        user.password = document.querySelector('input[type="password"]').value;
        axios.post(api+'/login',user).then(res => {
            if (res.data.code === 1) {
                localStorage.setItem('userId', res.data.data.userId);
                alert('登录成功');
                window.location.href='index.jsp'
            } else {
                alert('登录失败');
            }
        }).catch(err => {
            console.log(err);
        });
    }

    // 页面加载时生成一个验证码
    window.onload = generateCaptcha;
</script>
</html>