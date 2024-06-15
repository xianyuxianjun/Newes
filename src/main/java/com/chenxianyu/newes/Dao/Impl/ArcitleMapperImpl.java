package com.chenxianyu.newes.Dao.Impl;

import com.chenxianyu.newes.Dao.ArcitleMapper;
import com.chenxianyu.newes.Pojo.Article;
import com.chenxianyu.newes.Utils.DataSourceFactory;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;
import java.util.List;

public class ArcitleMapperImpl implements ArcitleMapper {
    private final QueryRunner queryRunner;
    /**
     * 构造函数，初始化 QueryRunner 实例。
     */
    public ArcitleMapperImpl( ) {
        this.queryRunner = new QueryRunner(DataSourceFactory.getDataSource());
    }

    /**
     * @param articleId 要创建的用户对象
     * @return
     */
    @Override
    public Article getArticleById(int articleId) {
        try {
            return queryRunner.query("SELECT * FROM article WHERE article_id=?", new BeanHandler<>(Article.class),articleId);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param article 要创建的文章对象
     * @return
     */
    @Override
    public int createArticle(Article article) {
        try {
            return queryRunner.update("INSERT INTO article(title,summary,content,publish_date,modify_date,author_id,category_id) VALUES(?,?,?,?,?,?,?)",
                    article.getTitle(),article.getSummary(),article.getContent(),article.getPublishDate(),article.getModifyDate(),article.getAuthorId(),article.getCategoryId());
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * @param article 包含更新信息的文章对象
     * @return
     */
    @Override
    public int updateArticle(Article article) {
        try {
            return queryRunner.update("UPDATE article SET title=?,summary=?,content=?,publish_date=?,modify_date=?,author_id=?,category_id=? WHERE article_id=?",
                    article.getTitle(),article.getSummary(),article.getContent(),article.getPublishDate(),article.getModifyDate(),article.getAuthorId(),article.getCategoryId(),article.getArticleId());
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * @param articleId 要删除的文章ID
     * @return
     */
    @Override
    public int deleteArticle(int articleId) {
        try {
            return queryRunner.update("DELETE FROM article WHERE article_id=?", articleId);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * @return 文章数量
     */
    @Override
    public int getArticleCount() {
        try {
            return queryRunner.query("SELECT COUNT(*) FROM article", new BeanHandler<>(Integer.class));
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * @param offset 起始位置
     * @param limit  获取数量
     * @return
     */
    @Override
    public List<Article> getArticleList(int offset, int limit) {
        try {
            return queryRunner.query("SELECT * FROM article LIMIT ?,?", new BeanHandler<>(List.class), offset, limit);
        } catch (SQLException e) {
            e.printStackTrace();
            return List.of();
        }
    }

    /**
     * @param categoryId 类别ID
     * @param offset     起始位置
     * @param limit      获取数量
     * @return
     */
    @Override
    public List<Article> getArticleListByCategory(int categoryId, int offset, int limit) {
        try {
            return queryRunner.query("SELECT * FROM article WHERE category_id=? LIMIT ?,?", new BeanHandler<>(List.class), categoryId, offset, limit);
        } catch (SQLException e) {
            e.printStackTrace();
            return List.of();
        }
    }

    /**
     * @param authorId 作者ID
     * @param offset   起始位置
     * @param limit    获取数量
     * @return
     */
    @Override
    public List<Article> getArticleListByAuthor(int authorId, int offset, int limit) {
        try {
            return queryRunner.query("SELECT * FROM article WHERE author_id=? LIMIT ?,?", new BeanHandler<>(List.class), authorId, offset, limit);
        } catch (SQLException e) {
            e.printStackTrace();
            return List.of();
        }
    }

    /**
     * @param keyword 关键字
     * @param offset  起始位置
     * @param limit   获取数量
     * @return
     */
    @Override
    public List<Article> getArticleListByKeyword(String keyword, int offset, int limit) {
        try {
            return queryRunner.query("SELECT * FROM article WHERE title LIKE ? OR summary LIKE ? OR content LIKE ? LIMIT ?,?", new BeanHandler<>(List.class), keyword, keyword, keyword, offset, limit);
        } catch (SQLException e) {
            e.printStackTrace();
            return List.of();
        }
    }
}