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
</head>
<body>
<form action="login" method="post">
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
        axios.post('login', {
            username: username,
            password: password
        }).then(function (response) {
            console.log(response);
            if (response.data === 'success') {
                window.location.href = 'index.jsp';
            } else {
                alert('Login failed');
            }
        }).catch(function (error) {
            console.log(error);
        });
    });
</script>
</html>
