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
@WebServlet(urlPatterns = "/addNews")
public class AddNewsServlet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Article article = RequestUtils.getParam(req, Article.class);
        int num = articleService.addArticle(article);
        if (num > 0) {
            // 添加成功
            Res.success(resp, "Add news success");
        } else {
            // 添加失败
            Res.error(resp, "Add news failed");
        }
    }
}
