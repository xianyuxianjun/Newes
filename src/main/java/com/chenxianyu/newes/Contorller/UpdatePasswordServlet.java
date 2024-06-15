package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Utils.UserServlet;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdatePasswordServlet extends UserServlet {
    //修改密码
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取用户信息
        User user = RequestUtils.getParam(req, User.class);
        //调用service层的updatePassword方法
        boolean updatePassword = userService.updatePassword(user.getUserId(), user.getPassword());
        if (updatePassword) {
            // 修改密码成功
            Res.success(resp);
        } else {
            // 修改密码失败
            Res.error(resp, "Update password failed");
        }
    }
}
