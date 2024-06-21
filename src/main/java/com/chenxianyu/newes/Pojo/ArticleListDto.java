package com.chenxianyu.newes.Pojo;

public class ArticleListDto {
    private int offset;
    private int limit;
    private String title;

    @Override
    public String toString() {
        return "ArticleListDto{" +
                "offset=" + offset +
                ", limit=" + limit +
                ", title='" + title + '\'' +
                '}';
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
