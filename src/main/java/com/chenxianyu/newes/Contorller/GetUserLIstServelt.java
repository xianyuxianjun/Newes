package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.ArticleListDto;
import com.chenxianyu.newes.Pojo.User;
import com.chenxianyu.newes.Pojo.UserListDto;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;
import com.chenxianyu.newes.Utils.UserServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/getUserList")
public class GetUserLIstServelt extends UserServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserListDto userListDto = RequestUtils.getParam(req, UserListDto.class);
        //获取参数
        int offset = userListDto.getOffset();
        int limit = userListDto.getLimit();
        System.out.println("offset: " + offset + " limit: " + limit);
        List<User> userList = userService.getUserList(offset, limit);
        if (userList != null) {
            // 获取成功
            Res.success(resp, userList);
        } else {
            // 获取失败
            Res.error(resp, "Get user list failed");
        }
    }
}
