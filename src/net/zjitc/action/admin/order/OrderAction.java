package net.zjitc.action.admin.order;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.orders.Orders;
import net.zjitc.service.order.OrderService;
import net.zjitc.utils.PageBean;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Controller
@Scope("prototype")
public class OrderAction extends ActionSupport implements ModelDriven<Orders>{
    private int page;//接收当前页
    private int limit = 10;//限定limit为10条数据
    private String str;

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    @Resource
    private OrderService orderService;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }
    public String findPageBean(){
        PageBean<Orders> pageBean = orderService.findPageBean(page,limit);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "orderList";
    }
    /*通过状态查询*/
    public String findByState(){
        /*接收传递过来的state*/ //model.getState()
        PageBean<Orders> pageBean = orderService.findByState(page,limit,model.getState());
        ActionContext.getContext().getValueStack().push(pageBean);
        return "stateList";
    }
    //修改订单状态
    public String editState(){
        //通过oid查找订单
        Orders existOrder = orderService.findByOid(model.getOid());
        existOrder.setState(3);//设置状态为3，表示已经发货
        orderService.update(existOrder);
        return "editState";
    }
    public String delete(){
        //可以获得客户端请求的所有信息
        HttpServletRequest request = ServletActionContext.getRequest();
        //split() 方法用于把一个字符串分割成字符串数组
        String[] strArr=str.split(",");
        for(int i=1;i<strArr.length;i++){
            Orders order=orderService.findByOid(strArr[i]);
            orderService.delete(order);
        }
//        Orders order=orderService.findByOid(model.getOid());
//        orderService.delete(order);
        return "editState";
    }

    private Orders model = new Orders();
    @Override
    public Orders getModel() {
        return model;
    }
}
