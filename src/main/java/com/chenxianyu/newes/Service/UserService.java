package com.chenxianyu.newes.Service;

import com.chenxianyu.newes.Dao.Impl.UserMapperImpl;
import com.chenxianyu.newes.Pojo.User;

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
     * @param userId 用户的ID
     * @param password 新密码
     * @return 修改成功返回true 失败返回false
     */
    public boolean updatePassword(int userId, String password) {
        int num = userMapper.updatePassword(userId, password);
        if (num == 1){
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
     * @param user 用户的更新信息
     * @return 删除成功返回true 失败返回false
     */
    public boolean updateUserInfo(User user) {
       int num = userMapper.updateUser(user);
       if (num == 1){
           return true;
       }
       return false;
    }

    public boolean denglu(String username, String password) {
        String password1 = userMapper.chaxunmima(username);
        if (password1.equals(password)){
            return true;
        }else {
            return false;
        }
    }

    public boolean zhuce(User user) {
        int num = userMapper.zhuce(user);
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }
}
