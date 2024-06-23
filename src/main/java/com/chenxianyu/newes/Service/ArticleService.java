package com.chenxianyu.newes.Service;

import com.chenxianyu.newes.Dao.Impl.ArcitleMapperImpl;
import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Utils.DataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class ArticleService {
    ArcitleMapperImpl arcitleMapper = new ArcitleMapperImpl();

    /**
     * 根据文章ID修改文章信息。
     * @param article
     * @return
     */
    public int updateArticle(Article article) {
        return arcitleMapper.updateArticle(article);
    }

    public int addArticle(Article article) {
        return arcitleMapper.createArticle(article);
    }

    public List<Article> getArticleListByKeyword(String keyword, int offset, int limit) {
        return arcitleMapper.getArticleListByKeyword(keyword, offset, limit);
    }

    public Article getAricleById(int articleId) {
        return arcitleMapper.getArticleById(articleId);
    }

    public void addNum(int articleId) {
        arcitleMapper.addNum(articleId);
    }

    public List<Article> getArticleList() {
        return arcitleMapper.getTopFive();
    }
}
