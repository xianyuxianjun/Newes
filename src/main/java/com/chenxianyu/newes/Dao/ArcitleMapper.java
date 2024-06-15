package com.chenxianyu.newes.Dao;

import com.chenxianyu.newes.Pojo.Article;

import java.util.List;

public interface ArcitleMapper {
    /**
     * 根据文章ID查询文章信息。
     *
     * @param articleId 要创建的用户对象
     * @return 返回对应的文章对象，如果不存在则返回null
     */
    Article getArticleById(int articleId);

    /**
     * 创建新的文章记录。
     *
     * @param article 要创建的文章对象
     * @return 返回受影响的行数，通常为1表示插入成功
     */
    int createArticle(Article article);

    /**
     * 更新现有文章的信息。
     *
     * @param article 包含更新信息的文章对象
     * @return 返回受影响的行数，表示更新的记录数量
     */
    int updateArticle(Article article);

    /**
     * 删除文章记录。
     *
     * @param articleId 要删除的文章ID
     * @return 返回受影响的行数，通常为1表示删除成功
     */
    int deleteArticle(int articleId);

    /**
     * 获取文章总数。
     *
     * @return 返回文章总数
     */
    int getArticleCount();

    /**
     * 获取文章列表。
     *
     * @param offset 起始位置
     * @param limit 获取数量
     * @return 返回文章列表
     */
    List<Article> getArticleList(int offset, int limit);

    /**
     * 获取文章列表。
     *
     * @param categoryId 类别ID
     * @param offset 起始位置
     * @param limit 获取数量
     * @return 返回文章列表
     */
    List<Article> getArticleListByCategory(int categoryId, int offset, int limit);

    /**
     * 获取文章列表。
     *
     * @param authorId 作者ID
     * @param offset 起始位置
     * @param limit 获取数量
     * @return 返回文章列表
     */
    List<Article> getArticleListByAuthor(int authorId, int offset, int limit);

    /**
     * 获取文章列表。
     *
     * @param keyword 关键字
     * @param offset 起始位置
     * @param limit 获取数量
     * @return 返回文章列表
     */
    List<Article> getArticleListByKeyword(String keyword, int offset, int limit);
}
