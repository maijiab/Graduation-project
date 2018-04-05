package net.zjitc.service.categorysecond.impl;

import net.zjitc.dao.categorysecond.CategorySecondDao;
import net.zjitc.domain.categorysecond.Categorysecond;

import net.zjitc.service.categorysecond.CategorySecondException;
import net.zjitc.service.categorysecond.CategorySecondService;
import net.zjitc.service.product.ProductService;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/27.
 */
@Service
@Transactional
public class CategorySecondServiceImpl implements CategorySecondService {
    @Resource
    private CategorySecondDao categorySecondDao;
    @Resource
    private ProductService productService;
    @Override
    public List findByCid(Integer cid) {
        return categorySecondDao.findByCid(cid);
    }

    @Override
    public List<Categorysecond> findAll() {
        return categorySecondDao.findAll();
    }

    @Override
    public void save(Categorysecond model) {
        categorySecondDao.save(model);
    }

    @Override
    public Categorysecond findById(Integer csid) {
        return categorySecondDao.findById(csid);
    }

    @Override
    public void update(Categorysecond cs) {
        categorySecondDao.update(cs);
    }

    @Override
    public void delete(Categorysecond cs) throws CategorySecondException {
        List plist= productService.findByPid(cs.getCsid());
        if(plist.size()>0){
            throw new CategorySecondException("二级分类下有商品列表，不能删除");
        }
        categorySecondDao.delete(cs);
    }

    @Override
    public PageBean<Categorysecond> findPage(Integer page, Integer limit) {
        return categorySecondDao.findPage(page,limit);
    }



}
