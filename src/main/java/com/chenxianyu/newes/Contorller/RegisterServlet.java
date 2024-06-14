package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    //注册
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String age = req.getParameter("age");
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");
        String like = req.getParameter("like");
        UserService userService = new UserService();
        User user = new User(username, password, name, age,gender,phone,like);
        //调用service层的register方法
        boolean register = userService.register(user);
            if (register) {
                //注册成功
                req.getRequestDispatcher("/login.jsp").forward(req, resp);
            } else {
                //注册失败
                req.getRequestDispatcher("/register.jsp").forward(req, resp);
            }
        }

}
