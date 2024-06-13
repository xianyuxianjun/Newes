package com.chenxianyu.newes.Dao.Impl;

import com.chenxianyu.newes.Dao.UserMapper;
import com.chenxianyu.newes.Pojo.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserMapperImpl implements UserMapper {
    private QueryRunner queryRunner;

    /**
     * 构造函数，初始化 QueryRunner 实例。
     */
    public UserMapperImpl() {
        queryRunner = new QueryRunner();
    }

    /**
     * 根据用户ID查询用户信息。
     *
     * @param id 用户ID
     * @return 返回对应的用户对象，如果不存在则返回null
     */
    @Override
    public User getUserById(int id) {
        try {
            return queryRunner.query("SELECT * FROM user WHERE id=?", new BeanHandler<>(User.class), id);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 根据用户名查询用户信息。
     *
     * @param username 用户名
     * @return 返回对应的用户对象，如果不存在则返回null
     */
    @Override
    public User getUserByUsername(String username) {
        try {
            return queryRunner.query("SELECT * FROM user WHERE username=?", new BeanHandler<>(User.class), username);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * 创建新的用户记录。
     *
     * @param user 要创建的用户对象
     * @return 返回受影响的行数，为1表示插入成功
     */
    @Override
    public int createUser(User user) {
        try {
            return queryRunner.update("INSERT INTO user (username, password) VALUES (?, ?)", user.getUsername(), user.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 更新现有用户的信息。
     *
     * @param user 包含更新信息的用户对象
     * @return 返回受影响的行数，表示更新的记录数量
     */
    @Override
    public int updateUser(User user) {
        try {
            return queryRunner.update("UPDATE user SET username=?, password=? WHERE id=?", user.getUsername(), user.getPassword(), user.getId());
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    /**
     * 删除用户记录。
     *
     * @param id 要删除的用户ID
     * @return 返回受影响的行数，为1表示删除成功
     */
    @Override
    public int deleteUser(int id) {
        try {
            return queryRunner.update("DELETE FROM user WHERE id=?", id);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
    /**
     * 更新用户的密码。
     *
     * @param userId 用户ID
     * @param newPassword 新密码
     * @return 返回受影响的行数，表示更新的记录数量
     */
    @Override
    public int updatePassword(int userId, String newPassword) {
        try {
            // 使用用户 ID 作为更新条件
            return queryRunner.update("UPDATE user SET password=? WHERE id=?", newPassword, userId);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public String chaxunmima(String username) {
        return "";
    }

    @Override
    public int zhuce(User user) {
        return 1;
    }
}
