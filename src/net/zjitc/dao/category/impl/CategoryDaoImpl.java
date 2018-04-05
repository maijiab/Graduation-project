package net.zjitc.dao.category.impl;

import net.zjitc.dao.base.SessionBase;
import net.zjitc.dao.category.CategoryDao;
import net.zjitc.domain.category.Category;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/25.
 */
@Repository
public class CategoryDaoImpl extends SessionBase implements CategoryDao {
    @Override
    public List<Category> findAll() {
            return getSession().createQuery("from Category ").list();
        }

    @Override
    public void save(Category model) {
        getSession().save(model);
    }

    @Override
    public Category findById(Integer cid) {
        return (Category) getSession().createQuery("from Category c where c.cid=?")
                .setParameter(0,cid)
                .uniqueResult();
    }

    @Override
    public void update(Category category) {
        getSession().update(category);
    }

    @Override
    public void delete(Category category) {
        getSession().delete(category);
    }


}
