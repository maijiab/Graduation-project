package net.zjitc.domain.evaluate;

import net.zjitc.domain.product.Product;
import net.zjitc.domain.user.User;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Entity
public class Evaluate {
    private Integer eid;
    private String content;
    private String title;
    private Date data;
    private User user;
    private Product product;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Id
    @Column(name = "eid", nullable = false)
    public Integer getEid() {
        return eid;
    }

    public void setEid(Integer eid) {
        this.eid = eid;
    }

    @Basic
    @Column(name = "content", nullable = true, length = 300)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "title", nullable = true, length = 300)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "data", nullable = true)
    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Evaluate evaluate = (Evaluate) o;

        if (eid != null ? !eid.equals(evaluate.eid) : evaluate.eid != null) return false;
        if (content != null ? !content.equals(evaluate.content) : evaluate.content != null) return false;
        if (title != null ? !title.equals(evaluate.title) : evaluate.title != null) return false;
        if (data != null ? !data.equals(evaluate.data) : evaluate.data != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = eid != null ? eid.hashCode() : 0;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (data != null ? data.hashCode() : 0);
        return result;
    }


}
