package net.zjitc.domain.orderitem;

import net.zjitc.domain.orders.Orders;
import net.zjitc.domain.product.Product;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Entity
public class Orderitem {
    private Integer itemid;
    private Integer count;
    private Double subtotal;
    private Integer osatate;
    private Orders order;
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Orders getOrder() {
        return order;
    }

    public void setOrder(Orders order) {
        this.order = order;
    }

    @Id
    @Column(name = "itemid", nullable = false)
    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    @Basic
    @Column(name = "count", nullable = true)
    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Basic
    @Column(name = "subtotal", nullable = true, precision = 0)
    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    @Basic
    @Column(name = "osatate", nullable = true)
    public Integer getOsatate() {
        return osatate;
    }

    public void setOsatate(Integer osatate) {
        this.osatate = osatate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orderitem orderitem = (Orderitem) o;

        if (itemid != null ? !itemid.equals(orderitem.itemid) : orderitem.itemid != null) return false;
        if (count != null ? !count.equals(orderitem.count) : orderitem.count != null) return false;
        if (subtotal != null ? !subtotal.equals(orderitem.subtotal) : orderitem.subtotal != null) return false;
        if (osatate != null ? !osatate.equals(orderitem.osatate) : orderitem.osatate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = itemid != null ? itemid.hashCode() : 0;
        result = 31 * result + (count != null ? count.hashCode() : 0);
        result = 31 * result + (subtotal != null ? subtotal.hashCode() : 0);
        result = 31 * result + (osatate != null ? osatate.hashCode() : 0);
        return result;
    }
}
