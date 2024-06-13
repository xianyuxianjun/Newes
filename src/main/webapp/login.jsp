<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <!-- 引入Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- 引入Axios -->
    <script src="https://cdn.staticfile.org/axios/0.18.0/axios.min.js"></script>
</head>
<body>

<div class="container">
    <div class="row justify-content-center align-items-center" style="height: 100vh;">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h2 class="text-center mb-4">登录</h2>
                    <form id="loginForm">
                        <div class="form-group">
                            <label for="username">用户名：</label>
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="请输入用户名">
                        </div>
                        <div class="form-group">
                            <label for="password">密码：</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="请输入密码">
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">登录</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 引入Bootstrap JS和依赖 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const loginForm = document.getElementById('loginForm');

        loginForm.addEventListener('submit', function (event) {
            event.preventDefault();

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            axios.post('/login', {
                username: username,
                password: password
            })
                .then(res => {
                    console.log(res.data);
                    // 这里可以添加跳转到另一个页面或其他成功逻辑
                })
                .catch(error => {
                    console.log(error);
                    // 这里可以添加显示错误信息或其他错误处理逻辑
                });
        });
    });
</script>

</body>
</html>
