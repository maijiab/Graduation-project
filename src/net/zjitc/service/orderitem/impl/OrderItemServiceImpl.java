package net.zjitc.service.orderitem.impl;

import net.zjitc.dao.orderitem.OrderItemDao;
import net.zjitc.domain.orderitem.Orderitem;
import net.zjitc.service.orderitem.OrderItemService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Service
@Transactional
public class OrderItemServiceImpl implements OrderItemService {
    @Resource
    private OrderItemDao orderItemDao;
    @Override
    public Orderitem findById(Integer itemid) {
        return orderItemDao.findById(itemid);
    }

    @Override
    public void update(Orderitem item) {
        orderItemDao.update(item);
    }
}
