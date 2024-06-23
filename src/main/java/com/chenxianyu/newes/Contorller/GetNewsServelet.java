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
@WebServlet("/getNews")
public class GetNewsServelet extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Article article = RequestUtils.getParam(req, Article.class);
        Article article1 =  articleService.getAricleById(article.getArticleId());
        if (article1 != null) {
            articleService.addNum(article.getArticleId());
            Res.success(resp, article1);
        } else {
            Res.error(resp, "文章不存在");
        }
    }
}
