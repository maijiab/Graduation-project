package net.zjitc.dao.admin.impl;

import net.zjitc.dao.admin.AdminDao;
import net.zjitc.domain.admin.Admin;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/11/24.
 */
@Repository
public class AdminDaoImpl implements AdminDao {
    @Resource
    public SessionFactory sessionFactory;
    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    @Override
    public Admin findByUsernamePassword(String username, String password) {
        return (Admin) getSession().createQuery(
                "from Admin a where a.username=? and a.password=?")
                .setParameter(0,username)
                .setParameter(1,password)
                .uniqueResult();
    }
}
