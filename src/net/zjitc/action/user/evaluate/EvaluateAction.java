package net.zjitc.action.user.evaluate;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.evaluate.Evaluate;
import net.zjitc.domain.orderitem.Orderitem;
import net.zjitc.domain.product.Product;
import net.zjitc.domain.user.User;
import net.zjitc.service.evaluate.EvaluateService;
import net.zjitc.service.orderitem.OrderItemService;
import net.zjitc.service.product.ProductService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by fyl1997 on 2017/12/20.
 */
@Controller
@Scope("prototype")
public class EvaluateAction extends ActionSupport implements ModelDriven<Evaluate>{
    private Integer pid; //商品id

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    private Integer itemid; //订单条目id
    @Resource
    private ProductService productService;
    @Resource
    private OrderItemService orderItemService;

    @Resource
    private EvaluateService evaluateService;

    public String evaluateUI(){
        Product product = productService.findByPdid(pid);
        model.setProduct(product);
        return "evaluateUI";
    }
    public String addEvaluate(){
       /*当前用户*/
        User user = (User) ActionContext.getContext().getSession().get("existUser");
        model.setUser(user);
        model.setData(new Date());
        /*评价保存在数据库中*/
        evaluateService.save(model);
        /*根据itemid 查找*/
        Orderitem item = orderItemService.findById(itemid);
        item.setOsatate(3);
        orderItemService.update(item);
        this.addActionMessage("亲，谢谢您帮忙之中给我评价。。。。。");
        return "msg";

    }
    private Evaluate model = new Evaluate();
    @Override
    public Evaluate getModel() {
        return model;
    }
}
