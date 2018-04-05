package net.zjitc.action.user.orders;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import net.zjitc.domain.cart.Cart;
import net.zjitc.domain.cart.CartItem;
import net.zjitc.domain.orderitem.Orderitem;
import net.zjitc.domain.orders.Orders;
import net.zjitc.domain.user.User;
import net.zjitc.service.order.OrderService;
import net.zjitc.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by fyl1997 on 2017/12/10.
 */
@Controller
@Scope("prototype")
public class UserOrderAction extends ActionSupport implements ModelDriven<Orders> {
    private Orders model = new Orders();

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

    private Integer limit = 3;
    @Resource
    private OrderService orderService;
    public String addOrder(){
        /*1. 判断用户是否登录？登录页面*/
       User existUser = (User) ActionContext.getContext().getSession().get("existUser");
        if (existUser == null){
            return "login";
        }
        /*2. 判断购物是否为空，*/
        Cart cart = (Cart) ActionContext.getContext().getSession().get("cart");
        if (cart == null) {
            this.addActionMessage("亲,您的购物车是空的，请选择商品。。。");
            return "mes";
        }
        /*3. 当前的订单的相关信息补全*/
        model.setOrdertime(getTime()); //时间,数据库中使用的是字符串的格式，需要转换
        model.setState(1);
        model.setTotal(cart.getTotal());
        model.setUser(existUser);
        /*默认收获地址为当前的用户*/
        model.setName(existUser.getName());
        model.setPhone(existUser.getPhone());
        model.setAddr(existUser.getAddr());

        /*4. 从购物车取出条目，补全订单条目*/
        for (CartItem cartitem :cart.getCartItems()){
        Orderitem item = new Orderitem(); //每取出一个购物车的条目，生成一个订单条目
        item.setCount(cartitem.getCount());// 商品个数
        item.setOsatate(1); //不能评价
        item.setSubtotal(cartitem.getSubTotal()); //小计
        item.setProduct(cartitem.getProduct());
        model.getOrderitems().add(item); //条目添加到订单中
    }
        /*5. 保存订单（数据库）*/
        orderService.add(model);
        /*6. 清空购物车*/
        cart.clearCart();
        return "order";
}
    private String getTime() {
        /*设置时间 格式*/
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sf.format(new Date());
    }
    public String findByUid(){
        /*用户*/
        User user = (User) ActionContext.getContext().getSession().get("existUser");
        if(user == null){
            return "login";
        }
        /*分页*/
        PageBean pageBean = orderService.findByUid(page,limit,user.getUid());
        ActionContext.getContext().getValueStack().push(pageBean);
        return "orderList";

    }


    /*通过订单ID找到当前的订单，然后进入付款页面order.jsp*/
    public String findByOid(){
        /*准备当前订单*/
        Orders orders = orderService.findByOid(model.getOid());
        ActionContext.getContext().getValueStack().push(orders);
        return "order";
    }
    /*付款功能*//*付完钱后，进入付款成功的提示页面*/
    public String payOrder(){
        /*更新收货地址。。。。*/
        Orders currOrder = orderService.findByOid(model.getOid());
        currOrder.setName(model.getName());
        currOrder.setPhone(model.getPhone());
        currOrder.setAddr(model.getAddr());
        currOrder.setState(2);
        orderService.update(currOrder);
        this.addActionMessage("订单号为"+model.getOid()+"，付款成功");
        return "toOrderList";
    }
    /*收货，并完成订单功能*/
    public String finshOrder(){
        Orders currOrder = orderService.findByOid(model.getOid());
        currOrder.setState(4);
        for (Orderitem item : currOrder.getOrderitems()){
            item.setOsatate(2);
        }
        orderService.update(currOrder);
        return "toOrderList";//重定向到订单列表页面
    }

    @Override
    public Orders getModel() {
        return model;
    }
}
