package net.zjitc.service.product.impl;

import net.zjitc.dao.product.ProductDao;
import net.zjitc.domain.product.Product;
import net.zjitc.service.product.ProductService;
import net.zjitc.utils.PageBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/29.
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Resource
    private ProductDao productDao;
    @Override
    public List findByPid(Integer csid) {
        return productDao.findByPid(csid);
    }

    @Override
    public List findAll() {
        return productDao.findAll();
    }

    @Override
    public PageBean<Product> findPage(Integer page, Integer limit) {
        return productDao.findPage(page,limit);
    }

    @Override
    public void save(Product model) {
        productDao.save(model);
    }

    @Override
    public void update(Product model) {
            productDao.update(model);
    }

    @Override
    public Product findByPdid(Integer pid) {
        return productDao.findByPdid(pid);
    }
    @Override
    public void delete(Product product) {
        productDao.delete(product);
    }

    @Override
    public List<Product> findHotProducts(int i) {
        return productDao.findHotProducts(i);
    }

    @Override
    public List<Product> findNewProducts(int i) {
        return productDao.findNewProducts(i);
    }

    @Override
    public PageBean findPageBean(Integer page, Integer limit, Integer cid) {
        return productDao.findPageBean(page,limit,cid);
    }

    @Override
    public PageBean<Product> findByCSid(Integer page, Integer limit, Integer csid,Integer cid) {
        return productDao.findByCSid(page,limit,csid,cid);
    }

    @Override
    public List query(String pname) {
        return productDao.query(pname);
    }

    @Override
    public PageBean<Product> findPages(Integer page, Integer limit,String pname) {
        return productDao.findPages(page,limit,pname);
    }




}
