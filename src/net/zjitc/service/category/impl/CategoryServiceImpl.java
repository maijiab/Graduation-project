package net.zjitc.service.category.impl;

import net.zjitc.dao.category.CategoryDao;
import net.zjitc.domain.category.Category;
import net.zjitc.service.category.CategoryService;
import net.zjitc.service.categorysecond.CategorySecondService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/25.
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Resource
    private CategoryDao categoryDao;
    @Resource
    private CategorySecondService categorySecondService;
    @Override
    public List<Category> findAll() {
        return categoryDao.findAll();
    }

    @Override
    public void save(Category model) {
        categoryDao.save(model);
    }

    @Override
    public Category findById(Integer cid) {
        return categoryDao.findById(cid);
    }

    @Override
    public void update(Category category) {
        categoryDao.update(category);
    }

    @Override
    public void delete(Category category) throws CategoryException {
         List cslist=categorySecondService.findByCid(category.getCid());
         if(cslist.size()>0){
             throw new CategoryException("一级分类下有二级分类，不能删除");
         }
        categoryDao.delete(category);
    }


}
