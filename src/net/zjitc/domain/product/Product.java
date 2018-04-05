package net.zjitc.domain.product;

import net.zjitc.domain.categorysecond.Categorysecond;
import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.domain.orderitem.Orderitem;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by fyl1997 on 2017/12/4.
 */
@Entity
public class Product {
    private Integer pid;
    private String pname;
    private String image;
    private Double price;
    private String pdesc;
    private Timestamp pdate;
    private Integer isHot;
    private Categorysecond categorysecond;
    private Set<Orderitem> orderitems;
    private Set<Evaluate> evaluates;

    public Set<Evaluate> getEvaluates() {
        return evaluates;
    }

    public void setEvaluates(Set<Evaluate> evaluates) {
        this.evaluates = evaluates;
    }

    public Set<Orderitem> getOrderitems() {
        return orderitems;
    }

    public void setOrderitems(Set<Orderitem> orderitems) {
        this.orderitems = orderitems;
    }

    public Categorysecond getCategorysecond() {
        return categorysecond;
    }

    public void setCategorysecond(Categorysecond categorysecond) {
        this.categorysecond = categorysecond;
    }

    @Id
    @Column(name = "pid", nullable = false)
    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    @Basic
    @Column(name = "pname", nullable = true, length = 300)
    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    @Basic
    @Column(name = "image", nullable = true, length = 300)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Basic
    @Column(name = "price", nullable = true, precision = 0)
    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Basic
    @Column(name = "pdesc", nullable = true, length = 300)
    public String getPdesc() {
        return pdesc;
    }

    public void setPdesc(String pdesc) {
        this.pdesc = pdesc;
    }

    @Basic
    @Column(name = "pdate", nullable = true)
    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

    @Basic
    @Column(name = "is_hot", nullable = true)
    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (pid != null ? !pid.equals(product.pid) : product.pid != null) return false;
        if (pname != null ? !pname.equals(product.pname) : product.pname != null) return false;
        if (image != null ? !image.equals(product.image) : product.image != null) return false;
        if (price != null ? !price.equals(product.price) : product.price != null) return false;
        if (pdesc != null ? !pdesc.equals(product.pdesc) : product.pdesc != null) return false;
        if (pdate != null ? !pdate.equals(product.pdate) : product.pdate != null) return false;
        if (isHot != null ? !isHot.equals(product.isHot) : product.isHot != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pid != null ? pid.hashCode() : 0;
        result = 31 * result + (pname != null ? pname.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (price != null ? price.hashCode() : 0);
        result = 31 * result + (pdesc != null ? pdesc.hashCode() : 0);
        result = 31 * result + (pdate != null ? pdate.hashCode() : 0);
        result = 31 * result + (isHot != null ? isHot.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pid=" + pid +
                ", pname='" + pname + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", pdesc='" + pdesc + '\'' +
                ", pdate=" + pdate +
                ", isHot=" + isHot +
                ", categorysecond=" + categorysecond +
                ", orderitems=" + orderitems +
                ", evaluates=" + evaluates +
                '}';
    }
}
