package net.zjitc.service.order.impl;


import net.zjitc.dao.Order.OrderDao;
import net.zjitc.domain.orders.Orders;
import net.zjitc.service.order.OrderService;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;
    @Override
    public void add(Orders orders) {
        orderDao.add(orders);
    }

    @Override
    public PageBean findByUid(Integer page, Integer limit, Integer uid) {
        return orderDao.findByUid(page,limit,uid);
    }

    @Override
    public Orders findByOid(String oid) {
        return orderDao.findByOid(oid);
    }

    @Override
    public void update(Orders currOrder) {
        orderDao.update(currOrder);
    }

    @Override
    public PageBean<Orders> findPageBean(int page, int limit) {
        return orderDao.findPageBean(page,limit);
    }

    @Override
    public PageBean<Orders> findByState(int page, int limit, Integer state) {
        return orderDao.findByState(page,limit,state);
    }

    @Override
    public void delete(Orders order) {
        orderDao.delete(order);
    }
}
