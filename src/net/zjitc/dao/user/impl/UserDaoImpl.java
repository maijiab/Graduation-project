package net.zjitc.dao.user.impl;

import net.zjitc.dao.user.UserDao;
import net.zjitc.domain.user.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/24.
 */
@Repository
public class UserDaoImpl implements UserDao {
    @Resource
    public SessionFactory sessionFactory;

    public Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    @Override
    public List<User> findAllUser() {
        return getSession().createQuery("from User ").list();
    }

    @Override
    public User getById(Integer uid) {
        return (User) getSession().createQuery("from User u where u.uid=?")
                .setParameter(0,uid)
                .uniqueResult();
    }

    @Override
    public void delete(User user) {
        getSession().delete(user);
    }

    @Override
    public void save(User user) {
        getSession().save(user);
    }

    @Override
    public User findByUsernamePassword(String username, String password) {
        return (User) getSession().createQuery("from User u where u.username=? and u.password = ?")
                .setParameter(0,username)
                .setParameter(1,password)
                .uniqueResult();
    }

    @Override
    public User findByUsername(String username) {
        return (User) getSession().createQuery("from User u where u.username = ?")
                .setParameter(0,username)
                .uniqueResult();
    }


}
