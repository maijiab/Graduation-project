package net.zjitc.dao.orderitem;

import net.zjitc.domain.orderitem.Orderitem;

/**
 * Created by fyl1997 on 2017/12/20.
 */
public interface OrderItemDao {
    Orderitem findById(Integer itemid);

    void update(Orderitem item);
}
