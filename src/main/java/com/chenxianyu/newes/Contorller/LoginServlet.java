package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Dao.Impl.UserMapperImpl;
import com.chenxianyu.newes.Dao.UserMapper;
import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    //登录

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户名和密码
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserService userService = new UserService();
        //调用service层的login方法
        boolean login = userService.login(username, password);
        if (login) {
            //登录成功
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        } else {
            //登录失败
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}
