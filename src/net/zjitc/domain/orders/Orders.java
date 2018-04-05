package net.zjitc.domain.orders;

import net.zjitc.domain.orderitem.Orderitem;
import net.zjitc.domain.user.User;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Entity
public class Orders {
    private String oid;
    private Double total;
    private String ordertime;
    private Integer state;
    private String name;
    private String phone;
    private String addr;
    private Integer uid;
    private User user;
    private Set<Orderitem> orderitems= new LinkedHashSet<>();;
    /*需要有对象，才能增加条目*/



    public Set<Orderitem> getOrderitems() {
        return orderitems;
    }

    public void setOrderitems(Set<Orderitem> orderitems) {
        this.orderitems = orderitems;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Id
    @Column(name = "oid", nullable = false, length = 200)
    public String getOid() {
        return oid;
    }

    public void setOid(String oid) {
        this.oid = oid;
    }

    @Basic
    @Column(name = "total", nullable = true, precision = 0)
    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    @Basic
    @Column(name = "ordertime", nullable = true, length = 300)
    public String getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }

    @Basic
    @Column(name = "state", nullable = true)
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 300)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "phone", nullable = true, length = 300)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "addr", nullable = true, length = 300)
    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Basic
    @Column(name = "uid", nullable = true)
    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Orders orders = (Orders) o;

        if (oid != null ? !oid.equals(orders.oid) : orders.oid != null) return false;
        if (total != null ? !total.equals(orders.total) : orders.total != null) return false;
        if (ordertime != null ? !ordertime.equals(orders.ordertime) : orders.ordertime != null) return false;
        if (state != null ? !state.equals(orders.state) : orders.state != null) return false;
        if (name != null ? !name.equals(orders.name) : orders.name != null) return false;
        if (phone != null ? !phone.equals(orders.phone) : orders.phone != null) return false;
        if (addr != null ? !addr.equals(orders.addr) : orders.addr != null) return false;
        if (uid != null ? !uid.equals(orders.uid) : orders.uid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = oid != null ? oid.hashCode() : 0;
        result = 31 * result + (total != null ? total.hashCode() : 0);
        result = 31 * result + (ordertime != null ? ordertime.hashCode() : 0);
        result = 31 * result + (state != null ? state.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (addr != null ? addr.hashCode() : 0);
        result = 31 * result + (uid != null ? uid.hashCode() : 0);
        return result;
    }


}
