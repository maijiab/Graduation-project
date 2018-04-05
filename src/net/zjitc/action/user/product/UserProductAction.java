package net.zjitc.action.user.product;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.category.Category;
import net.zjitc.domain.categorysecond.Categorysecond;
import net.zjitc.domain.product.Product;
import net.zjitc.service.category.CategoryService;
import net.zjitc.service.categorysecond.CategorySecondService;
import net.zjitc.service.product.ProductService;
import net.zjitc.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/12/6.
 */
@Controller
@Scope("prototype")
public class UserProductAction extends ActionSupport implements ModelDriven<Product>{
    @Resource
    private ProductService productService;
    @Resource
    private CategoryService categoryService;
    @Resource
    private CategorySecondService categorySecondService;
    private Integer page;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCsid() {
        return csid;
    }

    public void setCsid(Integer csid) {
        this.csid = csid;
    }

    private Integer cid;
    private Integer csid;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    private Integer limit = 6;
    public Product model = new Product();

    public String findByCid(){
        PageBean pageBean=productService.findPageBean(page,limit,cid);
        Category category=categoryService.findById(cid);
        List clist =categorySecondService.findAll();
        ActionContext.getContext().put("clist",clist);
        ActionContext.getContext().getValueStack().push(category);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findByCid";
    }
    public String findByCSid(){
        PageBean<Product> pageBean;
        pageBean = productService.findByCSid(page,limit,csid,cid);
        Categorysecond cs=categorySecondService.findById(csid);
        ActionContext.getContext().getValueStack().push(cs);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findByCSid";
    }
    public String findByPdid(){
        Product product = productService.findByPdid(model.getPid());

        ActionContext.getContext().getValueStack().push(product);
        return "findByPdid";

    }
    @Override
    public Product getModel() {  return model; }
}
