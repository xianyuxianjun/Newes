package com.chenxianyu.newes.Contorller;

import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Pojo.ArticleListDto;
import com.chenxianyu.newes.Service.ArticleService;
import com.chenxianyu.newes.Utils.ArticleServlet;
import com.chenxianyu.newes.Utils.JsonUtil;
import com.chenxianyu.newes.Utils.RequestUtils;
import com.chenxianyu.newes.Utils.Res;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/getNewsList")
public class getNewsListServelt extends ArticleServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从请求体获取json参数
        ArticleListDto articleListDto = RequestUtils.getParam(req, ArticleListDto.class);
        //获取参数
        int offset = articleListDto.getOffset();
        int limit = articleListDto.getLimit();
        System.out.println("offset: " + offset + " limit: " + limit);
        //获取文章列表
        List<Article> articleList = arcitleMapper.getArticleList(offset, limit);
        if (articleList != null) {
            // 获取成功
            Res.success(resp, articleList);
        } else {
            // 获取失败
            Res.error(resp, "Get news list failed");
        }
    }
}
