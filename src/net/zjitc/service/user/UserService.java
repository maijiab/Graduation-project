package net.zjitc.service.user;

import net.zjitc.domain.user.User;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/24.
 */
public interface UserService {
    List<User> findAllUser();

    User getById(Integer uid);

    void delete(User user);


    void save(User model);

    User findByUsernamePassword(String username, String password);

    User findByUsername(String username);
}
