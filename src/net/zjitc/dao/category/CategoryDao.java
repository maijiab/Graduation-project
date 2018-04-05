package net.zjitc.dao.category;

import net.zjitc.domain.category.Category;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/25.
 */
public interface CategoryDao {
    List<Category> findAll();


    void save(Category model);

    Category findById(Integer cid);

    void update(Category category);

    void delete(Category category);
}
