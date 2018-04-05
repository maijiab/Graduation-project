package net.zjitc.service.order;

import net.zjitc.domain.orders.Orders;
import net.zjitc.utils.PageBean;

/**
 * Created by fyl1997 on 2017/12/10.
 */
public interface OrderService {
    void add(Orders orders);

    PageBean findByUid(Integer page, Integer limit, Integer uid);

    Orders findByOid(String oid);

    void update(Orders currOrder);

    PageBean<Orders> findPageBean(int page, int limit);

    PageBean<Orders> findByState(int page, int limit, Integer state);

    void delete(Orders order);
}
