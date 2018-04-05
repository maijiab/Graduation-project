package net.zjitc.service.category;

import net.zjitc.domain.category.Category;
import net.zjitc.service.category.impl.CategoryException;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/25.
 */
public interface CategoryService {
    List<Category> findAll();


    void save(Category model);

    Category findById(Integer cid);

    void update(Category category);


    void delete(Category category) throws CategoryException;
}
