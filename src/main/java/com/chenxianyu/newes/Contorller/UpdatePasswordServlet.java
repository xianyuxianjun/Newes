package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Service.UserService;
import com.chenxianyu.newes.Utils.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdatePasswordServlet extends BaseServlet {
    //修改密码
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        int id  = Integer.parseInt(req.getParameter("username"));
        String password = req.getParameter("password");
        UserService userService = new UserService();
        //调用service层的updatePassword方法
        boolean updatePassword = userService.updatePassword(id, password);
        if (updatePassword) {
            //修改密码成功
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        } else {
            //修改密码失败
            req.getRequestDispatcher("/updatePassword.jsp").forward(req, resp);
        }
    }
}
