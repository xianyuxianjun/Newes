package com.chenxianyu.newes.Utils;

import com.chenxianyu.newes.Service.UserService;

import javax.servlet.http.HttpServlet;

public class BaseServlet extends HttpServlet {
    protected UserService userService = new UserService();
}
