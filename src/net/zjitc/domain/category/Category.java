package net.zjitc.domain.category;

import net.zjitc.domain.categorysecond.Categorysecond;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Set;

/**
 * Created by fyl1997 on 2017/11/25.
 */
@Entity
public class Category {
    private Integer cid;
    private String cname;
    private Set<Categorysecond> categorySeconds;

    public Set<Categorysecond> getCategorySeconds() {
        return categorySeconds;
    }

    public void setCategorySeconds(Set<Categorysecond> categorySeconds) {
        this.categorySeconds = categorySeconds;
    }

    @Id
    @Column(name = "cid", nullable = false)
    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Basic
    @Column(name = "cname", nullable = true, length = 300)
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Category category = (Category) o;

        if (cid != null ? !cid.equals(category.cid) : category.cid != null) return false;
        if (cname != null ? !cname.equals(category.cname) : category.cname != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cid != null ? cid.hashCode() : 0;
        result = 31 * result + (cname != null ? cname.hashCode() : 0);
        return result;
    }
}
