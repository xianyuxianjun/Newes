package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Service.UserService;
import com.chenxianyu.newes.Utils.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetUserServlet extends BaseServlet {
    //获取用户信息

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //根据id查询用户信息并返回前端
        //获取用户id
        int id = Integer.parseInt(req.getParameter("id"));
        UserService userService = new UserService();
        //调用service层的getUser方法
        User user = userService.getUser(id);
        if (user != null) {
            //查询成功
            req.setAttribute("user", user);
            req.getRequestDispatcher("/getUser.jsp").forward(req, resp);
        } else {
            //查询失败
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}
