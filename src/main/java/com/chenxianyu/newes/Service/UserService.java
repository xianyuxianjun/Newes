package com.chenxianyu.newes.Service;

import com.chenxianyu.newes.Dao.Impl.UserMapperImpl;
import com.chenxianyu.newes.Pojo.User;

import java.util.List;

public class UserService {
        UserMapperImpl userMapper = new UserMapperImpl();

    /**
     * 登录
     * @param username
     * @param password
     * @return 如果用户名和密码正确则return true ,否则return false
     */
    public boolean login(String username, String password) {
            User user = userMapper.getUserByUsername(username);
            if (user == null) {
                return false;
            }else {
                if (user.getPassword().equals(password)) {
                    return true;
                }else {
                    return false;
                }
            }
    }

    /**
     * 注册
     * @param user
     * @return 如果注册成功则return true ，否则return false
     */
    public boolean register(User user) {
        int num = userMapper.createUser(user);
        if (num == 1){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 修改密码
     */
    public boolean updatePassword(int userId, String newPassword) {
        int num = userMapper.updatePassword(userId, newPassword);
        if (num == 1) {
            return true;
        }
        return false;
    }
    /**
     * 删除用户
     * @param userId 用户的ID
     * @return 删除成功返回true 失败返回false
     */
//    public boolean deleteUser(int userId) {
//        int num = userMapper.deleteUser(userId);
//        if (num == 1){
//            return true;
//        }
//        return false;
//    }

    /**
     * 修改用户信息
     * @return 修改成功返回true 失败返回false
     * @param user 用户对象
     */
     public boolean updateUser(User user){
            int num = userMapper.updateUser(user);
            if (num == 1) {
                return true;
            }
            return false;
        }

    /**
     * 获取用户
     * @param id
     * @return
     */
    public User getUser(int id) {
        return userMapper.getUserById(id);
    }

    public void updateAvatar(Integer userId, String filePath) {
        userMapper.updateAvatar(userId, filePath);
    }

    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    public List<User> getUserList(int offset, int limit) {
        return userMapper.getUserList(offset, limit);
    }

    public int deleteUser(int id) {
        return userMapper.deleteUser(id);
    }
}

