package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Utils.ArticleServlet;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(urlPatterns = "/updateNews")
public class UpdateNewsServLet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Article article = RequestUtils.getParam(req, Article.class);
        int num = articleService.updateArticle(article);
        if (num > 0) {
            // 更新成功
            Res.success(resp, "Update news success");
        } else {
            // 更新失败
            Res.error(resp, "Update news failed");
        }
    }
}
