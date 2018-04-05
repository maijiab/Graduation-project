package net.zjitc.domain.categorysecond;

import net.zjitc.domain.category.Category;
import net.zjitc.domain.product.Product;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Set;

/**
 * Created by fyl1997 on 2017/11/27.
 */
@Entity
public class Categorysecond {
    private Integer csid;
    private String csname;
    private Category category;
    private Set<Product> products;

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Id
    @Column(name = "csid", nullable = false)
    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    @Basic
    @Column(name = "csname", nullable = true, length = 300)
    public String getCsname() {
        return csname;
    }

    public void setCsname(String csname) {
        this.csname = csname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Categorysecond that = (Categorysecond) o;

        if (csid != null ? !csid.equals(that.csid) : that.csid != null) return false;
        if (csname != null ? !csname.equals(that.csname) : that.csname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = csid != null ? csid.hashCode() : 0;
        result = 31 * result + (csname != null ? csname.hashCode() : 0);
        return result;
    }
}
