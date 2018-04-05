package net.zjitc.dao.Order.impl;

import net.zjitc.dao.Order.OrderDao;
import net.zjitc.dao.base.SessionBase;
import net.zjitc.domain.orders.Orders;
import net.zjitc.domain.product.Product;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Repository
public class OrderDaoImpl extends SessionBase implements OrderDao {
    @Override
    public void add(Orders orders) {
        getSession().save(orders);
    }

    @Override
    public PageBean findByUid(Integer page, Integer limit, Integer uid) {
        List<Product> list = getSession().createQuery("from Orders o where o.user.uid = ? ORDER BY ordertime desc ")
                .setParameter(0, uid)
                .setFirstResult((page - 1) * limit)  //从哪开始
                .setMaxResults(limit)  //查多少条
                .list();

        //从数据库中查出记录的总数
        Long count = (Long) getSession().createQuery("select count(*) from Orders o where o.user.uid = ? ")
                .setParameter(0, uid)
                .uniqueResult();

        return new PageBean<Product>(page, limit, count.intValue(), list);
    }

    @Override
    public Orders findByOid(String oid) {
        return (Orders) getSession().createQuery("from Orders  o where o.oid = ?")
                .setParameter(0, oid)
                .uniqueResult();
    }

    @Override
    public void update(Orders currOrder) {
        getSession().update(currOrder);
    }

    @Override
    public PageBean<Orders> findPageBean(int page, int limit) {
        //从数据库中查出数据
        List recordList = this.getSession().createQuery(
                "from Orders order by ordertime desc ")
                .setFirstResult((page - 1) * limit)
                .setMaxResults(limit)
                .list();
        //查出总记录
        Long count = (Long) this.getSession().createQuery(
                "select count (*) from Orders")
                .uniqueResult();
        //生成pageBean对象
        return new PageBean(page, limit, count.intValue(), recordList);

}

    @Override
    public PageBean<Orders> findByState(int page, int limit, Integer state) {
        //从数据库中查出数据
        List recordList = this.getSession().createQuery(
                "from Orders o where o.state = ? order by ordertime desc ")
                .setParameter(0, state)
                .setFirstResult((page - 1) * limit)
                .setMaxResults(limit)
                .list();
        //查出总记录
        Long count = (Long) this.getSession().createQuery(
                "select count (*) from Orders o where o.state = ?")
                .setParameter(0, state)
                .uniqueResult();

        //生成pageBean对象
        return new PageBean(page, limit, count.intValue(), recordList);
    }

    @Override
    public void delete(Orders order) {
        getSession().delete(order);
    }

}
