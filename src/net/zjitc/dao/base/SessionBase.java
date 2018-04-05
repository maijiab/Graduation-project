package net.zjitc.dao.base;


import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/11/25.
 */
public class SessionBase {
    @Resource
    private SessionFactory sessionFactory;

    protected Session getSession(){
        return sessionFactory.getCurrentSession();
    }
}
