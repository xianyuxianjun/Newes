<%--
  Created by IntelliJ IDEA.
  User: 17967
  Date: 2024/6/15
  Time: 下午8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <style>
        body {
            position: relative;
            background-image: url("/img/login.png");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
        .dao-box {
            display: flex;
            justify-content: center; /* 使 .dao-box 在水平方向上居中 */
            margin-top: 50px; /* 设置 .dao-box 的上边距，将其整体往下移动 */
        }
        .dao-box ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex; /* 设置 ul 为 Flex 容器 */
            justify-content: flex-start; /* 使 li 项从左到右排列 */
        }
        .dao-box ul li {
            margin-right: 20px; /* 设置 li 项之间的间距 */
        }
        .dao-box ul li a{
            display: block;
            width: 100px;
            height: 50px;
            line-height: 50px;
            background-color: #4CAF50;
            text-align: center;
            text-decoration: none;
            color: white;
        }


        /* ...其他样式... */

        .info-center {
            margin-top: 20px; /* 设置上边距，创建空间 */
            text-align: center; /* 文本居中 */
            font-size: 36px; /* 设置字体大小 */
            font-family: 'Press Start 2P', cursive; /* 设置字体为像素风格 */
        }
        :root {
            --light-gray : #d6d2c8;
            --dark-gray: #55524e;
            --gray: #9b9484;
            --dark-blue: #2b293e;
            --light-blue: #35b7da;
        }

        #computer {
            position: absolute;
            width: 340px;
            height: 300px;
            top: 35%;
            left: 20%;
            transform: translate(-50%, -50%);
            opacity: 0;/* 设置透明度 */
            animation: fadeIn 4s ease-out forwards;
            /* 设置动画延迟 */
            animation-delay: 2s;
            background:

                /* Bottom Section */
                    repeating-linear-gradient(90deg, var(--gray) 0 10px, var(--light-gray) 10px 18px) 258px 236px / 64px 10px,
                    repeating-linear-gradient(90deg, var(--dark-gray) 0 10px, var(--light-gray) 10px 18px) 258px 246px / 64px 38px,
                    linear-gradient(var(--dark-gray), var(--dark-gray)) 166px 264px / 10px 14px,
                    linear-gradient(var(--light-gray) 10px, var(--dark-gray) 10px) 144px 248px / 80px 20px,
                    linear-gradient(90deg, var(--dark-gray) 10px, var(--gray) 10px) 124px 236px / 110px 48px,
                    linear-gradient(90deg, var(--gray) 10px, var(--light-gray) 10px) 90px 230px / 250px 60px,
                    linear-gradient(90deg, var(--gray) 10px, var(--light-gray) 10px) 100px 220px / 240px 80px,
                    linear-gradient(var(--dark-gray), var(--dark-gray)) 10px bottom / 330px 80px,
                    linear-gradient(var(--dark-gray), var(--dark-gray)) left bottom / 320px 70px,

                        /* Top Section */
                    linear-gradient(90deg, var(--gray) 18px, var(--light-gray) 18px 26px, var(--gray) 26px 36px, var(--dark-gray) 36px 122px, var(--light-gray) 122px 160px, var(--gray) 160px) 120px 180px / 170px 10px,
                    linear-gradient(var(--gray) 10px, var(--dark-blue) 10px 150px, var(--gray) 150px) 130px 10px / 150px 160px,
                    linear-gradient(90deg, var(--gray) 10px, var(--dark-blue) 10px 180px, var(--gray) 180px) 110px 30px / 190px 120px,
                    linear-gradient(var(--gray), var(--gray)) 120px 20px / 170px 140px,
                    linear-gradient(var(--light-gray), var(--light-gray)) 110px top / 190px 200px,
                    linear-gradient(90deg, var(--gray) 10px, var(--light-gray) 10px) 90px 10px / 220px 180px,
                    linear-gradient(var(--gray), var(--gray)) 100px top / 200px 200px,
                    linear-gradient(var(--dark-gray), var(--dark-gray)) 40px top / 260px 200px,
                    linear-gradient(90deg, var(--dark-gray) 50%, var(--light-gray) 50%) 30px 10px / 280px 180px,

                        /* Back section */
                    linear-gradient(90deg, var(--dark-gray) 96px, var(--gray) 96px) 70px 210px / 216px 14px,
                    linear-gradient(var(--dark-gray), var(--dark-gray)) 90px 190px / 178px 30px;
            background-repeat: no-repeat;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
        #computer::before {
            content: "";
            display: block;
            position: absolute;
            width: 10px;
            height: 10px;
            top: 95px;
            left: 175px;
            background-color: var(--light-blue);
            animation: hello 3500ms linear infinite forwards alternate;
        }

        @keyframes hello {
            0%, 18% {
                box-shadow:
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        40px -30px 0 var(--light-blue),
                        40px -20px 0 var(--light-blue),
                        10px -30px 0 var(--light-blue),
                        10px -20px 0 var(--light-blue),
                        50px 0 0 var(--light-blue),
                        40px 10px 0 var(--light-blue),
                        30px 10px 0 var(--light-blue),
                        20px 10px 0 var(--light-blue),
                        10px 10px 0 var(--light-blue);
            }
            24%, 38% {
                box-shadow:
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        50px -30px 0 var(--light-blue),
                        40px -20px 0 var(--light-blue),
                        0 -30px 0 var(--light-blue),
                        10px -20px 0 var(--light-blue),
                        50px 0 0 var(--light-blue),
                        40px 10px 0 var(--light-blue),
                        30px 0 0 var(--light-blue),
                        20px 10px 0 var(--light-blue),
                        10px 10px 0 var(--light-blue);
            }
            44%, 58% {
                box-shadow:
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        50px -30px 0 var(--light-blue),
                        50px 0 0 var(--light-blue),
                        40px 10px 0 var(--light-blue),
                        30px -20px 0 var(--light-blue),
                        30px 0 0 var(--light-blue),
                        30px 10px 0 var(--light-blue),
                        10px -10px var(--light-blue),
                        0 -30px 0 var(--light-blue),
                        0 -20px 0 var(--light-blue),
                        0 10px 0 var(--light-blue);
            }
            64%, 78% {
                box-shadow:
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        0 0 0 var(--light-blue),
                        50px -30px 0 var(--light-blue),
                        50px 0 0 var(--light-blue),
                        50px 10px 0 var(--light-blue),
                        30px -30px 0 var(--light-blue),
                        30px -20px 0 var(--light-blue),
                        30px 0 0 var(--light-blue),
                        30px 10px 0 var(--light-blue),
                        10px -10px var(--light-blue),
                        0 -30px 0 var(--light-blue),
                        0 -20px 0 var(--light-blue),
                        0 10px 0 var(--light-blue);
            }
            84%, 100% {
                box-shadow:
                        50px -30px 0 var(--light-blue),
                        50px -10px 0 var(--light-blue),
                        50px 0 0 var(--light-blue),
                        50px 10px 0 var(--light-blue),
                        30px -30px 0 var(--light-blue),
                        30px -20px 0 var(--light-blue),
                        30px -10px 0 var(--light-blue),
                        30px 0 0 var(--light-blue),
                        30px 10px 0 var(--light-blue),
                        20px -10px 0 var(--light-blue),
                        10px -10px 0 var(--light-blue),
                        0 -30px 0 var(--light-blue),
                        0 -20px 0 var(--light-blue),
                        0 -10px var(--light-blue),
                        0 10px 0 var(--light-blue);
            }
        }
        body, html {
            height: 100%;
            margin: 0;
            overflow: hidden;
        }

        .bg {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            z-index: -1;
        }

        .bg video {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div class="bg">
    <video autoplay loop muted>
        <source src="./img/背景视频.mp4" type="video/mp4">
    </video>
</div>
    <div class="dao-box">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="情报广场">情报广场</a></li>
            <li><a href="论坛">论坛</a></li>
            <li><a href="个人信息">个人信息</a></li>
        </ul>
    </div>
    <div class="info-center">
         欢迎来到冒险岛情报中心
    </div>
    <div id="computer">
</div>
</body>
</html>
