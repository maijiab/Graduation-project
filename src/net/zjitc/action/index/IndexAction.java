package net.zjitc.action.index;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import net.zjitc.domain.category.Category;
import net.zjitc.domain.product.Product;
import net.zjitc.service.category.CategoryService;
import net.zjitc.service.product.ProductService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/12/4.
 */
@Controller
@Scope("prototype")
public class IndexAction extends ActionSupport{
    @Resource
    private CategoryService categoryService;
    @Resource
    private ProductService productService;



    public String exectue(){
        List<Category> clist=categoryService.findAll();
        ActionContext.getContext().getSession().put("clist",clist);

        List<Product> hlist=productService.findHotProducts(6);
        ActionContext.getContext().put("hlist",hlist);

        List<Product> nlist=productService.findNewProducts(6);
        ActionContext.getContext().put("nlist",nlist);
        return "index";
    }
}
