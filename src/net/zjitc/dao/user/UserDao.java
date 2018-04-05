package net.zjitc.dao.user;

import net.zjitc.domain.user.User;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/24.
 */
public interface UserDao {
    List<User> findAllUser();

    User getById(Integer uid);

    void delete(User user);


    void save(User user);

    User findByUsernamePassword(String username, String password);

    User findByUsername(String username);
}
