package net.zjitc.dao.orderitem.impl;

import net.zjitc.dao.base.SessionBase;
import net.zjitc.dao.orderitem.OrderItemDao;
import net.zjitc.domain.orderitem.Orderitem;
import org.springframework.stereotype.Repository;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Repository
public class OrderItemDaoImpl extends SessionBase implements OrderItemDao{
    @Override
    public Orderitem findById(Integer itemid) {
        return (Orderitem) getSession().createQuery("from Orderitem  o where o.itemid = ?")
                .setParameter(0, itemid)
                .uniqueResult();
    }

    @Override
    public void update(Orderitem item) {
        getSession().update(item);
    }
}

