package com.chenxianyu.newes.Dao;

import com.chenxianyu.newes.Pojo.User;

import java.util.List;

public interface UserMapper {

    /**
     * 根据用户ID查询用户信息。
     *
     * @param id 用户ID
     * @return 返回对应的用户对象，如果不存在则返回null
     */
    User getUserById(int id);

    /**
     * 根据用户名查询用户信息。
     *
     * @param username 用户名
     * @return 返回对应的用户对象，如果不存在则返回null
     */
    User getUserByUsername(String username);

    /**
     * 创建新的用户记录。
     *
     * @param user 要创建的用户对象
     * @return 返回受影响的行数，通常为1表示插入成功
     */
    int createUser(User user);

    /**
     * 更新现有用户的信息。
     *
     * @param user 包含更新信息的用户对象
     * @return 返回受影响的行数，表示更新的记录数量
     */
    int updateUser(User user);

    /**
     * 删除用户记录。
     *
     * @param id 要删除的用户ID
     * @return 返回受影响的行数，通常为1表示删除成功
     */
    int deleteUser(int id);

    /**
     * 获取用户总数。
     *
     * @return 返回用户总数
     */
    int getUserCount();

    /**
     * 更新用户密码。
     *
     * @param userId 用户ID
     * @param newPassword 新密码
     * @return 返回受影响的行数，通常为1表示更新成功
     */
    int updatePassword(int userId, String newPassword);

    void updateAvatar(Integer userId, String filePath);

    List<User> getUserList(int offset, int limit);
}
