<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/14
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>
<body>
<form action="/login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required>
    <br/>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>
    <br/>
    <input type="submit" value="Login">
</form>
</body>
<script>
    //登录的操作，使用axios
    document.querySelector('form').addEventListener('submit', function (e) {
        e.preventDefault();
        const username = document.querySelector('#username').value;
        const password = document.querySelector('#password').value;
        axios.post('/Newes_war_exploded/login', {
            username: username,
            password: password
        }).then(res => {
            console.log(res);
        }).catch(err => {
            console.error(err);
        });
    });
</script>
</html>
