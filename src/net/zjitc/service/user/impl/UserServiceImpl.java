package net.zjitc.service.user.impl;

import net.zjitc.dao.user.UserDao;
import net.zjitc.domain.user.User;
import net.zjitc.service.user.UserService;
import net.zjitc.utils.UUIDutils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/24.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    public UserDao userDao;
    @Override
    public List<User> findAllUser() {
        return userDao.findAllUser();
    }

    @Override
    public User getById(Integer uid) {
        return userDao.getById(uid);
    }

    @Override
    public void delete(User user) {
             userDao.delete(user);
    }

    @Override
    public void save(User user) {
        /*产生一个UUID*/
        String code = UUIDutils.uuid();
        /*用户设置UUID*/
        user.setCode(code);
        userDao.save(user);
    }

    @Override
    public User findByUsernamePassword(String username, String password) {
        return userDao.findByUsernamePassword(username,password);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }


}
