<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/22
  Time: 下午4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>新增新闻</title>
    <link rel="stylesheet" href="css/addNews.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="./js/config.js"></script>
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1>用户管理</h1>
        </div>
        <nav>
            <ul>
                <li ><a href="./index.jsp">首页</a></li>
                <li ><a href="userManagement.jsp">用户管理</a></li>
                <li><a href="addUser.jsp">添加用户</a></li>
            </ul>
        </nav>
    </div>
</header>
<section>
    <div class="container">
        <h2>新增用户</h2>
        <form class="news-form" onsubmit="putUser(event)">
            <input type="text" name="username" placeholder="用户名" required>
            <textarea name="password" placeholder="密码" required></textarea>
            <textarea name="name" placeholder="姓名" required></textarea>
            <textarea name="age" placeholder="年龄" required></textarea>
            <textarea name="gender" placeholder="性别" required></textarea>
            <textarea name="phone" placeholder="手机" required></textarea>
            <textarea name="like" placeholder="爱好" required></textarea>
            <textarea name="type" placeholder="类型" required></textarea>
            <button type="submit">添加用户</button>
        </form>
    </div>
</section>
<footer>
    <div class="container">
        <p>&copy; 2024 用户管理系统</p>
    </div>
</footer>
</body>
<script>
    //获取新闻表单的值
    function getUser() {
        let user = {username:'', name:'',password:'',age:'',gender:'',phone:'',type:'',like:''};
        user.username = document.getElementsByName('username')[0].value;
        user.name = document.getElementsByName('name')[0].value;
        user.password = document.getElementsByName('password')[0].value;
        user.age = document.getElementsByName('age')[0].value;
        user.gender = document.getElementsByName('gender')[0].value;
        user.phone = document.getElementsByName('phone')[0].value;
        user.type = document.getElementsByName('type')[0].value;
        user.like = document.getElementsByName('like')[0].value;
        return user;
    }
    function putUser(event){
        event.preventDefault(); // 阻止表单的默认提交行为

        axios.post(api+'/addUser',getUser())
            .then(res=>{
                console.log(res);
                if (res.data.code==1){
                    alert("添加成功")
                    window.history.back();
                }else{
                    alert('添加失败')
                }
            })
            .catch(err=>{
                console.log(err);
            });
    }

</script>
</html>