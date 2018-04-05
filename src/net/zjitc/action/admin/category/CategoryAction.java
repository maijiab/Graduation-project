package net.zjitc.action.admin.category;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.category.Category;
import net.zjitc.service.category.CategoryService;
import net.zjitc.service.category.impl.CategoryException;
import net.zjitc.service.categorysecond.CategorySecondService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by fyl1997 on 2017/11/25.
 */
@Controller
@Scope("prototype")
public class CategoryAction extends ActionSupport implements ModelDriven<Category> {
   private Category model=new Category();

   @Resource
   private CategoryService categoryService;
   @Resource
   private CategorySecondService categorySecondService;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    private String message;



    public String findAll(){
        List<Category> clist=categoryService.findAll();
        ActionContext.getContext().put("clist",clist);
        return "list";
    }
    public String addUI(){
        return "addUI";
    }
    public String add(){
      categoryService.save(model);
        return "tolist";
    }
    public String editUI(){
        Category category=categoryService.findById(model.getCid());
        ActionContext.getContext().getValueStack().push(category);
        return "editUI";
    }
    public String edit(){
        Category category = categoryService.findById(model.getCid());
        //修改值
        category.setCname(model.getCname());
        categoryService.update(category);
        return "tolist";
    }
    public String delete(){
        Category category=categoryService.findById(model.getCid());
        try {
            categoryService.delete(category);
        } catch (CategoryException e) {
            e.printStackTrace();
            message = e.getMessage();
            return "deleteError";
        }
        return "tolist";
    }

    @Override
    public Category getModel() {
        return model;
    }
}
