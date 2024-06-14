package com.chenxianyu.newes.Utils;

import com.alibaba.druid.pool.DruidDataSource;

import javax.sql.DataSource;
import java.sql.SQLException;

public class DataSourceFactory {

    public static DataSource getDataSource() {
        DruidDataSource ds = new DruidDataSource();
        ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/Newes");
        ds.setUsername("root");
        ds.setPassword("123456");
        ds.setInitialSize(5);
        ds.setMaxActive(10);
        try {
            ds.init();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ds;
    }
}