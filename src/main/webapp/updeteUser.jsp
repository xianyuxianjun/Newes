<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/19
  Time: 上午11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>user</title>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="./css/updateUser.css">
    <script src="js/config.js"></script>
</head>
<body>
<div class="user-card">
    <img class="user-avatar" src="" id="avatar" alt="用户头像"> <!-- 添加头像的图片元素 -->
    <div class="user-info">
        <div class="user-name">用户名：<input id="username"></div>
        <div class="user-real-name">真实姓名：<input id="name"></div>
        <div class="user-age">年龄：<input id="age"></div>
        <div class="user-gender">
            性别：
            <select id="gender">
                <option value="男">男</option>
                <option value="女">女</option>
            </select>
        </div>
        <div class="user-phone">电话：<input id="phone"></div>
        <div class="user-like">爱好：<input id="like"></div>
        <button id="update" onclick="updateUser()">提交修改</button>
    </div>
</div>
</body>
<script>
    //获取输入框的值
    window.onload = function () {
        this.getImg();
    }
    function getInputValue(id) {
        return document.getElementById(id).value;
    }
    //获取每一个输入框的值
    function getUserInfo() {
        let user = {userId:'',username: '', name: '', age: '', gender: '', phone: '', like: ''};
        user.username= getInputValue('username');
        user.name= getInputValue('name');
        user.age= getInputValue('age');
        user.gender= getInputValue('gender')
        user.phone= getInputValue('phone');
        user.like= getInputValue('like');
        user.userId= localStorage.getItem('userId')
        return user;
    }
    //提交修改
    function updateUser(){
        let user = getUserInfo();
        axios.post(api+'/updateUser',user)
            .then(res=>{
                if (res.data.code===1){
                    alert('修改成功')
                    //返回user.jsp
                    window.location.href='user.jsp'
                }else{
                    alert('修改失败')
                }
            }).catch(err=>{
            console.log(err)
        })
    }
    //获取头像
    function getImg() {
        let userId = localStorage.getItem("userId")
        axios.post(api+'/getUser',{userId:userId})
            .then(res=>{
                document.getElementById('avatar').src=res.data.data.avatar;
            }).catch(err=>{
            console.log(err)
        })
    }
</script>
</html>