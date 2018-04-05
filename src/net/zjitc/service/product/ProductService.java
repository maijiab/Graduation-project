package net.zjitc.service.product;

import net.zjitc.domain.product.Product;
import net.zjitc.utils.PageBean;

import java.util.List;

/**
 * Created by fyl1997 on 2017/11/29.
 */

public interface ProductService {
    List findByPid(Integer csid);

    List findAll();

    PageBean<Product> findPage(Integer page, Integer limit);

    void save(Product model);

    void update(Product model);


    Product findByPdid(Integer pid);

    void delete(Product product);

    List<Product> findHotProducts(int i);

    List<Product> findNewProducts(int i);


    PageBean findPageBean(Integer page, Integer limit, Integer cid);

    PageBean<Product> findByCSid(Integer page, Integer limit, Integer csid, Integer cid);


    List query(String pname);


    PageBean<Product> findPages(Integer page, Integer limit, String pname);


}
