<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/22
  Time: 上午10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="css/userManagement.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="./js/config.js"></script>
</head>
<body>
<header>
    <div class="container">
        <div id="branding">
            <h1>用户管理系统</h1>
        </div>
        <nav>
            <ul>
                <li ><a href="./index.jsp">首页</a></li>
                <li ><a href="userManagement.jsp">用户管理</a></li>
                <li ><a href="newsManagement.jsp">新闻管理</a></li>
                <li><a href="addUser.jsp">添加用户</a></li>
            </ul>
        </nav>
    </div>
</header>

<section>
    <div class="container">
        <table class="user-table">
            <thead>
            <tr>
                <th>头像</th>
                <th>用户名</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>手机</th>
                <th>类型</th>
                <th class="actions cz">操作</th>
            </tr>
            </thead>
            <tbody>
            <!-- 这里将通过 JavaScript 动态添加用户条目 -->
            <tr>
                <td class="avatar-cell"><img src="path_to_avatar" alt="Avatar"></td>
                <td>username_placeholder</td>
                <td>name_placeholder</td>
                <td>age_placeholder</td>
                <td>gender_placeholder</td>
                <td>phone_placeholder</td>
                <td>type_placeholder</td>
                <td class="actions">
                    <button class="edit-btn">编辑</button>
                    <button class="delete-btn">删除</button>
                    <button class="admin-btn">设为管理员</button>
                </td>
            </tr>
            <!-- 可根据需要添加更多用户条目 -->
            </tbody>
        </table>

        <div class="pagination">
            <button id="prevBtn">上一页</button>
            <span id="currentPage"></span>
            <button id="nextBtn">下一页</button>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <p>&copy; 2024 用户管理系统</p>
    </div>
</footer>

</body>
<script>
    let currentPage = 1; // 当前页码
    const pageSize = 5; // 每页显示条数
    // 页面加载完毕时获取第一页用户数据
    document.addEventListener('DOMContentLoaded', function () {
        getUserList();
    });

    // 获取用户列表
    function getUserList() {
        axios.post(api + 'getUserList', {
            offset: (currentPage - 1) * pageSize,
            limit: pageSize
        })
            .then(res => {
                let userList = res.data.data;
                console.log('获取到的用户列表:', userList);
                updateTable(userList);
            })
            .catch(err => {
                console.error('获取用户列表失败:', err);
            });
    }
    //删除用户
    function deleteUser(id) {
        axios.post(api + 'deleteUser', {
            userId: id
        })
            .then(res => {
                console.log('删除用户成功:', res);
                getUserList();
            })
            .catch(err => {
                console.error('删除用户失败:', err);
            });
    }
    //修改用户
    function toUser(id) {
        localStorage.setItem('userId', id);
        window.location.href = 'updeteUser.jsp';
    }
    //设为管理员
    function setAdmin(id) {
        axios.post(api + 'setAdmin', {
            userId: id,
            type:1
        })
            .then(res => {
                console.log('设置管理员成功:', res);
                getUserList();
            })
            .catch(err => {
                console.error('设置管理员失败:', err);
            });
    }

    // 更新表格内容
    function updateTable(userList) {
        let tbody = document.querySelector('.user-table tbody');
        tbody.innerHTML = ''; // 清空表格内容

        userList.forEach(user => {
            // 创建表格行
            let tr = document.createElement('tr');

            // 创建头像单元格
            let avatarCell = document.createElement('td');
            avatarCell.classList.add('avatar-cell'); // 添加头像单元格样式类

            // 创建头像图片
            let avatar = document.createElement('img');
            avatar.src = user.avatar;
            avatar.alt = 'Avatar';
            avatarCell.appendChild(avatar);
            tr.appendChild(avatarCell);

            // 创建其他单元格并设置内容
            let usernameCell = document.createElement('td');
            usernameCell.textContent = user.username;
            tr.appendChild(usernameCell);

            let nameCell = document.createElement('td');
            nameCell.textContent = user.name;
            tr.appendChild(nameCell);

            let ageCell = document.createElement('td');
            ageCell.textContent = user.age;
            tr.appendChild(ageCell);

            let genderCell = document.createElement('td');
            genderCell.textContent = user.gender;
            tr.appendChild(genderCell);

            let phoneCell = document.createElement('td');
            phoneCell.textContent = user.phone;
            tr.appendChild(phoneCell);

            let typeCell = document.createElement('td');
            typeCell.textContent = user.type;
            tr.appendChild(typeCell);

            // 操作按钮单元格
            let actionsCell = document.createElement('td');
            actionsCell.classList.add('actions');

            let editButton = document.createElement('button');
            editButton.classList.add('edit-btn');
            editButton.textContent = '编辑';
            editButton.addEventListener('click', function() {
                // 跳转到编辑用户页面
                toUser(user.userId);
            });
            actionsCell.appendChild(editButton);

            let deleteButton = document.createElement('button');
            deleteButton.classList.add('delete-btn');
            deleteButton.textContent = '删除';
            deleteButton.addEventListener('click', function() {
                deleteUser(user.userId); // 调用 deleteUser 函数，并将用户的 id 作为参数传递
            });
            actionsCell.appendChild(deleteButton);

            let adminButton = document.createElement('button');
            adminButton.classList.add('admin-btn');
            if (user.type==1){
                adminButton.textContent = '管理员';
            }else{
                adminButton.textContent = '设为管理员';
                adminButton.addEventListener('click', function() {
                    setAdmin(user.userId); // 调用 setAdmin 函数，并将用户的 id 作为参数传递
                });
            }
            actionsCell.appendChild(adminButton);

            tr.appendChild(actionsCell);

            tbody.appendChild(tr);
        });
    }
</script>

</html>

