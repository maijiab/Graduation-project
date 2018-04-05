package net.zjitc.dao.product.impl;

import net.zjitc.dao.base.SessionBase;
import net.zjitc.dao.product.ProductDao;
import net.zjitc.domain.product.Product;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/29.
 */
@Repository
public class ProductDaoImpl extends SessionBase implements ProductDao {
    @Override
    public List findByPid(Integer csid) {
        return getSession().createQuery("from Product p where p.categorysecond.csid=?")
                .setParameter(0,csid)
                .list();
    }

    @Override
    public List findAll() {
        return getSession().createQuery("from Product ").list();
    }

    @Override
    public PageBean<Product> findPage(Integer page, Integer limit) {
        List<Product> list=getSession().createQuery("from Product")
                .setFirstResult((page-1)*4)
                .setMaxResults(limit)
                .list();
        Long count=(Long)getSession().createQuery("select count(*) from Product").uniqueResult();
        return new PageBean<Product>(page,limit,count.intValue(),list);
    }

    @Override
    public void save(Product model) {
        getSession().save(model);
    }

    @Override
    public Product findByPdid(Integer pid) {
        return (Product) getSession().createQuery("from Product p where p.pid = ?")
                .setParameter(0,pid)
                .uniqueResult();
    }


    @Override
    public void delete(Product product) {
        getSession().delete(product);
    }

    @Override
    public List<Product> findHotProducts(int i) {
        return getSession().createQuery("from Product p where p.isHot=?")
                .setParameter(0,1)
                .setFirstResult(0)
                .setMaxResults(i)
                .list();
    }

    @Override
    public List<Product> findNewProducts(int i) {
        return getSession().createQuery("from Product p order by pdate desc")
                .setFirstResult(0)
                .setMaxResults(i)
                .list();
    }

    @Override
    public PageBean findPageBean(Integer page, Integer limit, Integer cid) {
        /*找到数据总数*/
        Long count = (Long) getSession().createQuery(
                "select count(*) from Product p where p.categorysecond.category.cid = ?")
                .setParameter(0,cid)
                .uniqueResult();
        /*当前页的list*/
        List list = getSession().createQuery(
                "from Product p where p.categorysecond.category.cid = ?")
                .setParameter(0,cid)
                .setFirstResult((page -1) *limit)
                .setMaxResults(limit)
                .list();
        return new PageBean(page,limit,count.intValue(),list);
    }

    @Override
    public PageBean<Product> findByCSid(Integer page, Integer limit, Integer csid,Integer cid) {
        Long count = (Long) getSession().createQuery(
                "select count(*) from Product p where p.categorysecond.csid = ?")
                .setParameter(0,csid)
                .uniqueResult();
        /*当前页的list*/
        List list = getSession().createQuery(
                "from Product p where p.categorysecond.csid= ?")
                .setParameter(0,csid)
                .setFirstResult((page -1) *limit)
                .setMaxResults(limit)
                .list();
        return new PageBean(page,limit,count.intValue(),list);
    }

    @Override
    public List query(String pname) {
        return getSession().createQuery("from Product p where p.pname like ?")
                .setParameter(0,"%"+pname+"%")
                .list();
    }

    @Override
    public PageBean<Product> findPages(Integer page, Integer limit,String pname) {
        List<Product> list=getSession().createQuery("from Product p where p.pname like ?")
                .setParameter(0,"%"+pname+"%")
                .setFirstResult((page-1)*limit)
                .setMaxResults(limit)
                .list();
        Long count=(Long)getSession().createQuery("select count(*) from Product p where p.pname like ?")
                .setParameter(0,"%"+pname+"%")
                .uniqueResult();
        return new PageBean<Product>(page,limit,count.intValue(),list);
    }
    @Override
    public void update(Product model) {
        getSession().update(model);
    }
}
