package net.zjitc.dao.categorysecond.impl;

import net.zjitc.dao.base.SessionBase;
import net.zjitc.dao.categorysecond.CategorySecondDao;
import net.zjitc.domain.categorysecond.Categorysecond;
import net.zjitc.service.category.CategoryService;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/27.
 */
@Repository
public class CategorySecondDaoImpl extends SessionBase implements CategorySecondDao {

    @Override
    public List findByCid(Integer cid) {
        return getSession().createQuery("from Categorysecond  c  where c.category.cid=? ")
                .setParameter(0,cid)
                .list();
    }

    @Override
    public List<Categorysecond> findAll() {
        return getSession().createQuery("from Categorysecond ")
                .list();
    }

    @Override
    public void save(Categorysecond model) {
        getSession().save(model);
    }

    @Override
    public Categorysecond findById(Integer csid) {
        return (Categorysecond) getSession().createQuery("from Categorysecond c where c.csid=?")
                .setParameter(0,csid)
                .uniqueResult();
    }

    @Override
    public void update(Categorysecond cs) {
        getSession().update(cs);
    }

    @Override
    public void delete(Categorysecond cs) {
        getSession().delete(cs);
    }

    @Override
    public PageBean<Categorysecond> findPage(Integer page, Integer limit) {
        List<Categorysecond> list=getSession().createQuery("from Categorysecond ")
                .setFirstResult((page-1)*limit)
                .setMaxResults(limit)
                .list();
        Long count=(Long)getSession().createQuery("select count(*) from Categorysecond ").uniqueResult();
        return new PageBean<Categorysecond>(page,limit,count.intValue(),list);
    }




}
