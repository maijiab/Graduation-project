package net.zjitc.action.admin.categorysecond;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.category.Category;
import net.zjitc.domain.categorysecond.Categorysecond;
import net.zjitc.service.category.CategoryService;

import net.zjitc.service.categorysecond.CategorySecondException;
import net.zjitc.service.categorysecond.CategorySecondService;
import net.zjitc.service.product.ProductService;
import net.zjitc.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/27.
 */
@Controller
@Scope("prototype")
public class CategorySecondAction extends ActionSupport implements ModelDriven<Categorysecond>{
    private Categorysecond model=new Categorysecond();
    private Integer page;

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

    private Integer limit = 10;
    @Resource
    private CategoryService categoryService;
    @Resource
    private CategorySecondService categorySecondService;

    @Resource
    private ProductService productService;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String message;

    public String findAll(){
        List<Categorysecond> cslist=categorySecondService.findAll();
        ActionContext.getContext().put("cslist",cslist);
        return "list";
    }
    public String findPage(){
        PageBean<Categorysecond> pageBean=categorySecondService.findPage(page,limit);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "list";
    }
    public String addUI(){
        List<Category> clist=categoryService.findAll();
        ActionContext.getContext().put("clist",clist);
        return "addUI";
    }
    public String add(){
        categorySecondService.save(model);
        return "tolist";
    }
    public String editUI(){
        List<Category> clist=categoryService.findAll();
        ActionContext.getContext().put("clist",clist);
        Categorysecond cs=categorySecondService.findById(model.getCsid());
        model.setCategory(cs.getCategory());
        model.setCsname(cs.getCsname());
       return "editUI";
    }
    public String edit(){
        Categorysecond cs = categorySecondService.findById(model.getCsid());
        cs.setCsname(model.getCsname());
        cs.setCategory(model.getCategory());
        categorySecondService.update(cs);
        return "tolist";
    }
    public String delete(){
        Categorysecond cs = categorySecondService.findById(model.getCsid());
        try {
            categorySecondService.delete(cs);
        } catch (CategorySecondException e) {
            e.printStackTrace();
            message = e.getMessage();
            return "deleteError";
        }
        return "tolist";
    }







    @Override
    public Categorysecond getModel() {
        return model;
    }
}
